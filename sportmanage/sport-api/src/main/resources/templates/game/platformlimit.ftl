<!DOCTYPE html>
<html>
<head>
    <#import "../common/common.macro.ftl" as netCommon>
    <@netCommon.commonStyle />
    <title>${I18n.admin_name}</title>
    <style type="text/css">
        .hrLine{
          vertical-align:middle; display:inline-block;
        }
    </style>
</head>
<body class="hold-transition skin-blue sidebar-mini <#if cookieMap?exists && cookieMap["sport_manage_settings"]?exists && "off" == cookieMap["sport_manage_settings"].value >sidebar-collapse</#if>">
<div class="wrapper">
    <@netCommon.commonHeader />
    <@netCommon.commonLeft "platformlimit" />
    <div class="content-wrapper" style="overflow: scroll;">
        <section class="content">
            <ul id="platformTab" class="nav nav-tabs">
                <li class="active">
                    <a href="#bkConfig" data-toggle="tab">篮球</a>
                </li>
                <li><a href="#ftConfig" data-toggle="tab">足球</a></li>
            </ul>
            <div id="platformTabContent" class="tab-content">
                <div class="tab-pane fade in active" id="bkConfig">
                    <div class="form-group">
                        <div class="col-sm-5">
                            <div class="modal-header">
                                <h4 class="modal-title">${I18n.platform_limit}</h4>
                            </div>
                            <hr style="width:100%; height:1px;" color="#d2d6de"/>
                            <div class="modal-body" id="platformBKModel">
                                <form class="form-horizontal form">
                                    <div class="form-group">
                                        <label for="bkOrMin" class="col-sm-2 control-label">${I18n.game_or_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkOrMin"
                                                                     placeholder="${I18n.game_or_min}" ></div>
                                        <label for="bkOrMax" class="col-sm-2 control-label">${I18n.game_or_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkOrMax"
                                                                     placeholder="${I18n.game_or_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="bkP3Min" class="col-sm-2 control-label">${I18n.game_p3_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkP3Min"
                                                                     placeholder="${I18n.game_p3_min}"></div>
                                        <label for="bkP3Max" class="col-sm-2 control-label">${I18n.game_p3_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkP3Max"
                                                                     placeholder="${I18n.game_p3_max}"></div>
                                    </div>

                                    <div style=" width:100%; text-align:left; margin-left:1px; margin-right:1px;">
                                        <hr class="hrLine" style="width:50px; height:1px;" color="#d2d6de"/>
                                            <span style="color:red; font-size: 18px;">滚球</span>
                                        <hr class="hrLine" style="width:80%; height:1px;" color="#d2d6de"/>
                                    </div>

                                    <div class="form-group">
                                        <label for="bkReFthtMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ftht_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkReFthtMin"
                                                                     placeholder="${I18n.game_re_ftht_min}"></div>
                                        <label for="bkReFthtMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ftht_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkReFthtMax"
                                                                     placeholder="${I18n.game_re_ftht_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="bkReAhMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ah_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkReAhMin"
                                                                     placeholder="${I18n.game_re_ah_min}"></div>
                                        <label for="bkReAhMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ah_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkReAhMax"
                                                                     placeholder="${I18n.game_re_ah_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="bkReOuMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ou_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkReOuMin"
                                                                     placeholder="${I18n.game_re_ou_min}"></div>
                                        <label for="bkReOuMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ou_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkReOuMax"
                                                                     placeholder="${I18n.game_re_ou_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="bkReBigMin"
                                               class="col-sm-2 control-label">${I18n.bk_re_big_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkReBigMin"
                                                                     placeholder="${I18n.bk_re_big_min}"></div>
                                        <label for="bkReBigMax"
                                               class="col-sm-2 control-label">${I18n.bk_re_big_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkReBigMax"
                                                                     placeholder="${I18n.bk_re_big_max}"></div>
                                    </div>

                                    <div class="form-group">
                                        <label for="bkReSmallMin"
                                               class="col-sm-2 control-label">${I18n.bk_re_small_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkReSmallMin"
                                                                     placeholder="${I18n.bk_re_small_min}"></div>
                                        <label for="bkReSmallMax"
                                               class="col-sm-2 control-label">${I18n.bk_re_small_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkReSmallMax"
                                                                     placeholder="${I18n.bk_re_small_max}"></div>
                                    </div>
                                    <div style=" width:100%; text-align:left; margin-left:1px; margin-right:1px;">
                                        <hr class="hrLine" style="width:50px; height:1px;" color="#d2d6de"/>
                                        <span style="color:red; font-size: 18px;">今日</span>
                                        <hr class="hrLine" style="width:80%; height:1px;" color="#d2d6de"/>
                                    </div>

                                    <div class="form-group">
                                        <label for="bkRbFthtMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ftht_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRbFthtMin"
                                                                     placeholder="${I18n.game_re_ftht_min}"></div>
                                        <label for="bkRbFthtMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ftht_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRbFthtMax"
                                                                     placeholder="${I18n.game_re_ftht_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="bkRbAhMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ah_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRbAhMin"
                                                                     placeholder="${I18n.game_re_ah_min}"></div>
                                        <label for="bkRbAhMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ah_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRbAhMax"
                                                                     placeholder="${I18n.game_re_ah_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="bkRbOuMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ou_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRbOuMin"
                                                                     placeholder="${I18n.game_re_ou_min}"></div>
                                        <label for="bkRbOuMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ou_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRbOuMax"
                                                                     placeholder="${I18n.game_re_ou_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="bkRbBigMin"
                                               class="col-sm-2 control-label">${I18n.bk_re_big_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRbBigMin"
                                                                     placeholder="${I18n.bk_re_big_min}"></div>
                                        <label for="bkRbBigMax"
                                               class="col-sm-2 control-label">${I18n.bk_re_big_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRbBigMax"
                                                                     placeholder="${I18n.bk_re_big_max}"></div>
                                    </div>

                                    <div class="form-group">
                                        <label for="bkRbSmallMin"
                                               class="col-sm-2 control-label">${I18n.bk_re_small_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRbSmallMin"
                                                                     placeholder="${I18n.bk_re_small_min}"></div>
                                        <label for="bkRbSmallMax"
                                               class="col-sm-2 control-label">${I18n.bk_re_small_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRbSmallMax"
                                                                     placeholder="${I18n.bk_re_small_max}"></div>
                                    </div>

                                    <div style=" width:100%; text-align:left; margin-left:1px; margin-right:1px;">
                                        <hr class="hrLine" style="width:50px; height:1px;" color="#d2d6de"/>
                                        <span style="color:red; font-size: 18px;">早盘</span>
                                        <hr class="hrLine" style="width:80%; height:1px;" color="#d2d6de"/>
                                    </div>

                                    <div class="form-group">
                                        <label for="bkRFthtMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ftht_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRFthtMin"
                                                                     placeholder="${I18n.game_re_ftht_min}"></div>
                                        <label for="bkRFthtMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ftht_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRFthtMax"
                                                                     placeholder="${I18n.game_re_ftht_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="bkRAhMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ah_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRAhMin"
                                                                     placeholder="${I18n.game_re_ah_min}"></div>
                                        <label for="bkRAhMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ah_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRAhMax"
                                                                     placeholder="${I18n.game_re_ah_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="bkROuMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ou_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkROuMin"
                                                                     placeholder="${I18n.game_re_ou_min}"></div>
                                        <label for="bkROuMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ou_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkROuMax"
                                                                     placeholder="${I18n.game_re_ou_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="bkRBigMin"
                                               class="col-sm-2 control-label">${I18n.bk_re_big_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRBigMin"
                                                                     placeholder="${I18n.bk_re_big_min}"></div>
                                        <label for="bkRBigMax"
                                               class="col-sm-2 control-label">${I18n.bk_re_big_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRBigMax"
                                                                     placeholder="${I18n.bk_re_big_max}"></div>
                                    </div>

                                    <div class="form-group">
                                        <label for="bkRSmallMin"
                                               class="col-sm-2 control-label">${I18n.bk_re_small_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRSmallMin"
                                                                     placeholder="${I18n.bk_re_small_min}"></div>
                                        <label for="bkRSmallMax"
                                               class="col-sm-2 control-label">${I18n.bk_re_small_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRSmallMax"
                                                                     placeholder="${I18n.bk_re_small_max}"></div>
                                    </div>

                                </form>
                            </div>
                        </div>
                        <div class="col-sm-5">
                            <div class="modal-header">
                                <h4 class="modal-title">${I18n.platform_limit_default}</h4>
                            </div>
                            <hr style="width:100%; height:1px;" color="#d2d6de"/>
                            <div class="modal-body" id="defaultBKModel">
                                <form class="form-horizontal form">
                                    <div class="form-group">
                                        <label for="bkOrMin" class="col-sm-2 control-label">${I18n.game_or_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkOrMin"
                                                                     placeholder="${I18n.game_or_min}"></div>
                                        <label for="bkOrMax" class="col-sm-2 control-label">${I18n.game_or_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkOrMax"
                                                                     placeholder="${I18n.game_or_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="bkP3Min" class="col-sm-2 control-label">${I18n.game_p3_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkP3Min"
                                                                     placeholder="${I18n.game_p3_min}"></div>
                                        <label for="bkP3Max" class="col-sm-2 control-label">${I18n.game_p3_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkP3Max"
                                                                     placeholder="${I18n.game_p3_max}"></div>
                                    </div>

                                    <div style=" width:100%; text-align:left; margin-left:1px; margin-right:1px;">
                                        <hr class="hrLine" style="width:50px; height:1px;" color="#d2d6de"/>
                                        <span style="color:red; font-size: 18px;">滚球</span>
                                        <hr class="hrLine" style="width:80%; height:1px;" color="#d2d6de"/>
                                    </div>

                                    <div class="form-group">
                                        <label for="bkReFthtMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ftht_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkReFthtMin"
                                                                     placeholder="${I18n.game_re_ftht_min}"></div>
                                        <label for="bkReFthtMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ftht_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkReFthtMax"
                                                                     placeholder="${I18n.game_re_ftht_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="bkReAhMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ah_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkReAhMin"
                                                                     placeholder="${I18n.game_re_ah_min}"></div>
                                        <label for="bkReAhMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ah_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkReAhMax"
                                                                     placeholder="${I18n.game_re_ah_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="bkReOuMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ou_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkReOuMin"
                                                                     placeholder="${I18n.game_re_ou_min}"></div>
                                        <label for="bkReOuMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ou_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkReOuMax"
                                                                     placeholder="${I18n.game_re_ou_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="bkReBigMin"
                                               class="col-sm-2 control-label">${I18n.bk_re_big_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkReBigMin"
                                                                     placeholder="${I18n.bk_re_big_min}"></div>
                                        <label for="bkReBigMax"
                                               class="col-sm-2 control-label">${I18n.bk_re_big_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkReBigMax"
                                                                     placeholder="${I18n.bk_re_big_max}"></div>
                                    </div>

                                    <div class="form-group">
                                        <label for="bkReSmallMin"
                                               class="col-sm-2 control-label">${I18n.bk_re_small_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkReSmallMin"
                                                                     placeholder="${I18n.bk_re_small_min}"></div>
                                        <label for="bkReSmallMax"
                                               class="col-sm-2 control-label">${I18n.bk_re_small_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkReSmallMax"
                                                                     placeholder="${I18n.bk_re_small_max}"></div>
                                    </div>

                                    <div style=" width:100%; text-align:left; margin-left:1px; margin-right:1px;">
                                        <hr class="hrLine" style="width:50px; height:1px;" color="#d2d6de"/>
                                        <span style="color:red; font-size: 18px;">今日</span>
                                        <hr class="hrLine" style="width:80%; height:1px;" color="#d2d6de"/>
                                    </div>

                                    <div class="form-group">
                                        <label for="bkRbFthtMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ftht_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRbFthtMin"
                                                                     placeholder="${I18n.game_re_ftht_min}"></div>
                                        <label for="bkRbFthtMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ftht_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRbFthtMax"
                                                                     placeholder="${I18n.game_re_ftht_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="bkRbAhMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ah_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRbAhMin"
                                                                     placeholder="${I18n.game_re_ah_min}"></div>
                                        <label for="bkRbAhMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ah_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRbAhMax"
                                                                     placeholder="${I18n.game_re_ah_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="bkRbOuMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ou_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRbOuMin"
                                                                     placeholder="${I18n.game_re_ou_min}"></div>
                                        <label for="bkRbOuMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ou_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRbOuMax"
                                                                     placeholder="${I18n.game_re_ou_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="bkRbBigMin"
                                               class="col-sm-2 control-label">${I18n.bk_re_big_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRbBigMin"
                                                                     placeholder="${I18n.bk_re_big_min}"></div>
                                        <label for="bkRbBigMax"
                                               class="col-sm-2 control-label">${I18n.bk_re_big_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRbBigMax"
                                                                     placeholder="${I18n.bk_re_big_max}"></div>
                                    </div>

                                    <div class="form-group">
                                        <label for="bkRbSmallMin"
                                               class="col-sm-2 control-label">${I18n.bk_re_small_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRbSmallMin"
                                                                     placeholder="${I18n.bk_re_small_min}"></div>
                                        <label for="bkRbSmallMax"
                                               class="col-sm-2 control-label">${I18n.bk_re_small_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRbSmallMax"
                                                                     placeholder="${I18n.bk_re_small_max}"></div>
                                    </div>

                                    <div style=" width:100%; text-align:left; margin-left:1px; margin-right:1px;">
                                        <hr class="hrLine" style="width:50px; height:1px;" color="#d2d6de"/>
                                        <span style="color:red; font-size: 18px;">早盘</span>
                                        <hr class="hrLine" style="width:80%; height:1px;" color="#d2d6de"/>
                                    </div>

                                    <div class="form-group">
                                        <label for="bkRFthtMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ftht_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRFthtMin"
                                                                     placeholder="${I18n.game_re_ftht_min}"></div>
                                        <label for="bkRFthtMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ftht_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRFthtMax"
                                                                     placeholder="${I18n.game_re_ftht_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="bkRAhMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ah_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRAhMin"
                                                                     placeholder="${I18n.game_re_ah_min}"></div>
                                        <label for="bkRAhMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ah_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRAhMax"
                                                                     placeholder="${I18n.game_re_ah_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="bkROuMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ou_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkROuMin"
                                                                     placeholder="${I18n.game_re_ou_min}"></div>
                                        <label for="bkROuMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ou_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkROuMax"
                                                                     placeholder="${I18n.game_re_ou_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="bkRBigMin"
                                               class="col-sm-2 control-label">${I18n.bk_re_big_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRBigMin"
                                                                     placeholder="${I18n.bk_re_big_min}"></div>
                                        <label for="bkRBigMax"
                                               class="col-sm-2 control-label">${I18n.bk_re_big_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRBigMax"
                                                                     placeholder="${I18n.bk_re_big_max}"></div>
                                    </div>

                                    <div class="form-group">
                                        <label for="bkRSmallMin"
                                               class="col-sm-2 control-label">${I18n.bk_re_small_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRSmallMin"
                                                                     placeholder="${I18n.bk_re_small_min}"></div>
                                        <label for="bkRSmallMax"
                                               class="col-sm-2 control-label">${I18n.bk_re_small_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="bkRSmallMax"
                                                                     placeholder="${I18n.bk_re_small_max}"></div>
                                    </div>

                                </form>
                            </div>
                        </div>

                        <hr style="width:100%; height:1px;" color="#d2d6de"/>
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-6">
                                <button  class="btn btn-primary"  id="submitBkConfig">${I18n.submit_button}</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="ftConfig">
                    <div class="form-group">
                        <div class="col-sm-5">
                            <div class="modal-header">
                                <h4 class="modal-title">${I18n.platform_limit}</h4>
                            </div>
                            <hr style="width:100%; height:1px;" color="#d2d6de"/>
                            <div class="modal-body" id="platformFTModel">
                                <form class="form-horizontal form">
                                    <div class="form-group">
                                        <label for="ftOrMin" class="col-sm-2 control-label">${I18n.game_or_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftOrMin"
                                                                     placeholder="${I18n.game_or_min}"></div>
                                        <label for="ftOrMax" class="col-sm-2 control-label">${I18n.game_or_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftOrMax"
                                                                     placeholder="${I18n.game_or_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftP3Min" class="col-sm-2 control-label">${I18n.game_p3_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftP3Min"
                                                                     placeholder="${I18n.game_p3_min}"></div>
                                        <label for="ftP3Max" class="col-sm-2 control-label">${I18n.game_p3_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftP3Max"
                                                                     placeholder="${I18n.game_p3_max}"></div>
                                    </div>

                                    <div style=" width:100%; text-align:left; margin-left:1px; margin-right:1px;">
                                        <hr class="hrLine" style="width:50px; height:1px;" color="#d2d6de"/>
                                        <span style="color:red; font-size: 18px;">滚球</span>
                                        <hr class="hrLine" style="width:80%; height:1px;" color="#d2d6de"/>
                                    </div>

                                    <div class="form-group">
                                        <label for="ftReFthtMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ftht_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftReFthtMin"
                                                                     placeholder="${I18n.game_re_ftht_min}"></div>
                                        <label for="ftReFthtMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ftht_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftReFthtMax"
                                                                     placeholder="${I18n.game_re_ftht_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftReFthtlstMin"
                                               class="col-sm-2 control-label">${I18n.game_re_fthtlst_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftReFthtlstMin"
                                                                     placeholder="${I18n.game_re_fthtlst_min}"></div>
                                        <label for="ftReFthtlstMax"
                                               class="col-sm-2 control-label">${I18n.game_re_fthtlst_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftReFthtlstMax"
                                                                     placeholder="${I18n.game_re_fthtlst_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftReAhMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ah_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftReAhMin"
                                                                     placeholder="${I18n.game_re_ah_min}"></div>
                                        <label for="ftReAhMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ah_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftReAhMax"
                                                                     placeholder="${I18n.game_re_ah_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftReAhlstMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ahlst_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftReAhlstMin"
                                                                     placeholder="${I18n.game_re_ahlst_min}"></div>
                                        <label for="ftReAhlstMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ahlst_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftReAhlstMax"
                                                                     placeholder="${I18n.game_re_ahlst_max}"></div>
                                    </div>

                                    <div class="form-group">
                                        <label for="ftReOuMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ou_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftReOuMin"
                                                                     placeholder="${I18n.game_re_ou_min}"></div>
                                        <label for="ftReOuMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ou_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftReOuMax"
                                                                     placeholder="${I18n.game_re_ou_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftReOulstMin"
                                               class="col-sm-2 control-label">${I18n.game_re_oulst_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftReOulstMin"
                                                                     placeholder="${I18n.game_re_oulst_min}"></div>
                                        <label for="ftReOulstMax"
                                               class="col-sm-2 control-label">${I18n.game_re_oulst_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftReOulstMax"
                                                                     placeholder="${I18n.game_re_oulst_max}"></div>
                                    </div>

                                    <div style=" width:100%; text-align:left; margin-left:1px; margin-right:1px;">
                                        <hr class="hrLine" style="width:50px; height:1px;" color="#d2d6de"/>
                                        <span style="color:red; font-size: 18px;">今日</span>
                                        <hr class="hrLine" style="width:80%; height:1px;" color="#d2d6de"/>
                                    </div>

                                    <div class="form-group">
                                        <label for="ftRbFthtMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ftht_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbFthtMin"
                                                                     placeholder="${I18n.game_re_ftht_min}"></div>
                                        <label for="ftRbFthtMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ftht_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbFthtMax"
                                                                     placeholder="${I18n.game_re_ftht_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRbFthtlstMin"
                                               class="col-sm-2 control-label">${I18n.game_re_fthtlst_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbFthtlstMin"
                                                                     placeholder="${I18n.game_re_fthtlst_min}"></div>
                                        <label for="ftRbFthtlstMax"
                                               class="col-sm-2 control-label">${I18n.game_re_fthtlst_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbFthtlstMax"
                                                                     placeholder="${I18n.game_re_fthtlst_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRbAhMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ah_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbAhMin"
                                                                     placeholder="${I18n.game_re_ah_min}"></div>
                                        <label for="ftRbAhMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ah_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbAhMax"
                                                                     placeholder="${I18n.game_re_ah_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRbAhlstMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ahlst_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbAhlstMin"
                                                                     placeholder="${I18n.game_re_ahlst_min}"></div>
                                        <label for="ftRbAhlstMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ahlst_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbAhlstMax"
                                                                     placeholder="${I18n.game_re_ahlst_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRbOuMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ou_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbOuMin"
                                                                     placeholder="${I18n.game_re_ou_min}"></div>
                                        <label for="ftRbOuMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ou_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbOuMax"
                                                                     placeholder="${I18n.game_re_ou_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRbOulstMin"
                                               class="col-sm-2 control-label">${I18n.game_re_oulst_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbOulstMin"
                                                                     placeholder="${I18n.game_re_oulst_min}"></div>
                                        <label for="ftRbOulstMax"
                                               class="col-sm-2 control-label">${I18n.game_re_oulst_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbOulstMax"
                                                                     placeholder="${I18n.game_re_oulst_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRbOeMin"
                                               class="col-sm-2 control-label">${I18n.game_rb_oe_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbOeMin"
                                                                     placeholder="${I18n.game_rb_oe_min}"></div>
                                        <label for="ftRbOeMax"
                                               class="col-sm-2 control-label">${I18n.game_rb_oe_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbOeMax"
                                                                     placeholder="${I18n.game_rb_oe_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRbOelstMin"
                                               class="col-sm-2 control-label">${I18n.game_rb_oelst_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbOelstMin"
                                                                     placeholder="${I18n.game_rb_oelst_min}"></div>
                                        <label for="ftRbOelstMax"
                                               class="col-sm-2 control-label">${I18n.game_rb_oelst_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbOelstMax"
                                                                     placeholder="${I18n.game_rb_oelst_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRbCsMin"
                                               class="col-sm-2 control-label">${I18n.game_rb_cs_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbCsMin"
                                                                     placeholder="${I18n.game_rb_cs_min}"></div>
                                        <label for="ftRbCsMax"
                                               class="col-sm-2 control-label">${I18n.game_rb_cs_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbCsMax"
                                                                     placeholder="${I18n.game_rb_cs_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRbTgMin"
                                               class="col-sm-2 control-label">${I18n.game_rb_tg_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbTgMin"
                                                                     placeholder="${I18n.game_rb_tg_min}"></div>
                                        <label for="ftRbTgMax"
                                               class="col-sm-2 control-label">${I18n.game_rb_tg_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbTgMax"
                                                                     placeholder="${I18n.game_rb_tg_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRbTglstMin"
                                               class="col-sm-2 control-label">${I18n.game_rb_tglst_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbTglstMin"
                                                                     placeholder="${I18n.game_rb_tglst_min}"></div>
                                        <label for="ftRbTglstMax"
                                               class="col-sm-2 control-label">${I18n.game_rb_tglst_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbTglstMax"
                                                                     placeholder="${I18n.game_rb_tglst_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRbHfMin"
                                               class="col-sm-2 control-label">${I18n.game_rb_hf_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbHfMin"
                                                                     placeholder="${I18n.game_rb_hf_min}"></div>
                                        <label for="ftRbHfMax"
                                               class="col-sm-2 control-label">${I18n.game_rb_hf_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbHfMax"
                                                                     placeholder="${I18n.game_rb_hf_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRbFglgMin"
                                               class="col-sm-2 control-label">${I18n.game_rb_fglg_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbFglgMin"
                                                                     placeholder="${I18n.game_rb_fglg_min}"></div>
                                        <label for="ftRbFglgMax"
                                               class="col-sm-2 control-label">${I18n.game_rb_fglg_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbFglgMax"
                                                                     placeholder="${I18n.game_rb_fglg_max}"></div>
                                    </div>

                                    <div style=" width:100%; text-align:left; margin-left:1px; margin-right:1px;">
                                        <hr class="hrLine" style="width:50px; height:1px;" color="#d2d6de"/>
                                        <span style="color:red; font-size: 18px;">早盘</span>
                                        <hr class="hrLine" style="width:80%; height:1px;" color="#d2d6de"/>
                                    </div>

                                    <div class="form-group">
                                        <label for="ftRFthtMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ftht_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRFthtMin"
                                                                     placeholder="${I18n.game_re_ftht_min}"></div>
                                        <label for="ftRFthtMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ftht_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRFthtMax"
                                                                     placeholder="${I18n.game_re_ftht_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRFthtlstMin"
                                               class="col-sm-2 control-label">${I18n.game_re_fthtlst_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRFthtlstMin"
                                                                     placeholder="${I18n.game_re_fthtlst_min}"></div>
                                        <label for="ftRFthtlstMax"
                                               class="col-sm-2 control-label">${I18n.game_re_fthtlst_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRFthtlstMax"
                                                                     placeholder="${I18n.game_re_fthtlst_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRAhMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ah_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRAhMin"
                                                                     placeholder="${I18n.game_re_ah_min}"></div>
                                        <label for="ftRAhMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ah_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRAhMax"
                                                                     placeholder="${I18n.game_re_ah_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRAhlstMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ahlst_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRAhlstMin"
                                                                     placeholder="${I18n.game_re_ahlst_min}"></div>
                                        <label for="ftRAhlstMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ahlst_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRAhlstMax"
                                                                     placeholder="${I18n.game_re_ahlst_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftROuMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ou_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftROuMin"
                                                                     placeholder="${I18n.game_re_ou_min}"></div>
                                        <label for="ftROuMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ou_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftROuMax"
                                                                     placeholder="${I18n.game_re_ou_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftROulstMin"
                                               class="col-sm-2 control-label">${I18n.game_re_oulst_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftROulstMin"
                                                                     placeholder="${I18n.game_re_oulst_min}"></div>
                                        <label for="ftROulstMax"
                                               class="col-sm-2 control-label">${I18n.game_re_oulst_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftROulstMax"
                                                                     placeholder="${I18n.game_re_oulst_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftROeMin"
                                               class="col-sm-2 control-label">${I18n.game_rb_oe_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftROeMin"
                                                                     placeholder="${I18n.game_rb_oe_min}"></div>
                                        <label for="ftROeMax"
                                               class="col-sm-2 control-label">${I18n.game_rb_oe_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftROeMax"
                                                                     placeholder="${I18n.game_rb_oe_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftROelstMin"
                                               class="col-sm-2 control-label">${I18n.game_rb_oelst_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftROelstMin"
                                                                     placeholder="${I18n.game_rb_oelst_min}"></div>
                                        <label for="ftROelstMax"
                                               class="col-sm-2 control-label">${I18n.game_rb_oelst_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftROelstMax"
                                                                     placeholder="${I18n.game_rb_oelst_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRCsMin"
                                               class="col-sm-2 control-label">${I18n.game_rb_cs_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRCsMin"
                                                                     placeholder="${I18n.game_rb_cs_min}"></div>
                                        <label for="ftRCsMax"
                                               class="col-sm-2 control-label">${I18n.game_rb_cs_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRCsMax"
                                                                     placeholder="${I18n.game_rb_cs_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRTgMin"
                                               class="col-sm-2 control-label">${I18n.game_rb_tg_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRTgMin"
                                                                     placeholder="${I18n.game_rb_tg_min}"></div>
                                        <label for="ftRTgMax"
                                               class="col-sm-2 control-label">${I18n.game_rb_tg_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRTgMax"
                                                                     placeholder="${I18n.game_rb_tg_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRTglstMin"
                                               class="col-sm-2 control-label">${I18n.game_rb_tglst_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRTglstMin"
                                                                     placeholder="${I18n.game_rb_tglst_min}"></div>
                                        <label for="ftRTglstMax"
                                               class="col-sm-2 control-label">${I18n.game_rb_tglst_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRTglstMax"
                                                                     placeholder="${I18n.game_rb_tglst_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRHfMin"
                                               class="col-sm-2 control-label">${I18n.game_rb_hf_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRHfMin"
                                                                     placeholder="${I18n.game_rb_hf_min}"></div>
                                        <label for="ftRHfMax"
                                               class="col-sm-2 control-label">${I18n.game_rb_hf_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRHfMax"
                                                                     placeholder="${I18n.game_rb_hf_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRFglgMin"
                                               class="col-sm-2 control-label">${I18n.game_rb_fglg_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRFglgMin"
                                                                     placeholder="${I18n.game_rb_fglg_min}"></div>
                                        <label for="ftRFglgMax"
                                               class="col-sm-2 control-label">${I18n.game_rb_fglg_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRFglgMax"
                                                                     placeholder="${I18n.game_rb_fglg_max}"></div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-sm-5">
                            <div class="modal-header">
                                <h4 class="modal-title">${I18n.platform_limit_default}</h4>
                            </div>
                            <hr style="width:100%; height:1px;" color="#d2d6de"/>
                            <div class="modal-body" id="defaultFTModel">
                                <form class="form-horizontal form">
                                    <div class="form-group">
                                        <label for="ftOrMin" class="col-sm-2 control-label">${I18n.game_or_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftOrMin"
                                                                     placeholder="${I18n.game_or_min}"></div>
                                        <label for="ftOrMax" class="col-sm-2 control-label">${I18n.game_or_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftOrMax"
                                                                     placeholder="${I18n.game_or_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftP3Min" class="col-sm-2 control-label">${I18n.game_p3_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftP3Min"
                                                                     placeholder="${I18n.game_p3_min}"></div>
                                        <label for="ftP3Max" class="col-sm-2 control-label">${I18n.game_p3_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftP3Max"
                                                                     placeholder="${I18n.game_p3_max}"></div>
                                    </div>

                                    <div style=" width:100%; text-align:left; margin-left:1px; margin-right:1px;">
                                        <hr class="hrLine" style="width:50px; height:1px;" color="#d2d6de"/>
                                        <span style="color:red; font-size: 18px;">滚球</span>
                                        <hr class="hrLine" style="width:80%; height:1px;" color="#d2d6de"/>
                                    </div>

                                    <div class="form-group">
                                        <label for="ftReFthtMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ftht_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftReFthtMin"
                                                                     placeholder="${I18n.game_re_ftht_min}"></div>
                                        <label for="ftReFthtMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ftht_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftReFthtMax"
                                                                     placeholder="${I18n.game_re_ftht_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftReFthtlstMin"
                                               class="col-sm-2 control-label">${I18n.game_re_fthtlst_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftReFthtlstMin"
                                                                     placeholder="${I18n.game_re_fthtlst_min}"></div>
                                        <label for="ftReFthtlstMax"
                                               class="col-sm-2 control-label">${I18n.game_re_fthtlst_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftReFthtlstMax"
                                                                     placeholder="${I18n.game_re_fthtlst_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftReAhMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ah_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftReAhMin"
                                                                     placeholder="${I18n.game_re_ah_min}"></div>
                                        <label for="ftReAhMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ah_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftReAhMax"
                                                                     placeholder="${I18n.game_re_ah_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftReAhlstMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ahlst_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftReAhlstMin"
                                                                     placeholder="${I18n.game_re_ahlst_min}"></div>
                                        <label for="ftReAhlstMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ahlst_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftReAhlstMax"
                                                                     placeholder="${I18n.game_re_ahlst_max}"></div>
                                    </div>

                                    <div class="form-group">
                                        <label for="ftReOuMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ou_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftReOuMin"
                                                                     placeholder="${I18n.game_re_ou_min}"></div>
                                        <label for="ftReOuMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ou_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftReOuMax"
                                                                     placeholder="${I18n.game_re_ou_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftReOulstMin"
                                               class="col-sm-2 control-label">${I18n.game_re_oulst_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftReOulstMin"
                                                                     placeholder="${I18n.game_re_oulst_min}"></div>
                                        <label for="ftReOulstMax"
                                               class="col-sm-2 control-label">${I18n.game_re_oulst_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftReOulstMax"
                                                                     placeholder="${I18n.game_re_oulst_max}"></div>
                                    </div>

                                    <div style=" width:100%; text-align:left; margin-left:1px; margin-right:1px;">
                                        <hr class="hrLine" style="width:50px; height:1px;" color="#d2d6de"/>
                                        <span style="color:red; font-size: 18px;">今日</span>
                                        <hr class="hrLine" style="width:80%; height:1px;" color="#d2d6de"/>
                                    </div>

                                    <div class="form-group">
                                        <label for="ftRbFthtMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ftht_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbFthtMin"
                                                                     placeholder="${I18n.game_re_ftht_min}"></div>
                                        <label for="ftRbFthtMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ftht_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbFthtMax"
                                                                     placeholder="${I18n.game_re_ftht_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRbFthtlstMin"
                                               class="col-sm-2 control-label">${I18n.game_re_fthtlst_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbFthtlstMin"
                                                                     placeholder="${I18n.game_re_fthtlst_min}"></div>
                                        <label for="ftRbFthtlstMax"
                                               class="col-sm-2 control-label">${I18n.game_re_fthtlst_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbFthtlstMax"
                                                                     placeholder="${I18n.game_re_fthtlst_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRbAhMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ah_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbAhMin"
                                                                     placeholder="${I18n.game_re_ah_min}"></div>
                                        <label for="ftRbAhMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ah_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbAhMax"
                                                                     placeholder="${I18n.game_re_ah_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRbAhlstMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ahlst_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbAhlstMin"
                                                                     placeholder="${I18n.game_re_ahlst_min}"></div>
                                        <label for="ftRbAhlstMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ahlst_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbAhlstMax"
                                                                     placeholder="${I18n.game_re_ahlst_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRbOuMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ou_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbOuMin"
                                                                     placeholder="${I18n.game_re_ou_min}"></div>
                                        <label for="ftRbOuMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ou_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbOuMax"
                                                                     placeholder="${I18n.game_re_ou_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRbOulstMin"
                                               class="col-sm-2 control-label">${I18n.game_re_oulst_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbOulstMin"
                                                                     placeholder="${I18n.game_re_oulst_min}"></div>
                                        <label for="ftRbOulstMax"
                                               class="col-sm-2 control-label">${I18n.game_re_oulst_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbOulstMax"
                                                                     placeholder="${I18n.game_re_oulst_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRbOeMin"
                                               class="col-sm-2 control-label">${I18n.game_rb_oe_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbOeMin"
                                                                     placeholder="${I18n.game_rb_oe_min}"></div>
                                        <label for="ftRbOeMax"
                                               class="col-sm-2 control-label">${I18n.game_rb_oe_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbOeMax"
                                                                     placeholder="${I18n.game_rb_oe_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRbOelstMin"
                                               class="col-sm-2 control-label">${I18n.game_rb_oelst_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbOelstMin"
                                                                     placeholder="${I18n.game_rb_oelst_min}"></div>
                                        <label for="ftRbOelstMax"
                                               class="col-sm-2 control-label">${I18n.game_rb_oelst_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbOelstMax"
                                                                     placeholder="${I18n.game_rb_oelst_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRbCsMin"
                                               class="col-sm-2 control-label">${I18n.game_rb_cs_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbCsMin"
                                                                     placeholder="${I18n.game_rb_cs_min}"></div>
                                        <label for="ftRbCsMax"
                                               class="col-sm-2 control-label">${I18n.game_rb_cs_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbCsMax"
                                                                     placeholder="${I18n.game_rb_cs_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRbTgMin"
                                               class="col-sm-2 control-label">${I18n.game_rb_tg_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbTgMin"
                                                                     placeholder="${I18n.game_rb_tg_min}"></div>
                                        <label for="ftRbTgMax"
                                               class="col-sm-2 control-label">${I18n.game_rb_tg_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbTgMax"
                                                                     placeholder="${I18n.game_rb_tg_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRbTglstMin"
                                               class="col-sm-2 control-label">${I18n.game_rb_tglst_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbTglstMin"
                                                                     placeholder="${I18n.game_rb_tglst_min}"></div>
                                        <label for="ftRbTglstMax"
                                               class="col-sm-2 control-label">${I18n.game_rb_tglst_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbTglstMax"
                                                                     placeholder="${I18n.game_rb_tglst_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRbHfMin"
                                               class="col-sm-2 control-label">${I18n.game_rb_hf_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbHfMin"
                                                                     placeholder="${I18n.game_rb_hf_min}"></div>
                                        <label for="ftRbHfMax"
                                               class="col-sm-2 control-label">${I18n.game_rb_hf_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbHfMax"
                                                                     placeholder="${I18n.game_rb_hf_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRbFglgMin"
                                               class="col-sm-2 control-label">${I18n.game_rb_fglg_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbFglgMin"
                                                                     placeholder="${I18n.game_rb_fglg_min}"></div>
                                        <label for="ftRbFglgMax"
                                               class="col-sm-2 control-label">${I18n.game_rb_fglg_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRbFglgMax"
                                                                     placeholder="${I18n.game_rb_fglg_max}"></div>
                                    </div>

                                    <div style=" width:100%; text-align:left; margin-left:1px; margin-right:1px;">
                                        <hr class="hrLine" style="width:50px; height:1px;" color="#d2d6de"/>
                                        <span style="color:red; font-size: 18px;">早盘</span>
                                        <hr class="hrLine" style="width:80%; height:1px;" color="#d2d6de"/>
                                    </div>

                                    <div class="form-group">
                                        <label for="ftRFthtMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ftht_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRFthtMin"
                                                                     placeholder="${I18n.game_re_ftht_min}"></div>
                                        <label for="ftRFthtMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ftht_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRFthtMax"
                                                                     placeholder="${I18n.game_re_ftht_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRFthtlstMin"
                                               class="col-sm-2 control-label">${I18n.game_re_fthtlst_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRFthtlstMin"
                                                                     placeholder="${I18n.game_re_fthtlst_min}"></div>
                                        <label for="ftRFthtlstMax"
                                               class="col-sm-2 control-label">${I18n.game_re_fthtlst_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRFthtlstMax"
                                                                     placeholder="${I18n.game_re_fthtlst_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRAhMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ah_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRAhMin"
                                                                     placeholder="${I18n.game_re_ah_min}"></div>
                                        <label for="ftRAhMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ah_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRAhMax"
                                                                     placeholder="${I18n.game_re_ah_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRAhlstMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ahlst_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRAhlstMin"
                                                                     placeholder="${I18n.game_re_ahlst_min}"></div>
                                        <label for="ftRAhlstMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ahlst_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRAhlstMax"
                                                                     placeholder="${I18n.game_re_ahlst_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftROuMin"
                                               class="col-sm-2 control-label">${I18n.game_re_ou_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftROuMin"
                                                                     placeholder="${I18n.game_re_ou_min}"></div>
                                        <label for="ftROuMax"
                                               class="col-sm-2 control-label">${I18n.game_re_ou_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftROuMax"
                                                                     placeholder="${I18n.game_re_ou_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftROulstMin"
                                               class="col-sm-2 control-label">${I18n.game_re_oulst_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftROulstMin"
                                                                     placeholder="${I18n.game_re_oulst_min}"></div>
                                        <label for="ftROulstMax"
                                               class="col-sm-2 control-label">${I18n.game_re_oulst_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftROulstMax"
                                                                     placeholder="${I18n.game_re_oulst_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftROeMin"
                                               class="col-sm-2 control-label">${I18n.game_rb_oe_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftROeMin"
                                                                     placeholder="${I18n.game_rb_oe_min}"></div>
                                        <label for="ftROeMax"
                                               class="col-sm-2 control-label">${I18n.game_rb_oe_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftROeMax"
                                                                     placeholder="${I18n.game_rb_oe_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftROelstMin"
                                               class="col-sm-2 control-label">${I18n.game_rb_oelst_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftROelstMin"
                                                                     placeholder="${I18n.game_rb_oelst_min}"></div>
                                        <label for="ftROelstMax"
                                               class="col-sm-2 control-label">${I18n.game_rb_oelst_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftROelstMax"
                                                                     placeholder="${I18n.game_rb_oelst_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRCsMin"
                                               class="col-sm-2 control-label">${I18n.game_rb_cs_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRCsMin"
                                                                     placeholder="${I18n.game_rb_cs_min}"></div>
                                        <label for="ftRCsMax"
                                               class="col-sm-2 control-label">${I18n.game_rb_cs_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRCsMax"
                                                                     placeholder="${I18n.game_rb_cs_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRTgMin"
                                               class="col-sm-2 control-label">${I18n.game_rb_tg_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRTgMin"
                                                                     placeholder="${I18n.game_rb_tg_min}"></div>
                                        <label for="ftRTgMax"
                                               class="col-sm-2 control-label">${I18n.game_rb_tg_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRTgMax"
                                                                     placeholder="${I18n.game_rb_tg_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRTglstMin"
                                               class="col-sm-2 control-label">${I18n.game_rb_tglst_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRTglstMin"
                                                                     placeholder="${I18n.game_rb_tglst_min}"></div>
                                        <label for="ftRTglstMax"
                                               class="col-sm-2 control-label">${I18n.game_rb_tglst_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRTglstMax"
                                                                     placeholder="${I18n.game_rb_tglst_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRHfMin"
                                               class="col-sm-2 control-label">${I18n.game_rb_hf_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRHfMin"
                                                                     placeholder="${I18n.game_rb_hf_min}"></div>
                                        <label for="ftRHfMax"
                                               class="col-sm-2 control-label">${I18n.game_rb_hf_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRHfMax"
                                                                     placeholder="${I18n.game_rb_hf_max}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ftRFglgMin"
                                               class="col-sm-2 control-label">${I18n.game_rb_fglg_min}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRFglgMin"
                                                                     placeholder="${I18n.game_rb_fglg_min}"></div>
                                        <label for="ftRFglgMax"
                                               class="col-sm-2 control-label">${I18n.game_rb_fglg_max}</label>
                                        <div class="col-sm-4"><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="form-control" name="ftRFglgMax"
                                                                     placeholder="${I18n.game_rb_fglg_max}"></div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <hr style="width:100%; height:1px;" color="#d2d6de"/>
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-6">
                                <button  class="btn btn-primary"  id="submitFTConfig">${I18n.submit_button}</button>
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
<script src="${request.contextPath}/static/js/constant.js"></script>
<script src="${request.contextPath}/static/js/game/platformlimit.js"></script>
</body>
</html>
