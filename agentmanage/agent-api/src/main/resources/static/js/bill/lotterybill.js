$(function () {

    // init date tables
    var lotteryTable = $("#lottery_list").dataTable({
        "deferRender": true,
        "processing": true,
        "serverSide": true,
        "showFooter": true,
        "ajax": {
            url: base_url + "/bill/lotteryBills",
            type: "post",
            data: function (d) {
                return buildParams("#searchForm :input", d);
            }
        },
        "searching": false,
        "ordering": false,
        "columns": [
            {
                "data": 'userName',
                "bSortable": false,
                "visible": true
            },
            {
                "data": 'orderNumber',
                "bSortable": false,
                "visible": true
            },
            {
                "data": 'round',
                "bSortable": false,
                "visible": true
            },
            {
                "data": 'dropMoney',
                "visible": true,
                "render": function (data, type, row) {
                    return formatCurrency(data);
                }
            },
            {
                "data": 'userWin',
                "visible": true,
                "render": function (data, type, row) {
                    return formatCurrency(data);
                }
            },
            {
                "data": 'gameCode',
                "bSortable": false,
                "visible": true
            },
            {
                "data": 'dropContent',
                "bSortable": false,
                "visible": true
            },
            {
                "data": 'betTime',
                "visible": true,
                "render": function (data, type, row) {
                    return data ? moment(new Date(data)).format("YYYY-MM-DD HH:mm:ss") : "";
                }
            },
            {
                "data": 'countStatus',
                "bSortable": false,
                "visible": true,
                "render": function (data, type, row) {
                    switch (parseInt(data)) {
                        case 0:
                            return "未结算";
                        case 1:
                            return "已结算";
                        case 3:
                            return "已注销";
                        case 4:
                            return "已恢复";
                        case 5:
                            return "已撤销结算";
                        case 6:
                            return "已二次结算";
                    }
                }
            }
        ],
        "language": language_table,
        "rowCallback": function (row, data) {
            tableDatas.push(data);
        },
        "footerCallback": function (tfoot, data, start, end, display) {
            var fields = [];
            fields.push('dropMoney');
            fields.push('userWin');
            //获取小计数据并初始化
            var subArr = subFooterCount(tableDatas, fields);
            $("#sum_bet").html(formatCurrency(subArr[0]));
            $("#sum_win").html(formatCurrency(subArr[1]));
            //获取合计数据并初始化
            var sumArr = sumFooterCount(tableDatas, fields.length);
            $("#total_bet").html(formatCurrency(sumArr[1]));
            $("#total_win").html(formatCurrency(sumArr[2]));

            initTableDates();
        }
    });

    $('#searchBtn').on('click', function () {
        initTableDates();
        lotteryTable.fnDraw();
    });


});