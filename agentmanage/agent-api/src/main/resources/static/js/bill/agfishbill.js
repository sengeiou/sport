$(function () {

    var tableDatas = [];

    function initTableDates() {
        tableDatas = [];
    }

    // init date tables
    var reealTable = $("#real_list").dataTable({
        "deferRender": true,
        "processing": true,
        "serverSide": true,
        "showFooter": true,
        "ajax": {
            url: base_url + "/bill/realBills",
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
                "data": 'billno',
                "bSortable": false,
                "visible": true
            },
            {
                "data": 'gameCode',
                "bSortable": false,
                "visible": true
            },
            {
                "data": 'betAmount',
                "visible": true,
                "render": function (data, type, row) {
                    return formatCurrency(data);
                }
            },
            {
                "data": 'validBetAmount',
                "visible": true,
                "render": function (data, type, row) {
                    return formatCurrency(data);
                }
            },
            {
                "data": 'netAmount',
                "visible": true,
                "render": function (data, type, row) {
                    return formatCurrency(data);
                }
            },
            {
                "data": 'betTime',
                "visible": true,
                "render": function (data, type, row) {
                    return data ? moment(new Date(data)).format("YYYY-MM-DD HH:mm:ss") : "";
                }
            },
            {
                "data": 'platformType',
                "bSortable": false,
                "visible": true
            }
        ],
        "language": language_table,
        "rowCallback": function (row, data) {
            tableDatas.push(data);
        },
        "footerCallback": function (tfoot, data, start, end, display) {
            var fields = [];
            fields.push('betAmount');
            fields.push('validBetAmount');
            fields.push('netAmount');
            //获取小计数据并初始化
            var subArr = subFooterCount(tableDatas, fields);
            $("#sum_bet").html(formatCurrency(subArr[0]));
            $("#sum_valid_bet").html(formatCurrency(subArr[1]));
            $("#sum_net_amount").html(formatCurrency(subArr[2]));
            //获取合计数据并初始化
            var sumArr = sumFooterCount(tableDatas, fields.length);
            $("#total_bet").html(formatCurrency(sumArr[1]));
            $("#total_valid_bet").html(formatCurrency(sumArr[2]));
            $("#total_net_amount").html(formatCurrency(sumArr[3]));

            initTableDates();
        }
    });

    $('#searchBtn').on('click', function () {
        initTableDates();
        reealTable.fnDraw();
    });


});