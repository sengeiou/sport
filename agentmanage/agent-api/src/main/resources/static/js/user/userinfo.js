$(function () {
    // init date tables
    var agentsUrl = "/user/agents";
    fetchAllAgentInfos(agentsUrl);

    $("[name='testFlag']").bootstrapSwitch(initTestSwitch);
    $("[name='agopen']").bootstrapSwitch(initSwitch);
    $("[name='mgopen']").bootstrapSwitch(initSwitch);
    $("[name='cpopen']").bootstrapSwitch(initSwitch);


    var userTable = $("#user_list").dataTable({
        "deferRender": true,
        "processing": true,
        "serverSide": true,
        "ajax": {
            url: base_url + "/user/userList",
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
                "data": 'agentId',
                "visible": true,
                "render": function (data, type, row) {
                    var rest = "";
                    if (data !== 0) {
                        $.each(agentInfos, function (idx, obj) {
                            if (obj.id.toString() === data.toString()) {
                                rest = obj.userName;
                                return;
                            }
                        })
                    }
                    return rest;
                }
            },
            {
                "data": 'ctime',
                "visible": true
            },
            {
                "data": 'ttime',
                "visible": true
            },
            {
                "data": 'cmoney',
                "visible": true,
                "render": function (data, type, row) {
                    return formatCurrency(data);
                }
            },
            {
                "data": 'tmoney',
                "visible": true,
                "render": function (data, type, row) {
                    return formatCurrency(data);
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
                "data": 'serverAdmin',
                "visible": true
            },
            {
                "data": I18n.system_opt,
                "visible": authOwenUrls.indexOf('customerUpdate')>-1 || authOwenUrls.indexOf('customerPlatformLimit')>-1
                    || authOwenUrls.indexOf('customerLimit')>-1 || authOwenUrls.indexOf('customerOut')>-1?true:false,
                "render": function (data, type, row) {
                    return function () {
                        tableData['key' + row.id] = row;
                        var html = '<p id="' + row.id + '"; serverAdmin="' + row.serverAdmin + '"; userName="' + row.userName + '" >';
                        if (!!authOwenUrls && authOwenUrls.indexOf('customerUpdate') > -1) {
                            html += '<button class="btn btn-success btn-xs update" type="button">' + I18n.system_opt_edit + '</button>  ';
                        }
                        if (!!authOwenUrls && authOwenUrls.indexOf('customerPlatformLimit') > -1) {
                            html += '<button class="btn btn-info btn-xs user_operate" _type="user_lim" type="button">' + I18n.syatem_ope_lim + '</button>  ';
                        }
                        var html2='';
                        var html3='';
                        var html4='';
                        if(row.limitBk === 0){
                            html2 = '<button class="btn btn-primary btn-xs user_operate" _type="user_bk" type="button" _limit_bk="' + row.limitBk + '">' + I18n.system_ope_bk + '</button>  ';
                        }else{
                            html2 = '<button class="btn btn-danger btn-xs user_operate" _type="user_bk" type="button" _limit_bk="' + row.limitBk + '">' + I18n.system_ope_bk + '</button>  ';
                        }
                        if(row.limitFt === 0){
                            html3 = '<button class="btn btn-primary btn-xs user_operate" _type="user_fb" type="button" _limit_ft="' + row.limitFt + '">' + I18n.system_ope_fb + '</button>  ';
                        }else{
                            html3 = '<button class="btn btn-danger btn-xs user_operate" _type="user_fb" type="button" _limit_ft="' + row.limitFt + '">' + I18n.system_ope_fb + '</button>  ';
                        }
                        if (!!authOwenUrls && authOwenUrls.indexOf('customerLimit') > -1) {
                            html += html2+html3;
                        }
                        if (!!authOwenUrls && authOwenUrls.indexOf('customerOut') > -1) {
                            html += '<button class="btn btn-warning btn-xs user_operate" _type="user_tx" type="button">' + I18n.system_ope_tx + '</button>  ';
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
        userTable.fnDraw();
    });

    // add form
    $(".add").click(function () {
        $("#addModal .form")[0].reset();
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
            withdrawalPasswd: {
                required: true,
                minlength: 6,
                maxlength: 18,
                equalTo: "#passwordSafeConfirm"
            },
            passwordSafeConfirm: {
                required: true,
                minlength: 6,
                maxlength: 18,
                equalTo: "#withdrawalPasswd"
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
            withdrawalPasswd: {
                required: I18n.draw_password_empty,
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

            var param = getFormDataForObj($("#addModal .form"));
            if (!!param.agopen) {
                param.agopen = 1;
            } else {
                param.agopen = 0;
            }
            if (!!param.cpopen) {
                param.cpopen = 1;
            } else {
                param.cpopen = 0;
            }
            if (!!param.mgopen) {
                param.mgopen = 1;
            } else {
                param.mgopen = 0;
            }
            if (!!param.testFlag) {
                param.testFlag = 1;
            } else {
                param.testFlag = 0;
            }
            $.post(base_url + "/user/add", JSON.stringify(param), function (data, status) {
                if (data.result === 0) {
                    $('#addModal').modal('hide');
                    layer.open({
                        title: I18n.system_tips,
                        btn: [I18n.system_ok],
                        content: I18n.system_add_suc,
                        icon: '1',
                        end: function (layero, index) {
                            userTable.fnDraw();
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

    $("#pswSelect").click(function () {
        if ($(this).is(':checked')) {
            $("#passwordReset").show();
        } else {
            $("#passwordReset").hide();
        }
    });

    $("#drawPswSelect").click(function () {
        if ($(this).is(':checked')) {
            $("#drawPasswordReset").show();
        } else {
            $("#drawPasswordReset").hide();
        }
    });

    $("#statusSelect").click(function () {
        if ($(this).is(':checked')) {
            $("#statusReset").show();
        } else {
            $("#statusReset").hide();
        }
    });


    // update form
    $("#user_list").on('click', '.update', function () {

        $("#passwordReset").hide();
        $("#drawPasswordReset").hide();
        $("#statusReset").hide();

        var id = $(this).parent('p').attr("id");
        var row = tableData['key' + id];
        $("#updateModal .form input[name='id']").val(row.id);
        $("#updateModal .form input[name='userName']").val(row.userName);
        $("#updateModal .form input[name='alias']").val(row.alias);
        $("#updateModal .form input[name='notesWithdrawal']").val(row.notesWithdrawal);
        $("#updateModal .form input[name='notes']").val(row.notes);
        $("#updateModal .form input[name='birthday']").val(row.birthday);
        $("#updateModal .form input[name='regIp']").val(row.regIp);
        $('#updateModal .form select[name=levelId] option[value=' + row.levelId + ']').prop('selected', true);
        $('#updateModal .form select[name=bankId] option[value=' + row.bankId + ']').prop('selected', true);

        $("#updateModal .form input[name='testFlag']").bootstrapSwitch('readonly', false);
        setTimeout(function () {
            initTestFlag(row.testFlag);
        }, 1000);
        setTimeout(function () {
            initAgopen(row.agopen);
        }, 1000);
        setTimeout(function () {
            initMgopen(row.mgopen);
        }, 1000);
        setTimeout(function () {
            initCpopen(row.cpopen);
        }, 1000);

        $("#updateModal .form input[name='password']").val("");
        $("#updateModal .form input[name='newPassword']").val("");
        $("#updateModal .form input[name='withdrawalPasswd']").val("");
        $("#updateModal .form input[name='passwordSafeConfirm']").val("");
        $("#updateModal .form input[name='money']").val("");
        $('#updateModal .form select[name=status] option[value=' + row.status + ']').prop('selected', true);

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
            notesWithdrawal: {
                required: true
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
            withdrawalPasswd: {
                required: true,
                minlength: 6,
                maxlength: 18,
                equalTo: "#passwordSafeConfirm_up"
            },
            passwordSafeConfirm: {
                required: true,
                minlength: 6,
                maxlength: 18,
                equalTo: "#withdrawalPasswd_up"
            }
        },
        messages: {
            userName: {
                required: I18n.system_please_input + I18n.ADMIN_ACCOUNT
            },
            alias: {
                required: I18n.system_please_input + I18n.ADMIN_REAL_NAME
            },
            notesWithdrawal: {
                required: I18n.system_please_input + I18n.cus_payment
            },
            password: {
                required: I18n.login_password_empty,
                equalTo: I18n.ADMIN_PASSWORD_NOT_SAME
            },
            newPassword: {
                required: I18n.login_password_confirm,
                equalTo: I18n.ADMIN_PASSWORD_NOT_SAME
            },
            withdrawalPasswd: {
                required: I18n.draw_password_empty,
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
            if (!!param.agopen) {
                param.agopen = 1;
            } else {
                param.agopen = 0;
            }
            if (!!param.cpopen) {
                param.cpopen = 1;
            } else {
                param.cpopen = 0;
            }
            if (!!param.mgopen) {
                param.mgopen = 1;
            } else {
                param.mgopen = 0;
            }
            if (!!param.testFlag) {
                param.testFlag = 1;
            } else {
                param.testFlag = 0;
            }
            if (!$("#pswSelect").is(':checked')) {
                param.password = "";
            }
            if (!$("#drawPswSelect").is(':checked')) {
                param.withdrawalPasswd = "";
            }
            if (!$("#statusSelect").is(':checked')) {
                param.status = -1;
            }
            $.post(base_url + "/user/update", JSON.stringify(param), function (data, status) {
                if (data.result === 0) {
                    $('#updateModal').modal('hide');
                    layer.open({
                        title: I18n.system_tips,
                        btn: [I18n.system_ok],
                        content: I18n.system_update_suc,
                        icon: '1',
                        end: function (layero, index) {
                            userTable.fnDraw();
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

    $("#user_list").on('click', '.user_operate', function () {
        var typeName;
        var url;
        var needFresh = false;
        var type = $(this).attr("_type");
        var id = $(this).parent('p').attr("id");
        var userName = $(this).parent('p').attr("userName");
        var limitBk = $(this).attr("_limit_bk");
        var limitFt = $(this).attr("_limit_ft");
        var limitType;
        var limitValue;
        var serverAdmin = $(this).parent('p').attr("serverAdmin");
        if ("user_lim" == type) {
            $("#limitModal input[name='id']").val(id);
            $("#limitModal input[name='serverAdmin']").val(serverAdmin);
            initBkConfigs();
            $('#limitModal').modal({backdrop: false, keyboard: false}).modal('show');
            $('#platformTab li:eq(0) a').tab('show');
            return;
        } else if ("user_bk" == type) {
            limitType = 1;
            if(limitBk === '0'){
                typeName = '限制篮球下注';
                limitValue = 1;
            }else{
                typeName = '解除限制篮球下注';
                limitValue = 0;
            }
            url = base_url + "/user/limit";
            needFresh = true;
        } else if ("user_fb" == type) {
            limitType = 2;
            if(limitFt === '0'){
                typeName = '限制足球下注';
                limitValue = 1;
            }else{
                typeName = '解除限制足球下注';
                limitValue = 0;
            }
            url = base_url + "/user/limit";
            needFresh = true;
        } else if ("user_tx" == type) {
            typeName = '踢线';
            url = base_url + "/user/out";
            needFresh = true;
        } else {
            return;
        }
        var param = {};
        param.id=id;
        param.userName=userName;
        param.type=limitType;
        param.value=limitValue;
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
                                    userTable.fnDraw(false);
                                }
                            }
                        });
                    } else {
                        layer.open({
                            title: I18n.system_tips,
                            btn: [I18n.system_ok],
                            content: typeName + I18n.system_fail,
                            icon: '2'
                        });
                    }
                },
            });
        });
    });


    // 初始化篮球限额平台
    function initBkConfigs() {
        var pFlag = false;
        var id = $("#limitModal input[name='id']").val();
        var param = {};
        param.id=id;
        $.ajax({
            type: 'POST',
            url: base_url + "/limit/bkConfigs",
            async: false,
            dataType: "json",
            data: JSON.stringify(param),
            success: function (res) {
                var resObjs = res.data;
                $.each(resObjs, function (idx, obj) {
                    if (!!obj && obj.type === 0) {
                        pFlag = true;
                        $("#platformBKModel input[type=text]").each(function () {
                                var name = $(this).attr('name');
                                $(this).attr("value", obj[name]);
                            }
                        );
                    } else if (!!obj && !pFlag && obj.type === 1 && obj.serverAdmin.toString() === '1') {
                        $("#platformBKModel input[type=text]").each(function () {
                                var name = $(this).attr('name');
                                $(this).attr("value", obj[name]);
                            }
                        );
                    } else {
                        if (!!obj) {
                            $("#defaultBKModel input[type=text]").each(function () {
                                    var name = $(this).attr('name');
                                    $(this).attr("value", obj[name]);
                                    $(this).attr('readonly', 'readonly');
                                }
                            );
                        }
                    }
                })
            }
        });
    }

    // 初始化足球限额平台
    function initFTConfigs() {
        var pFlag = false;
        var id = $("#limitModal input[name='id']").val();
        var param = {};
        param.id=id;
        $.ajax({
            type: 'POST',
            url: base_url + "/limit/ftConfigs",
            async: false,
            dataType: "json",
            data: JSON.stringify(param),
            success: function (res) {
                var resObjs = res.data;
                $.each(resObjs, function (idx, obj) {
                    //优先初始化会员自定义的平台限额
                    if (!!obj && obj.type === 0) {
                        pFlag = true;
                        $("#platformFTModel input[type=text]").each(function () {
                                var name = $(this).attr('name');
                                $(this).attr("value", obj[name]);
                            }
                        );
                    } else if (!!obj && !pFlag && obj.type === 1 && obj.serverAdmin.toString() === '1') {
                        $("#platformFTModel input[type=text]").each(function () {
                                var name = $(this).attr('name');
                                $(this).attr("value", obj[name]);
                            }
                        );
                    } else {
                        if (!!obj) {
                            $("#defaultFTModel input[type=text]").each(function () {
                                    var name = $(this).attr('name');
                                    $(this).attr("value", obj[name]);
                                    $(this).attr('readonly', 'readonly');
                                }
                            );
                        }
                    }
                })
            }
        });
    }

    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        var activeTab = $(e.target).text();
        if (activeTab === '篮球') {
            initBkConfigs();
        } else {
            initFTConfigs();
        }
    });


    var bkConfigParam;
    var ftConfigParam;

    //获取篮球平台限额
    function initBKConfigParam() {
        $("#platformBKModel input[type=text]").each(function () {
            var name = $(this).attr('name');
            var val = $(this).val();
            if (!val) {
                bkConfigParam = '';
                return;
            } else {
                bkConfigParam[name] = val;
            }
        });
        if (!!bkConfigParam) {
            bkConfigParam.userid=$("#limitModal input[name='id']").val();
            bkConfigParam.serverAdmin= $("#limitModal input[name='serverAdmin']").val();
            bkConfigParam.type=0;
        }
    }

    //获取足球平台限额
    function initFTConfigParam() {
        $("#platformFTModel input[type=text]").each(function () {
            var name = $(this).attr('name');
            var val = $(this).val();
            if (!val) {
                ftConfigParam = '';
                return;
            } else {
                ftConfigParam[name] = val;
            }
        });
        if (!!ftConfigParam) {
            ftConfigParam.userid=$("#limitModal input[name='id']").val();
            ftConfigParam.serverAdmin= $("#limitModal input[name='serverAdmin']").val();
            ftConfigParam.type=0;
        }
    }

    //篮球平台限额确认提交
    $("#submitBkConfig").on('click', function () {
        bkConfigParam = {};
        initBKConfigParam();
        if (!bkConfigParam) {
            showWarnMessage('输入框不能为空');
            return;
        }
        $.post(base_url + "/limit/opeBKConfig", JSON.stringify(bkConfigParam), function (data, status) {
            if (data.result === 0) {
                layer.open({
                    title: I18n.system_tips,
                    btn: [I18n.system_ok],
                    content: I18n.system_ope_success,
                    icon: '1',
                    end: function (layero, index) {
                        initBkConfigs();
                    }
                });
            } else {
                showFailMessage(I18n.system_ope_failed);
            }
        });
    });

    //足球平台限额确认提交
    $("#submitFTConfig").on('click', function () {
        ftConfigParam = {};
        initFTConfigParam();
        if (!ftConfigParam) {
            showWarnMessage('输入框不能为空');
            return;
        }
        $.post(base_url + "/limit/opeFTConfig", JSON.stringify(ftConfigParam), function (data, status) {
            if (data.result === 0) {
                layer.open({
                    title: I18n.system_tips,
                    btn: [I18n.system_ok],
                    content: I18n.system_ope_success,
                    icon: '1',
                    end: function (layero, index) {
                        initFTConfigs();
                    }
                });
            } else {
                showFailMessage(I18n.system_ope_failed);
            }
        });
    })

});
