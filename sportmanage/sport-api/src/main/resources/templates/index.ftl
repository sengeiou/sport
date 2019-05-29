<!DOCTYPE html>
<html>
<head>
    <#import "./common/common.macro.ftl" as netCommon>
    <@netCommon.commonStyle />
    <title>${I18n.admin_name}</title>
</head>
<body class="hold-transition skin-blue sidebar-mini <#if cookieMap?exists && cookieMap["sport_manage_settings"]?exists && "off" == cookieMap["sport_manage_settings"].value >sidebar-collapse</#if> ">
<div class="wrapper">
    <@netCommon.commonHeader />
    <@netCommon.commonLeft "indexPage" />
    <div class="content-wrapper">
        <section class="content-header">
            <h1>${I18n.sport_data_report}
                <div class="pull-right box-tools">
                    <button type="button" class="btn btn-primary btn-sm daterange pull-right"
                            data-toggle="tooltip" id="filterTime" name="filterTime">
                        <i class="fa fa-calendar"></i>
                    </button>
                </div>
            </h1>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title">${I18n.platform_profit_loss}</h3>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div id="columnChart" style="height: 350px;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title">${I18n.customer_change}</h3>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div id="cusChart" style="height: 350px;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title">${I18n.out_in_money}</h3>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div id="moneyChart" style="height: 350px;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <@netCommon.commonFooter />
</div>
<@netCommon.commonScript />
<script src="${request.contextPath}/static/plugins/echarts/echarts.common.min.js"></script>
<script src="${request.contextPath}/static/js/index.js"></script>
</body>
</html>
