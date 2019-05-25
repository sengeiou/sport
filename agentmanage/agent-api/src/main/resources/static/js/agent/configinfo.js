$(function () {

    // init date tables
    var agentsUrl = "/config/agents";
    fetchAllAgentInfos(agentsUrl);
    var agentTable = $("#agent_url_list").dataTable({
        "deferRender": true,
        "processing": true,
        "serverSide": true,
        "ajax": {
            url: base_url + "/config/configList",
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
                "data": 'agentUrl',
                "visible": true
            },
            {
                "data": 'status',
                "visible": true,
                "render": function (data, type, row) {
                    switch (parseInt(data)) {
                        case 0:
                            return "正常";
                        case 1:
                            return "删除";
                    }
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
                "data": I18n.system_opt,
                "visible": authOwenUrls.indexOf('configUpdate')>-1 || authOwenUrls.indexOf('configDelete')>-1?true:false,
                "render": function (data, type, row) {
                    return function () {
                        tableData['key' + row.id] = row;
                        var html = '<p id="' + row.id + '" >';
                        if (!!authOwenUrls && authOwenUrls.indexOf('configUpdate') > -1) {
                            html += '<button class="btn btn-warning btn-xs update" type="button">' + I18n.system_opt_edit + '</button>  ';
                        }
                        if (!!authOwenUrls && authOwenUrls.indexOf('configDelete') > -1) {
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
            agentUrl: {
                required: true
            },
            serverAdmin: {
                required: true
            },
            notes: {
                required: true
            }
        },
        messages: {
            agentUrl: {
                required: I18n.system_please_input + I18n.agent_url_name
            },
            serverAdmin: {
                required: I18n.system_please_input + I18n.ADMIN_AGENT
            },
            notes: {
                required: I18n.system_please_input + I18n.agent_url_notes
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
            $.post(base_url + "/config/add", param, function (data, status) {
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


    // update form
    $("#agent_url_list").on('click', '.update', function () {

        $("#updateModal .form")[0].reset();
        var id = $(this).parent('p').attr("id");
        var row = tableData['key' + id];

        $("#updateModal .form input[name='id']").val(row.id);
        $('#updateModal .form select[name=agentId] option[value=' + row.agentId + ']').prop('selected', true);
        $("#updateModal .form input[name='agentUrl']").val(row.agentUrl);
        $('#updateModal .form select[name=status] option[value=' + row.status + ']').prop('selected', true);
        $("#updateModal .form input[name='serverAdmin']").val(row.serverAdmin);
        $("#updateModal .form input[name='notes']").val(row.notes);

        $('#updateModal').modal({backdrop: false, keyboard: false}).modal('show');
    });
    var updateModalValidate = $("#updateModal .form").validate({
        errorElement: 'span',
        errorClass: 'help-block',
        focusInvalid: true,
        rules: {
            agentUrl: {
                required: true
            },
            serverAdmin: {
                required: true
            },
            notes: {
                required: true
            }
        },
        messages: {
            agentUrl: {
                required: I18n.system_please_input + I18n.agent_url_name
            },
            serverAdmin: {
                required: I18n.system_please_input + I18n.ADMIN_AGENT
            },
            notes: {
                required: I18n.system_please_input + I18n.agent_url_notes
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

            $.post(base_url + "/config/update", param, function (data, status) {
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
    $("#agent_url_list").on('click', '.user_operate', function () {
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
            url = base_url + "/config/remove";
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
