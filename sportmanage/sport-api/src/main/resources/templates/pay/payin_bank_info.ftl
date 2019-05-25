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
	<@netCommon.commonLeft "bankDataPage" />
	<div class="content-wrapper">
	    <section class="content">
	    	<div class="row" id="searchForm">
				<div class="col-xs-2">
					<div class="input-group">
						<span class="input-group-addon">卡种</span>
						<input  class="form-control" id="bank" name="bank" autocomplete="off">
					</div>
				</div>
                <div class="col-xs-2">
                    <div class="input-group">
                        <span class="input-group-addon">卡号户主</span>
                        <input type="text" class="form-control" id="title" name="bankName" autocomplete="off">
                    </div>
                </div>
                <div class="col-xs-2">
                    <div class="input-group">
                        <span class="input-group-addon">状态</span>
                        <select class="selectpicker" name="status">
                            <option value="">全部</option>
                            <option value="0" >未启用</option>
                            <option value="1" selected = "selected">已启用</option>
                        </select>
                    </div>
                </div>
	            <div class="col-xs-1">
	            	<button class="btn btn-block btn-info" id="searchBtn">${I18n.system_search}</button>
	            </div>
	            <div class="col-xs-2">
	            	<button class="btn btn-block btn-success add" type="button">新增</button>
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
                                        <th name="executorParam" >支付类型</th>
					                	<th name="jobGroup" >卡种</th>
                                        <th name="glueType" >卡号户主</th>
										<th class="msg_content" >卡号</th>
                                        <th name="glueType" >支付层级</th>
					                  	<th name="executorParam" >状态</th>
                                        <th name="glueType" >最高限额</th>
                                        <th name="glueType" >最低限额</th>
                                        <th name="executorParam" >线下入款优惠(%)</th>

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
                    <input name="id" hidden>
					<div class="form-group">
						<label for="payType" class="col-sm-2 control-label">支付类型<span style="color:red">*</span></label>
						<div class="col-sm-4">
                            <select  class="form-control payType" name="payType">
                            </select>
                        </div>
                        <label for="bank" class="col-sm-2 control-label">卡种<span style="color:red">*</span></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="bank"></div>
					</div>
					<div class="form-group">
                        <label for="bankName" class="col-sm-2 control-label">卡号户主<span style="color:red">*</span></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="bankName"></div>
                        <label for="bankAccount" class="col-sm-2 control-label">卡号<span style="color:red">*</span></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="bankAccount"></div>
					</div>

                    <div class="form-group">
                        <label for="max" class="col-sm-2 control-label">最高限额</label>
                        <div class="col-sm-4"><input value="0" class="form-control" name="max"></div>
                        <label for="min" class="col-sm-2 control-label">最低限额</label>
                        <div class="col-sm-4"><input value="0" class="form-control" name="min"></div>
                    </div>
                    <div class="form-group">
                        <label for="discountRate" class="col-sm-2 control-label">线下入款优惠(%)</label>
                        <div class="col-sm-4"><input value="0" class="form-control" name="discountRate"></div>
                        <label for="imgUrl" class="col-sm-2 control-label">支付二维码URL</label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="imgUrl"></div>
                    </div>
                    <div class="form-group">
                        <label for="levelId" class="col-sm-2 control-label">支付等级<span style="color:red">*</span></label>
                        <div class="col-sm-4">
                            <select id="levelId" name="levelId" class="form-control levelId">
                            </select>
                        </div>
                        <label for="serverAdmin" class="col-sm-2 control-label">总代理<span style="color:red">*</span></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="serverAdmin"></div>
                    </div>
                    <div class="form-group">
                        <label for="bankAddress" class="col-sm-2 control-label">开户行地址<span style="color:red">*</span></label>
                        <div class="col-sm-8"><textarea name="bankAddress" class="form-control" rows="3"></textarea></div>
                    </div>
                    <div class="form-group" hidden>
                        <label for="status" class="col-sm-2 control-label">状态</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="status" readonly="readonly">
                                <option value="0">停用</option>
                                <option value="1" selected>启用</option>
                            </select>
                        </div>
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
                    <form class="form-horizontal form" role="form" >
                        <input name="id" hidden>
                        <input name="status" hidden>
                        <div class="form-group">
                            <label for="payType" class="col-sm-2 control-label">支付类型<span style="color:red">*</span></label>
                            <div class="col-sm-4">
                                <select  class="form-control payType" name="payType">
                                </select>
                            </div>
                            <label for="bank" class="col-sm-2 control-label">卡种<span style="color:red">*</span></label>
                            <div class="col-sm-4"><input type="text" class="form-control" name="bank"></div>
                        </div>
                        <div class="form-group">
                            <label for="bankName" class="col-sm-2 control-label">卡号户主<span style="color:red">*</span></label>
                            <div class="col-sm-4"><input type="text" class="form-control" name="bankName"></div>
                            <label for="bankAccount" class="col-sm-2 control-label">卡号<span style="color:red">*</span></label>
                            <div class="col-sm-4"><input type="text" class="form-control" name="bankAccount"></div>
                        </div>

                        <div class="form-group">
                            <label for="max" class="col-sm-2 control-label">最高限额</label>
                            <div class="col-sm-4"><input value="0" class="form-control" name="max"></div>
                            <label for="min" class="col-sm-2 control-label">最低限额</label>
                            <div class="col-sm-4"><input value="0" class="form-control" name="min"></div>
                        </div>
                        <div class="form-group">
                            <label for="discountRate" class="col-sm-2 control-label">线下入款优惠(%)</label>
                            <div class="col-sm-4"><input value="0" class="form-control" name="discountRate"></div>
                            <label for="imgUrl" class="col-sm-2 control-label">支付二维码URL</label>
                            <div class="col-sm-4"><input type="text" class="form-control" name="imgUrl"></div>
                        </div>
                        <div class="form-group">
                            <label for="levelId" class="col-sm-2 control-label">支付等级<span style="color:red">*</span></label>
                            <div class="col-sm-4">
                                <select id="levelId" name="levelId" class="form-control levelId">
                                </select>
                            </div>
                            <label for="serverAdmin" class="col-sm-2 control-label">总代理<span style="color:red">*</span></label>
                            <div class="col-sm-4"><input type="text" class="form-control" name="serverAdmin"></div>
                        </div>
                        <div class="form-group">
                            <label for="bankAddress" class="col-sm-2 control-label">开户行地址<span style="color:red">*</span></label>
                            <div class="col-sm-8"><textarea name="bankAddress" class="form-control" rows="3"></textarea></div>
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
<script src="${request.contextPath}/static/js/pay/payin_bank_info.js"></script>
</body>
</html>
