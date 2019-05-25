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
	<@netCommon.commonLeft "paymentPage" />
	<div class="content-wrapper">
	    <section class="content">
	    	<div class="row" id="searchForm">
				<div class="col-xs-2">
					<div class="input-group">
						<span class="input-group-addon">平台名称</span>
						<input  class="form-control" id="paymentName" name="paymentName" autocomplete="off">
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
                <div class="col-xs-2">

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
					                	<th name="jobGroup" >平台名称</th>
                                        <th name="glueType" >商户号</th>
                                        <th name="glueType" style="width:7%;">支付类型</th>
                                        <th name="glueType" style="width:7%;">出入款</th>
                                        <th name="glueType" >累计金额</th>
                                        <th name="glueType" >累计次数</th>
                                        <th name="glueType" style="width:7%;">分层名称</th>
                                        <th name="glueType" style="width:7%;">最低限额</th>
                                        <th name="glueType" style="width:7%;" >最高限额</th>
					                  	<th name="executorParam" >状态</th>
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
                    <input name="status" value="0" hidden>
                    <input name="totalMoney" value="0" hidden>
                    <input name="totalTime" value="0" hidden>
					<div class="form-group">
						<label for="accountCompany" class="col-sm-2 control-label">平台名称<span style="color:red">*</span></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="accountCompany"></div>
                        <label for="businessCode" class="col-sm-2 control-label">商户号<span style="color:red">*</span></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="businessCode"></div>

					</div>
                    <div class="form-group">
                        <label for="payType" class="col-sm-2 control-label">支付类型<span style="color:red">*</span></label>
                        <div class="col-sm-4">
                            <select  class="form-control payType" name="payType">
                            </select>
                        </div>
                        <label for="type" class="col-sm-2 control-label">出入款类型<span style="color:red">*</span></label>
                        <div class="col-sm-4">
                            <select class="selectpicker" name="type">
                                 <option value="0">入款</option>
                                <option  value="1">出款</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="levelId" class="col-sm-2 control-label">分层等级<span style="color:red">*</span></label>
                        <div class="col-sm-4">
                            <select id="levelId" name="levelId" class="form-control levelId">
                            </select>
                        </div>
                        <label for="discountRate" class="col-sm-2 control-label">优惠比例(%)<span style="color:red">*</span></label>
                        <div class="col-sm-4"><input value="0" class="form-control" name="discountRate"></div>
                    </div>
                    <div class="form-group">
                        <label for="min" class="col-sm-2 control-label">最低限额<span style="color:red">*</span></label>
                        <div class="col-sm-4"><input type="text" class="form-control" value="0" name="min"></div>
                        <label for="max" class="col-sm-2 control-label">最高限额<span style="color:red">*</span></label>
                        <div class="col-sm-4"><input type="text" class="form-control" value="0" name="max"></div>
                    </div>
                    <div class="form-group">
                        <label for="feesRate" class="col-sm-2 control-label">手续费比例(%)<span style="color:red">*</span></label>
                        <div class="col-sm-4"><input value="0" class="form-control" name="feesRate"></div>
                        <label for="serverAdmin" class="col-sm-2 control-label">总代理<span style="color:red">*</span></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="serverAdmin"></div>
                    </div>
                    <div class="form-group">
                        <label for="payUrl" class="col-sm-2 control-label">返回地址</label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="payUrl"></div>
                        <label for="baofooid" class="col-sm-2 control-label">终端号</label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="baofooid"></div>
                    </div>
                    <div class="form-group form-inline">
                        <label for="chooseBank" class="col-sm-2 control-label">是否支持网银</label>
                        <div class="switch" id="choose" data-on-label="是" data-off-label="否" aria-multiselectable="true">
                            <input type="checkbox" name="chooseBank" class="chooseBank"/>
                        </div>
                        <div class="banks" hidden  style="width:45%;float:right;">
                        <label for="payBank" class="col-sm-3 control-label">支持银行</label>
                        <div class="col-sm-6">
                            <select id="add_bank"  class="form-control payBank" title="请选择" name="payBank" multiple>
                            </select>
                        </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="businessPwd" class="col-sm-2 control-label">密钥一<span style="color:red">*</span></label>
                        <div class="col-sm-8"><textarea name="businessPwd" class="form-control" rows="3"></textarea></div>
                    </div>
                    <div class="form-group">
                        <label for="key2" class="col-sm-2 control-label">密钥二</label>
                        <div class="col-sm-8"><textarea name="key2" class="form-control" rows="3"></textarea></div>
                    </div>
                    <div class="form-group">
                        <label for="notes" class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-8"><textarea name="notes" class="form-control" rows="3"></textarea></div>
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
                    <input name="id" hidden/>
                    <input name="status" value="0" hidden>
                    <input name="totalMoney" value="0" hidden>
                    <input name="totalTime" value="0" hidden>
                    <div class="form-group">
                        <label for="accountCompany" class="col-sm-2 control-label">平台名称<span style="color:red">*</span></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="accountCompany"></div>
                        <label for="businessCode" class="col-sm-2 control-label">商户号<span style="color:red">*</span></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="businessCode"></div>

                    </div>
                    <div class="form-group">
                        <label for="payType" class="col-sm-2 control-label">支付类型<span style="color:red">*</span></label>
                        <div class="col-sm-4">
                            <select  class="form-control payType" name="payType">
                            </select>
                        </div>
                        <label for="type" class="col-sm-2 control-label">出入款类型<span style="color:red">*</span></label>
                        <div class="col-sm-4">
                            <select class="selectpicker" name="type">
                                <option value="0">入款</option>
                                <option  value="1">出款</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="levelId" class="col-sm-2 control-label">分层等级<span style="color:red">*</span></label>
                        <div class="col-sm-4">
                            <select id="levelId" name="levelId" class="form-control levelId">
                            </select>
                        </div>
                        <label for="discountRate" class="col-sm-2 control-label">优惠比例(%)<span style="color:red">*</span></label>
                        <div class="col-sm-4"><input value="0" class="form-control" name="discountRate"></div>
                    </div>
                    <div class="form-group">
                        <label for="min" class="col-sm-2 control-label">最低限额<span style="color:red">*</span></label>
                        <div class="col-sm-4"><input type="text" class="form-control" value="0" name="min"></div>
                        <label for="max" class="col-sm-2 control-label">最高限额<span style="color:red">*</span></label>
                        <div class="col-sm-4"><input type="text" class="form-control" value="0" name="max"></div>
                    </div>
                    <div class="form-group">
                        <label for="feesRate" class="col-sm-2 control-label">手续费比例(%)<span style="color:red">*</span></label>
                        <div class="col-sm-4"><input value="0" class="form-control" name="feesRate"></div>
                        <label for="serverAdmin" class="col-sm-2 control-label">总代理<span style="color:red">*</span></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="serverAdmin"></div>
                    </div>
                    <div class="form-group">
                        <label for="payUrl" class="col-sm-2 control-label">返回地址</label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="payUrl"></div>
                        <label for="baofooid" class="col-sm-2 control-label">终端号</label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="baofooid"></div>
                    </div>
                    <div class="form-group form-inline">
                        <label for="chooseBank" class="col-sm-2 control-label">是否支持网银</label>
                        <div class="switch" data-on-label="是" data-off-label="否" aria-multiselectable="true">
                            <input type="checkbox" name="chooseBank" class="chooseBank"/>
                        </div>
                        <div class="banks" hidden  style="width:45%;float:right;">
                            <label for="payBank" class="col-sm-3 control-label">支持银行</label>
                            <div class="col-sm-6">
                                <select id="update_bank"  class="form-control payBank" title="请选择" name="payBank" multiple>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="businessPwd" class="col-sm-2 control-label">密钥一<span style="color:red">*</span></label>
                        <div class="col-sm-8"><textarea name="businessPwd" class="form-control" rows="3"></textarea></div>
                    </div>
                    <div class="form-group">
                        <label for="key2" class="col-sm-2 control-label">密钥二</label>
                        <div class="col-sm-8"><textarea name="key2" class="form-control" rows="3"></textarea></div>
                    </div>
                    <div class="form-group">
                        <label for="notes" class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-8"><textarea name="notes" class="form-control" rows="3"></textarea></div>
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
<script src="${request.contextPath}/static/js/pay/payment_info.js"></script>
</body>
</html>
