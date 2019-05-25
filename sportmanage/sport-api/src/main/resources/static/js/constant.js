var language_table = {
    "sProcessing": I18n.dataTable_sProcessing,
    "sLengthMenu": I18n.dataTable_sLengthMenu,
    "sZeroRecords": I18n.dataTable_sZeroRecords,
    "sInfo": I18n.dataTable_sInfo,
    "sInfoEmpty": I18n.dataTable_sInfoEmpty,
    "sInfoFiltered": I18n.dataTable_sInfoFiltered,
    "sInfoPostFix": "",
    "sSearch": I18n.dataTable_sSearch,
    "sUrl": "",
    "sEmptyTable": I18n.dataTable_sEmptyTable,
    "sLoadingRecords": I18n.dataTable_sLoadingRecords,
    "sInfoThousands": ",",
    "oPaginate": {
        "sFirst": I18n.dataTable_sFirst,
        "sPrevious": I18n.dataTable_sPrevious,
        "sNext": I18n.dataTable_sNext,
        "sLast": I18n.dataTable_sLast
    },
    "oAria": {
        "sSortAscending": I18n.dataTable_sSortAscending,
        "sSortDescending": I18n.dataTable_sSortDescending
    }
};

var authOwenUrls = $("#authOwenUrls").val();

function getFormDataForObj($form) {
    var unindexed_array = $form.serializeArray();
    var indexed_array = {};
    $.map(unindexed_array, function (n, i) {
        indexed_array[n['name']] = n['value'];
    });
    return indexed_array;
}

function getFormDataForJson($form) {
    var unindexed_array = $form.serializeArray();
    var indexed_array = {};
    $.map(unindexed_array, function (n, i) {
        indexed_array[n['name']] = n['value'];
    });
    return JSON.stringify(indexed_array);
}

function buildParams($sel, d){
    var param = {};
    $($sel).each(function () {
        var name = this.name;
        var value = this.value;
        param[name] = value;
    });
    if(!!param.filterTime){
        param.beginTime = param.filterTime.split(" - ")[0];
        param.endTime = param.filterTime.split(" - ")[1];
    }
    param.start = d.start;
    param.length = d.length;
    return JSON.stringify(param);
}

var parentAuths;

function fetchParentAuths() {
    $.ajax({
        type : 'POST',
        url : base_url + "/auth/parent",
        async:false,
        dataType : "json",
        success : function(res) {
            parentAuths = res.data;
        }
    });
}

var roleNames;
function fetchAllRoleNames() {
    $.ajax({
        type : 'POST',
        url : base_url + "/admin/roles",
        async:false,
        dataType : "json",
        success : function(res) {
            roleNames = res.data;
        }
    });
}

function showWarnMessage(msg){
    layer.open({
        title: I18n.system_tips,
        btn: [I18n.system_ok],
        content: (msg),
        icon: '6'
    });
}

function showFailMessage(msg){
    layer.open({
        title: I18n.system_tips,
        btn: [I18n.system_ok],
        content: (msg),
        icon: '2'
    });
}


// filter Time
var rangesConf = {};
rangesConf[I18n.daterangepicker_ranges_today] = [moment().startOf('day'), moment().endOf('day')];
rangesConf[I18n.daterangepicker_ranges_yesterday] = [moment().subtract(1, 'days').startOf('day'), moment().subtract(1, 'days').endOf('day')];
rangesConf[I18n.daterangepicker_ranges_this_month] = [moment().startOf('month'), moment().endOf('month')];
rangesConf[I18n.daterangepicker_ranges_last_month] = [moment().subtract(1, 'months').startOf('month'), moment().subtract(1, 'months').endOf('month')];
rangesConf[I18n.daterangepicker_ranges_recent_week] = [moment().subtract(1, 'weeks').startOf('day'), moment().endOf('day')];
rangesConf[I18n.daterangepicker_ranges_recent_month] = [moment().subtract(1, 'months').startOf('day'), moment().endOf('day')];

$('#filterTime').daterangepicker({
    autoApply: false,
    singleDatePicker: false,
    showDropdowns: false,        // 是否显示年月选择条件
    timePicker: true, 			// 是否显示小时和分钟选择条件
    timePickerIncrement: 10, 	// 时间的增量，单位为分钟
    timePicker24Hour: true,
    alwaysShowCalendars: true,
    opens: 'left', //日期选择框的弹出位置
    ranges: rangesConf,
    locale: {
        format: 'YYYY-MM-DD HH:mm:ss',
        separator: ' - ',
        customRangeLabel: I18n.daterangepicker_custom_name,
        applyLabel: I18n.system_ok,
        cancelLabel: I18n.system_cancel,
        fromLabel: I18n.daterangepicker_custom_starttime,
        toLabel: I18n.daterangepicker_custom_endtime,
        daysOfWeek: I18n.daterangepicker_custom_daysofweek.split(','),        // '日', '一', '二', '三', '四', '五', '六'
        monthNames: I18n.daterangepicker_custom_monthnames.split(','),        // '一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'
        firstDay: 1
    },
    startDate: rangesConf[I18n.daterangepicker_ranges_recent_week][0],
    endDate: rangesConf[I18n.daterangepicker_ranges_recent_week][1]
}, function (start, end, label) {
    // freshChartDate(start, end);
});


$(".panel-heading").click(function (e) {
    /*切换折叠指示图标*/
    $(this).find("span").toggleClass("glyphicon-chevron-down");
    $(this).find("span").toggleClass("glyphicon-chevron-up");
});


// zTree 格式设置
var zTree_setting = {
    view: {
        dblClickExpand: true,
        selectedMulti : true,//可以多选
        showLine: true
    },
    check: {
        enable: true ,//显示复选框
        chkStyle : "checkbox"
    },
    data: {
        key: {
            title:"t"
        },
        simpleData: {
            enable: true,
            idKey: "id",
            pIdKey: "pId",
            rootPId: null
        }
    }
};

