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
                "data": 'leagueName',
                "bSortable": false,
                "visible": true
            },
            {
                "data": 'team',
                "bSortable": false,
                "visible": true
            },
            {
                "data": 'ptype',
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
                        var html = '<p id="' + row.id + '"; cancel="' + row.cancel + '"; orderNo="' + row.orderNo + '"; confirmed="' + row.confirmed + '" >';
                        html += '<select class="form-control billConfirmeType" name="billConfirmeType"> ';
                        $.each(billConfirmeTypes, function (idx, obj) {
                            if (parseInt(obj.value) === parseInt(row.confirmed)) {
                                html += '<option value= "' + obj.value + '" selected >' + obj.name + '</option> ';
                            } else {
                                html += '<option value= "' + obj.value + '" >' + obj.name + '</option> ';
                            }
                        });
                        html += '</select>';
                        return html;
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

    $("#sport_list").on('change', '.billConfirmeType', function () {
        var id = $(this).parent('p').attr("id");
        var cancel = $(this).parent('p').attr("cancel");
        var orderNo = $(this).parent('p').attr("orderNo");
        var originalVal = $(this).parent('p').attr("confirmed");
        if (parseInt(cancel) === 1) {
            showWarnMessage('注单已取消，不能更改');
            $(this).find('option[value="'+originalVal+'"]').prop('selected', true);
            return;
        }
        var confirmed = $(this).val();
        var url = base_url + "/bill/audit";
        var param = {};
        param.id = id;
        param.orderNo = orderNo;
        param.confirmed = confirmed;
        layer.confirm(I18n.system_ok + '操作注单 ' + orderNo + '?', {
            icon: 3,
            title: I18n.system_tips,
            btn: [I18n.system_ok, I18n.system_cancel]
        }, function (index) {
            layer.close(index);
            $.ajax({
                type: 'POST',
                url: url,
                data: JSON.stringify(param),
                dataType: "json",
                success: function (data) {
                    if (data.result === 0) {
                        layer.open({
                            title: I18n.system_tips,
                            btn: [I18n.system_ok],
                            content: I18n.system_ope_success,
                            icon: '1',
                            end: function (layero, index) {
                                sportTable.fnDraw();
                            }
                        });
                    } else {
                        layer.open({
                            title: I18n.system_tips,
                            btn: [I18n.system_ok],
                            content: (I18n.system_ope_failed),
                            icon: '2'
                        });
                    }
                },
            });
        });
    })

});