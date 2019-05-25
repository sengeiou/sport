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
    <@netCommon.commonLeft "configPage" />
    <div class="content-wrapper">
        <section class="content">
            <div class="row" id="searchForm">
                <div class="col-xs-2">
                    <div class="input-group">
                        <span class="input-group-addon">${I18n.agent_names}</span>
                        <select class="form-control" id="agentId" name="agentId">
                            <option value="-1">全部</option>
                            <#list agents as agent>
                                <option value="${agent.id}">${agent.userName}</option>
                            </#list>
                        </select>
                    </div>
                </div>
                <div class="col-xs-2">
                    <div class="input-group">
                        <span class="input-group-addon">${I18n.ADMIN_STATE}</span>
                        <select class="form-control" id="status" name="status">
                            <option value="-1">全部</option>
                            <option value="0">正常</option>
                            <option value="1">删除</option>
                        </select>
                    </div>
                </div>

                <div class="col-xs-1">
                    <button class="btn btn-block btn-info" id="searchBtn">${I18n.system_search}</button>
                </div>
                <#if authOwenUrls?index_of("configAdd") != -1>
                    <div class="col-xs-1">
                        <button class="btn btn-block btn-success add" type="button">${I18n.common_add}</button>
                    </div>
                </#if>
            </div>

            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-body">
                            <table id="agent_url_list" class="table table-bordered table-striped" width="100%">
                                <thead>
                                <tr>
                                    <th>${I18n.ADMIN_ID}</th>
                                    <th>${I18n.agent_names}</th>
                                    <th>${I18n.agent_url_name}</th>
                                    <th>${I18n.agent_status}</th>
                                    <th>${I18n.agent_url_notes}</th>
                                    <th>${I18n.agent_serverAdmin}</th>
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
                <h4 class="modal-title">${I18n.agent_url_add}</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal form" role="form">
                    <div class="form-group">
                        <label for="agentId" class="col-sm-2 control-label">${I18n.agent_names}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4">
                            <select class="form-control" name="agentId">
                                <#list agents as agent>
                                    <option value="${agent.id}">${agent.userName}</option>
                                </#list>
                            </select>
                        </div>
                        <label for="agentUrl" class="col-sm-2 control-label">${I18n.agent_url_name}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="agentUrl"
                                                     placeholder="${I18n.agent_url_name}"></div>
                    </div>
                    <div class="form-group">
                        <label for="status" class="col-sm-2 control-label">${I18n.agent_status}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4">
                            <select class="form-control" name="status">
                                <option value="0">正常</option>
                                <option value="1">删除</option>
                            </select>
                        </div>
                        <label for="serverAdmin" class="col-sm-2 control-label">${I18n.ADMIN_AGENT}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="serverAdmin"
                                                     placeholder="${I18n.ADMIN_AGENT}"></div>
                    </div>
                    <div class="form-group">
                        <label for="notes" class="col-sm-2 control-label">${I18n.agent_url_notes}<font
                                    color="red">*</font></label>
                        <div class="col-sm-6"><input type="text" class="form-control" name="notes" autocomplete="off"
                                                     placeholder="${I18n.agent_url_notes}"></div>
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
                <h4 class="modal-title">${I18n.agent_url_update}</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal form" role="form">
                    <input type="hidden" name="id">
                    <div class="form-group">
                        <label for="agentId" class="col-sm-2 control-label">${I18n.agent_names}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4">
                            <select class="form-control" name="agentId">
                                <#list agents as agent>
                                    <option value="${agent.id}">${agent.userName}</option>
                                </#list>
                            </select>
                        </div>
                        <label for="agentUrl" class="col-sm-2 control-label">${I18n.agent_url_name}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="agentUrl"
                                                     placeholder="${I18n.agent_url_name}"></div>
                    </div>
                    <div class="form-group">
                        <label for="status" class="col-sm-2 control-label">${I18n.agent_status}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4">
                            <select class="form-control" name="status">
                                <option value="0">正常</option>
                                <option value="1">删除</option>
                            </select>
                        </div>
                        <label for="serverAdmin" class="col-sm-2 control-label">${I18n.ADMIN_AGENT}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="serverAdmin"
                                                     placeholder="${I18n.ADMIN_AGENT}"></div>
                    </div>
                    <div class="form-group">
                        <label for="notes" class="col-sm-2 control-label">${I18n.agent_url_notes}<font
                                    color="red">*</font></label>
                        <div class="col-sm-6"><input type="text" class="form-control" name="notes" autocomplete="off"
                                                     placeholder="${I18n.agent_url_notes}"></div>
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

<@netCommon.commonScript />
<script src="${request.contextPath}/static/js/constant.js"></script>
<script src="${request.contextPath}/static/js/agent/configinfo.js"></script>
</body>
</html>
