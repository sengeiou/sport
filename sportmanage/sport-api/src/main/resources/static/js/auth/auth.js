$(function () {
    fetchParentAuths();
    // init date tables
    var authTable = $("#auth_list").dataTable({
        "deferRender": true,
        "processing": true,
        "serverSide": true,
        "ajax": {
            url: base_url + "/auth/authList",
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
                "data": 'authNameCN',
                "visible": true
            },
            {
                "data": 'authNameEN',
                "visible": true
            },
            {
                "data": 'authType',
                "visible": true,
                "render": function (data, type, row) {
                    switch (parseInt(data)) {
                        case 1:
                            return "菜单权限";
                        case 2:
                            return "操作权限";
                    }
                }
            },
            {
                "data": 'authUrl',
                "visible": true
            },
            {
                "data": 'authDesc',
                "visible": true
            },
            {
                "data": 'parent',
                "visible": true,
                "render": function (data, type, row) {
                    var res = "";
                    if (data !== 0) {
                        $.each(parentAuths, function (idx, obj) {
                            if (obj.id === data) {
                                res = obj.authNameCN;
                                return;
                            }
                        })
                    }
                    return res;
                }
            },
            {
                "data": I18n.system_opt,
                "visible": authOwenUrls.indexOf('authUpdate') > -1 || authOwenUrls.indexOf('authDelete') > -1 ? true : false,
                "render": function (data, type, row) {
                    return function () {
                        tableData['key' + row.id] = row;
                        var html = '<p id="' + row.id + '" >';
                        if (!!authOwenUrls && authOwenUrls.indexOf('authUpdate') > -1) {
                            html += '<button class="btn btn-warning btn-xs update" type="button">' + I18n.system_opt_edit + '</button>  ';
                        }
                        if (!!authOwenUrls && authOwenUrls.indexOf('authDelete') > -1) {
                            html += '<button class="btn btn-danger btn-xs user_operate" _type="auth_del" type="button">' + I18n.system_opt_del + '</button>  ';
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
        fetchParentAuths();
        authTable.fnDraw();
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
            authNameCN: {
                required: true
            },
            authNameEN: {
                required: true
            }
        },
        messages: {
            authNameCN: {
                required: I18n.system_please_input + I18n.auth_name_cn
            },
            authNameEN: {
                required: I18n.system_please_input + I18n.auth_name_en
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
            $.post(base_url + "/auth/add", param, function (data, status) {
                if (data.result === 0) {
                    $('#addModal').modal('hide');
                    layer.open({
                        title: I18n.system_tips,
                        btn: [I18n.system_ok],
                        content: I18n.system_add_suc,
                        icon: '1',
                        end: function (layero, index) {
                            fetchParentAuths();
                            authTable.fnDraw();
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
    $("#auth_list").on('click', '.update', function () {

        var id = $(this).parent('p').attr("id");
        var row = tableData['key' + id];

        $("#updateModal .form input[name='id']").val(row.id);
        $("#updateModal .form input[name='authNameCN']").val(row.authNameCN);
        $("#updateModal .form input[name='authNameEN']").val(row.authNameEN);
        $('#updateModal .form select[name=authType] option[value=' + row.authType + ']').prop('selected', true);
        $("#updateModal .form input[name='authDesc']").val(row.authDesc);
        $('#updateModal .form select[name=parent] option[value=' + row.parent + ']').prop('selected', true);
        $("#updateModal .form input[name='authUrl']").val(row.authUrl);

        $('#updateModal').modal({backdrop: false, keyboard: false}).modal('show');
    });
    var updateModalValidate = $("#updateModal .form").validate({
        errorElement: 'span',
        errorClass: 'help-block',
        focusInvalid: true,

        rules: {
            authNameCN: {
                required: true
            },
            authNameEN: {
                required: true
            }
        },
        messages: {
            authNameCN: {
                required: I18n.system_please_input + I18n.auth_name_cn
            },
            authNameEN: {
                required: I18n.system_please_input + I18n.auth_name_en
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
            $.post(base_url + "/auth/update", param, function (data, status) {
                if (data.result === 0) {
                    $('#updateModal').modal('hide');
                    layer.open({
                        title: I18n.system_tips,
                        btn: [I18n.system_ok],
                        content: I18n.system_update_suc,
                        icon: '1',
                        end: function (layero, index) {
                            fetchParentAuths();
                            authTable.fnDraw();
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
    $("#auth_list").on('click', '.user_operate', function () {
        var typeName;
        var url;
        var needFresh = false;
        var type = $(this).attr("_type");
        if ("user_pause" == type) {
            typeName = I18n.jobinfo_opt_stop;
            url = base_url + "/user/stop";
            needFresh = true;
        } else if ("user_resume" == type) {
            typeName = I18n.jobinfo_opt_start;
            url = base_url + "/user/start";
            needFresh = true;
        } else if ("auth_del" == type) {
            typeName = I18n.system_opt_del;
            url = base_url + "/auth/remove";
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
                                    fetchParentAuths();
                                    authTable.fnDraw(false);
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
