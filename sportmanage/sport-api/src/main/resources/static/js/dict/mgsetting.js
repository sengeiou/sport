$(function () {
    $.get(base_url + "/dict/list/mgSetting",function(ret){
        var html='';
        if(ret.result!=0){
            $(".alert-error").show();
            return;
        }
        var data=ret.data;
        for(var i=0;i<data.length;i++){
            var a="值";
            if(data[i].value.search("http")>-1){
                a="URL地址";
            }
            html+=' <div class="form-group"><h4>'+data[i].name+'：<div class="changeable"><input type="checkbox" onchange="changeable(this.checked,'+i+')"/></div></h4>' ;
            html+= '<div class="input-group"> <span class="input-group-addon" id="basic-addon">'+a+'</span>' ;
            html+=  '<input class="times form-control" name="'+data[i].code+'" value="'+data[i].value+'" id="daterange'+i+'" disabled style="width: 50%" aria-describedby="basic-addon"></div></div>';
        }
        $("#content").html(html);
        initBootstrap(data);
    })

});

function initBootstrap(data){
    $('.changeable').bootstrapSwitch();

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