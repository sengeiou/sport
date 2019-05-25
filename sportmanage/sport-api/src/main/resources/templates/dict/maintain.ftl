<!DOCTYPE html>
<html>
<head>
  	<#import "../common/common.macro.ftl" as netCommon>
	<@netCommon.commonStyle />
    <title>${I18n.admin_name}</title>
    <style type="text/css">
        .btn-group{
            left:25%;
            margin-bottom:20px;
        }
    </style>
</head>
<body class="hold-transition skin-blue sidebar-mini <#if cookieMap?exists && cookieMap["sport_manage_settings"]?exists && "off" == cookieMap["sport_manage_settings"].value >sidebar-collapse</#if>">
<div class="wrapper">
	<@netCommon.commonHeader />
	<@netCommon.commonLeft "userinfo" />
	<div class="content-wrapper">
        <form id="form-horizontal" role="form" style="margin:20px 40px;height: 100%">
            <div id="content">
            </div>

            <div class="btn-group btn-group-lg" role="group" aria-label="...">
                <button type="button" class="btn btn-default" id="update">提交</button>
            </div>
        </form>
        <div class="alert alert-error" hidden>
            <a  class="close" data-dismiss="alert" href="#" aria-hidden="true">
                &times;
            </a>
            <strong>接口报错，请联系相关开发人员处理！</strong>
        </div>
	</div>
</div>
<@netCommon.commonScript />
<script src="${request.contextPath}/static/js/constant.js"></script>
<script src="${request.contextPath}/static/js/dict/maintain.js"></script>
</body>
</html>
