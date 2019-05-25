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
    <@netCommon.commonLeft "enumTypePage" />
    <div class="content-wrapper">
        <section class="content">
            <div class="row" id="searchForm">
                <div class="col-xs-2">
                    <div class="input-group">
                        <span class="input-group-addon">${I18n.enum_type_name}</span>
                        <input type="text" class="form-control" id="name" name="name" autocomplete="off">
                    </div>
                </div>
                <div class="col-xs-2">
                    <div class="input-group">
                        <span class="input-group-addon">${I18n.enum_type_code}</span>
                        <input type="text" class="form-control" id="code" name="code" autocomplete="off">
                    </div>
                </div>
                <div class="col-xs-1">
                    <button class="btn btn-block btn-info" id="searchBtn">${I18n.system_search}</button>
                </div>
                <div class="col-xs-1">
                    <button class="btn btn-block btn-success add" type="button">${I18n.common_add}</button>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-body">
                            <table id="enum_level" class="table table-bordered table-striped" width="100%">
                                <thead>
                                <tr>
                                    <th>${I18n.enum_type_name}</th>
                                    <th>${I18n.enum_type_code}</th>
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
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" style="margin-top: 25%;">
            <div class="modal-header">
                <h4 class="modal-title">${I18n.enum_type_add}</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal form" role="form">
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">${I18n.sport_enum_name}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="name"
                                                     placeholder="${I18n.sport_enum_name}"></div>
                        <label for="code" class="col-sm-2 control-label">${I18n.spoort_enum_code}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="code"
                                                     placeholder="${I18n.spoort_enum_code}"></div>
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

<!-- 更新.模态框 -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" style="margin-top: 25%;">
            <div class="modal-header">
                <h4 class="modal-title">${I18n.enum_type_update}</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal form" role="form">
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">${I18n.sport_enum_name}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="name"
                                                     placeholder="${I18n.sport_enum_name}" readonly></div>
                        <label for="code" class="col-sm-2 control-label">${I18n.spoort_enum_code}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="code"
                                                     placeholder="${I18n.spoort_enum_code}"></div>
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

<@netCommon.commonScript />
<script src="${request.contextPath}/static/js/constant.js"></script>
<script src="${request.contextPath}/static/js/system/enumtype.js"></script>
</body>
</html>
