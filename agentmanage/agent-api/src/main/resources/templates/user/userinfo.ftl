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

        #limitModal .modal-lg {
            width: 80%;
            margin-left: 280px;
        }

        .hrLine {
            vertical-align: middle;
            display: inline-block;
        }
    </style>
</head>
<body class="hold-transition skin-blue sidebar-mini <#if cookieMap?exists && cookieMap["sport_manage_settings"]?exists && "off" == cookieMap["sport_manage_settings"].value >sidebar-collapse</#if>">
<div class="wrapper">
    <@netCommon.commonHeader />
    <@netCommon.commonLeft "userInfo" />
    <div class="content-wrapper">
        <section class="content">
            <div class="row" id="searchForm">
                <div class="col-xs-2">
                    <div class="input-group">
                        <span class="input-group-addon">${I18n.cus_name}</span>
                        <input type="text" class="form-control" id="userName" name="userName" autocomplete="off">
                    </div>
                </div>
                <div class="col-xs-2">
                    <div class="input-group">
                        <span class="input-group-addon">${I18n.ADMIN_REAL_NAME}</span>
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
                <#if authOwenUrls?index_of("customerAdd") != -1>
                    <div class="col-xs-2">
                        <button class="btn btn-block btn-success add" type="button">${I18n.cus_add}</button>
                    </div>
                </#if>
            </div>

            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-body">
                            <table id="user_list" class="table table-bordered table-striped" width="100%">
                                <thead>
                                <tr>
                                    <th>${I18n.ADMIN_ID}</th>
                                    <th>${I18n.cus_name}</th>
                                    <th>${I18n.agent_money}</th>
                                    <th>${I18n.ADMIN_REAL_NAME}</th>
                                    <th>${I18n.cus_agent}</th>
                                    <th>${I18n.cus_ctime}</th>
                                    <th>${I18n.cus_ttime}</th>
                                    <th>${I18n.cus_cmoney}</th>
                                    <th>${I18n.cus_tmoney}</th>
                                    <th>${I18n.agent_status}</th>
                                    <th>${I18n.ADMIN_RIGIST_TIME}</th>
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
        <div class="modal-content" style="margin-top: 15%;">
            <div class="modal-header">
                <h4 class="modal-title">${I18n.cus_add}</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal form" role="form">

                    <div class="form-group">
                        <label for="userName" class="col-sm-2 control-label">${I18n.cus_name}<font color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="userName"
                                                     placeholder="${I18n.cus_name}"></div>
                        <label for="alias" class="col-sm-2 control-label">${I18n.ADMIN_REAL_NAME}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="alias"
                                                     placeholder="${I18n.ADMIN_REAL_NAME}"></div>
                    </div>
                    <div class="form-group">
                        <label for="agentId" class="col-sm-2 control-label">${I18n.cus_agent}<font color="red">*</font></label>
                        <div class="col-sm-4">
                            <select class="form-control" name="agentId">
                                <#list agents as agent>
                                    <option value="${agent.id}">${agent.userName}</option>
                                </#list>
                            </select>
                        </div>
                        <label for="serverAdmin" class="col-sm-2 control-label">${I18n.ADMIN_AGENT}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="serverAdmin"
                                                     placeholder="${I18n.ADMIN_AGENT}"></div>
                    </div>
                    <div class="form-group">
                        <label for="birthday" class="col-sm-2 control-label">${I18n.cus_birthday}</label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="birthday"
                                                     placeholder="${I18n.cus_birthday}"></div>
                        <label for="money" class="col-sm-2 control-label">${I18n.agent_money}<font color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="money"
                                                     placeholder="${I18n.system_credit_info}"></div>
                    </div>

                    <div class="form-group">
                        <label for="levelId" class="col-sm-2 control-label">${I18n.payment_level}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4">
                            <select class="form-control" name="levelId">
                                <option value="0">默认分层</option>
                                <#list levels as level>
                                    <option value="${level.id}">${level.levelName}</option>
                                </#list>
                            </select>
                        </div>

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
                        <label for="testFlag" class="col-sm-2 control-label">${I18n.test_account}</label>
                        <div class="switch col-sm-4" data-on="info" data-off="success">
                            <input type="checkbox" name="testFlag"/>
                        </div>
                        <label for="agopen" class="col-sm-2 control-label">AG</label>
                        <div class="switch col-sm-4" data-on="info" data-off="success">
                            <input type="checkbox" name="agopen"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="mgopen" class="col-sm-2 control-label">MG</label>
                        <div class="switch col-sm-4" data-on="info" data-off="success">
                            <input type="checkbox" name="mgopen"/>
                        </div>
                        <label for="cpopen" class="col-sm-2 control-label">${I18n.cus_lottery}</label>
                        <div class="switch col-sm-4" data-on="info" data-off="success">
                            <input type="checkbox" name="cpopen"/>
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
                        <label for="withdrawalPasswd" class="col-sm-2 control-label">${I18n.draw_pwd}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="password" class="form-control" id="withdrawalPasswd"
                                                     name="withdrawalPasswd" placeholder="${I18n.draw_password_empty}">
                        </div>
                        <label for="passwordSafeConfirm" class="col-sm-2 control-label">${I18n.ADMIN_PASSWORD_CONFIRM}
                            <font color="red">*</font></label>
                        <div class="col-sm-4"><input type="password" class="form-control" id="passwordSafeConfirm"
                                                     name="passwordSafeConfirm"
                                                     placeholder="${I18n.login_password_confirm}"></div>
                    </div>
                    <div class="form-group">
                        <label for="notes" class="col-sm-2 control-label">${I18n.agent_url_notes}</label>
                        <div class="col-sm-6"><input type="text" class="form-control" name="notes"
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
        <div class="modal-content" style="margin-top: 15%;">
            <div class="modal-header">
                <h4 class="modal-title">${I18n.cus_update}</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal form" role="form">
                    <input type="hidden" name="id">
                    <div class="form-group">
                        <label for="userName" class="col-sm-2 control-label">${I18n.cus_name}<font color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="userName"
                                                     placeholder="${I18n.cus_name}" readonly="readonly"></div>
                        <label for="alias" class="col-sm-2 control-label">${I18n.ADMIN_REAL_NAME}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="alias"
                                                     placeholder="${I18n.ADMIN_REAL_NAME}"></div>
                    </div>
                    <div class="form-group">
                        <label for="notesWithdrawal" class="col-sm-2 control-label">${I18n.cus_payment}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="notesWithdrawal"
                                                     placeholder="${I18n.cus_payment}"></div>
                        <label for="notes" class="col-sm-2 control-label">${I18n.agent_url_notes}</label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="notes"
                                                     placeholder="${I18n.agent_url_notes}"></div>
                    </div>
                    <div class="form-group">
                        <label for="birthday" class="col-sm-2 control-label">${I18n.cus_birthday}</label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="birthday"
                                                     placeholder="${I18n.cus_birthday}"></div>
                        <label for="regIp" class="col-sm-2 control-label">${I18n.cus_ip}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="regIp"
                                                     placeholder="${I18n.cus_ip}" readonly="readonly"></div>
                    </div>

                    <div class="form-group">
                        <label for="levelId" class="col-sm-2 control-label">${I18n.payment_level}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4">
                            <select class="form-control" name="levelId">
                                <option value="0">默认分层</option>
                                <#list levels as level>
                                    <option value="${level.id}">${level.levelName}</option>
                                </#list>
                            </select>
                        </div>
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
                        <label for="testFlag" class="col-sm-2 control-label">${I18n.test_account}</label>
                        <div class="switch col-sm-4" data-on="info" data-off="success">
                            <input type="checkbox" name="testFlag"/>
                        </div>
                        <label for="agopen" class="col-sm-2 control-label">AG</label>
                        <div class="switch col-sm-4" data-on="info" data-off="success">
                            <input type="checkbox" name="agopen"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="mgopen" class="col-sm-2 control-label">MG</label>
                        <div class="switch col-sm-4" data-on="info" data-off="success">
                            <input type="checkbox" name="mgopen"/>
                        </div>
                        <label for="cpopen" class="col-sm-2 control-label">${I18n.cus_lottery}</label>
                        <div class="switch col-sm-4" data-on="info" data-off="success">
                            <input type="checkbox" name="cpopen"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="pswSelect" class="col-sm-2 control-label">${I18n.login_psw_reset}</label>
                        <div class="col-sm-2"><input type="checkbox" id="pswSelect" name="pswSelect"></div>
                        <label for="drawPswSelect" class="col-sm-2 control-label">${I18n.draw_pwd_reset}</label>
                        <div class="col-sm-2"><input type="checkbox" id="drawPswSelect" name="drawPswSelect"></div>
                        <label for="statusSelect" class="col-sm-2 control-label">${I18n.STATUS_RESET}</label>
                        <div class="col-sm-2"><input type="checkbox" id="statusSelect" name="statusSelect"></div>
                    </div>

                    <div class="form-group" id="passwordReset">
                        <label for="password_up" class="col-sm-2 control-label">${I18n.ADMIN_PASSWORD}<font color="red">*</font></label>
                        <div class="col-sm-4"><input type="password" class="form-control" id="password_up"
                                                     name="password" placeholder="${I18n.login_password_empty}"></div>
                        <label for="newPassword_up" class="col-sm-2 control-label">${I18n.ADMIN_PASSWORD_CONFIRM}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="password" class="form-control" id="newPassword_up"
                                                     name="newPassword" placeholder="${I18n.login_password_confirm}">
                        </div>
                    </div>
                    <div class="form-group" id="drawPasswordReset">
                        <label for="withdrawalPasswd_up" class="col-sm-2 control-label">${I18n.draw_pwd}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="password" class="form-control" id="withdrawalPasswd_up"
                                                     name="withdrawalPasswd" placeholder="${I18n.draw_password_empty}">
                        </div>
                        <label for="passwordSafeConfirm_up"
                               class="col-sm-2 control-label">${I18n.ADMIN_PASSWORD_CONFIRM}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="password" class="form-control" id="passwordSafeConfirm_up"
                                                     name="passwordSafeConfirm"
                                                     placeholder="${I18n.login_password_confirm}"></div>
                    </div>

                    <div class="form-group" id="statusReset">
                        <label for="type" class="col-sm-2 control-label">${I18n.ADMIN_STATE}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4">
                            <select class="form-control" name="status">
                                <option value="0">正常</option>
                                <option value="1">冻结</option>
                                <option value="2">删除</option>
                            </select>
                        </div>
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

