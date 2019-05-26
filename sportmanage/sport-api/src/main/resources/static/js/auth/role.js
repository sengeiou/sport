$(function () {
    // init date tables
    var roleTable = $("#role_list").dataTable({
        "deferRender": true,
        "processing": true,
        "serverSide": true,
        "ajax": {
            url: base_url + "/role/roleList",
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
                "data": 'roleNameCN',
                "visible": true
            },
            {
                "data": 'roleNameEN',
                "visible": true
            },
            {
                "data": 'roleDesc',
                "visible": true
            },
            {
                "data": I18n.system_opt,
                "visible": authOwenUrls.indexOf('roleUpdate') > -1 || authOwenUrls.indexOf('roleConfig') > -1
                || authOwenUrls.indexOf('roleDelete') > -1 ? true : false,
                "render": function (data, type, row) {
                    return function () {
                        tableData['key' + row.id] = row;
                        var html = '<p id="' + row.id + '" >';
                        if (!!authOwenUrls && authOwenUrls.indexOf('roleUpdate') > -1) {
                            html += '<button class="btn btn-warning btn-xs update" type="button">' + I18n.system_opt_edit + '</button>  ';
                        }
                        if (!!authOwenUrls && authOwenUrls.indexOf('roleConfig') > -1) {
                            html += '<button class="btn btn-success btn-xs user_operate" _type="role_config" type="button">' + I18n.role_config + '</button>  ';
                        }
                        if (!!authOwenUrls && authOwenUrls.indexOf('roleDelete') > -1) {
                            html += '<button class="btn btn-danger btn-xs user_operate" _type="role_del" type="button">' + I18n.system_opt_del + '</button>  ';
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
        roleTable.fnDraw();
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
            roleNameCN: {
                required: true
            },
            roleNameEN: {
                required: true
            }
        },
        messages: {
            roleNameCN: {
                required: I18n.system_please_input + I18n.role_name_cn
            },
            roleNameEN: {
                required: I18n.system_please_input + I18n.role_name_en
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
            $.post(base_url + "/role/add", param, function (data, status) {
                if (data.result === 0) {
                    $('#addModal').modal('hide');
                    layer.open({
                        title: I18n.system_tips,
                        btn: [I18n.system_ok],
                        content: I18n.system_add_suc,
                        icon: '1',
                        end: function (layero, index) {
                            roleTable.fnDraw();
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
    $("#role_list").on('click', '.update', function () {

        var id = $(this).parent('p').attr("id");
        var row = tableData['key' + id];

        $("#updateModal .form input[name='id']").val(row.id);
        $("#updateModal .form input[name='roleNameCN']").val(row.roleNameCN);
        $("#updateModal .form input[name='roleNameEN']").val(row.roleNameEN);
        $("#updateModal .form input[name='roleDesc']").val(row.roleDesc);

        $('#updateModal').modal({backdrop: false, keyboard: false}).modal('show');
    });
    var updateModalValidate = $("#updateModal .form").validate({
        errorElement: 'span',
        errorClass: 'help-block',
        focusInvalid: true,

        rules: {
            roleNameCN: {
                required: true
            },
            roleNameEN: {
                required: true
            }
        },
        messages: {
            roleNameCN: {
                required: I18n.system_please_input + I18n.role_name_cn
            },
            roleNameEN: {
                required: I18n.system_please_input + I18n.role_name_en
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
            $.post(base_url + "/role/update", param, function (data, status) {
                if (data.result === 0) {
                    $('#updateModal').modal('hide');
                    layer.open({
                        title: I18n.system_tips,
                        btn: [I18n.system_ok],
                        content: I18n.system_update_suc,
                        icon: '1',
                        end: function (layero, index) {
                            roleTable.fnDraw();
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
    $("#role_list").unbind('click').on('click', '.user_operate', function () {
        //初始化权限树形页面
        $("#configModal .form")[0].reset();
        var typeName;
        var url;
        var needFresh = false;
        var type = $(this).attr("_type");
        if ("role_config" == type) {
            typeName = I18n.role_config;
            url = base_url + "/role/config";
            needFresh = false;
        } else if ("role_del" == type) {
            typeName = I18n.system_opt_del;
            url = base_url + "/role/remove";
            needFresh = true;
        } else {
            return;
        }
        var id = $(this).parent('p').attr("id");
        var param = {};
        param.id = id;
        if ("role_config" == type) {
            loadAllAuths();
            $('#configModal').modal({backdrop: false, keyboard: false}).modal('show');
            var zNodes = eval(allAuths);
            $.fn.zTree.init($("#authTree"), zTree_setting, zNodes);
            initSelectedTree(id);
            $("#auth_config").unbind('click').click(function () {
                var ids = fetchAllSelectedNode();
                param.roleId = id.toString();
                param.authIds = ids;
                $.ajax({
                    type: 'POST',
                    url: url,
                    data: JSON.stringify(param),
                    dataType: "json",
                    success: function (data) {
                        $("#configModal").modal('hide');
                        if (data.result === 0) {
                            layer.open({
                                title: I18n.system_tips,
                                btn: [I18n.system_ok],
                                content: typeName + I18n.system_success,
                                icon: '1'
                            });
                        } else {
                            layer.open({
                                title: I18n.system_tips,
                                btn: [I18n.system_ok],
                                content: (data.error_msg || typeName + I18n.system_fail),
                                icon: '2'
                            });
                        }
                    }
                });
            });
        } else {
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
                                        roleTable.fnDraw(false);
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
        }
    });


    $("#configModal").on('hide.bs.modal', function () {
        $("#configModal .form")[0].reset();
        $("#addModal .form .form-group").removeClass("has-error");
        $(".remote_panel").show();
    });

    var allAuths = [];

    function loadAllAuths() {
        allAuths = [];
        $.ajax({
            type: 'POST',
            url: base_url + "/auth/all",
            async: false,
            dataType: "json",
            success: function (res) {
                var rt = res.data;
                $.each(rt, function (index, value) {
                    var x = {};
                    x.id = value.id.toString();
                    x.name = value.authNameCN.toString();
                    x.pId = value.parent.toString();
                    allAuths.push(x);
                });
                return allAuths;
            }
        });
    }

    var selectedAuths = [];

    function getSelectedAuths(id) {
        selectedAuths = [];
        var param = {};
        param.id = id;
        $.ajax({
            type: 'POST',
            url: base_url + "/auth/auth",
            data: JSON.stringify(param),
            async: false,
            dataType: "json",
            success: function (res) {
                var rt = res.data;
                $.each(rt, function (index, value) {
                    selectedAuths.push(value.authId.toString());
                });
                return selectedAuths;
            }
        });
    }


    function initSelectedTree(id) {

        getSelectedAuths(id);
        var datalist = selectedAuths;
        //获取所有树节点
        var treeObj = $.fn.zTree.getZTreeObj("authTree");
        if (datalist != '' && datalist.length > 0) {
            // var nodes=treeObj.getNodes();//获取所有子节点
            for (var i = 0; i < datalist.length; i++) {
                //通过id查找节点
                var node = treeObj.getNodeByParam("id", datalist[i], null);
                if (node != null && !node.isParent) {
                    treeObj.checkNode(node, true, true);
                }
            }
        }
    }


    //获取所有选中的节点数据
    function fetchAllSelectedNode() {
        var arr = new Array();
        var res = "";
        var tree = $.fn.zTree.getZTreeObj('authTree');
        var treeData = tree.getCheckedNodes(true);
        if (treeData.length != 0) {
            for (var i = 0; i < treeData.length; i++) {
                arr.push(treeData[i].id);
            }
        }
        if (arr.length != 0) {
            res = arr.join(",");
        }
        return res;
    }


});
