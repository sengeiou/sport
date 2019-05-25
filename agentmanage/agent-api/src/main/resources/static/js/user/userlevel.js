$(function () {

    // init date tables
    var levelTable = $("#user_level").dataTable({
        "deferRender": true,
        "processing": true,
        "serverSide": true,
        "ajax": {
            url: base_url + "/level/levelList",
            type: "post",
            data: function (d) {
                return buildParams("#searchForm :input", d);
            }
        },
        "searching": false,
        "ordering": false,
        "columns": [
            {
                "data": 'id',
                "bSortable": false,
                "visible": false
            },
            {
                "data": 'sumMoney',
                "visible": true,
                "render": function (data, type, row) {
                    return formatCurrency(data);
                }
            },
            {
                "data": 'sumBet',
                "visible": true,
                "render": function (data, type, row) {
                    return formatCurrency(data);
                }
            },
            {
                "data": 'memLevel',
                "visible": true
            },
            {
                "data": 'notes',
                "visible": true
            },
            {
                "data": 'serverAdmin',
                "visible": true
            },
            {
                "data": I18n.system_opt,
                "visible": authOwenUrls.indexOf('customerLevelEdit')>-1 || authOwenUrls.indexOf('customerLevelDel')>-1?true:false,
                "render": function (data, type, row) {
                    return function () {
                        tableData['key' + row.id] = row;
                        var html = '<p id="' + row.id + '" >';
                        if (!!authOwenUrls && authOwenUrls.indexOf('customerLevelEdit') > -1) {
                            html += '<button class="btn btn-warning btn-xs update" type="button">' + I18n.system_opt_edit + '</button>  ';
                        }
                        if (!!authOwenUrls && authOwenUrls.indexOf('customerLevelDel') > -1) {
                            html += '<button class="btn btn-danger btn-xs level_operate" _type="level_del" type="button">' + I18n.system_opt_del + '</button>  ';
                        }
                         html += '</p>';
                        return html;
                    };
                }
            }
        ],
        "language": language_table
    });

    var tableData = {};
    $('#searchBtn').on('click', function () {
        levelTable.fnDraw();
    });

    // add form
    $(".add").click(function () {
        $("#addModal .form")[0].reset();
        addModalValidate.resetForm();
        $("#addModal .form .form-group").removeClass("has-error");
        $('#addModal').modal({backdrop: false, keyboard: false}).modal('show');
    });

    var addModalValidate = $("#addModal .form").validate({
        errorElement: 'span',
        errorClass: 'help-block',
        focusInvalid: true,
        rules: {
            sumMoney: {
                required: true,
                number: true,
                minNumber: $("#addModal input[name='sumMoney']").val()
            },
            sumBet: {
                required: true,
                number: true,
                minNumber: $("#addModal input[name='sumBet']").val()
            },
            memLevel: {
                required: true,
                number: true
            },
            notes: {
                required: true
            },
            serverAdmin: {
                required: true
            }
        },
        messages: {
            sumMoney: {
                required: I18n.system_please_input + I18n.cus_cmoney,
                number: I18n.system_please_input + I18n.system_number,
                minNumber: I18n.system_min_number
            },
            sumBet: {
                required: I18n.system_please_input + I18n.level_bet,
                number: I18n.system_please_input + I18n.system_number,
                minNumber: I18n.system_min_number
            },
            memLevel: {
                required: I18n.system_please_input + I18n.cus_level,
                number: I18n.system_please_input + I18n.system_number
            },
            notes: {
                required: I18n.system_please_input + I18n.agent_url_notes
            },
            serverAdmin: {
                required: I18n.system_please_input + I18n.agent_serverAdmin
            }
        },
        highlight: function (element) {
            $(element).closest('.form-group').addClass('has-error');
        },
        success: function (label) {
            label.closest('.form-group').removeClass('has-error');
            label.remove();
        },
        errorPlacement: function (error, element) {
            element.parent('div').append(error);
        },
        submitHandler: function (form) {

            var param = getFormDataForJson($("#addModal .form"));
            $.post(base_url + "/level/add", param, function (data, status) {
                if (data.result === 0) {
                    $('#addModal').modal('hide');
                    layer.open({
                        title: I18n.system_tips,
                        btn: [I18n.system_ok],
                        content: I18n.system_add_suc,
                        icon: '1',
                        end: function (layero, index) {
                            levelTable.fnDraw();
                        }
                    });
                } else {
                    layer.open({
                        title: I18n.system_tips,
                        btn: [I18n.system_ok],
                        content: (data.error_msg || I18n.system_add_fail),
                        icon: '2'
                    });
                }
            });
        }
    });

    $("#addModal").on('hide.bs.modal', function () {
        $("#addModal .form")[0].reset();
        addModalValidate.resetForm();
        $("#addModal .form .form-group").removeClass("has-error");
        $(".remote_panel").show();
    });


    // update form
    $("#user_level").on('click', '.update', function () {

        $("#updateModal .form")[0].reset();
        var id = $(this).parent('p').attr("id");
        var row = tableData['key' + id];

        $("#updateModal .form input[name='id']").val(row.id);
        $("#updateModal .form input[name='sumMoney']").val(row.sumMoney);
        $("#updateModal .form input[name='sumBet']").val(row.sumBet);
        $("#updateModal .form input[name='memLevel']").val(row.memLevel);
        $("#updateModal .form input[name='serverAdmin']").val(row.serverAdmin);
        $("#updateModal .form input[name='notes']").val(row.notes);

        $('#updateModal').modal({backdrop: false, keyboard: false}).modal('show');
    });
    var updateModalValidate = $("#updateModal .form").validate({
        errorElement: 'span',
        errorClass: 'help-block',
        focusInvalid: true,
        rules: {
            sumMoney: {
                required: true,
                number: true,
                minNumber: $("#updateModal input[name='sumMoney']").val()
            },
            sumBet: {
                required: true,
                number: true,
                minNumber: $("#updateModal input[name='sumBet']").val()
            },
            memLevel: {
                required: true,
                number: true
            },
            notes: {
                required: true
            },
            serverAdmin: {
                required: true
            }
        },
        messages: {
            sumMoney: {
                required: I18n.system_please_input + I18n.cus_cmoney,
                number: I18n.system_please_input + I18n.system_number,
                minNumber: I18n.system_min_number
            },
            sumBet: {
                required: I18n.system_please_input + I18n.level_bet,
                number: I18n.system_please_input + I18n.system_number,
                minNumber: I18n.system_min_number
            },
            memLevel: {
                required: I18n.system_please_input + I18n.cus_level,
                number: I18n.system_please_input + I18n.system_number
            },
            notes: {
                required: I18n.system_please_input + I18n.agent_url_notes
            },
            serverAdmin: {
                required: I18n.system_please_input + I18n.agent_serverAdmin
            }
        },
        highlight: function (element) {
            $(element).closest('.form-group').addClass('has-error');
        },
        success: function (label) {
            label.closest('.form-group').removeClass('has-error');
            label.remove();
        },
        errorPlacement: function (error, element) {
            element.parent('div').append(error);
        },
        submitHandler: function (form) {

            var param = getFormDataForJson($("#updateModal .form"));

            $.post(base_url + "/level/update", param, function (data, status) {
                if (data.result === 0) {
                    $('#updateModal').modal('hide');
                    layer.open({
                        title: I18n.system_tips,
                        btn: [I18n.system_ok],
                        content: I18n.system_update_suc,
                        icon: '1',
                        end: function (layero, index) {
                            levelTable.fnDraw();
                        }
                    });
                } else {
                    layer.open({
                        title: I18n.system_tips,
                        btn: [I18n.system_ok],
                        content: (data.error_msg || I18n.system_update_fail),
                        icon: '2'
                    });
                }
            });
        }
    });
    $("#updateModal").on('hide.bs.modal', function () {
        $("#updateModal .form")[0].reset()
    });


    // delete form
    $("#user_level").on('click', '.level_operate', function () {
        var typeName;
        var url;
        var needFresh = false;
        var type = $(this).attr("_type");
        if ("user_pause" == type) {
            typeName = I18n.jobinfo_opt_stop;
            url = base_url + "/agent/stop";
            needFresh = true;
        } else if ("user_resume" == type) {
            typeName = I18n.jobinfo_opt_start;
            url = base_url + "/agent/start";
            needFresh = true;
        } else if ("level_del" == type) {
            typeName = I18n.system_opt_del;
            url = base_url + "/level/remove";
            needFresh = true;
        } else {
            return;
        }
        var id = $(this).parent('p').attr("id");
        var param = {};
        param.id = id;
        layer.confirm(I18n.system_ok + typeName + '?', {
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
                            content: typeName + I18n.system_success,
                            icon: '1',
                            end: function (layero, index) {
                                if (needFresh) {
                                    levelTable.fnDraw(false);
                                }
                            }
                        });
                    } else {
                        layer.open({
                            title: I18n.system_tips,
                            btn: [I18n.system_ok],
                            content: (data.error_msg || typeName + I18n.system_fail),
                            icon: '2'
                        });
                    }
                },
            });
        });
    });


});
