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
    <@netCommon.commonLeft "enumPage" />
    <div class="content-wrapper">
        <section class="content">
            <div class="row" id="searchForm">
                <div class="col-xs-2">
                    <div class="input-group">
                        <span class="input-group-addon">${I18n.sport_enum_name}</span>
                        <input type="text" class="form-control" id="name" name="name" autocomplete="off">
                    </div>
                </div>
                <div class="col-xs-2">
                    <div class="input-group">
                        <span class="input-group-addon">${I18n.spoort_enum_code}</span>
                        <input type="text" class="form-control" id="code" name="code" autocomplete="off">
                    </div>
                </div>
                <div class="col-xs-2">
                    <div class="input-group">
                        <span class="input-group-addon">${I18n.sport_enum_type}</span>
                        <select class="form-control" id="typeCode" name="typeCode">
                            <option value="">全部</option>
                            <#list types as type>
                                <option value="${type.code}">${type.name}</option>
                            </#list>
                        </select>
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
                                    <th >${I18n.ADMIN_ID}</th>
                                    <th>${I18n.sport_enum_name}</th>
                                    <th>${I18n.spoort_enum_code}</th>
                                    <th>${I18n.sport_enum_type}</th>
                                    <th>${I18n.sport_enum_value}</th>
                                    <th>${I18n.sport_enum_order}</th>
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
                <h4 class="modal-title">${I18n.enum_add}</h4>
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
                    <div class="form-group">
                        <label for="memLevel" class="col-sm-2 control-label">${I18n.sport_enum_type}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4">
                            <select class="form-control" name="typeCode">
                                <#list types as type>
                                    <option value="${type.code}">${type.name}</option>
                                </#list>
                            </select>
                        </div>
                        <label for="value" class="col-sm-2 control-label">${I18n.sport_enum_value}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="value"
                                                     placeholder="${I18n.sport_enum_value}"></div>
                    </div>
                    <div class="form-group">
                        <label for="sort" class="col-sm-2 control-label">${I18n.sport_enum_order}<font
                                    color="red">*</font></label>
                        <div class="col-sm-6"><input type="text" class="form-control" name="sort" autocomplete="off"
                                                     placeholder="${I18n.sport_enum_order}"></div>
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
                <h4 class="modal-title">${I18n.enum_update}</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal form" role="form">
                    <input type="hidden" name="id">
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
                    <div class="form-group">
                        <label for="memLevel" class="col-sm-2 control-label">${I18n.sport_enum_type}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4">
                            <select class="form-control" name="typeCode">
                                <#list types as type>
                                    <option value="${type.code}">${type.name}</option>
                                </#list>
                            </select>
                        </div>
                        <label for="value" class="col-sm-2 control-label">${I18n.sport_enum_value}<font
                                    color="red">*</font></label>
                        <div class="col-sm-4"><input type="text" class="form-control" name="value"
                                                     placeholder="${I18n.sport_enum_value}"></div>
                    </div>
                    <div class="form-group">
                        <label for="sort" class="col-sm-2 control-label">${I18n.sport_enum_order}<font
                                    color="red">*</font></label>
                        <div class="col-sm-6"><input type="text" class="form-control" name="sort" autocomplete="off"
                                                     placeholder="${I18n.sport_enum_order}"></div>
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
<script src="${request.contextPath}/static/js/system/enum.js"></script>
</body>
</html>
