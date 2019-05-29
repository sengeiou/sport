<#macro commonStyle>
    <link rel="icon" href="${request.contextPath}/static/favicon.ico"/>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet"
          href="${request.contextPath}/static/adminlte/bower_components/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="${request.contextPath}/static/adminlte/bower_components/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${request.contextPath}/static/adminlte/bower_components/Ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${request.contextPath}/static/adminlte/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="${request.contextPath}/static/adminlte/dist/css/skins/_all-skins.min.css">
    <link rel="stylesheet"
          href="${request.contextPath}/static/adminlte/bower_components/bootstrap-daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="${request.contextPath}/static/adminlte/plugins/iCheck/square/blue.css">
    <link rel="stylesheet"
          href="${request.contextPath}/static/adminlte/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet"
          href="${request.contextPath}/static/adminlte/bower_components/PACE/themes/blue/pace-theme-flash.css">
    <link rel="stylesheet"
          href="${request.contextPath}/static/adminlte/bower_components/zTree_v3/css/zTreeStyle/zTreeStyle.css"/>
    <link rel="stylesheet"
          href="${request.contextPath}/static/adminlte/bower_components/bootstrap/css/bootstrap-switch.min.css"/>
    <link rel="stylesheet"
          href="${request.contextPath}/static/adminlte/bower_components/bootstrap/css/bootstrap-select.min.css"/>
    <style type="text/css">
        .btn-group-xs > .btn, .btn-xs {
            padding: 1px 5px;
            font-size: 16px;
            line-height: 1;
            border-radius: 1px;
        }

        table.dataTable {
            clear: both;
            margin-top: 6px !important;
            margin-bottom: 6px !important;
            max-width: none !important;
            border-collapse: separate !important;
            text-align: center;
            vertical-align: middle !important;
        }

        th {
            text-align: center;
        }

        body {
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: 16px;
            line-height: 1.42857143;
            color: #333;
            background-color: #fff;
        }

        .col-sm-offset-3 {
            margin-left: 40%;
        }

        .dropdown-menu > li > a {
            color: #777;
            text-align: center;
            font-size: 15px;
        }

        .dropdown-menu > li > a {
            display: block;
            padding: 3px 20px;
            clear: both;
            font-weight: 600;
            line-height: 1.42857143;
            color: #333;
            white-space: nowrap;
        }
    </style>
    <#global I18n = I18nUtil.getMultString()?eval />
    <#global loginName = loginName />
    <#global authOwenUrls = authOwenUrls />
</#macro>

<#macro commonScript>
    <script src="${request.contextPath}/static/adminlte/bower_components/jquery/jquery.min.js"></script>
    <script src="${request.contextPath}/static/adminlte/bower_components/bootstrap/js/bootstrap.min.js"></script>
    <script src="${request.contextPath}/static/adminlte/bower_components/fastclick/fastclick.js"></script>
    <script src="${request.contextPath}/static/adminlte/dist/js/adminlte.min.js"></script>
    <script src="${request.contextPath}/static/adminlte/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <script src="${request.contextPath}/static/adminlte/bower_components/PACE/pace.min.js"></script>
    <script src="${request.contextPath}/static/plugins/jquery/jquery.cookie.js"></script>
    <script src="${request.contextPath}/static/plugins/layer/layer.js"></script>
    <script src="${request.contextPath}/static/adminlte/bower_components/moment/moment.min.js"></script>
    <script src="${request.contextPath}/static/adminlte/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
    <script src="${request.contextPath}/static/plugins/echarts/echarts.common.min.js"></script>
    <script src="${request.contextPath}/static/plugins/jquery/jquery.validate.min.js"></script>
    <script src="${request.contextPath}/static/adminlte/plugins/iCheck/icheck.min.js"></script>
    <script src="${request.contextPath}/static/adminlte/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="${request.contextPath}/static/adminlte/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="${request.contextPath}/static/adminlte/bower_components/bootstrap/js/bootstrap-switch.min.js"></script>
    <script src="${request.contextPath}/static/adminlte/bower_components/bootstrap/js/bootstrap-select.min.js"></script>
    <script src="${request.contextPath}/static/adminlte/bower_components/zTree_v3/js/jquery.ztree.core.min.js"></script>
    <script src="${request.contextPath}/static/adminlte/bower_components/zTree_v3/js/jquery.ztree.excheck.min.js"></script>
    <script src="${request.contextPath}/static/adminlte/bower_components/zTree_v3/js/jquery.ztree.exedit.min.js"></script>
    <script src="${request.contextPath}/static/js/common.js"></script>
    <script>
        var base_url = '${request.contextPath}';
        var I18n = ${I18nUtil.getMultString()};
    </script>
