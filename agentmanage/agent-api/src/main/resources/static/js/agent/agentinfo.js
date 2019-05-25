$(function () {

    var loginNameSession = $("#loginNameSession").val();
    if (!!loginNameSession && loginNameSession !== 'admin') {
        $("#searchForm #userName").val(loginNameSession);
        $("#searchForm #userName").attr("readOnly", true);
    } else {
        $("#searchForm #userName").attr("readOnly", false);
    }

    var agentBanksUrl = "/agent/banks";
    fetchAllBankInfos(agentBanksUrl);
    // init date tables
    var agentTable = $("#agent_list").dataTable({
        "deferRender": true,
        "processing": true,
        "serverSide": true,
        "ajax": {
            url: base_url + "/agent/agentList",
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
                "data": 'userName',
                "visible": true
            },
            {
                "data": 'money',
                "visible": true,
                "render": function (data, type, row) {
                    return formatCurrency(data);
                }
            },
            {
                "data": 'alias',
                "visible": true
            },
            {
                "data": 'bankId',
                "visible": true,
                "render": function (data, type, row) {
                    var rest = "";
                    if (data !== 0) {
                        $.each(bankInfos, function (idx, obj) {
                            if (obj.id.toString() === data.toString()) {
                                rest = obj.bankAccount;
                                return;
                            }
                        })
                    }
                    return rest;
                }
            },
            {
                "data": 'status',
                "visible": true,
                "render": function (data, type, row) {
                    switch (parseInt(data)) {
                        case 0:
                            return "正常";
                        case 1:
                            return "冻结";
                        case 2:
                            return "删除";
                    }
                }
            },
            {
                "data": 'addDate',
                "visible": true,
                "render": function (data, type, row) {
                    return data ? moment(new Date(data)).format("YYYY-MM-DD HH:mm:ss") : "";
                }
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
                "data": 'phone',
                "visible": true
            },
            {
                "data": I18n.system_opt,
                "visible": authOwenUrls.indexOf('agentUpdate')>-1 || authOwenUrls.indexOf('agentDelete')>-1?true:false,
                "render": function (data, type, row) {
                    return function () {
                        tableData['key' + row.id] = row;
                        var html = '<p id="' + row.id + '" >';
                        if (!!authOwenUrls && authOwenUrls.indexOf('agentUpdate') > -1) {
                            html += '<button class="btn btn-warning btn-xs update" type="button">' + I18n.system_opt_edit + '</button>  ';
                        }
                        if (!!authOwenUrls && authOwenUrls.indexOf('agentDelete') > -1) {
                            html += '<button class="btn btn-danger btn-xs user_operate" _type="agent_del" type="button">' + I18n.system_opt_del + '</button>  ';
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
        agentTable.fnDraw();
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
            userName: {
                required: true,
                minlength: 5,
                maxlength: 18
            },
            alias: {
                required: true
            },
            serverAdmin: {
                required: true
            },
            bankId: {
                required: true
            },
            notes: {
                required: true
            },
            phone: {
                required: true
            },
            money: {
                required: true,
                number: true,
                minNumber: $("#addModal input[name='money']").val()
            },
            password: {
                required: true,
                minlength: 6,
                maxlength: 18,
                equalTo: "#newPassword"
            },
            newPassword: {
                required: true,
                minlength: 6,
                maxlength: 18,
                equalTo: "#password"
            },
            passwordSafe: {
                required: true,
                minlength: 6,
                maxlength: 18,
                equalTo: "#passwordSafeConfirm"
            },
            passwordSafeConfirm: {
                required: true,
                minlength: 6,
                maxlength: 18,
                equalTo: "#passwordSafe"
            }
        },
        messages: {
            userName: {
                required: I18n.system_please_input + I18n.ADMIN_ACCOUNT
            },
            alias: {
                required: I18n.system_please_input + I18n.ADMIN_REAL_NAME
            },
            serverAdmin: {
                required: I18n.system_please_input + I18n.ADMIN_AGENT
            },
            bankId: {
                required: I18n.system_please_input + I18n.agent_bankId
            },
            notes: {
                required: I18n.system_please_input + I18n.agent_notes
            },
            phone: {
                required: I18n.system_please_input + I18n.agent_phone
            },
            money: {
                required: I18n.system_please_input + I18n.agent_money,
                number: I18n.system_please_input + I18n.system_number,
                minNumber: I18n.system_min_number
            },
            password: {
                required: I18n.login_password_empty,
                equalTo: I18n.ADMIN_PASSWORD_NOT_SAME
            },
            newPassword: {
                required: I18n.login_password_confirm,
                equalTo: I18n.ADMIN_PASSWORD_NOT_SAME
            },
            passwordSafe: {
                required: I18n.login_password_empty,
                equalTo: I18n.ADMIN_PASSWORD_NOT_SAME
            },
            passwordSafeConfirm: {
                required: I18n.login_password_confirm,
                equalTo: I18n.ADMIN_PASSWORD_NOT_SAME
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
            $.post(base_url + "/agent/add", param, function (data, status) {
                if (data.result === 0) {
                    $('#addModal').modal('hide');
                    layer.open({
                        title: I18n.system_tips,
                        btn: [I18n.system_ok],
                        content: I18n.system_add_suc,
                        icon: '1',
                        end: function (layero, index) {
                            agentTable.fnDraw();
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

    $("#moneyChangeSelect").click(function () {
        if ($(this).is(':checked')) {
            $("#moneyChange").show();
        } else {
            $("#moneyChange").hide();
        }
    });

    $("#pswSelect").click(function () {
        if ($(this).is(':checked')) {
            $("#passwordReset").show();
        } else {
            $("#passwordReset").hide();
        }
    });

    $("#passwordSafeSelect").click(function () {
        if ($(this).is(':checked')) {
            $("#passwordSafeReset").show();
        } else {
            $("#passwordSafeReset").hide();
        }
    });


    // update form
    $("#agent_list").on('click', '.update', function () {

        $("#moneyChange").hide();
        $("#passwordReset").hide();
        $("#passwordSafeReset").hide();
        $("#updateModal .form")[0].reset();
        var id = $(this).parent('p').attr("id");
        var row = tableData['key' + id];

        $("#updateModal .form input[name='id']").val(row.id);
        $("#updateModal .form input[name='userName']").val(row.userName);
        $("#updateModal .form input[name='alias']").val(row.alias);
        $("#updateModal .form input[name='phone']").val(row.phone);
        $('#updateModal .form select[name=bankId] option[value=' + row.bankId + ']').prop('selected', true);
        $("#updateModal .form input[name='notes']").val(row.notes);
        $("#updateModal .form input[name='serverAdmin']").val(row.serverAdmin);
        $('#updateModal .form select[name=status] option[value=' + row.status + ']').prop('selected', true);
        $("#updateModal .form input[name='money']").val("");
        $("#updateModal .form input[name='password']").val("");
        $("#updateModal .form input[name='newPassword']").val("");
        $("#updateModal .form input[name='passwordSafe']").val("");
        $("#updateModal .form input[name='passwordSafeConfirm']").val("");

        $('#updateModal').modal({backdrop: false, keyboard: false}).modal('show');
    });
    var updateModalValidate = $("#updateModal .form").validate({
        errorElement: 'span',
        errorClass: 'help-block',
        focusInvalid: true,
        rules: {
            userName: {
                required: true,
                minlength: 5,
                maxlength: 18
            },
            alias: {
                required: true
            },
            serverAdmin: {
                required: true
            },
            bankId: {
                required: true
            },
            notes: {
                required: true
            },
            phone: {
                required: true
            },
            money: {
                required: true,
                number: true,
                minNumber: $("#updateModal input[name='money']").val()
            },
            password: {
                required: true,
                minlength: 6,
                maxlength: 18,
                equalTo: "#newPassword_up"
            },
            newPassword: {
                required: true,
                minlength: 6,
                maxlength: 18,
                equalTo: "#password_up"
            },
            passwordSafe: {
                required: true,
                minlength: 6,
                maxlength: 18,
                equalTo: "#passwordSafeConfirm_up"
            },
            passwordSafeConfirm: {
                required: true,
                minlength: 6,
                maxlength: 18,
                equalTo: "#passwordSafe_up"
            }
        },
        messages: {
            userName: {
                required: I18n.system_please_input + I18n.ADMIN_ACCOUNT
            },
            alias: {
                required: I18n.system_please_input + I18n.ADMIN_REAL_NAME
            },
            serverAdmin: {
                required: I18n.system_please_input + I18n.ADMIN_AGENT
            },
            bankId: {
                required: I18n.system_please_input + I18n.agent_bankId
            },
            notes: {
                required: I18n.system_please_input + I18n.agent_notes
            },
            phone: {
                required: I18n.system_please_input + I18n.agent_phone
            },
            money: {
                required: I18n.system_please_input + I18n.agent_money,
                number: I18n.system_please_input + I18n.system_number,
                minNumber: I18n.system_min_number
            },
            password: {
                required: I18n.login_password_empty,
                equalTo: I18n.ADMIN_PASSWORD_NOT_SAME
            },
            newPassword: {
                required: I18n.login_password_confirm,
                equalTo: I18n.ADMIN_PASSWORD_NOT_SAME
            },
            passwordSafe: {
                required: I18n.login_password_empty,
                equalTo: I18n.ADMIN_PASSWORD_NOT_SAME
            },
            passwordSafeConfirm: {
                required: I18n.login_password_confirm,
                equalTo: I18n.ADMIN_PASSWORD_NOT_SAME
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

            var param = getFormDataForObj($("#updateModal .form"));
            if (!$("#moneyChangeSelect").is(':checked')) {
                param.money = 0;
            }
            if (!$("#pswSelect").is(':checked')) {
                param.password = "";
            }
            if (!$("#passwordSafeSelect").is(':checked')) {
                param.passwordSafe = "";
            }
            $.post(base_url + "/agent/update", JSON.stringify(param), function (data, status) {
                if (data.result === 0) {
                    $('#updateModal').modal('hide');
                    layer.open({
                        title: I18n.system_tips,
                        btn: [I18n.system_ok],
                        content: I18n.system_update_suc,
                        icon: '1',
                        end: function (layero, index) {
                            agentTable.fnDraw();
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
    $("#agent_list").on('click', '.user_operate', function () {
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
        } else if ("agent_del" == type) {
            typeName = I18n.system_opt_del;
            url = base_url + "/agent/remove";
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
                                    agentTable.fnDraw(false);
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
