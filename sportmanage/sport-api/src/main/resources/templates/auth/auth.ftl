<!DOCTYPE html>
<html>
<head>
    <#import "../common/common.macro.ftl" as netCommon>
    <@netCommon.commonStyle />
    <title>${I18n.admin_name}</title>
</head>
<body class="hold-transition skin-blue sidebar-mini <#if cookieMap?exists && cookieMap["sport_manage_settings"]?exists && "off" == cookieMap["sport_manage_settings"].value >sidebar-collapse</#if>">
<div class="wrapper">
    <@netCommon.commonHeader />
    <@netCommon.commonLeft "authPage" />
    <div class="content-wrapper">
        <section class="content">
            <div class="row" id="searchForm">
                <div class="col-xs-2">
                    <div class="input-group">
                        <span class="input-group-addon">${I18n.auth_name_cn}</span>
                        <input type="text" class="form-control" id="authNameCN" name="authNameCN" autocomplete="off">
                    </div>
                </div>
                <div class="col-xs-2">
                    <div class="input-group">
                        <span class="input-group-addon">${I18n.auth_name_en}</span>
                        <input type="text" class="form-control" id="authNameEN" name="authNameEN" autocomplete="off">
                    </div>
                </div>
                <div class="col-xs-2">
                    <div class="input-group">
                        <span class="input-group-addon">${I18n.auth_type}</span>
                        <select class="form-control" id="authType" name="authType">
                            <option value="-1">全部</option>
                            <option value="1">菜单权限</option>
                            <option value="2">操作权限</option>
                        </select>
                    </div>
                </div>
                <div class="col-xs-2">
                    <div class="input-group">
                        <span class="input-group-addon">${I18n.auth_parent}</span>
                        <select class="form-control" id="parent" name="parent">
                            <option value="-1">全部</option>
                            <#list parentAuths as parent>
                                <option value="${parent.id}">${parent.authNameCN}</option>
                            </#list>
                        </select>
                    </div>
                </div>

                <div class="col-xs-1">
                    <button class="btn btn-block btn-info" id="searchBtn">${I18n.system_search}</button>
                </div>
                <#if authOwenUrls?index_of("authAdd") != -1>
                    <div class="col-xs-2">
                        <button class="btn btn-block btn-success add" type="button">${I18n.auth_add}</button>
                    </div>
                </#if>
            </div>

            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-body">
                            <table id="auth_list" class="table table-bordered table-striped" width="100%">
                                <thead>
                                <tr>
                                    <th name="id">${I18n.ADMIN_ID}</th>
                                    <th name="jobGroup">${I18n.auth_name_cn}</th>
                                    <th name="jobGroup">${I18n.auth_name_en}</th>
                                    <th name="glueType">${I18n.auth_type}</th>
                                    <th name="executorParam">${I18n.auth_url}</th>
                                    <th name="author">${I18n.auth_desc}</th>
                                    <th name="jobDesc">${I18n.auth_parent}</th>
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
                <h4 class="modal-title">${I18n.auth_add}</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal form" role="form">
                    <div class="form-group">
                        <label for="authNameCN" class="col-sm-2 control-label">${I18n.auth_name_cn}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="authNameCN"
                                                     placeholder="${I18n.auth_name_cn}"></div>
                        <label for="authNameEN" class="col-sm-2 control-label">${I18n.auth_name_en}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="authNameEN"
                                                     placeholder="${I18n.auth_name_en}"></div>
                    </div>
                    <div class="form-group">
                        <label for="authType" class="col-sm-2 control-label">${I18n.auth_type}<font color="red">*</font></label>
                        <div class="col-sm-4">
                            <select class="form-control" name="authType">
                                <option value="1">菜单权限</option>
                                <option value="2">操作权限</option>
                            </select>
                        </div>
                        <label for="authDesc" class="col-sm-2 control-label">${I18n.auth_desc}<font
                                    color="black">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="authDesc"
                                                     placeholder="${I18n.auth_desc}"></div>
                    </div>
                    <div class="form-group">
                        <label for="parent" class="col-sm-2 control-label">${I18n.auth_parent}<font
                                    color="black">*</font></label>
                        <div class="col-sm-4">
                            <select class="form-control" name="parent">
                                <option value="0">--none--</option>
                                <#list parentAuths as parent>
                                    <option value="${parent.id}">${parent.authNameCN}</option>
                                </#list>
                            </select>
                        </div>
                        <label for="authUrl" class="col-sm-2 control-label">${I18n.auth_url}<font color="black">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="authUrl"
                                                     placeholder="${I18n.auth_url}"></div>
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
                <h4 class="modal-title">${I18n.auth_update}</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal form" role="form">
                    <input type="hidden" name="id">
                    <div class="form-group">
                        <label for="authNameCN" class="col-sm-2 control-label">${I18n.auth_name_cn}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="authNameCN"
                                                     placeholder="${I18n.auth_name_cn}"></div>
                        <label for="authNameEN" class="col-sm-2 control-label">${I18n.auth_name_en}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="authNameEN"
                                                     placeholder="${I18n.auth_name_en}"></div>
                    </div>
                    <div class="form-group">
                        <label for="authType" class="col-sm-2 control-label">${I18n.auth_type}<font color="red">*</font></label>
                        <div class="col-sm-4">
                            <select class="form-control" name="authType">
                                <option value="1">菜单权限</option>
                                <option value="2">操作权限</option>
                            </select>
                        </div>
                        <label for="authDesc" class="col-sm-2 control-label">${I18n.auth_desc}<font
                                    color="black">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="authDesc"
                                                     placeholder="${I18n.auth_desc}"></div>
                    </div>
                    <div class="form-group">
                        <label for="parent" class="col-sm-2 control-label">${I18n.auth_parent}<font
                                    color="black">*</font></label>
                        <div class="col-sm-4">
                            <select class="form-control" name="parent">
                                <option value="0">--none--</option>
                                <#list parentAuths as parent>
                                    <option value="${parent.id}">${parent.authNameCN}</option>
                                </#list>
                            </select>
                        </div>
                        <label for="authUrl" class="col-sm-2 control-label">${I18n.auth_url}<font color="black">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="authUrl"
                                                     placeholder="${I18n.auth_url}"></div>
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

<@netCommon.commonScript />
<script src="${request.contextPath}/static/js/constant.js"></script>
<script src="${request.contextPath}/static/js/auth/auth.js"></script>
</body>
</html>
