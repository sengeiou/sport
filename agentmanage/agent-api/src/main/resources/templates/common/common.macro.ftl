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
          href="${request.contextPath}/static/adminlte/bower_components/bootstrap-switch/css/bootstrap-switch.min.css">
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
    <link href="${request.contextPath}/static/adminlte/bower_components/zTree_v3/css/zTreeStyle/zTreeStyle.css"
          rel="stylesheet"/>
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

        .logo-login {
            -webkit-transition: width .3s ease-in-out;
            -o-transition: width .3s ease-in-out;
            transition: width .3s ease-in-out;
            display: block;
            float: left;
            height: 50px;
            font-size: 20px;
            line-height: 50px;
            text-align: center;
            width: 230px;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            padding: 0 15px;
            font-weight: 300;
            overflow: hidden;
        }
    </style>
    <#global I18n = I18nUtil.getMultString()?eval />
    <#global loginName = loginName />
    <#global authOwenUrls = authOwenUrls />
</#macro>

<#macro commonScript>
    <script src="${request.contextPath}/static/adminlte/bower_components/jquery/jquery.min.js"></script>
    <script src="${request.contextPath}/static/adminlte/bower_components/bootstrap/js/bootstrap.min.js"></script>
    <script src="${request.contextPath}/static/adminlte/bower_components/bootstrap-switch/js/bootstrap-switch.min.js"></script>
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
            <span class="logo-lg"><b style="color:#EAEBC0">SPORT</b>&nbsp;${I18n.admin_name}</span>
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

            <div class="navbar-custom-menu" style="float: left">
                <#if loginName == 'admin'>
                    <a href="#" class="logo-login" style="background-color: #3c8dbc">
                        <span class="logo-lg"><b style="color:#F1BF76">超级管理员</b></span>
                    </a>
                </#if>
                <#if loginName != 'admin'>
                    <a href="#" class="logo-login" style="background-color: #3c8dbc">
                        <span class="logo-lg"><b style="color:#8016BD">普通代理</b></span>
                    </a>
                </#if>
            </div>

        </nav>
    </header>
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
                <#if authOwenUrls?index_of("agentManager") != -1>
                    <div class="panel panel-primary leftMenu">
                        <div class="panel-heading" id="collapseListGroupHeading1" data-toggle="collapse"
                             data-target="#collapseListGroup1" role="tab">
                            <h4 class="panel-title">
                                <i class="fa fa-link"></i>
                                代理管理
                                <span class="glyphicon glyphicon-chevron-down right"></span>
                            </h4>
                        </div>
                        <div id="collapseListGroup1" class="panel-collapse collapse" role="tabpanel"
                             aria-labelledby="collapseListGroupHeading1">
                            <#if authOwenUrls?index_of("agentQuery") != -1>
                                <ul class="list-group">
                                    <li class="list-group-item <#if pageName == "agentPage">active</#if>">
                                        <a href="${request.contextPath}/agent/agentPage"><span>${I18n.agent_list}</span></a>
                                    </li>
                                </ul>
                            </#if>
                            <#if authOwenUrls?index_of("configQuery") != -1>
                                <ul class="list-group">
                                    <li class="list-group-item <#if pageName == "configPage">active</#if>">
                                        <a href="${request.contextPath}/config/configPage"><span>${I18n.agent_config}</span></a>
                                    </li>
                                </ul>
                            </#if>
                        </div>
                    </div>
                </#if>
                <#if authOwenUrls?index_of("customerManager") != -1>
                    <div class="panel panel-primary leftMenu">
                        <div class="panel-heading" id="collapseListGroupHeading2" data-toggle="collapse"
                             data-target="#collapseListGroup2" role="tab">
                            <h4 class="panel-title">
                                <i class="fa fa-user"></i>
                                会员管理
                                <span class="glyphicon glyphicon-chevron-down right"></span>
                            </h4>
                        </div>
                        <div id="collapseListGroup2" class="panel-collapse collapse" role="tabpanel"
                             aria-labelledby="collapseListGroupHeading2">
                            <ul class="list-group">
                                <#if authOwenUrls?index_of("customerQuery") != -1>
                                    <li class="list-group-item <#if pageName == "userInfo">active</#if>">
                                        <a href="${request.contextPath}/user/userPage"><span>${I18n.cus_list}</span></a>
                                    </li>
                                </#if>
                                <#if authOwenUrls?index_of("customerLevel") != -1>
                                    <li class="list-group-item <#if pageName == "userLevel">active</#if>">
                                        <a href="${request.contextPath}/level/levelPage"><span>${I18n.cus_level}</span></a>
                                    </li>
                                </#if>
                            </ul>
                        </div>
                    </div>
                </#if>
                <#if authOwenUrls?index_of("gameBillManage") != -1>
                    <div class="panel panel-primary leftMenu">
                        <div class="panel-heading" id="collapseListGroupHeading3" data-toggle="collapse"
                             data-target="#collapseListGroup3" role="tab">
                            <h4 class="panel-title">
                                <i class="fa fa-bar-chart"></i>
                                注单管理
                                <span class="glyphicon glyphicon-chevron-down right"></span>
                            </h4>
                        </div>
                        <div id="collapseListGroup3" class="panel-collapse collapse" role="tabpanel"
                             aria-labelledby="collapseListGroupHeading3">
                            <ul class="list-group">
                                <#if authOwenUrls?index_of("sportsBill") != -1>
                                    <li class="list-group-item <#if pageName == "sportsBill">active</#if>">
                                        <a href="${request.contextPath}/bill/sportPage"><span>${I18n.sports_event}</span></a>
                                    </li>
                                </#if>
                                <#if authOwenUrls?index_of("lotteryBill") != -1>
                                    <li class="list-group-item <#if pageName == "lotteryBill">active</#if>">
                                        <a href="${request.contextPath}/bill/lotteryPage"><span>${I18n.lottery_bill}</span></a>
                                    </li>
                                </#if>
                                <#if authOwenUrls?index_of("realBill") != -1>
                                    <li class="list-group-item <#if pageName == "realDealer">active</#if>">
                                        <a href="${request.contextPath}/bill/realPage"><span>${I18n.real_dealer}</span></a>
                                    </li>
                                </#if>
                                <#if authOwenUrls?index_of("AGFishBill") != -1>
                                    <li class="list-group-item <#if pageName == "AGFish">active</#if>">
                                        <a href="${request.contextPath}/bill/agFishPage"><span>${I18n.AG_fish}</span></a>
                                    </li>
                                </#if>
                                <#if authOwenUrls?index_of("AGYOPLAYBill") != -1>
                                    <li class="list-group-item <#if pageName == "AGYOPlay">active</#if>">
                                        <a href="${request.contextPath}/bill/agYoPlayPage"><span>${I18n.AG_YOPLAY}</span></a>
                                    </li>
                                </#if>
                                <#if authOwenUrls?index_of("AGXINBill") != -1>
                                    <li class="list-group-item <#if pageName == "AGXin">active</#if>">
                                        <a href="${request.contextPath}/bill/agXinPage"><span>${I18n.AG_XIN}</span></a>
                                    </li>
                                </#if>
                                <#if authOwenUrls?index_of("MGBill") != -1>
                                    <li class="list-group-item <#if pageName == "MGGame">active</#if>">
                                        <a href="${request.contextPath}/bill/mgPage"><span>${I18n.MG_game}</span></a>
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