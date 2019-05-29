/**
 * Created by xuxueli on 17/4/24.
 */
$(function () {

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
        showDropdowns: false,
        timePicker: true,
        timePickerIncrement: 10,
        timePicker24Hour: true,
        alwaysShowCalendars: true,
        opens: 'left',
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
        freshChartDate(start, end);
    });
    freshChartDate(rangesConf[I18n.daterangepicker_ranges_recent_week][0], rangesConf[I18n.daterangepicker_ranges_recent_week][1]);

    function freshChartDate(startDate, endDate) {
        var param = {
            'beginTime': startDate.format('YYYY-MM-DD HH:mm:ss'),
            'endTime': endDate.format('YYYY-MM-DD HH:mm:ss')
        };
        $.post(base_url + "/report/initChart", JSON.stringify(param), function (data, status) {
            if (data.result === 0) {
                freshPlatformChart(data);
                freshCustomerCharts(data);
                freshMoneyCharts(data);
            } else {
                layer.open({
                    title: I18n.system_tips,
                    btn: [I18n.system_ok],
                    content: (data.error_msg || I18n.report_loaddata_fail),
                    icon: '2'
                });
            }
        })
    }

    function freshPlatformChart(data) {
        var option = {
            color: ['#7B0687', '#F1ED76'],
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                }
            },
            legend: {
                data: ['打码量', '平台亏盈']
            },
            toolbox: {
                show: true,
                orient: 'vertical',
                left: 'right',
                top: 'center',
                feature: {
                    mark: {show: true},
                    dataView: {show: true, readOnly: false},
                    magicType: {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                    restore: {show: true},
                    saveAsImage: {show: true}
                }
            },
            calculable: true,
            xAxis: [
                {
                    type: 'category',
                    axisTick: {show: false},
                    data: ['2012', '2013', '2014', '2015', '2016']
                }
            ],
            yAxis: [
                {
                    type: 'value'
                }
            ],
            series: [
                {
                    name: '打码量',
                    type: 'bar',
                    barGap: 0,
                    data: [320, 332, 301, 334, 390]
                },
                {
                    name: '平台亏盈',
                    type: 'bar',
                    data: [220, 182, 191, 234, 290]
                }
            ]
        };
        var clumnChart = echarts.init(document.getElementById('columnChart'));
        clumnChart.setOption(option);
    }

    function freshCustomerCharts(data) {
        var cusOption = {
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'cross',
                    label: {
                        backgroundColor: '#6a7985'
                    }
                }
            },
            legend: {
                data: ['注册会员', '有效会员', '存款会员', '取款会员', '登录会员']
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: [
                {
                    type: 'category',
                    boundaryGap: false,
                    data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
                }
            ],
            yAxis: [
                {
                    type: 'value'
                }
            ],
            series: [
                {
                    name: '注册会员',
                    type: 'line',
                    stack: '总量',
                    areaStyle: {},
                    data: [120, 132, 101, 134, 90, 230, 210]
                },
                {
                    name: '有效会员',
                    type: 'line',
                    stack: '总量',
                    areaStyle: {},
                    data: [220, 182, 191, 234, 290, 330, 310]
                },
                {
                    name: '存款会员',
                    type: 'line',
                    stack: '总量',
                    areaStyle: {},
                    data: [150, 232, 201, 154, 190, 330, 410]
                },
                {
                    name: '取款会员',
                    type: 'line',
                    stack: '总量',
                    areaStyle: {normal: {}},
                    data: [320, 332, 301, 334, 390, 330, 320]
                },
                {
                    name: '登录会员',
                    type: 'line',
                    stack: '总量',
                    label: {
                        normal: {
                            show: true,
                            position: 'top'
                        }
                    },
                    areaStyle: {normal: {}},
                    data: [820, 932, 901, 934, 1290, 1330, 1320]
                }
            ]
        };
        var cusChart = echarts.init(document.getElementById('cusChart'));
        cusChart.setOption(cusOption);
    }

    function freshMoneyCharts(data) {
        var moneyOption = {
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['出款金额', '入款金额']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                    name: '出款金额',
                    type: 'line',
                    stack: '总量',
                    data: [120, 132, 101, 134, 90, 230, 210]
                },
                {
                    name: '入款金额',
                    type: 'line',
                    stack: '总量',
                    data: [220, 182, 191, 234, 290, 330, 310]
                }
            ]
        };
        var moneyChart = echarts.init(document.getElementById('moneyChart'));
        moneyChart.setOption(moneyOption);
    }


});
