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
    <@netCommon.commonLeft "logPage" />
    <div class="content-wrapper">
        <section class="content">
            <div class="row" id="searchForm">
                <div class="col-xs-2">
                    <div class="input-group">
                        <span class="input-group-addon">${I18n.log_ope_name}</span>
                        <input type="text" class="form-control" id="userName" name="userName" autocomplete="off">
                    </div>
                </div>
                <div class="col-xs-2">
                    <div class="input-group">
                        <span class="input-group-addon">${I18n.log_type_role}</span>
                        <select class="form-control" id="type" name="type">
                            <option value="-1">全部</option>
                            <option value="0">管理员</option>
                            <option value="1">代理</option>
                            <option value="2">会员</option>
                        </select>
                    </div>
                </div>
                <div class="col-xs-3">
                    <div class="input-group">
                		<span class="input-group-addon">
	                  		${I18n.log_ope_time}
	                	</span>
                        <input type="text" class="form-control" id="filterTime" name="filterTime">
                    </div>
                </div>

                <div class="col-xs-2">
                    <div class="input-group">
                        <span class="input-group-addon">${I18n.ADMIN_AGENT}</span>
                        <input type="text" class="form-control" id="serverAdmin" name="serverAdmin" autocomplete="off">
                    </div>
                </div>
                <div class="col-xs-1">
                    <button class="btn btn-block btn-info" id="searchBtn">${I18n.system_search}</button>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-body">
                            <table id="log_info" class="table table-bordered table-striped" width="100%">
                                <thead>
                                <tr>
                                    <th>${I18n.log_ope_name}</th>
                                    <th>${I18n.log_ip_address}</th>
                                    <th>${I18n.log_ope_time}</th>
                                    <th>${I18n.log_url_info}</th>
                                    <th>${I18n.log_url_param}</th>
                                    <th>${I18n.log_type_role}</th>
                                    <th>${I18n.ADMIN_AGENT}</th>
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

<@netCommon.commonScript />
<script src="${request.contextPath}/static/js/constant.js"></script>
<script src="${request.contextPath}/static/js/system/loginfo.js"></script>
</body>
</html>
