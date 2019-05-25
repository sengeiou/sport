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

function buildParams($sel, d) {
    var param = {};
    $($sel).each(function () {
        var name = this.name;
        var value = this.value;
        param[name] = value;
    });
    if (!!param.filterTime) {
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
        type: 'POST',
        url: base_url + "/auth/parent",
        async: false,
        dataType: "json",
        success: function (res) {
            parentAuths = res.data;
        }
    });
}

var roleNames;

function fetchAllRoleNames() {
    $.ajax({
        type: 'POST',
        url: base_url + "/user/roles",
        async: false,
        dataType: "json",
        success: function (res) {
            roleNames = res.data;
        }
    });
}

var bankInfos;

function fetchAllBankInfos(bankUrl) {
    $.ajax({
        type: 'POST',
        url: base_url + bankUrl,
        async: false,
        dataType: "json",
        success: function (res) {
            bankInfos = res.data;
        }
    });
}

var agentInfos;

function fetchAllAgentInfos(agentsUrl) {
    $.ajax({
        type: 'POST',
        url: base_url + agentsUrl,
        async: false,
        dataType: "json",
        success: function (res) {
            agentInfos = res.data;
        }
    });
}

var initSwitch = {
    onText : "ON",
    offText : "OFF",
    onColor : "success",
    offColor : "primary",
    size : "normal"
};

var initTestSwitch = {
    onText : "测试",
    offText : "会员",
    onColor : "success",
    offColor : "primary",
    size : "normal"
};


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


function initTestFlag(testFlag) {
    if(testFlag === 0){
        $("#updateModal .form input[name='testFlag']").bootstrapSwitch('state',false,true).delay(1000).bootstrapSwitch('readonly', true);
    }else{
        $("#updateModal .form input[name='testFlag']").bootstrapSwitch('state',true,true).delay(1000).bootstrapSwitch('readonly', true);
    }
}

function initAgopen(agopen) {
    if(agopen === 0){
        $("#updateModal .form input[name='agopen']").bootstrapSwitch('state',false,true);
    }else{
        $("#updateModal .form input[name='agopen']").bootstrapSwitch('state',true,true);
    }
}

function initMgopen(mgopen) {
    if(mgopen === 0){
        $("#updateModal .form input[name='mgopen']").bootstrapSwitch('state',false,true);
    }else{
        $("#updateModal .form input[name='mgopen']").bootstrapSwitch('state',true,true);
    }
}

function initCpopen(cpopen) {
    if(cpopen === 0){
        $("#updateModal .form input[name='cpopen']").bootstrapSwitch('state',false,true);
    }else{
        $("#updateModal .form input[name='cpopen']").bootstrapSwitch('state',true,true);
    }
}

function subFooterCount(tableDatas, fields) {
    var res = new Array(fields.size);
    var len = fields.length;
    for (var i = 0; i < len; i++) {
        res[i] = 0;
    }
    if (!!tableDatas && tableDatas.length > 0 && len > 0) {
        for (var t in tableDatas) {
            for (var i = 0; i < len; i++) {
                var field = fields[i];
                var count = tableDatas[t][field];
                if (!!count) {
                    res[i] += count;
                }
            }
        }
    }
    return res;
}

function sumFooterCount(tableDatas, len) {
    var res= new Array(len);
    for (var i = 0; i < len; i++) {
        res[i+1] = 0;
    }
    if (!!tableDatas && tableDatas.length > 0) {
        res = tableDatas[0].sumtotals;
    }
    return res;
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
        selectedMulti: true,//可以多选
        showLine: true
    },
    check: {
        enable: true,//显示复选框
        chkStyle: "checkbox"
    },
    data: {
        key: {
            title: "t"
        },
        simpleData: {
            enable: true,
            idKey: "id",
            pIdKey: "pId",
            rootPId: null
        }
    }
};


//自定义validate验证输入的数字小数点位数不能大于两位
jQuery.validator.addMethod("minNumber", function (value, element) {
    var returnVal = true;
    inputZ = value;
    var ArrMen = inputZ.split(".");    //截取字符串
    if (ArrMen.length == 2) {
        if (ArrMen[1].length > 2) {    //判断小数点后面的字符串长度
            returnVal = false;
            return false;
        }
    }
    return returnVal;
}, "最多两位小数");         //验证错误信息

//格式化数据  保留2位小数(一般用于金额显示)
function formatCurrency(num) {
    if(!num) return '0.00';
    num = num.toString().replace(/\$|\,/g, '');
    if (isNaN(num))
        num = "0";
    sign = (num == (num = Math.abs(num)));
    num = Math.floor(num * 100 + 0.50000000001);
    cents = num % 100;
    num = Math.floor(num / 100).toString();
    if (cents < 10)
        cents = "0" + cents;
    for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
        num = num.substring(0, num.length - (4 * i + 3)) + ',' +
            num.substring(num.length - (4 * i + 3));
    return (((sign) ? '' : '-') + num + '.' + cents);
}


function formatNum(num, n) {//参数说明：num 要格式化的数字 n 保留小数位
    num = String(num.toFixed(n));
    var re = /(-?\d+)(\d{3})/;
    while (re.test(num)) num = num.replace(re, "$1,$2")
    if (num % 1 == 0) {
        num = num / 1;
    } else {
        if (num.substr(num.length - 1, num.length) == 0) {
            num = num.substr(0, num.length - 1);
        }

        if (num.substr(num.length - 1, num.length) == 0) {
            num = num.substr(0, num.length - 1);
        }

        if (num.substr(num.length - 1, num.length) == 0) {
            num = num.substr(0, num.length - 1);
        }
    }
    return num;
}