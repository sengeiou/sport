$(function () {
    $.get(base_url + "/dict/list/maintain",function(ret){
        var html='';
        if(ret.result!=0){
            $(".alert-error").show();
            return;
        }
        var data=ret.data;
        for(var i=0;i<data.length;i++){
            html+=' <div class="form-group"><h4>'+data[i].name+'：<div class="changeable"><input type="checkbox" onchange="changeable(this.checked,'+i+')"/></div></h4>' ;
            html+= '<div class="input-group"> <span class="input-group-addon" id="basic-addon">时间范围</span>' ;
            html+=  '<input class="times form-control" name="'+data[i].code+'" id="daterange'+i+'" disabled readonly style="width: 50%" aria-describedby="basic-addon"></div></div>';
        }
        $("#content").html(html);
        initBootstrap(data);
    })

});

function initBootstrap(data){
    $('.changeable').bootstrapSwitch();
    $(".times").daterangepicker({
        autoApply: false,
        singleDatePicker: false,
        showDropdowns: false,        // 是否显示年月选择条件
        timePicker: true, 			// 是否显示小时和分钟选择条件
        timePickerIncrement: 10, 	// 时间的增量，单位为分钟
        timePicker24Hour: true,
        alwaysShowCalendars: true,
        opens: 'center', //日期选择框的弹出位置
        ranges: rangesConf,
        locale: {
            format: 'YYYY-MM-DD HH:mm:ss',
            separator: ' ~ ',
            customRangeLabel: I18n.daterangepicker_custom_name,
            applyLabel: I18n.system_ok,
            cancelLabel: I18n.system_cancel,
            fromLabel: I18n.daterangepicker_custom_starttime,
            toLabel: I18n.daterangepicker_custom_endtime,
            daysOfWeek: I18n.daterangepicker_custom_daysofweek.split(','),        // '日', '一', '二', '三', '四', '五', '六'
            monthNames: I18n.daterangepicker_custom_monthnames.split(','),        // '一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'
            firstDay: 1
        }
    });

    for(var i=0;i<data.length;i++){
        $('#daterange'+i).data('daterangepicker').setStartDate(data[i].value.split("~")[0]);
        $('#daterange'+i).data('daterangepicker').setEndDate(data[i].value.split("~")[1]);
    }

    $("#update").click( function(){
        var data=$('#form-horizontal').serializeArray();
        for(var i=0;i<data.length;i+=2){
          data[i].code=data[i].name;
        }
        $.post(base_url + "/dict/updateDictValue",JSON.stringify(data),function(ret){
            if(ret.result==0){
                window.location.reload();
            }else{
                $(".alert-error").show();
            }
        })
    });

}
 function changeable(checked,i){
  if(checked){
      document.getElementById('daterange'+i).disabled=false;
  }else{
      document.getElementById('daterange'+i).disabled=true;
  }
 }