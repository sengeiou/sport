$(function () {

    var tableDatas = [];

    function initTableDates() {
        tableDatas = [];
    }

    // init date tables
    var mgTable = $("#mg_list").dataTable({
        "deferRender": true,
        "processing": true,
        "serverSide": true,
        "showFooter": true,
        "ajax": {
            url: base_url + "/bill/mgBills",
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
                "data": 'colid',
                "bSortable": false,
                "visible": true
            },
            {
                "data": 'amount',
                "visible": true,
                "render": function (data, type, row) {
                    return formatCurrency(data);
                }
            },
            {
                "data": 'aftertxwalletamount',
                "visible": true,
                "render": function (data, type, row) {
                    return formatCurrency(data);
                }
            },
            {
                "data": 'type',
                "bSortable": false,
                "visible": true,
                "render": function (data, type, row) {
                    if ('mgsaspibet' === data) {
                        return '投注';
                    } else {
                        return '赔付';
                    }
                }
            },
            {
                "data": 'transactiontimestampdate',
                "visible": true,
                "render": function (data, type, row) {
                    return data ? moment(new Date(data)).format("YYYY-MM-DD HH:mm:ss") : "";
                }
            },
            {
                "data": 'gameplatformtype',
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
            fields.push('amount');
            fields.push('aftertxwalletamount');
            //获取小计数据并初始化
            var subArr = subFooterCount(tableDatas, fields);
            $("#sum_amount").html(formatCurrency(subArr[0]));
            $("#sum_after").html(formatCurrency(subArr[1]));
            //获取合计数据并初始化
            var sumArr = sumFooterCount(tableDatas, fields.length);
            $("#total_amount").html(formatCurrency(sumArr[1]));
            $("#total_after").html(formatCurrency(sumArr[2]));

            initTableDates();
        }
    });

    $('#searchBtn').on('click', function () {
        initTableDates();
        mgTable.fnDraw();
    });


});
