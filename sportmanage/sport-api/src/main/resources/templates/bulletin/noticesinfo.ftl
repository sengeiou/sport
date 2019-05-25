<!DOCTYPE html>
<html>
<head>
  	<#import "../common/common.macro.ftl" as netCommon>
	<@netCommon.commonStyle />
    <title>${I18n.admin_name}</title>
	<style type="text/css">
		input[type=checkbox], input[type=radio] {
			margin: 3px 0 0;
			margin-top: 1px\9;
			zoom: 200%;
			line-height: normal;
		}
	</style>
</head>
<body class="hold-transition skin-blue sidebar-mini <#if cookieMap?exists && cookieMap["sport_manage_settings"]?exists && "off" == cookieMap["sport_manage_settings"].value >sidebar-collapse</#if>">
<div class="wrapper">
	<@netCommon.commonHeader />
	<@netCommon.commonLeft "noticesPage" />
	<div class="content-wrapper">
	    <section class="content">
	    	<div class="row" id="searchForm">
				<div class="col-xs-2">
					<div class="input-group">
						<span class="input-group-addon">${I18n.msg_title}</span>
						<input type="text" class="form-control" id="title" name="title" autocomplete="off">
					</div>
				</div>
				<div class="col-xs-3">
					<div class="input-group">
                		<span class="input-group-addon">
	                  		${I18n.msg_add_time}
	                	</span>
						<input type="text" class="form-control" id="filterTime" name="filterTime" >
					</div>
				</div>

	            <div class="col-xs-1">
	            	<button class="btn btn-block btn-info" id="searchBtn">${I18n.system_search}</button>
	            </div>
	            <div class="col-xs-2">
	            	<button class="btn btn-block btn-success add" type="button">${I18n.MSG_ADD}</button>
	            </div>
          	</div>
	    	
			<div class="row">
				<div class="col-xs-12">
					<div class="box">
			            <div class="box-body" >
			              	<table id="user_list" class="table table-bordered table-striped" width="100%" >
				                <thead>
					            	<tr>
					            		<th name="id" >${I18n.msg_id}</th>
					                	<th name="jobGroup" >${I18n.msg_title}</th>
										<th class="msg_content" style='width:30%;' >${I18n.msg_content}</th>
                                        <th name="glueType" >${I18n.msg_alert}</th>
                                        <th name="glueType" >${I18n.msg_type}</th>
                                        <th name="glueType" >${I18n.msg_server_admin}</th>
					                  	<th name="executorParam" >${I18n.msg_add_time}</th>
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
<div class="modal fade" id="addModal" tabindex="-1" role="dialog"  aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" style="margin-top: 25%;">
			<div class="modal-header">
				<h4 class="modal-title" >${I18n.ADMIN_ADD_NEW}</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal form" role="form" >
					<div class="form-group">
						<label for="title" class="col-sm-2 control-label">消息标题<span style="color:red">*</span></label>
						<div class="col-sm-4"><input type="text" class="form-control" name="title"></div>
                        <label for="serverAdmin" class="col-sm-2 control-label">总代理<span style="color:red">*</span></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="serverAdmin"></div>
					</div>
					<div class="form-group">
						<label for="alert" class="col-sm-2 control-label">消息场景<span style="color:red">*</span></label>
						<div class="col-sm-4">
							<select class="form-control" name="alert">
                                <#--0-为登陆弹框1-支付中心弹框2-消息中心展示，012都会在消息中心展示-->
								<option value="0">登陆弹框</option>
								<option value="1">支付中心弹框</option>
								<option checked value="1">消息中心</option>
							</select>
						</div>
                        <label for="type" class="col-sm-2 control-label">消息提示对象<span style="color:red">*</span></label>
                        <div class="col-sm-4">
                            <select class="form-control" name="type">
							<#--1-会员2-代理-->
                                <option value="1">会员</option>
                                <option value="2">代理</option>
                            </select>
                        </div>
					</div>
                    <div class="form-group">
						<label for="context" class="col-sm-2 control-label">消息内容<span style="color:red">*</span></label>
						<div class="col-sm-8"><textarea name="context" class="form-control" rows="3"></textarea></div>
                    </div>
					<hr>
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-6">
							<button type="submit" class="btn btn-primary"  >${I18n.system_save}</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">${I18n.system_cancel}</button>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>
</div>

<!-- 更新.模态框 -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"  aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" style="margin-top: 25%;">
			<div class="modal-header">
				<h4 class="modal-title" >${I18n.ADMIN_UPDATE}</h4>
			</div>
			<div class="modal-body">
                <form class="form-horizontal form" role="form" >
					<input hidden name="id">
                    <div class="form-group">
                        <label for="title" class="col-sm-2 control-label">消息标题<span style="color:red">*</span></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="title"></div>
                        <label for="serverAdmin" class="col-sm-2 control-label">总代理<span style="color:red">*</span></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="serverAdmin"></div>
                    </div>
                    <div class="form-group">
                        <label for="alert" class="col-sm-2 control-label">消息场景<span style="color:red">*</span></label>
                        <div class="col-sm-4">
                            <select class="form-control" name="alert">
							<#--0-为登陆弹框1-支付中心弹框2-消息中心展示，012都会在消息中心展示-->
                                <option value="0">登陆弹框</option>
                                <option value="1">支付中心弹框</option>
                                <option checked value="1">消息中心</option>
                            </select>
                        </div>
                        <label for="type" class="col-sm-2 control-label">消息提示对象<span style="color:red">*</span></label>
                        <div class="col-sm-4">
                            <select class="form-control" name="type">
							<#--1-会员2-代理-->
                                <option value="1">会员</option>
                                <option value="2">代理</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="context" class="col-sm-2 control-label">消息内容<span style="color:red">*</span></label>
                        <div class="col-sm-8"><textarea name="context" class="form-control" rows="3"></textarea></div>
                    </div>
                    <hr>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-6">
                            <button type="submit" class="btn btn-primary"  >${I18n.system_save}</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">${I18n.system_cancel}</button>
                        </div>
                    </div>

                </form>
			</div>
		</div>
	</div>
</div>

<@netCommon.commonScript />
<script src="${request.contextPath}/static/js/constant.js"></script>
<script src="${request.contextPath}/static/js/bulletin/noticesinfo.js"></script>
</body>
</html>
