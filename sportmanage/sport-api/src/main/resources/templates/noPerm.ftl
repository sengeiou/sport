<!DOCTYPE html>
<html>
<head>
  	<#import "common/common.macro.ftl" as netCommon>
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
	<@netCommon.commonLeft "agentPage" />
	<div class="content-wrapper">
		<h4 style="text-align: center;">权限不足,请联系管理员......</h4>
		<h4 style="text-align: center;">Have no permission, Please contact the administrator......</h4>
	</div>
	<@netCommon.commonFooter />
</div>


<@netCommon.commonScript />
<script src="${request.contextPath}/static/js/constant.js"></script>
</body>
</html>
