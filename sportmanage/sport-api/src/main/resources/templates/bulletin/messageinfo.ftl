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
	<@netCommon.commonLeft "messagePage" />
	<div class="content-wrapper">
	    <section class="content">
	    	<div class="row" id="searchForm">
				<div class="col-xs-2">
					<div class="input-group">
						<span class="input-group-addon">${I18n.msg_title}</span>
						<input type="text" class="form-control" id="title" name="title" autocomplete="off">
					</div>
				</div>
                <div class="col-xs-2">
                    <div class="input-group">
                        <span class="input-group-addon">发信人</span>
                        <input type="text" class="form-control" id="fromUser" name="fromUser" autocomplete="off">
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
          	</div>
	    	
			<div class="row">
				<div class="col-xs-12">
					<div class="box">
			            <div class="box-body" >
			              	<table id="user_list" class="table table-bordered table-striped" width="100%" >
				                <thead>
					            	<tr>
					            		<th name="id" >ID</th>
                                        <th name="jobGroup"  style="width: 8%">发信人</th>
					                	<th name="jobGroup" >标题</th>
										<th name="jobGroup" style="width: 20%" >内容</th>
                                        <th name="jobGroup" >收信人</th>
                                        <th name="glueType" >发出时间</th>
                                        <th name="glueType"  style="width: 5%">发信人类型</th>
                                        <th name="glueType"  style="width: 5%">回复消息id</th>
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

<!-- 展示.模态框 -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"  aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" style="margin-top: 25%;">
			<div class="modal-header">
				<h4 class="modal-title" >展示详情</h4>
			</div>
			<div class="modal-body">
                <form class="form-horizontal form" role="form" >
					<input hidden name="id">
                    <div class="form-group">
                        <label for="fromUserName" class="col-sm-2 control-label">发信人<span style="color:red">*</span></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="fromUserName" readonly></div>
                        <label for="title" class="col-sm-2 control-label">标题<span style="color:red">*</span></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="title" readonly></div>
                    </div>
                    <div class="form-group">
                        <label for="fromType" class="col-sm-2 control-label">发信人类型<span style="color:red">*</span></label>
                        <div class="col-sm-4">
                            <select class="form-control" name="fromType" readonly>
                                <option value="0">管理员</option>
                                <option value="1">代理</option>
                            </select>
                        </div>
                        <label for="serverAdmin" class="col-sm-2 control-label">总代理<span style="color:red">*</span></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="serverAdmin" readonly></div>
                    </div>
                    <div class="form-group">
                        <label for="context" class="col-sm-2 control-label">内容<span style="color:red">*</span></label>
                        <div class="col-sm-8"><textarea name="context" class="form-control" rows="3" readonly></textarea></div>
                    </div>
                    <hr>
                    <div class="form-group">
                    <table id="info_list" class="table table-bordered table-striped" width="100%" >
                        <thead>
                        <tr>
                            <th name="jobGroup" >收信人</th>
                            <th name="jobGroup" >是否查看</th>
                            <th name="jobGroup" >是否删除</th>
                        </tr>
                        </thead>
                        <tbody id="tb"></tbody>
                        <tfoot></tfoot>
                    </table>
					</div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-6">
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
<script src="${request.contextPath}/static/js/bulletin/messageinfo.js"></script>
</body>
</html>