</#macro>

<#macro commonHeader>
    <header class="main-header">
        <a href="${request.contextPath}/" class="logo">
            <span class="logo-mini"><b>导航</b></span>
            <span class="logo-lg"><b style="color:#FFCBB3">SPORT</b>&nbsp;${I18n.admin_name}</span>
        </a>
        <nav class="navbar navbar-static-top" role="navigation">

            <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>

            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            ${loginName} <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="dropdown user user-menu">
                                <a href=";" id="logoutBtn" class="dropdown-toggle" data-toggle="dropdown"
                                   aria-expanded="false">
                                    <span class="hidden-xs">${I18n.logout_btn}</span>
                                </a>
                            </li>
                            <li class="dropdown user user-menu">
                                <a href=";" id="resetPswBtn" class="dropdown-toggle" data-toggle="dropdown"
                                   aria-expanded="false">
                                    <span class="hidden-xs">${I18n.password_reset}</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>

            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li class="dropdown user user-menu">
                        <a href=";" id="logoutBtn" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                            <span class="hidden-xs">${I18n.draw_audit}【2】</span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li class="dropdown user user-menu">
                        <a href=";" id="logoutBtn" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                            <span class="hidden-xs">${I18n.payment_out}【15】</span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li class="dropdown user user-menu">
                        <a href=";" id="logoutBtn" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                            <span class="hidden-xs">${I18n.payment_line}【11】</span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li class="dropdown user user-menu">
                        <a href=";" id="logoutBtn" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                            <span class="hidden-xs">${I18n.online_num}【31】</span>
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>

    <div class="modal fade" id="resetPwdModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content" style="margin-top: 15%;">
                <div class="modal-header">
                    <h4 class="modal-title">${I18n.login_password_reset}</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal form" role="form">
                        <div class="form-group">
                            <label for="loginOldPassword" class="col-sm-4 control-label">${I18n.login_old_pwd}<font
                                        color="red">*</font></label>
                            <div class="col-sm-6"><input type="password" class="form-control" name="loginOldPassword"
                                                         placeholder="${I18n.system_login_old_pwd}"></div>
                        </div>
                        <div class="form-group">
                            <label for="loginNewPassword" class="col-sm-4 control-label">${I18n.login_new_pwd}<font
                                        color="red">*</font></label>
                            <div class="col-sm-6"><input type="password" class="form-control" id="loginNewPassword" name="loginNewPassword"
                                                         placeholder="${I18n.login_new_pwd}"></div>
                        </div>
                        <div class="form-group">
                            <label for="loginConfirmPassword" class="col-sm-4 control-label">${I18n.login_confirm_pwd}<font
                                        color="red">*</font></label>
                            <div class="col-sm-6"><input type="password" class="form-control" id="loginConfirmPassword" name="loginConfirmPassword"
                                                         placeholder="${I18n.login_confirm_pwd}"></div>
                        </div>
                        <hr>
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-6">
                                <button type="submit" class="btn btn-primary">${I18n.system_save}</button>
                                <button type="button" class="btn btn-default"
                                        data-dismiss="modal">${I18n.system_cancel}</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</#macro>

