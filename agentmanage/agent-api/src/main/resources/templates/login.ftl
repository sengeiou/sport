<!DOCTYPE html>
<html>
<head>
  	<#import "./common/common.macro.ftl" as netCommon>
	<@netCommon.commonStyle />
	<title>${I18n.admin_name}</title>
	<style type="text/css">
		html,body {
			margin: 0;
			background-image: url("/static/img/blank.jpg");
			background-repeat:no-repeat;
			background-position:0% 0%;
			background-size:cover;
			background-color: #22C3AA;
		}
		.login-page, .register-page {
			margin-top: 15%;
			background: #FFFFFF;
			background-color: rgba(0,0,0,0.0);
		}
		.login-logo a, .register-logo a {
			color: #E6E6FA;
		}
	</style>
</head>
<body class="hold-transition login-page">
<div class="login-box">
		<div class="login-logo">
			<a><b>SPORT</b>代理系统</a>
		</div>
		<form id="loginForm" method="post" >
			<div class="login-box-body">
				<div class="form-group has-feedback">
	            	<input type="text" name="userName" class="form-control" placeholder="${I18n.login_username_placeholder}" maxlength="18" >
	            	<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
	          	<div class="form-group has-feedback">
	            	<input type="password" name="password" class="form-control" placeholder="${I18n.login_password_placeholder}" maxlength="18" >
	            	<span class="glyphicon glyphicon-lock form-control-feedback"></span>
	          	</div>
				<div class="row">
					<div class="col-xs-8">
		              	<div class="checkbox icheck">
		                	<label>
		                  		<input type="checkbox" name="ifRemember" >${I18n.login_remember_me}
		                	</label>
						</div>
		            </div>
		            <div class="col-xs-4">
						<button type="submit" class="btn btn-primary btn-block btn-flat">${I18n.login_btn}</button>
					</div>
				</div>
			</div>
		</form>
	</div>
<@netCommon.commonScript />
<script src="${request.contextPath}/static/js/constant.js"></script>
<script src="${request.contextPath}/static/js/login.js"></script>
</body>
</html>
