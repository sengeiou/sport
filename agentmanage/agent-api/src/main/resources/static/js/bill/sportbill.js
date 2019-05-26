$(function () {

    fetchAllPlayTypes();
    fetchAllConfirmeTypes();

    // init date tables
    var sportTable = $("#sport_list").dataTable({
        "deferRender": true,
        "processing": true,
        "serverSide": true,
        "showFooter": true,
        "ajax": {
            url: base_url + "/bill/sportBills",
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
                "data": 'orderNo',
                "bSortable": false,
                "visible": true
            },
            {
                "data": 'mLeagueName',
                "bSortable": false,
                "visible": true
            },
            {
                "data": 'team',
                "bSortable": false,
                "visible": true
            },
            {
                "data": 'pType',
                "visible": true,
                "render": function (data, type, row) {
                    var res = "";
                    if (!!data) {
                        $.each(ballPlayTypes, function (idx, obj) {
                            if (obj.value.toString() === data.toString()) {
                                res = obj.name;
                                return;
                            }
                        })
                    }
                    return res;
                }
            },
            {
                "data": 'billVal',
                "bSortable": false,
                "visible": true
            },
            {
                "data": 'gold',
                "visible": true,
                "render": function (data, type, row) {
                    return formatCurrency(data);
                }
            },
            {
                "data": 'gwin',
                "visible": true,
                "render": function (data, type, row) {
                    return formatCurrency(data);
                }
            },
            {
                "data": 'lastBetMoney',
                "visible": true,
                "render": function (data, type, row) {
                    return formatCurrency(data);
                }
            },
            {
                "data": 'afterBetCredit',
                "visible": true,
                "render": function (data, type, row) {
                    return formatCurrency(data);
                }
            },
            {
                "data": 'score',
                "bSortable": false,
                "visible": true
            },
            {
                "data": 'bettime',
                "visible": true,
                "render": function (data, type, row) {
                    return data ? moment(new Date(data)).format("YYYY-MM-DD HH:mm:ss") : "";
                }
            },
            {
                "data": 'cancel',
                "bSortable": false,
                "visible": true,
                "render": function (data, type, row) {
                    switch (parseInt(data)) {
                        case 0:
                            return '正常';
                        case 1:
                            return '取消';
                    }
                }
            },
            {
                "data": I18n.system_opt,
                "visible": authOwenUrls.indexOf('sportsBillAudit') > -1 ? true : false,
                "render": function (data, type, row) {
                    return function () {
                        return html = '<p id="' + row.id + '" >' +
                            '<button class="btn btn-info btn-xs user_operate" _type="user_lim" type="button"> 注单确认 </button>  ';
                    };
                }
            }
        ],
        "language": language_table,
        "rowCallback": function (row, data) {
            tableDatas.push(data);
        },
        "footerCallback": function (tfoot, data, start, end, display) {
            var fields = [];
            fields.push('gold');
            fields.push('gwin');
            fields.push('lastBetMoney');
            fields.push('afterBetCredit');
            //获取小计数据并初始化
            var subArr = subFooterCount(tableDatas, fields);
            $("#sum_bet").html(formatCurrency(subArr[0]));
            $("#sum_win").html(formatCurrency(subArr[1]));
            $("#sum_before").html(formatCurrency(subArr[2]));
            $("#sum_after").html(formatCurrency(subArr[3]));
            //获取合计数据并初始化
            var sumArr = sumFooterCount(tableDatas, fields.length);
            $("#total_bet").html(formatCurrency(sumArr[1]));
            $("#total_win").html(formatCurrency(sumArr[2]));
            $("#total_before").html(formatCurrency(sumArr[3]));
            $("#total_after").html(formatCurrency(sumArr[4]));

            initTableDates();
        }
    });

    $('#searchBtn').on('click', function () {
        initTableDates();
        sportTable.fnDraw();
    });

});