<!-- 限额.模态框 -->
<div class="modal fade" id="limitModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" style="margin-top: 4%;">
            <div class="modal-body">
                <section class="content">
                    <ul id="platformTab" class="nav nav-tabs">
                        <li class="active">
                            <a href="#bkConfig" data-toggle="tab">篮球</a>
                        </li>
                        <li><a href="#ftConfig" data-toggle="tab">足球</a></li>
                    </ul>
                    <div id="platformTabContent" class="tab-content">
                        <input type="hidden" name="id">
                        <input type="hidden" name="serverAdmin">
                        <div class="tab-pane fade in active" id="bkConfig">
                            <div class="form-group">
                                <div class="col-sm-5">
                                    <div class="modal-header">
                                        <h4 class="modal-title">${I18n.platform_limit}</h4>
                                    </div>
                                    <div class="modal-body" id="platformBKModel">
                                        <form class="form-horizontal form">
                                            <div class="form-group">
                                                <label for="bkOrMin"
                                                       class="col-sm-2 control-label">${I18n.game_or_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkOrMin"
                                                                             placeholder="${I18n.game_or_min}"></div>
                                                <label for="bkOrMax"
                                                       class="col-sm-2 control-label">${I18n.game_or_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkOrMax"
                                                                             placeholder="${I18n.game_or_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="bkP3Min"
                                                       class="col-sm-2 control-label">${I18n.game_p3_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkP3Min"
                                                                             placeholder="${I18n.game_p3_min}"></div>
                                                <label for="bkP3Max"
                                                       class="col-sm-2 control-label">${I18n.game_p3_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkP3Max"
                                                                             placeholder="${I18n.game_p3_max}"></div>
                                            </div>

                                            <div style=" width:100%; text-align:left; margin-left:1px; margin-right:1px;">
                                                <hr class="hrLine" style="width:50px; height:1px;" color="#d2d6de"/>
                                                <span style="color:red; font-size: 18px;">滚球</span>
                                                <hr class="hrLine" style="width:80%; height:1px;" color="#d2d6de"/>
                                            </div>

                                            <div class="form-group">
                                                <label for="bkReFthtMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ftht_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkReFthtMin"
                                                                             placeholder="${I18n.game_re_ftht_min}">
                                                </div>
                                                <label for="bkReFthtMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ftht_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkReFthtMax"
                                                                             placeholder="${I18n.game_re_ftht_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="bkReAhMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ah_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkReAhMin"
                                                                             placeholder="${I18n.game_re_ah_min}"></div>
                                                <label for="bkReAhMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ah_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkReAhMax"
                                                                             placeholder="${I18n.game_re_ah_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="bkReOuMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ou_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkReOuMin"
                                                                             placeholder="${I18n.game_re_ou_min}"></div>
                                                <label for="bkReOuMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ou_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkReOuMax"
                                                                             placeholder="${I18n.game_re_ou_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="bkReBigMin"
                                                       class="col-sm-2 control-label">${I18n.bk_re_big_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkReBigMin"
                                                                             placeholder="${I18n.bk_re_big_min}"></div>
                                                <label for="bkReBigMax"
                                                       class="col-sm-2 control-label">${I18n.bk_re_big_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkReBigMax"
                                                                             placeholder="${I18n.bk_re_big_max}"></div>
                                            </div>

                                            <div class="form-group">
                                                <label for="bkReSmallMin"
                                                       class="col-sm-2 control-label">${I18n.bk_re_small_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkReSmallMin"
                                                                             placeholder="${I18n.bk_re_small_min}">
                                                </div>
                                                <label for="bkReSmallMax"
                                                       class="col-sm-2 control-label">${I18n.bk_re_small_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkReSmallMax"
                                                                             placeholder="${I18n.bk_re_small_max}">
                                                </div>
                                            </div>
                                            <div style=" width:100%; text-align:left; margin-left:1px; margin-right:1px;">
                                                <hr class="hrLine" style="width:50px; height:1px;" color="#d2d6de"/>
                                                <span style="color:red; font-size: 18px;">今日</span>
                                                <hr class="hrLine" style="width:80%; height:1px;" color="#d2d6de"/>
                                            </div>

                                            <div class="form-group">
                                                <label for="bkRbFthtMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ftht_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRbFthtMin"
                                                                             placeholder="${I18n.game_re_ftht_min}">
                                                </div>
                                                <label for="bkRbFthtMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ftht_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRbFthtMax"
                                                                             placeholder="${I18n.game_re_ftht_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="bkRbAhMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ah_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRbAhMin"
                                                                             placeholder="${I18n.game_re_ah_min}"></div>
                                                <label for="bkRbAhMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ah_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRbAhMax"
                                                                             placeholder="${I18n.game_re_ah_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="bkRbOuMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ou_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRbOuMin"
                                                                             placeholder="${I18n.game_re_ou_min}"></div>
                                                <label for="bkRbOuMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ou_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRbOuMax"
                                                                             placeholder="${I18n.game_re_ou_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="bkRbBigMin"
                                                       class="col-sm-2 control-label">${I18n.bk_re_big_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRbBigMin"
                                                                             placeholder="${I18n.bk_re_big_min}"></div>
                                                <label for="bkRbBigMax"
                                                       class="col-sm-2 control-label">${I18n.bk_re_big_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRbBigMax"
                                                                             placeholder="${I18n.bk_re_big_max}"></div>
                                            </div>

                                            <div class="form-group">
                                                <label for="bkRbSmallMin"
                                                       class="col-sm-2 control-label">${I18n.bk_re_small_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRbSmallMin"
                                                                             placeholder="${I18n.bk_re_small_min}">
                                                </div>
                                                <label for="bkRbSmallMax"
                                                       class="col-sm-2 control-label">${I18n.bk_re_small_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRbSmallMax"
                                                                             placeholder="${I18n.bk_re_small_max}">
                                                </div>
                                            </div>

                                            <div style=" width:100%; text-align:left; margin-left:1px; margin-right:1px;">
                                                <hr class="hrLine" style="width:50px; height:1px;" color="#d2d6de"/>
                                                <span style="color:red; font-size: 18px;">早盘</span>
                                                <hr class="hrLine" style="width:80%; height:1px;" color="#d2d6de"/>
                                            </div>

                                            <div class="form-group">
                                                <label for="bkRFthtMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ftht_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRFthtMin"
                                                                             placeholder="${I18n.game_re_ftht_min}">
                                                </div>
                                                <label for="bkRFthtMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ftht_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRFthtMax"
                                                                             placeholder="${I18n.game_re_ftht_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="bkRAhMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ah_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRAhMin"
                                                                             placeholder="${I18n.game_re_ah_min}"></div>
                                                <label for="bkRAhMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ah_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRAhMax"
                                                                             placeholder="${I18n.game_re_ah_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="bkROuMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ou_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkROuMin"
                                                                             placeholder="${I18n.game_re_ou_min}"></div>
                                                <label for="bkROuMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ou_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkROuMax"
                                                                             placeholder="${I18n.game_re_ou_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="bkRBigMin"
                                                       class="col-sm-2 control-label">${I18n.bk_re_big_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRBigMin"
                                                                             placeholder="${I18n.bk_re_big_min}"></div>
                                                <label for="bkRBigMax"
                                                       class="col-sm-2 control-label">${I18n.bk_re_big_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRBigMax"
                                                                             placeholder="${I18n.bk_re_big_max}"></div>
                                            </div>

                                            <div class="form-group">
                                                <label for="bkRSmallMin"
                                                       class="col-sm-2 control-label">${I18n.bk_re_small_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRSmallMin"
                                                                             placeholder="${I18n.bk_re_small_min}">
                                                </div>
                                                <label for="bkRSmallMax"
                                                       class="col-sm-2 control-label">${I18n.bk_re_small_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRSmallMax"
                                                                             placeholder="${I18n.bk_re_small_max}">
                                                </div>
                                            </div>

                                        </form>
                                    </div>
                                </div>
                                <div class="col-sm-5">
                                    <div class="modal-header">
                                        <h4 class="modal-title">${I18n.platform_limit_default}</h4>
                                    </div>
                                    <div class="modal-body" id="defaultBKModel">
                                        <form class="form-horizontal form">
                                            <div class="form-group">
                                                <label for="bkOrMin"
                                                       class="col-sm-2 control-label">${I18n.game_or_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkOrMin"
                                                                             placeholder="${I18n.game_or_min}"></div>
                                                <label for="bkOrMax"
                                                       class="col-sm-2 control-label">${I18n.game_or_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkOrMax"
                                                                             placeholder="${I18n.game_or_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="bkP3Min"
                                                       class="col-sm-2 control-label">${I18n.game_p3_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkP3Min"
                                                                             placeholder="${I18n.game_p3_min}"></div>
                                                <label for="bkP3Max"
                                                       class="col-sm-2 control-label">${I18n.game_p3_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkP3Max"
                                                                             placeholder="${I18n.game_p3_max}"></div>
                                            </div>

                                            <div style=" width:100%; text-align:left; margin-left:1px; margin-right:1px;">
                                                <hr class="hrLine" style="width:50px; height:1px;" color="#d2d6de"/>
                                                <span style="color:red; font-size: 18px;">滚球</span>
                                                <hr class="hrLine" style="width:80%; height:1px;" color="#d2d6de"/>
                                            </div>

                                            <div class="form-group">
                                                <label for="bkReFthtMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ftht_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkReFthtMin"
                                                                             placeholder="${I18n.game_re_ftht_min}">
                                                </div>
                                                <label for="bkReFthtMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ftht_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkReFthtMax"
                                                                             placeholder="${I18n.game_re_ftht_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="bkReAhMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ah_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkReAhMin"
                                                                             placeholder="${I18n.game_re_ah_min}"></div>
                                                <label for="bkReAhMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ah_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkReAhMax"
                                                                             placeholder="${I18n.game_re_ah_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="bkReOuMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ou_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkReOuMin"
                                                                             placeholder="${I18n.game_re_ou_min}"></div>
                                                <label for="bkReOuMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ou_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkReOuMax"
                                                                             placeholder="${I18n.game_re_ou_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="bkReBigMin"
                                                       class="col-sm-2 control-label">${I18n.bk_re_big_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkReBigMin"
                                                                             placeholder="${I18n.bk_re_big_min}"></div>
                                                <label for="bkReBigMax"
                                                       class="col-sm-2 control-label">${I18n.bk_re_big_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkReBigMax"
                                                                             placeholder="${I18n.bk_re_big_max}"></div>
                                            </div>

                                            <div class="form-group">
                                                <label for="bkReSmallMin"
                                                       class="col-sm-2 control-label">${I18n.bk_re_small_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkReSmallMin"
                                                                             placeholder="${I18n.bk_re_small_min}">
                                                </div>
                                                <label for="bkReSmallMax"
                                                       class="col-sm-2 control-label">${I18n.bk_re_small_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkReSmallMax"
                                                                             placeholder="${I18n.bk_re_small_max}">
                                                </div>
                                            </div>

                                            <div style=" width:100%; text-align:left; margin-left:1px; margin-right:1px;">
                                                <hr class="hrLine" style="width:50px; height:1px;" color="#d2d6de"/>
                                                <span style="color:red; font-size: 18px;">今日</span>
                                                <hr class="hrLine" style="width:80%; height:1px;" color="#d2d6de"/>
                                            </div>

                                            <div class="form-group">
                                                <label for="bkRbFthtMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ftht_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRbFthtMin"
                                                                             placeholder="${I18n.game_re_ftht_min}">
                                                </div>
                                                <label for="bkRbFthtMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ftht_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRbFthtMax"
                                                                             placeholder="${I18n.game_re_ftht_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="bkRbAhMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ah_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRbAhMin"
                                                                             placeholder="${I18n.game_re_ah_min}"></div>
                                                <label for="bkRbAhMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ah_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRbAhMax"
                                                                             placeholder="${I18n.game_re_ah_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="bkRbOuMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ou_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRbOuMin"
                                                                             placeholder="${I18n.game_re_ou_min}"></div>
                                                <label for="bkRbOuMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ou_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRbOuMax"
                                                                             placeholder="${I18n.game_re_ou_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="bkRbBigMin"
                                                       class="col-sm-2 control-label">${I18n.bk_re_big_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRbBigMin"
                                                                             placeholder="${I18n.bk_re_big_min}"></div>
                                                <label for="bkRbBigMax"
                                                       class="col-sm-2 control-label">${I18n.bk_re_big_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRbBigMax"
                                                                             placeholder="${I18n.bk_re_big_max}"></div>
                                            </div>

                                            <div class="form-group">
                                                <label for="bkRbSmallMin"
                                                       class="col-sm-2 control-label">${I18n.bk_re_small_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRbSmallMin"
                                                                             placeholder="${I18n.bk_re_small_min}">
                                                </div>
                                                <label for="bkRbSmallMax"
                                                       class="col-sm-2 control-label">${I18n.bk_re_small_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRbSmallMax"
                                                                             placeholder="${I18n.bk_re_small_max}">
                                                </div>
                                            </div>

                                            <div style=" width:100%; text-align:left; margin-left:1px; margin-right:1px;">
                                                <hr class="hrLine" style="width:50px; height:1px;" color="#d2d6de"/>
                                                <span style="color:red; font-size: 18px;">早盘</span>
                                                <hr class="hrLine" style="width:80%; height:1px;" color="#d2d6de"/>
                                            </div>

                                            <div class="form-group">
                                                <label for="bkRFthtMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ftht_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRFthtMin"
                                                                             placeholder="${I18n.game_re_ftht_min}">
                                                </div>
                                                <label for="bkRFthtMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ftht_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRFthtMax"
                                                                             placeholder="${I18n.game_re_ftht_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="bkRAhMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ah_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRAhMin"
                                                                             placeholder="${I18n.game_re_ah_min}"></div>
                                                <label for="bkRAhMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ah_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRAhMax"
                                                                             placeholder="${I18n.game_re_ah_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="bkROuMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ou_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkROuMin"
                                                                             placeholder="${I18n.game_re_ou_min}"></div>
                                                <label for="bkROuMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ou_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkROuMax"
                                                                             placeholder="${I18n.game_re_ou_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="bkRBigMin"
                                                       class="col-sm-2 control-label">${I18n.bk_re_big_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRBigMin"
                                                                             placeholder="${I18n.bk_re_big_min}"></div>
                                                <label for="bkRBigMax"
                                                       class="col-sm-2 control-label">${I18n.bk_re_big_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRBigMax"
                                                                             placeholder="${I18n.bk_re_big_max}"></div>
                                            </div>

                                            <div class="form-group">
                                                <label for="bkRSmallMin"
                                                       class="col-sm-2 control-label">${I18n.bk_re_small_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRSmallMin"
                                                                             placeholder="${I18n.bk_re_small_min}">
                                                </div>
                                                <label for="bkRSmallMax"
                                                       class="col-sm-2 control-label">${I18n.bk_re_small_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="bkRSmallMax"
                                                                             placeholder="${I18n.bk_re_small_max}">
                                                </div>
                                            </div>

                                        </form>
                                    </div>
                                </div>
                                <hr style="width:100%; height:1px;" color="#d2d6de"/>

                                <div class="form-group" style="margin-bottom: 40px;">
                                    <div class="col-sm-offset-3 col-sm-6">
                                        <button class="btn btn-primary"
                                                id="submitBkConfig">${I18n.submit_button}</button>
                                        <button type="button" class="btn btn-default"
                                                data-dismiss="modal">${I18n.system_cancel}</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="ftConfig">
                            <div class="form-group">
                                <div class="col-sm-5">
                                    <div class="modal-header">
                                        <h4 class="modal-title">${I18n.platform_limit}</h4>
                                    </div>
                                    <div class="modal-body" id="platformFTModel">
                                        <form class="form-horizontal form">
                                            <div class="form-group">
                                                <label for="ftOrMin"
                                                       class="col-sm-2 control-label">${I18n.game_or_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftOrMin"
                                                                             placeholder="${I18n.game_or_min}"></div>
                                                <label for="ftOrMax"
                                                       class="col-sm-2 control-label">${I18n.game_or_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftOrMax"
                                                                             placeholder="${I18n.game_or_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftP3Min"
                                                       class="col-sm-2 control-label">${I18n.game_p3_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftP3Min"
                                                                             placeholder="${I18n.game_p3_min}"></div>
                                                <label for="ftP3Max"
                                                       class="col-sm-2 control-label">${I18n.game_p3_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftP3Max"
                                                                             placeholder="${I18n.game_p3_max}"></div>
                                            </div>

                                            <div style=" width:100%; text-align:left; margin-left:1px; margin-right:1px;">
                                                <hr class="hrLine" style="width:50px; height:1px;" color="#d2d6de"/>
                                                <span style="color:red; font-size: 18px;">滚球</span>
                                                <hr class="hrLine" style="width:80%; height:1px;" color="#d2d6de"/>
                                            </div>

                                            <div class="form-group">
                                                <label for="ftReFthtMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ftht_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftReFthtMin"
                                                                             placeholder="${I18n.game_re_ftht_min}">
                                                </div>
                                                <label for="ftReFthtMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ftht_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftReFthtMax"
                                                                             placeholder="${I18n.game_re_ftht_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftReFthtlstMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_fthtlst_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftReFthtlstMin"
                                                                             placeholder="${I18n.game_re_fthtlst_min}">
                                                </div>
                                                <label for="ftReFthtlstMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_fthtlst_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftReFthtlstMax"
                                                                             placeholder="${I18n.game_re_fthtlst_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftReAhMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ah_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftReAhMin"
                                                                             placeholder="${I18n.game_re_ah_min}"></div>
                                                <label for="ftReAhMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ah_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftReAhMax"
                                                                             placeholder="${I18n.game_re_ah_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftReAhlstMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ahlst_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftReAhlstMin"
                                                                             placeholder="${I18n.game_re_ahlst_min}">
                                                </div>
                                                <label for="ftReAhlstMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ahlst_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftReAhlstMax"
                                                                             placeholder="${I18n.game_re_ahlst_max}">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="ftReOuMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ou_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftReOuMin"
                                                                             placeholder="${I18n.game_re_ou_min}"></div>
                                                <label for="ftReOuMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ou_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftReOuMax"
                                                                             placeholder="${I18n.game_re_ou_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftReOulstMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_oulst_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftReOulstMin"
                                                                             placeholder="${I18n.game_re_oulst_min}">
                                                </div>
                                                <label for="ftReOulstMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_oulst_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftReOulstMax"
                                                                             placeholder="${I18n.game_re_oulst_max}">
                                                </div>
                                            </div>

                                            <div style=" width:100%; text-align:left; margin-left:1px; margin-right:1px;">
                                                <hr class="hrLine" style="width:50px; height:1px;" color="#d2d6de"/>
                                                <span style="color:red; font-size: 18px;">今日</span>
                                                <hr class="hrLine" style="width:80%; height:1px;" color="#d2d6de"/>
                                            </div>

                                            <div class="form-group">
                                                <label for="ftRbFthtMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ftht_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbFthtMin"
                                                                             placeholder="${I18n.game_re_ftht_min}">
                                                </div>
                                                <label for="ftRbFthtMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ftht_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbFthtMax"
                                                                             placeholder="${I18n.game_re_ftht_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRbFthtlstMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_fthtlst_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbFthtlstMin"
                                                                             placeholder="${I18n.game_re_fthtlst_min}">
                                                </div>
                                                <label for="ftRbFthtlstMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_fthtlst_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbFthtlstMax"
                                                                             placeholder="${I18n.game_re_fthtlst_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRbAhMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ah_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbAhMin"
                                                                             placeholder="${I18n.game_re_ah_min}"></div>
                                                <label for="ftRbAhMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ah_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbAhMax"
                                                                             placeholder="${I18n.game_re_ah_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRbAhlstMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ahlst_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbAhlstMin"
                                                                             placeholder="${I18n.game_re_ahlst_min}">
                                                </div>
                                                <label for="ftRbAhlstMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ahlst_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbAhlstMax"
                                                                             placeholder="${I18n.game_re_ahlst_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRbOuMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ou_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbOuMin"
                                                                             placeholder="${I18n.game_re_ou_min}"></div>
                                                <label for="ftRbOuMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ou_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbOuMax"
                                                                             placeholder="${I18n.game_re_ou_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRbOulstMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_oulst_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbOulstMin"
                                                                             placeholder="${I18n.game_re_oulst_min}">
                                                </div>
                                                <label for="ftRbOulstMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_oulst_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbOulstMax"
                                                                             placeholder="${I18n.game_re_oulst_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRbOeMin"
                                                       class="col-sm-2 control-label">${I18n.game_rb_oe_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbOeMin"
                                                                             placeholder="${I18n.game_rb_oe_min}"></div>
                                                <label for="ftRbOeMax"
                                                       class="col-sm-2 control-label">${I18n.game_rb_oe_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbOeMax"
                                                                             placeholder="${I18n.game_rb_oe_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRbOelstMin"
                                                       class="col-sm-2 control-label">${I18n.game_rb_oelst_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbOelstMin"
                                                                             placeholder="${I18n.game_rb_oelst_min}">
                                                </div>
                                                <label for="ftRbOelstMax"
                                                       class="col-sm-2 control-label">${I18n.game_rb_oelst_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbOelstMax"
                                                                             placeholder="${I18n.game_rb_oelst_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRbCsMin"
                                                       class="col-sm-2 control-label">${I18n.game_rb_cs_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbCsMin"
                                                                             placeholder="${I18n.game_rb_cs_min}"></div>
                                                <label for="ftRbCsMax"
                                                       class="col-sm-2 control-label">${I18n.game_rb_cs_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbCsMax"
                                                                             placeholder="${I18n.game_rb_cs_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRbTgMin"
                                                       class="col-sm-2 control-label">${I18n.game_rb_tg_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbTgMin"
                                                                             placeholder="${I18n.game_rb_tg_min}"></div>
                                                <label for="ftRbTgMax"
                                                       class="col-sm-2 control-label">${I18n.game_rb_tg_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbTgMax"
                                                                             placeholder="${I18n.game_rb_tg_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRbTglstMin"
                                                       class="col-sm-2 control-label">${I18n.game_rb_tglst_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbTglstMin"
                                                                             placeholder="${I18n.game_rb_tglst_min}">
                                                </div>
                                                <label for="ftRbTglstMax"
                                                       class="col-sm-2 control-label">${I18n.game_rb_tglst_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbTglstMax"
                                                                             placeholder="${I18n.game_rb_tglst_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRbHfMin"
                                                       class="col-sm-2 control-label">${I18n.game_rb_hf_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbHfMin"
                                                                             placeholder="${I18n.game_rb_hf_min}"></div>
                                                <label for="ftRbHfMax"
                                                       class="col-sm-2 control-label">${I18n.game_rb_hf_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbHfMax"
                                                                             placeholder="${I18n.game_rb_hf_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRbFglgMin"
                                                       class="col-sm-2 control-label">${I18n.game_rb_fglg_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbFglgMin"
                                                                             placeholder="${I18n.game_rb_fglg_min}">
                                                </div>
                                                <label for="ftRbFglgMax"
                                                       class="col-sm-2 control-label">${I18n.game_rb_fglg_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbFglgMax"
                                                                             placeholder="${I18n.game_rb_fglg_max}">
                                                </div>
                                            </div>

                                            <div style=" width:100%; text-align:left; margin-left:1px; margin-right:1px;">
                                                <hr class="hrLine" style="width:50px; height:1px;" color="#d2d6de"/>
                                                <span style="color:red; font-size: 18px;">早盘</span>
                                                <hr class="hrLine" style="width:80%; height:1px;" color="#d2d6de"/>
                                            </div>

                                            <div class="form-group">
                                                <label for="ftRFthtMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ftht_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRFthtMin"
                                                                             placeholder="${I18n.game_re_ftht_min}">
                                                </div>
                                                <label for="ftRFthtMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ftht_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRFthtMax"
                                                                             placeholder="${I18n.game_re_ftht_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRFthtlstMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_fthtlst_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRFthtlstMin"
                                                                             placeholder="${I18n.game_re_fthtlst_min}">
                                                </div>
                                                <label for="ftRFthtlstMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_fthtlst_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRFthtlstMax"
                                                                             placeholder="${I18n.game_re_fthtlst_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRAhMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ah_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRAhMin"
                                                                             placeholder="${I18n.game_re_ah_min}"></div>
                                                <label for="ftRAhMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ah_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRAhMax"
                                                                             placeholder="${I18n.game_re_ah_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRAhlstMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ahlst_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRAhlstMin"
                                                                             placeholder="${I18n.game_re_ahlst_min}">
                                                </div>
                                                <label for="ftRAhlstMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ahlst_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRAhlstMax"
                                                                             placeholder="${I18n.game_re_ahlst_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftROuMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ou_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftROuMin"
                                                                             placeholder="${I18n.game_re_ou_min}"></div>
                                                <label for="ftROuMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ou_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftROuMax"
                                                                             placeholder="${I18n.game_re_ou_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftROulstMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_oulst_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftROulstMin"
                                                                             placeholder="${I18n.game_re_oulst_min}">
                                                </div>
                                                <label for="ftROulstMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_oulst_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftROulstMax"
                                                                             placeholder="${I18n.game_re_oulst_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftROeMin"
                                                       class="col-sm-2 control-label">${I18n.game_rb_oe_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftROeMin"
                                                                             placeholder="${I18n.game_rb_oe_min}"></div>
                                                <label for="ftROeMax"
                                                       class="col-sm-2 control-label">${I18n.game_rb_oe_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftROeMax"
                                                                             placeholder="${I18n.game_rb_oe_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftROelstMin"
                                                       class="col-sm-2 control-label">${I18n.game_rb_oelst_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftROelstMin"
                                                                             placeholder="${I18n.game_rb_oelst_min}">
                                                </div>
                                                <label for="ftROelstMax"
                                                       class="col-sm-2 control-label">${I18n.game_rb_oelst_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftROelstMax"
                                                                             placeholder="${I18n.game_rb_oelst_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRCsMin"
                                                       class="col-sm-2 control-label">${I18n.game_rb_cs_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRCsMin"
                                                                             placeholder="${I18n.game_rb_cs_min}"></div>
                                                <label for="ftRCsMax"
                                                       class="col-sm-2 control-label">${I18n.game_rb_cs_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRCsMax"
                                                                             placeholder="${I18n.game_rb_cs_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRTgMin"
                                                       class="col-sm-2 control-label">${I18n.game_rb_tg_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRTgMin"
                                                                             placeholder="${I18n.game_rb_tg_min}"></div>
                                                <label for="ftRTgMax"
                                                       class="col-sm-2 control-label">${I18n.game_rb_tg_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRTgMax"
                                                                             placeholder="${I18n.game_rb_tg_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRTglstMin"
                                                       class="col-sm-2 control-label">${I18n.game_rb_tglst_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRTglstMin"
                                                                             placeholder="${I18n.game_rb_tglst_min}">
                                                </div>
                                                <label for="ftRTglstMax"
                                                       class="col-sm-2 control-label">${I18n.game_rb_tglst_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRTglstMax"
                                                                             placeholder="${I18n.game_rb_tglst_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRHfMin"
                                                       class="col-sm-2 control-label">${I18n.game_rb_hf_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRHfMin"
                                                                             placeholder="${I18n.game_rb_hf_min}"></div>
                                                <label for="ftRHfMax"
                                                       class="col-sm-2 control-label">${I18n.game_rb_hf_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRHfMax"
                                                                             placeholder="${I18n.game_rb_hf_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRFglgMin"
                                                       class="col-sm-2 control-label">${I18n.game_rb_fglg_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRFglgMin"
                                                                             placeholder="${I18n.game_rb_fglg_min}">
                                                </div>
                                                <label for="ftRFglgMax"
                                                       class="col-sm-2 control-label">${I18n.game_rb_fglg_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRFglgMax"
                                                                             placeholder="${I18n.game_rb_fglg_max}">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="col-sm-5">
                                    <div class="modal-header">
                                        <h4 class="modal-title">${I18n.platform_limit_default}</h4>
                                    </div>
                                    <div class="modal-body" id="defaultFTModel">
                                        <form class="form-horizontal form">
                                            <div class="form-group">
                                                <label for="ftOrMin"
                                                       class="col-sm-2 control-label">${I18n.game_or_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftOrMin"
                                                                             placeholder="${I18n.game_or_min}"></div>
                                                <label for="ftOrMax"
                                                       class="col-sm-2 control-label">${I18n.game_or_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftOrMax"
                                                                             placeholder="${I18n.game_or_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftP3Min"
                                                       class="col-sm-2 control-label">${I18n.game_p3_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftP3Min"
                                                                             placeholder="${I18n.game_p3_min}"></div>
                                                <label for="ftP3Max"
                                                       class="col-sm-2 control-label">${I18n.game_p3_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftP3Max"
                                                                             placeholder="${I18n.game_p3_max}"></div>
                                            </div>

                                            <div style=" width:100%; text-align:left; margin-left:1px; margin-right:1px;">
                                                <hr class="hrLine" style="width:50px; height:1px;" color="#d2d6de"/>
                                                <span style="color:red; font-size: 18px;">滚球</span>
                                                <hr class="hrLine" style="width:80%; height:1px;" color="#d2d6de"/>
                                            </div>

                                            <div class="form-group">
                                                <label for="ftReFthtMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ftht_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftReFthtMin"
                                                                             placeholder="${I18n.game_re_ftht_min}">
                                                </div>
                                                <label for="ftReFthtMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ftht_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftReFthtMax"
                                                                             placeholder="${I18n.game_re_ftht_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftReFthtlstMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_fthtlst_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftReFthtlstMin"
                                                                             placeholder="${I18n.game_re_fthtlst_min}">
                                                </div>
                                                <label for="ftReFthtlstMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_fthtlst_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftReFthtlstMax"
                                                                             placeholder="${I18n.game_re_fthtlst_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftReAhMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ah_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftReAhMin"
                                                                             placeholder="${I18n.game_re_ah_min}"></div>
                                                <label for="ftReAhMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ah_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftReAhMax"
                                                                             placeholder="${I18n.game_re_ah_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftReAhlstMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ahlst_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftReAhlstMin"
                                                                             placeholder="${I18n.game_re_ahlst_min}">
                                                </div>
                                                <label for="ftReAhlstMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ahlst_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftReAhlstMax"
                                                                             placeholder="${I18n.game_re_ahlst_max}">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="ftReOuMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ou_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftReOuMin"
                                                                             placeholder="${I18n.game_re_ou_min}"></div>
                                                <label for="ftReOuMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ou_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftReOuMax"
                                                                             placeholder="${I18n.game_re_ou_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftReOulstMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_oulst_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftReOulstMin"
                                                                             placeholder="${I18n.game_re_oulst_min}">
                                                </div>
                                                <label for="ftReOulstMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_oulst_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftReOulstMax"
                                                                             placeholder="${I18n.game_re_oulst_max}">
                                                </div>
                                            </div>

                                            <div style=" width:100%; text-align:left; margin-left:1px; margin-right:1px;">
                                                <hr class="hrLine" style="width:50px; height:1px;" color="#d2d6de"/>
                                                <span style="color:red; font-size: 18px;">今日</span>
                                                <hr class="hrLine" style="width:80%; height:1px;" color="#d2d6de"/>
                                            </div>

                                            <div class="form-group">
                                                <label for="ftRbFthtMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ftht_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbFthtMin"
                                                                             placeholder="${I18n.game_re_ftht_min}">
                                                </div>
                                                <label for="ftRbFthtMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ftht_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbFthtMax"
                                                                             placeholder="${I18n.game_re_ftht_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRbFthtlstMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_fthtlst_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbFthtlstMin"
                                                                             placeholder="${I18n.game_re_fthtlst_min}">
                                                </div>
                                                <label for="ftRbFthtlstMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_fthtlst_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbFthtlstMax"
                                                                             placeholder="${I18n.game_re_fthtlst_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRbAhMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ah_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbAhMin"
                                                                             placeholder="${I18n.game_re_ah_min}"></div>
                                                <label for="ftRbAhMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ah_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbAhMax"
                                                                             placeholder="${I18n.game_re_ah_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRbAhlstMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ahlst_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbAhlstMin"
                                                                             placeholder="${I18n.game_re_ahlst_min}">
                                                </div>
                                                <label for="ftRbAhlstMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ahlst_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbAhlstMax"
                                                                             placeholder="${I18n.game_re_ahlst_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRbOuMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ou_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbOuMin"
                                                                             placeholder="${I18n.game_re_ou_min}"></div>
                                                <label for="ftRbOuMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ou_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbOuMax"
                                                                             placeholder="${I18n.game_re_ou_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRbOulstMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_oulst_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbOulstMin"
                                                                             placeholder="${I18n.game_re_oulst_min}">
                                                </div>
                                                <label for="ftRbOulstMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_oulst_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbOulstMax"
                                                                             placeholder="${I18n.game_re_oulst_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRbOeMin"
                                                       class="col-sm-2 control-label">${I18n.game_rb_oe_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbOeMin"
                                                                             placeholder="${I18n.game_rb_oe_min}"></div>
                                                <label for="ftRbOeMax"
                                                       class="col-sm-2 control-label">${I18n.game_rb_oe_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbOeMax"
                                                                             placeholder="${I18n.game_rb_oe_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRbOelstMin"
                                                       class="col-sm-2 control-label">${I18n.game_rb_oelst_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbOelstMin"
                                                                             placeholder="${I18n.game_rb_oelst_min}">
                                                </div>
                                                <label for="ftRbOelstMax"
                                                       class="col-sm-2 control-label">${I18n.game_rb_oelst_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbOelstMax"
                                                                             placeholder="${I18n.game_rb_oelst_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRbCsMin"
                                                       class="col-sm-2 control-label">${I18n.game_rb_cs_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbCsMin"
                                                                             placeholder="${I18n.game_rb_cs_min}"></div>
                                                <label for="ftRbCsMax"
                                                       class="col-sm-2 control-label">${I18n.game_rb_cs_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbCsMax"
                                                                             placeholder="${I18n.game_rb_cs_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRbTgMin"
                                                       class="col-sm-2 control-label">${I18n.game_rb_tg_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbTgMin"
                                                                             placeholder="${I18n.game_rb_tg_min}"></div>
                                                <label for="ftRbTgMax"
                                                       class="col-sm-2 control-label">${I18n.game_rb_tg_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbTgMax"
                                                                             placeholder="${I18n.game_rb_tg_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRbTglstMin"
                                                       class="col-sm-2 control-label">${I18n.game_rb_tglst_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbTglstMin"
                                                                             placeholder="${I18n.game_rb_tglst_min}">
                                                </div>
                                                <label for="ftRbTglstMax"
                                                       class="col-sm-2 control-label">${I18n.game_rb_tglst_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbTglstMax"
                                                                             placeholder="${I18n.game_rb_tglst_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRbHfMin"
                                                       class="col-sm-2 control-label">${I18n.game_rb_hf_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbHfMin"
                                                                             placeholder="${I18n.game_rb_hf_min}"></div>
                                                <label for="ftRbHfMax"
                                                       class="col-sm-2 control-label">${I18n.game_rb_hf_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbHfMax"
                                                                             placeholder="${I18n.game_rb_hf_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRbFglgMin"
                                                       class="col-sm-2 control-label">${I18n.game_rb_fglg_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbFglgMin"
                                                                             placeholder="${I18n.game_rb_fglg_min}">
                                                </div>
                                                <label for="ftRbFglgMax"
                                                       class="col-sm-2 control-label">${I18n.game_rb_fglg_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRbFglgMax"
                                                                             placeholder="${I18n.game_rb_fglg_max}">
                                                </div>
                                            </div>

                                            <div style=" width:100%; text-align:left; margin-left:1px; margin-right:1px;">
                                                <hr class="hrLine" style="width:50px; height:1px;" color="#d2d6de"/>
                                                <span style="color:red; font-size: 18px;">早盘</span>
                                                <hr class="hrLine" style="width:80%; height:1px;" color="#d2d6de"/>
                                            </div>

                                            <div class="form-group">
                                                <label for="ftRFthtMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ftht_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRFthtMin"
                                                                             placeholder="${I18n.game_re_ftht_min}">
                                                </div>
                                                <label for="ftRFthtMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ftht_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRFthtMax"
                                                                             placeholder="${I18n.game_re_ftht_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRFthtlstMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_fthtlst_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRFthtlstMin"
                                                                             placeholder="${I18n.game_re_fthtlst_min}">
                                                </div>
                                                <label for="ftRFthtlstMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_fthtlst_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRFthtlstMax"
                                                                             placeholder="${I18n.game_re_fthtlst_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRAhMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ah_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRAhMin"
                                                                             placeholder="${I18n.game_re_ah_min}"></div>
                                                <label for="ftRAhMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ah_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRAhMax"
                                                                             placeholder="${I18n.game_re_ah_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRAhlstMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ahlst_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRAhlstMin"
                                                                             placeholder="${I18n.game_re_ahlst_min}">
                                                </div>
                                                <label for="ftRAhlstMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ahlst_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRAhlstMax"
                                                                             placeholder="${I18n.game_re_ahlst_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftROuMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_ou_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftROuMin"
                                                                             placeholder="${I18n.game_re_ou_min}"></div>
                                                <label for="ftROuMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_ou_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftROuMax"
                                                                             placeholder="${I18n.game_re_ou_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftROulstMin"
                                                       class="col-sm-2 control-label">${I18n.game_re_oulst_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftROulstMin"
                                                                             placeholder="${I18n.game_re_oulst_min}">
                                                </div>
                                                <label for="ftROulstMax"
                                                       class="col-sm-2 control-label">${I18n.game_re_oulst_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftROulstMax"
                                                                             placeholder="${I18n.game_re_oulst_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftROeMin"
                                                       class="col-sm-2 control-label">${I18n.game_rb_oe_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftROeMin"
                                                                             placeholder="${I18n.game_rb_oe_min}"></div>
                                                <label for="ftROeMax"
                                                       class="col-sm-2 control-label">${I18n.game_rb_oe_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftROeMax"
                                                                             placeholder="${I18n.game_rb_oe_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftROelstMin"
                                                       class="col-sm-2 control-label">${I18n.game_rb_oelst_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftROelstMin"
                                                                             placeholder="${I18n.game_rb_oelst_min}">
                                                </div>
                                                <label for="ftROelstMax"
                                                       class="col-sm-2 control-label">${I18n.game_rb_oelst_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftROelstMax"
                                                                             placeholder="${I18n.game_rb_oelst_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRCsMin"
                                                       class="col-sm-2 control-label">${I18n.game_rb_cs_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRCsMin"
                                                                             placeholder="${I18n.game_rb_cs_min}"></div>
                                                <label for="ftRCsMax"
                                                       class="col-sm-2 control-label">${I18n.game_rb_cs_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRCsMax"
                                                                             placeholder="${I18n.game_rb_cs_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRTgMin"
                                                       class="col-sm-2 control-label">${I18n.game_rb_tg_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRTgMin"
                                                                             placeholder="${I18n.game_rb_tg_min}"></div>
                                                <label for="ftRTgMax"
                                                       class="col-sm-2 control-label">${I18n.game_rb_tg_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRTgMax"
                                                                             placeholder="${I18n.game_rb_tg_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRTglstMin"
                                                       class="col-sm-2 control-label">${I18n.game_rb_tglst_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRTglstMin"
                                                                             placeholder="${I18n.game_rb_tglst_min}">
                                                </div>
                                                <label for="ftRTglstMax"
                                                       class="col-sm-2 control-label">${I18n.game_rb_tglst_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRTglstMax"
                                                                             placeholder="${I18n.game_rb_tglst_max}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRHfMin"
                                                       class="col-sm-2 control-label">${I18n.game_rb_hf_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRHfMin"
                                                                             placeholder="${I18n.game_rb_hf_min}"></div>
                                                <label for="ftRHfMax"
                                                       class="col-sm-2 control-label">${I18n.game_rb_hf_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRHfMax"
                                                                             placeholder="${I18n.game_rb_hf_max}"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ftRFglgMin"
                                                       class="col-sm-2 control-label">${I18n.game_rb_fglg_min}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRFglgMin"
                                                                             placeholder="${I18n.game_rb_fglg_min}">
                                                </div>
                                                <label for="ftRFglgMax"
                                                       class="col-sm-2 control-label">${I18n.game_rb_fglg_max}</label>
                                                <div class="col-sm-4"><input type="text"
                                                                             onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                                             class="form-control" name="ftRFglgMax"
                                                                             placeholder="${I18n.game_rb_fglg_max}">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <hr style="width:100%; height:1px;" color="#d2d6de"/>

                                <div class="form-group" style="margin-bottom: 40px;">
                                    <div class="col-sm-offset-3 col-sm-6">
                                        <button class="btn btn-primary"
                                                id="submitFTConfig">${I18n.submit_button}</button>
                                        <button type="button" class="btn btn-default"
                                                data-dismiss="modal">${I18n.system_cancel}</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</div>

<@netCommon.commonScript />
<script src="${request.contextPath}/static/js/constant.js"></script>
<script src="${request.contextPath}/static/js/user/userinfo.js"></script>
</body>
</html>
