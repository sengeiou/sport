<!DOCTYPE html>
<html>
<head>
    <#import "../common/common.macro.ftl" as netCommon>
    <@netCommon.commonStyle />
    <title>${I18n.admin_name}</title>
    <style type="text/css">
        input[type=checkbox], input[type=radio] {
            margin: 3px 0 0;
            margin-top: 1px \9;
            zoom: 200%;
            line-height: normal;
        }
    </style>
</head>
<body class="hold-transition skin-blue sidebar-mini <#if cookieMap?exists && cookieMap["sport_manage_settings"]?exists && "off" == cookieMap["sport_manage_settings"].value >sidebar-collapse</#if>">
<div class="wrapper">
    <@netCommon.commonHeader />
    <@netCommon.commonLeft "agentPage" />
    <div class="content-wrapper">
        <input type="hidden" id="loginNameSession" name="loginNameSession" value="${loginNameSession}">
        <section class="content">
            <div class="row" id="searchForm">
                <div class="col-xs-2">
                    <div class="input-group">
                        <span class="input-group-addon">${I18n.agent_name}</span>
                        <input type="text" class="form-control" id="userName" name="userName" autocomplete="off">
                    </div>
                </div>
                <div class="col-xs-2">
                    <div class="input-group">
                        <span class="input-group-addon">${I18n.agent_alias}</span>
                        <input type="text" class="form-control" id="alias" name="alias" autocomplete="off">
                    </div>
                </div>
                <div class="col-xs-2">
                    <div class="input-group">
                        <span class="input-group-addon">${I18n.ADMIN_STATE}</span>
                        <select class="form-control" id="status" name="status">
                            <option value="-1">全部</option>
                            <option value="0">正常</option>
                            <option value="1">冻结</option>
                            <option value="2">删除</option>
                        </select>
                    </div>
                </div>
                <div class="col-xs-3">
                    <div class="input-group">
                		<span class="input-group-addon">
	                  		${I18n.ADMIN_RIGIST_TIME}
	                	</span>
                        <input type="text" class="form-control" id="filterTime" name="filterTime">
                    </div>
                </div>

                <div class="col-xs-1">
                    <button class="btn btn-block btn-info" id="searchBtn">${I18n.system_search}</button>
                </div>
                <#if authOwenUrls?index_of("agentAdd") != -1>
                    <div class="col-xs-2">
                        <button class="btn btn-block btn-success add" type="button">${I18n.agent_add}</button>
                    </div>
                </#if>
            </div>

            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-body">
                            <table id="agent_list" class="table table-bordered table-striped" width="100%">
                                <thead>
                                <tr>
                                    <th>${I18n.ADMIN_ID}</th>
                                    <th>${I18n.agent_name}</th>
                                    <th>${I18n.agent_money}</th>
                                    <th>${I18n.agent_alias}</th>
                                    <th>${I18n.agent_bankId}</th>
                                    <th>${I18n.agent_status}</th>
                                    <th>${I18n.ADMIN_RIGIST_TIME}</th>
                                    <th>${I18n.agent_notes}</th>
                                    <th>${I18n.agent_serverAdmin}</th>
                                    <th>${I18n.agent_phone}</th>
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
                <h4 class="modal-title">${I18n.agent_add}</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal form" role="form">
                    <div class="form-group">
                        <label for="userName" class="col-sm-2 control-label">${I18n.agent_name}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="userName"
                                                     placeholder="${I18n.agent_name}"></div>
                        <label for="alias" class="col-sm-2 control-label">${I18n.agent_alias}<font color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="alias"
                                                     placeholder="${I18n.agent_alias}"></div>
                    </div>
                    <div class="form-group">
                        <label for="money" class="col-sm-2 control-label">${I18n.agent_money}<font color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="money"
                                                     placeholder="${I18n.input_money}"></div>
                        <label for="bankId" class="col-sm-2 control-label">${I18n.agent_bankId}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4">
                            <select class="form-control" name="bankId">
                                <option value="0">--none--</option>
                                <#list banks as bank>
                                    <option value="${bank.id}">${bank.bankAccount}</option>
                                </#list>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="notes" class="col-sm-2 control-label">${I18n.agent_notes}<font color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="notes"
                                                     placeholder="${I18n.agent_notes}"></div>
                        <label for="serverAdmin" class="col-sm-2 control-label">${I18n.ADMIN_AGENT}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="serverAdmin"
                                                     placeholder="${I18n.ADMIN_AGENT}"></div>
                    </div>
                    <div class="form-group">
                        <label for="phone" class="col-sm-2 control-label">${I18n.agent_phone}<font color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="phone"
                                                     placeholder="${I18n.agent_phone}"></div>
                        <label for="status" class="col-sm-2 control-label">${I18n.agent_status}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4">
                            <select class="form-control" name="status">
                                <option value="0">正常</option>
                                <option value="1">冻结</option>
                                <option value="2">删除</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">${I18n.ADMIN_PASSWORD}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="password" class="form-control" id="password" name="password"
                                                     placeholder="${I18n.login_password_empty}"></div>
                        <label for="newPassword" class="col-sm-2 control-label">${I18n.ADMIN_PASSWORD_CONFIRM}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="password" class="form-control" id="newPassword"
                                                     name="newPassword" placeholder="${I18n.login_password_confirm}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="passwordSafe" class="col-sm-2 control-label">${I18n.withDraw_psw}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="password" class="form-control" id="passwordSafe"
                                                     name="passwordSafe" placeholder="${I18n.login_password_empty}">
                        </div>
                        <label for="passwordSafeConfirm" class="col-sm-2 control-label">${I18n.ADMIN_PASSWORD_CONFIRM}
                            <font color="red">*</font></label>
                        <div class="col-sm-4"><input type="password" class="form-control" id="passwordSafeConfirm"
                                                     name="passwordSafeConfirm"
                                                     placeholder="${I18n.login_password_confirm}"></div>
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
                <h4 class="modal-title">${I18n.ADMIN_UPDATE}</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal form" role="form">
                    <input type="hidden" name="id">
                    <div class="form-group">
                        <label for="userName" class="col-sm-2 control-label">${I18n.agent_name}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="userName"
                                                     placeholder="${I18n.agent_name}"></div>
                        <label for="alias" class="col-sm-2 control-label">${I18n.agent_alias}<font color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="alias"
                                                     placeholder="${I18n.agent_alias}"></div>
                    </div>
                    <div class="form-group">
                        <label for="phone" class="col-sm-2 control-label">${I18n.agent_phone}<font color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="phone"
                                                     placeholder="${I18n.agent_phone}"></div>
                        <label for="bankId" class="col-sm-2 control-label">${I18n.agent_bankId}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4">
                            <select class="form-control" name="bankId">
                                <option value="0">--none--</option>
                                <#list banks as bank>
                                    <option value="${bank.id}">${bank.bankAccount}</option>
                                </#list>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="notes" class="col-sm-2 control-label">${I18n.agent_notes}<font color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="notes"
                                                     placeholder="${I18n.agent_notes}"></div>
                        <label for="serverAdmin" class="col-sm-2 control-label">${I18n.ADMIN_AGENT}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="serverAdmin"
                                                     placeholder="${I18n.ADMIN_AGENT}"></div>
                    </div>
                    <div class="form-group">
                        <label for="status" class="col-sm-2 control-label">${I18n.agent_status}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4">
                            <select class="form-control" name="status">
                                <option value="0">正常</option>
                                <option value="1">冻结</option>
                                <option value="2">删除</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="moneyChangeSelect" class="col-sm-2 control-label">${I18n.money_change}<font
                                    color="black">*</font></label>
                        <div class="col-sm-2"><input type="checkbox" id="moneyChangeSelect" name="moneyChangeSelect">
                        </div>
                        <label for="pswSelect" class="col-sm-2 control-label">${I18n.password_reset}<font color="black">*</font></label>
                        <div class="col-sm-2"><input type="checkbox" id="pswSelect" name="pswSelect"></div>
                        <label for="passwordSafeSelect" class="col-sm-2 control-label">${I18n.password_safe_reset}<font
                                    color="black">*</font></label>
                        <div class="col-sm-2"><input type="checkbox" id="passwordSafeSelect" name="passwordSafeSelect">
                        </div>
                    </div>
                    <div class="form-group" id="moneyChange">
                        <label for="money" class="col-sm-2 control-label">${I18n.agent_money}<font color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="money"
                                                     placeholder="${I18n.money_change_message}"></div>
                    </div>
                    <div class="form-group" id="passwordReset">
                        <label for="password_up" class="col-sm-2 control-label">${I18n.ADMIN_PASSWORD}<font color="red">*</font></label>
                        <div class="col-sm-4"><input type="password" class="form-control" id="password_up"
                                                     name="password" placeholder="${I18n.login_password_empty}"></div>
                        <label for="newPassword_up" class="col-sm-2 control-label">${I18n.ADMIN_PASSWORD_CONFIRM}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="password" class="form-control" id="newPassword_up"
                                                     name="newPassword_up" placeholder="${I18n.login_password_confirm}">
                        </div>
                    </div>

                    <div class="form-group" id="passwordSafeReset">
                        <label for="passwordSafe_up" class="col-sm-2 control-label">${I18n.withDraw_psw}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="password" class="form-control" id="passwordSafe_up"
                                                     name="passwordSafe" placeholder="${I18n.draw_password_empty}">
                        </div>
                        <label for="passwordSafeConfirm_up"
                               class="col-sm-2 control-label">${I18n.ADMIN_PASSWORD_CONFIRM}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="password" class="form-control" id="passwordSafeConfirm_up"
                                                     name="passwordSafeConfirm"
                                                     placeholder="${I18n.login_password_confirm}"></div>
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
<script src="${request.contextPath}/static/js/agent/agentinfo.js"></script>
</body>
</html>
