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
        .personalinfo li .title {color: #515365;float: left;font-weight: 500;margin-right: 30px;width: 30%;}
        .personalinfo li .text {color: #888da8;display: block;overflow: hidden;}
        .personalinfo li {margin-bottom: 10px;}
        .personalinfo {list-style: none;margin-bottom: 0;}
		.modal-body{min-height: 500px}
	</style>
</head>
<body class="hold-transition skin-blue sidebar-mini <#if cookieMap?exists && cookieMap["sport_manage_settings"]?exists && "off" == cookieMap["sport_manage_settings"].value >sidebar-collapse</#if>">
<div class="wrapper">
	<@netCommon.commonHeader />
	<@netCommon.commonLeft "payOutPage" />
	<div class="content-wrapper">
	    <section class="content">
	    	<div class="row" id="searchForm">
				<div class="col-xs-2">
					<div class="input-group">
						<span class="input-group-addon">订单号</span>
						<input type="text" class="form-control" id="title" name="orderId" autocomplete="off">
					</div>
				</div>
                <div class="col-xs-2">
                    <div class="input-group">
                        <span class="input-group-addon">会员名</span>
                        <input type="text" class="form-control" id="fromUser" name="username" autocomplete="off">
                    </div>
                </div>
                <div class="col-xs-2">
                    <div class="input-group">
                        <span class="input-group-addon">状态</span>
						<input name="statusStr" hidden value="0,1">
                        <select class="selectpicker" id="status" multiple title="全部">
                            <#--0-未审核1-审核成功2-已出款-3-审核失败-4-出款中-5-撤销出款-->
                                <option value="0" selected = "selected">待审核</option>
                                <option value="1"  selected = "selected">待出款</option>
                                <option value="2">已出款</option>
                                <option value="3">已驳回</option>
                                <option value="4">出款中</option>
                                <option value="5">已撤销</option>
                        </select>
                    </div>
                </div>
				<div class="col-xs-3">
					<div class="input-group">
                		<span class="input-group-addon">
	                  		${I18n.msg_add_time}
	                	</span>
						<input type="text" class="form-control" id="filterTime" name="filterTime" readonly >
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
                                        <th name="jobGroup"  style="width: 8%">订单号</th>
                                        <th name="jobGroup"  style="width: 8%">会员名</th>
					                	<th name="jobGroup" style="width: 8%" >出款前金额</th>
										<th name="jobGroup" style="width: 8%" >出款金额</th>
                                        <th name="jobGroup" style="width: 8%">出款后金额</th>
                                        <th name="jobGroup" style="width: 8%">出款类型</th>
                                        <th name="jobGroup" style="width: 8%">状态</th>
                                        <th name="glueType">入款时间</th>
                                        <th name="glueType">备注</th>
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
				<h4 class="modal-title" >出款审核提示信息</h4>
			</div>
			<div class="modal-body">
                <div class="col-md-7" style="width: 100%; margin-left: 18%">
                    <ul class="personalinfo">
                        <li>
                            <span class="title">提款类型:</span>
                            <span id="type" class="text"></span>
                        </li>
                        <li>
                            <span class="title">开户姓名:</span>
                            <span id="alias" class="text"></span>
                        </li>
                        <li>
                            <span class="title">银行账户:</span>
                            <span id="bankAccount" class="text"></span>
                        </li>
                        <li>
                            <span class="title">提款金额:</span>
                            <span id="gold"  class="text"></span>
                        </li>
                        <li>
                            <span class="title">上次充值金额:</span>
                            <span id="lastPayInAmount" class="text"></span>
                        </li>
                        <li>
                            <span class="title">上次存款到现在的流水额:</span>
                            <span id="lastFlowAmount" class="text"></span>
                        </li>
                        <li>
                            <span class="title">充值总额:</span>
                            <span id="payInAmount" class="text"></span>
                        </li>
                        <li>
                            <span class="title">流水总额:</span>
                            <span id="flowAmount" class="text"></span>
                        </li>
                    </ul>
                </div>
                <div class="col-sm-offset-3 col-sm-6" style="padding-top: 20%">
                    <p id="" class="btn_p">
                    <#--//0-未审核1-审核成功2-已出款-3-审核失败-4-出款中-5-撤销出款-->
                    <button type="button" to_status="1" class="btn btn-warning btn-default update">${I18n.system_check}</button>
                    <button type="button" to_status="3" class="btn btn-danger btn-default update">${I18n.system_check_no}</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">${I18n.system_cancel}</button>
                    </p>
                </div>
			</div>
		</div>
	</div>
</div>

<@netCommon.commonScript />
<script src="${request.contextPath}/static/js/constant.js"></script>
<script src="${request.contextPath}/static/js/pay/payout_info.js"></script>
</body>
</html>
