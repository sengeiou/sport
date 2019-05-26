<!DOCTYPE html>
<html>
<head>
    <#import "../common/common.macro.ftl" as netCommon>
    <@netCommon.commonStyle />
    <title>${I18n.admin_name}</title>
    <style type="text/css">

    </style>
</head>
<body class="hold-transition skin-blue sidebar-mini <#if cookieMap?exists && cookieMap["sport_manage_settings"]?exists && "off" == cookieMap["sport_manage_settings"].value >sidebar-collapse</#if>">
<div class="wrapper">
    <@netCommon.commonHeader />
    <@netCommon.commonLeft "rolePage" />
    <div class="content-wrapper">
        <section class="content">
            <div class="row" id="searchForm">
                <div class="col-xs-2">
                    <div class="input-group">
                        <span class="input-group-addon">${I18n.role_name_cn}</span>
                        <input type="text" class="form-control" id="roleNameCN" name="roleNameCN" autocomplete="off">
                    </div>
                </div>
                <div class="col-xs-2">
                    <div class="input-group">
                        <span class="input-group-addon">${I18n.role_name_en}</span>
                        <input type="text" class="form-control" id="roleNameEN" name="roleNameEN" autocomplete="off">
                    </div>
                </div>

                <div class="col-xs-1">
                    <button class="btn btn-block btn-info" id="searchBtn">${I18n.system_search}</button>
                </div>
                <#if authOwenUrls?index_of("roleAdd") != -1>
                    <div class="col-xs-2">
                        <button class="btn btn-block btn-success add" type="button">${I18n.role_add}</button>
                    </div>
                </#if>
            </div>

            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-body">
                            <table id="role_list" class="table table-bordered table-striped" width="100%">
                                <thead>
                                <tr>
                                    <th name="id">${I18n.ADMIN_ID}</th>
                                    <th name="jobGroup">${I18n.role_name_cn}</th>
                                    <th name="jobGroup">${I18n.role_name_en}</th>
                                    <th name="glueType">${I18n.role_desc}</th>
                                    <th>${I18n.system_opt}</th>
                                </tr>
                                </thead>
                                <tbody></tbody>
                                <tfoot></tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <@netCommon.commonFooter />
</div>

<!-- 新增.模态框 -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" style="margin-top: 25%;">
            <div class="modal-header">
                <h4 class="modal-title">${I18n.role_add}</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal form" role="form">
                    <div class="form-group">
                        <label for="roleNameCN" class="col-sm-2 control-label">${I18n.role_name_cn}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="roleNameCN"
                                                     placeholder="${I18n.auth_name_cn}"></div>
                        <label for="roleNameEN" class="col-sm-2 control-label">${I18n.role_name_en}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="roleNameEN"
                                                     placeholder="${I18n.auth_name_en}"></div>
                    </div>
                    <div class="form-group">
                        <label for="roleDesc" class="col-sm-2 control-label">${I18n.role_desc}<font
                                    color="black">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="roleDesc"
                                                     placeholder="${I18n.auth_desc}"></div>
                    </div>

                    <hr>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-6">
                            <button type="submit" class="btn btn-primary">${I18n.system_save}</button>
                            <button type="button" class="btn btn-default"
                                    data-dismiss="modal">${I18n.system_cancel}</button>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

<!-- 更新.模态框 -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" style="margin-top: 25%;">
            <div class="modal-header">
                <h4 class="modal-title">${I18n.role_update}</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal form" role="form">
                    <input type="hidden" name="id">
                    <div class="form-group">
                        <label for="roleNameCN" class="col-sm-2 control-label">${I18n.role_name_cn}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="roleNameCN"
                                                     placeholder="${I18n.auth_name_cn}"></div>
                        <label for="roleNameEN" class="col-sm-2 control-label">${I18n.role_name_en}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="roleNameEN"
                                                     placeholder="${I18n.auth_name_en}"></div>
                    </div>
                    <div class="form-group">
                        <label for="roleDesc" class="col-sm-2 control-label">${I18n.role_desc}<font
                                    color="black">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="roleDesc"
                                                     placeholder="${I18n.auth_desc}"></div>
                    </div>

                    <hr>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-6">
                            <button type="submit" class="btn btn-primary">${I18n.system_save}</button>
                            <button type="button" class="btn btn-default"
                                    data-dismiss="modal">${I18n.system_cancel}</button>
                            <input type="hidden" name="id">
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

<!-- 权限配置.模态框 -->
<div class="modal fade" id="configModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" style="margin-top: 25%;">
            <div class="modal-header">
                <h4 class="modal-title">${I18n.role_config}</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal form" role="form">

                    <ul id="authTree" class="ztree"></ul>
                    <hr>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-6">
                            <input type="button" class="btn btn-primary" id="auth_config"
                                   value="${I18n.system_save}"/>
                            <button type="button" class="btn btn-default"
                                    data-dismiss="modal">${I18n.system_cancel}</button>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

<@netCommon.commonScript />
<script src="${request.contextPath}/static/js/constant.js"></script>
<script src="${request.contextPath}/static/js/auth/role.js"></script>
</body>
</html>
