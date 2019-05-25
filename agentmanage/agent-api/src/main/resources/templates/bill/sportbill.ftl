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
	<@netCommon.commonLeft "sportsBill" />
	<div class="content-wrapper">
		<section class="content">
			<div class="row" id="searchForm">
				<div class="col-xs-2">
					<div class="input-group">
						<span class="input-group-addon">${I18n.bill_order}</span>
						<input type="text" class="form-control" id="orderNo" name="orderNo" autocomplete="off">
					</div>
				</div>
				<#--<div class="col-xs-2">
					<div class="input-group">
						<span class="input-group-addon">${I18n.bill_active}</span>
						<select class="form-control" id="gType" name="gType">
							<option value="">全部</option>
							<option value="0">未结算</option>
							<option value="1">已结算</option>
							<option value="3">已注销</option>
							<option value="4">已恢复</option>
							<option value="5">已撤销结算</option>
							<option value="6">已二次结算</option>
						</select>
					</div>
				</div>
				-->
				<div class="col-xs-2">
					<div class="input-group">
						<span class="input-group-addon">${I18n.bill_active}</span>
						<input type="text" class="form-control" id="gType" name="gType" autocomplete="off">
					</div>
				</div>
				<div class="col-xs-2">
					<div class="input-group">
						<span class="input-group-addon">${I18n.bill_playType}</span>
						<input type="text" class="form-control" id="pType" name="pType" autocomplete="off">
					</div>
				</div>

				<div class="col-xs-3">
					<div class="input-group">
                		<span class="input-group-addon">
	                  		${I18n.bill_time}
	                	</span>
						<input type="text" class="form-control" id="filterTime" name="filterTime">
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
							<table id="sport_list" class="table table-bordered table-striped" width="100%">
								<thead>
								<tr>
									<th>${I18n.cus_bill_name}</th>
									<th>${I18n.bill_order}</th>
									<th>${I18n.ag_bet_amount}</th>
									<th>${I18n.bill_win}</th>
									<th>${I18n.bill_credit_before}</th>
									<th>${I18n.bill_credit_after}</th>
									<th>${I18n.bill_score}</th>
									<th>${I18n.bill_time}</th>
									<th>${I18n.lottery_state}</th>
									<th>${I18n.system_opt}</th>
								</tr>
								</thead>
								<tbody></tbody>
								<tfoot>
								<tr>
									<td style="font-weight: bold;">小计</td>
									<td></td>
									<td style="font-weight: bold;" id="sum_bet"></td>
									<td style="font-weight: bold;" id="sum_win"></td>
									<td style="font-weight: bold;" id="sum_before"></td>
									<td style="font-weight: bold;" id="sum_after"></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="font-weight: bold;">合计</td>
									<td></td>
									<td style="font-weight: bold;" id="total_bet"></td>
									<td style="font-weight: bold;" id="total_win"></td>
									<td style="font-weight: bold;" id="total_before"></td>
									<td style="font-weight: bold;" id="total_after"></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								</tfoot>
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
<script src="${request.contextPath}/static/js/bill/sportbill.js"></script>
</body>
</html>