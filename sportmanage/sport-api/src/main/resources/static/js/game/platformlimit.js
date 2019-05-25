$(function () {

    $('#platformTab li:eq(0) a').tab('show');

    //篮球平台限额
    var bkConfigPlatform;
    //篮球默认限额
    var bkConfigDefault;
    //足球平台限额
    var ftConfigPlatform;
    //足球默认限额
    var ftConfigDefault;

    initBkConfigs();

    // 初始化篮球限额平台
    function initBkConfigs() {
        $.ajax({
            type: 'POST',
            url: base_url + "/limit/bkConfigs",
            async: false,
            dataType: "json",
            success: function (res) {
                var resObjs = res.data;
                $.each(resObjs, function (idx, obj) {
                    if (obj.serverAdmin.toString() === '1') {
                        bkConfigPlatform = obj;
                        if (!!obj) {
                            $("#platformBKModel input[type=text]").each(function () {
                                    var name = $(this).attr('name');
                                    $(this).attr("value", bkConfigPlatform[name]);
                                }
                            );
                        }
                    } else {
                        bkConfigDefault = obj;
                        if (!!obj) {
                            $("#defaultBKModel input[type=text]").each(function () {
                                    var name = $(this).attr('name');
                                    $(this).attr("value", bkConfigDefault[name]);
                                }
                            );
                        }
                    }
                })
            }
        });
    }

    function initFTConfigs() {
        $.ajax({
            type: 'POST',
            url: base_url + "/limit/ftConfigs",
            async: false,
            dataType: "json",
            success: function (res) {
                var resObjs = res.data;
                $.each(resObjs, function (idx, obj) {
                    if (obj.serverAdmin.toString() === '1') {
                        ftConfigPlatform = obj;
                        if (!!obj) {
                            $("#platformFTModel input[type=text]").each(function () {
                                    var name = $(this).attr('name');
                                    $(this).attr("value", ftConfigPlatform[name]);
                                }
                            );
                        }
                    } else {
                        ftConfigDefault = obj;
                        if (!!obj) {
                            $("#defaultFTModel input[type=text]").each(function () {
                                    var name = $(this).attr('name');
                                    $(this).attr("value", ftConfigDefault[name]);
                                }
                            );
                        }
                    }
                })
            }
        });
    }

    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        var activeTab = $(e.target).text();
        if (activeTab === '篮球') {
            initBkConfigs();
        } else {
            initFTConfigs();
        }
    });

    var bkConfigParam;
    var ftConfigParam;

    //获取篮球平台限额
    function initBKConfigParam() {
        $("#platformBKModel input[type=text]").each(function () {
            var name = $(this).attr('name');
            var val = $(this).val();
            if (!val) {
                bkConfigParam = '';
                return;
            } else {
                bkConfigParam[name] = val;
            }
        });
        if (!bkConfigParam) {
            return;
        }
        $("#defaultBKModel input[type=text]").each(function () {
            var name = $(this).attr('name') + 'De';
            var val = $(this).val();
            if (!val) {
                bkConfigParam = '';
                return;
            } else {
                bkConfigParam[name] = val;
            }
        });
    }



    //获取足球平台限额
    function initFTConfigParam() {
        $("#platformFTModel input[type=text]").each(function () {
            var name = $(this).attr('name');
            var val = $(this).val();
            if (!val) {
                ftConfigParam = '';
                return;
            } else {
                ftConfigParam[name] = val;
            }
        });
        if (!ftConfigParam) {
            return;
        }
        $("#defaultFTModel input[type=text]").each(function () {
            var name = $(this).attr('name') + 'De';
            var val = $(this).val();
            if (!val) {
                ftConfigParam = '';
                return;
            } else {
                ftConfigParam[name] = val;
            }
        });
    }

    //篮球平台限额确认提交
    $("#submitBkConfig").on('click', function () {
        bkConfigParam = {};
        initBKConfigParam();
        if (!bkConfigParam) {
            showWarnMessage('输入框不能为空');
            return;
        }
        $.post(base_url + "/limit/opeBKConfig", JSON.stringify(bkConfigParam), function (data, status) {
            if (data.result === 0) {
                layer.open({
                    title: I18n.system_tips,
                    btn: [I18n.system_ok],
                    content: I18n.system_ope_success,
                    icon: '1',
                    end: function (layero, index) {
                        initBkConfigs();
                    }
                });
            } else {
                showFailMessage(I18n.system_ope_failed);
            }
        });
    });

    //足球平台限额确认提交
    $("#submitFTConfig").on('click', function () {
        ftConfigParam = {};
        initFTConfigParam();
        if (!ftConfigParam) {
            showWarnMessage('输入框不能为空');
            return;
        }
        $.post(base_url + "/limit/opeFTConfig", JSON.stringify(ftConfigParam), function (data, status) {
            if (data.result === 0) {
                layer.open({
                    title: I18n.system_tips,
                    btn: [I18n.system_ok],
                    content: I18n.system_ope_success,
                    icon: '1',
                    end: function (layero, index) {
                        initFTConfigs();
                    }
                });
            } else {
                showFailMessage(I18n.system_ope_failed);
            }
        });
    })

});
