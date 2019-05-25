$(function () {

    // init date tables
    var enumTable = $("#enum_level").dataTable({
        "deferRender": true,
        "processing": true,
        "serverSide": true,
        "ajax": {
            url: base_url + "/dict/enumList",
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
                "data": 'name',
                "bSortable": false,
                "visible": true
            },
            {
                "data": 'code',
                "bSortable": false,
                "visible": true
            },
            {
                "data": 'typeName',
                "bSortable": false,
                "visible": true
            },
            {
                "data": 'value',
                "bSortable": false,
                "visible": true
            },
            {
                "data": 'sort',
                "bSortable": false,
                "visible": true
            },
            {
                "data": I18n.system_opt,
                "render": function (data, type, row) {
                    return function () {
                        tableData['key' + row.id] = row;
                        var html = '<p id="' + row.id + '" >' +
                            '<button class="btn btn-warning btn-xs update" type="button">' + I18n.system_opt_edit + '</button>  ' +
                            '<button class="btn btn-danger btn-xs level_operate" _type="enum_del" type="button">' + I18n.system_opt_del + '</button>  ' +
                            '</p>';
                        return html;
                    };
                }
            }
        ],
        "language": language_table
    });

    var tableData = {};
    $('#searchBtn').on('click', function () {
        enumTable.fnDraw();
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
            name: {
                required: true
            },
            code: {
                required: true
            },
            value: {
                required: true
            },
            sort: {
                required: true,
                number: true
            }
        },
        messages: {
            name: {
                required: I18n.system_please_input + I18n.sport_enum_name
            },
            code: {
                required: I18n.system_please_input + I18n.spoort_enum_code
            },
            value: {
                required: I18n.system_please_input + I18n.sport_enum_value
            },
            sort: {
                required: I18n.system_please_input + I18n.sport_enum_order,
                number: I18n.system_please_input + I18n.system_number
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
            $.post(base_url + "/dict/add", param, function (data, status) {
                if (data.result === 0) {
                    $('#addModal').modal('hide');
                    layer.open({
                        title: I18n.system_tips,
                        btn: [I18n.system_ok],
                        content: I18n.system_add_suc,
                        icon: '1',
                        end: function (layero, index) {
                            enumTable.fnDraw();
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
    $("#enum_level").on('click', '.update', function () {

        $("#updateModal .form")[0].reset();
        var id = $(this).parent('p').attr("id");
        var row = tableData['key' + id];

        $("#updateModal .form input[name='id']").val(row.id);
        $("#updateModal .form input[name='name']").val(row.name);
        $("#updateModal .form input[name='code']").val(row.code);
        $('#updateModal .form select[name=typeCode] option[value=' + row.typeCode + ']').prop('selected', true);
        $("#updateModal .form input[name='value']").val(row.value);
        $("#updateModal .form input[name='sort']").val(row.sort);
        $('#updateModal').modal({backdrop: false, keyboard: false}).modal('show');
    });
    var updateModalValidate = $("#updateModal .form").validate({
        errorElement: 'span',
        errorClass: 'help-block',
        focusInvalid: true,
        rules: {
            name: {
                required: true
            },
            code: {
                required: true
            },
            value: {
                required: true
            },
            sort: {
                required: true,
                number: true
            }
        },
        messages: {
            name: {
                required: I18n.system_please_input + I18n.sport_enum_name
            },
            code: {
                required: I18n.system_please_input + I18n.spoort_enum_code
            },
            value: {
                required: I18n.system_please_input + I18n.sport_enum_value
            },
            sort: {
                required: I18n.system_please_input + I18n.sport_enum_order,
                number: I18n.system_please_input + I18n.system_number
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
            $.post(base_url + "/dict/update", param, function (data, status) {
                if (data.result === 0) {
                    $('#updateModal').modal('hide');
                    layer.open({
                        title: I18n.system_tips,
                        btn: [I18n.system_ok],
                        content: I18n.system_update_suc,
                        icon: '1',
                        end: function (layero, index) {
                            enumTable.fnDraw();
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
    $("#enum_level").on('click', '.level_operate', function () {
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
        } else if ("enum_del" == type) {
            typeName = I18n.system_opt_del;
            url = base_url + "/dict/remove";
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
                                    enumTable.fnDraw(false);
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