<#macro commonLeft pageName >
    <style type="text/css">
        .panel-primary > .panel-heading {
            color: #fff;
            background-color: #222d32;
            border-color: #222d32;
        }

        .list-group-item.active, .list-group-item.active:focus, .list-group-item.active:hover {
            z-index: 2;
            color: #fff;
            background-color: #888888;
            border-color: #888888;
        }

        .list-group-item {
            position: relative;
            display: block;
            padding: 10px 35px;
            margin-bottom: -1px;
            background-color: #222d32;
            border: 1px solid #222d32;
        }

        .panel-primary {
            border-color: #222d32;
        }

        body {
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: 15px;
            line-height: 1.42857143;
            color: #333;
            background-color: #fff;
        }

        .panel-title {
            margin-top: 0;
            margin-bottom: 0;
            font-size: 17px;
            color: inherit;
        }

        .panel-group .panel-heading + .panel-collapse > .list-group, .panel-group .panel-heading + .panel-collapse > .panel-body {
            border-top: 1px solid #222d32;
        }

        .skin-blue .sidebar a {
            color: #F0FFF0;
        }

        .panel-group {
            height: calc(100vh - 100px);
            top: 0;
            bottom: 0;
        }
    </style>

    <aside class="main-sidebar">
        <section class="sidebar">
            <div class="panel-group table-responsive" role="tablist">
                <input type="hidden" name="authOwenUrls" id="authOwenUrls" value="${authOwenUrls}">
                <div class="panel panel-primary leftMenu">
                    <div class="panel-heading" id="collapseListGroupHeading1" data-toggle="collapse" data-target="#collapseListGroup1" role="tab" >
                        <h4 class="panel-title">
                            <i class="fa fa-area-chart"></i>
                            报表管理
                            <span class="glyphicon glyphicon-chevron-down right"></span>
                        </h4>
                    </div>
                    <div id="collapseListGroup1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="collapseListGroupHeading1">
                        <ul class="list-group">
                            <li class="list-group-item <#if pageName == "indexPage">active</#if>">
                                <a href="${request.contextPath}/report/indexPage"><span>${I18n.menu_data_report}</span></a></li>
                            <#--<li class="list-group-item <#if pageName == "report">active</#if>">
                                <a href="${request.contextPath}/user/userPage"><span>${I18n.SPORT_REPORT_QUERY}</span></a></li>
                            <li class="list-group-item <#if pageName == "jobgroup">active</#if>">
                                <a href="${request.contextPath}/user/userPage"><span>${I18n.SPORT_REPORT_SUMMARY}</span></a></li>
                            <li class="list-group-item <#if pageName == "joblog">active</#if>">
                                <a href="${request.contextPath}/user/userPage"><span>${I18n.LOTTERY_REPORT_QUERY}</span></a></li>
                            <li class="list-group-item <#if pageName == "jobgroup">active</#if>">
                                <a href="${request.contextPath}/user/userPage"><span>${I18n.LOTTERY_REPORT_SUMMARY}</span></a></li>
                            <li class="list-group-item <#if pageName == "joblog">active</#if>">
                                <a href="${request.contextPath}/user/userPage"><span>${I18n.AG_REPORT_QUERY}</span></a></li>
                            <li class="list-group-item <#if pageName == "jobgroup">active</#if>">
                                <a href="${request.contextPath}/user/userPage"><span>${I18n.AG_REPORT_SUMMARY}</span></a></li>
                            <li class="list-group-item <#if pageName == "joblog">active</#if>">
                                <a href="${request.contextPath}/user/userPage"><span>${I18n.MG_REPORT_QUERY}</span></a></li>
                            <li class="list-group-item <#if pageName == "jobgroup">active</#if>">
                                <a href="${request.contextPath}/user/userPage"><span>${I18n.MG_REPORT_SUMMARY}</span></a></li>-->
                        </ul>
                    </div>
                </div>
                <div class="panel panel-primary leftMenu">
                    <div class="panel-heading" id="collapseListGroupHeading2" data-toggle="collapse"
                         data-target="#collapseListGroup2" role="tab">
                        <h4 class="panel-title">
                            <i class="fa fa-dollar"></i>
                            资金管理
                            <span class="glyphicon glyphicon-chevron-down right"></span>
                        </h4>
                    </div>
                    <div id="collapseListGroup2" class="panel-collapse collapse" role="tabpanel"
                         aria-labelledby="collapseListGroupHeading2">
                        <ul class="list-group">
                            <li class="list-group-item <#if pageName == "offlinePayInPage">active</#if>">
                                <a href="${request.contextPath}/pay/offlinePayInPage"><span>${I18n.offline_income_audit}</span></a>
                            </li>
                            <li class="list-group-item <#if pageName == "bankDataPage">active</#if>">
                                <a href="${request.contextPath}/bankData/bankDataPage"><span>${I18n.offline_income_config}</span></a>
                            </li>
                            <li class="list-group-item <#if pageName == "payOutPage">active</#if>">
                                <a href="${request.contextPath}/pay/payOutPage"><span>${I18n.with_draw_audit}</span></a>
                            </li>
                            <li class="list-group-item <#if pageName == "paymentPage">active</#if>">
                                <a href="${request.contextPath}/payment/paymentPage"><span>${I18n.merchant_infor_config}</span></a>
                            </li>
                            <li class="list-group-item <#if pageName == "payLevelPage">active</#if>">
                                <a href="${request.contextPath}/payLevel/payLevelPage"><span>${I18n.pay_level}</span></a>
                            </li>
                            <li class="list-group-item <#if pageName == "joblog">active</#if>">
                                <a href="${request.contextPath}/admin/userPage"><span>${I18n.cash_system}</span></a>
                            </li>
                            <li class="list-group-item <#if pageName == "joblog">active</#if>">
                                <a href="${request.contextPath}/admin/userPage"><span>${I18n.credit_conver}</span></a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="panel panel-primary leftMenu">
                    <div class="panel-heading" id="collapseListGroupHeading3" data-toggle="collapse"
                         data-target="#collapseListGroup3" role="tab">
                        <h4 class="panel-title">
                            <i class="fa fa-server"></i>
                            公告管理
                            <span class="glyphicon glyphicon-chevron-down right"></span>
                        </h4>
                    </div>
                    <div id="collapseListGroup3" class="panel-collapse collapse" role="tabpanel"
                         aria-labelledby="collapseListGroupHeading3">
                        <ul class="list-group">
                            <li class="list-group-item <#if pageName == "noticesPage">active</#if>">
                                <a href="${request.contextPath}/bulletin/noticesPage"><span>${I18n.message_center}</span></a>
                            </li>
                            <li class="list-group-item <#if pageName == "messagePage">active</#if>">
                                <a href="${request.contextPath}/bulletin/messagePage"><span>${I18n.mail_info}</span></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="panel panel-primary leftMenu">
                    <div class="panel-heading" id="collapseListGroupHeading4" data-toggle="collapse"
                         data-target="#collapseListGroup4" role="tab">
                        <h4 class="panel-title">
                            <i class="fa fa-hourglass"></i>
                            游戏管理
                            <span class="glyphicon glyphicon-chevron-down right"></span>
                        </h4>
                    </div>
                    <div id="collapseListGroup4" class="panel-collapse collapse" role="tabpanel"
                         aria-labelledby="collapseListGroupHeading4">
                        <ul class="list-group">
                            <li class="list-group-item <#if pageName == "joblog">active</#if>">
                                <a href="${request.contextPath}/admin/userPage"><span>${I18n.audit_score}</span></a>
                            </li>
                            <li class="list-group-item <#if pageName == "platformlimit">active</#if>">
                                <a href="${request.contextPath}/limit/platformPage"><span>${I18n.platform_limit}</span></a>
                            </li>
                            <li class="list-group-item <#if pageName == "joblog">active</#if>">
                                <a href="${request.contextPath}/admin/userPage"><span>${I18n.hedging_amount}</span></a>
                            </li>
                            <li class="list-group-item <#if pageName == "jobgroup">active</#if>">
                                <a href="${request.contextPath}/admin/userPage"><span>${I18n.popular_events}</span></a>
                            </li>
                            <li class="list-group-item <#if pageName == "joblog">active</#if>">
                                <a href="${request.contextPath}/admin/userPage"><span>${I18n.blocking_events}</span></a>
                            </li>
                            <li class="list-group-item <#if pageName == "jobgroup">active</#if>">
                                <a href="${request.contextPath}/admin/userPage"><span>${I18n.swabbing_warter}</span></a>
                            </li>
                            <li class="list-group-item <#if pageName == "joblog">active</#if>">
                                <a href="${request.contextPath}/admin/userPage"><span>${I18n.match_result}</span></a>
                            </li>
                            <li class="list-group-item <#if pageName == "joblog">active</#if>">
                                <a href="${request.contextPath}/admin/userPage"><span>${I18n.agent_domain}</span></a>
                            </li>
                            <li class="list-group-item <#if pageName == "jobgroup">active</#if>">
                                <a href="${request.contextPath}/admin/userPage"><span>${I18n.half_time_settlement}</span></a>
                            </li>
                            <li class="list-group-item <#if pageName == "joblog">active</#if>">
                                <a href="${request.contextPath}/admin/userPage"><span>${I18n.site_config}</span></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="panel panel-primary leftMenu">
                    <div class="panel-heading" id="collapseListGroupHeading5" data-toggle="collapse"
                         data-target="#collapseListGroup5" role="tab">
                        <h4 class="panel-title">
                            <i class="fa fa-share-alt"></i>
                            活动管理
                            <span class="glyphicon glyphicon-chevron-down right"></span>
                        </h4>
                    </div>
                    <div id="collapseListGroup5" class="panel-collapse collapse" role="tabpanel"
                         aria-labelledby="collapseListGroupHeading5">
                        <ul class="list-group">
                            <li class="list-group-item <#if pageName == "joblog">active</#if>">
                                <a href="${request.contextPath}/admin/userPage"><span>${I18n.red_packet}</span></a></li>
                            <li class="list-group-item <#if pageName == "jobgroup">active</#if>">
                                <a href="${request.contextPath}/admin/userPage"><span>${I18n.sign_day}</span></a></li>

                            <li class="list-group-item <#if pageName == "joblog">active</#if>">
                                <a href="${request.contextPath}/admin/userPage"><span>${I18n.special_offer}</span></a>
                            </li>
                            <li class="list-group-item <#if pageName == "jobgroup">active</#if>">
                                <a href="${request.contextPath}/admin/userPage"><span>${I18n.home_rotation}</span></a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="panel panel-primary leftMenu">
                    <div class="panel-heading" id="collapseListGroupHeading6" data-toggle="collapse"
                         data-target="#collapseListGroup6" role="tab">
                        <h4 class="panel-title">
                            <i class="fa fa-sitemap"></i>
                            系统设置
                            <span class="glyphicon glyphicon-chevron-down right"></span>
                        </h4>
                    </div>
                    <div id="collapseListGroup6" class="panel-collapse collapse" role="tabpanel"
                         aria-labelledby="collapseListGroupHeading6">
                        <ul class="list-group">
                            <li class="list-group-item <#if pageName == "enumPage">active</#if>">
                                <a href="${request.contextPath}/dict/enumPage"><span>${I18n.system_enum}</span></a></li>
                            <li class="list-group-item <#if pageName == "enumTypePage">active</#if>">
                                <a href="${request.contextPath}/dict/enumTypePage"><span>${I18n.system_type}</span></a>
                            </li>
                            <li class="list-group-item <#if pageName == "logPage">active</#if>">
                                <a href="${request.contextPath}/log/logPage"><span>${I18n.ope_log}</span></a></li>
                        </ul>
                    </div>
                </div>

                <#if authOwenUrls?index_of("authManage") != -1>
                    <div class="panel panel-primary leftMenu">
                        <div class="panel-heading" id="collapseListGroupHeading7" data-toggle="collapse"
                             data-target="#collapseListGroup7" role="tab">
                            <h4 class="panel-title">
                                <i class="fa fa-cogs"></i>
                                权限管理
                                <span class="glyphicon glyphicon-chevron-down right"></span>
                            </h4>
                        </div>
                        <div id="collapseListGroup7" class="panel-collapse collapse" role="tabpanel"
                             aria-labelledby="collapseListGroupHeading7">
                            <ul class="list-group">
                                <#if authOwenUrls?index_of("adminQuery") != -1>
                                    <li class="list-group-item <#if pageName == "userinfo">active</#if>">
                                        <a href="${request.contextPath}/admin/userPage"><span>${I18n.admin_list}</span></a>
                                    </li>
                                </#if>
                                <#if authOwenUrls?index_of("roleQuery") != -1>
                                    <li class="list-group-item <#if pageName == "rolePage">active</#if>">
                                        <a href="${request.contextPath}/role/rolePage"><span>${I18n.ROLE_MANAGE}</span></a>
                                    </li>
                                </#if>
                                <#if authOwenUrls?index_of("authQuery") != -1>
                                    <li class="list-group-item <#if pageName == "authPage">active</#if>">
                                        <a href="${request.contextPath}/auth/authPage"><span>${I18n.AUTH_MANAGE}</span></a>
                                    </li>
                                </#if>
                            </ul>
                        </div>
                    </div>
                </#if>
            </div>
        </section>
    </aside>
</#macro>


<#macro commonFooter >
    <footer class="main-footer">
        Powered by <b>GreatFeat</b> Vesion 10002
        <div class="pull-right hidden-xs">
            <strong>Copyright &copy; 2019-${.now?string('yyyy')} &nbsp; JAVA&nbsp;凤凰彩票</strong>
        </div>
    </footer>
</#macro>