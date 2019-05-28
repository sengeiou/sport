$(function () {

    // logout
    $("#logoutBtn").click(function () {
        layer.confirm(I18n.logout_confirm, {
            icon: 3,
            title: I18n.system_tips,
            btn: [I18n.system_ok, I18n.system_cancel]
        }, function (index) {
            layer.close(index);
            $.post(base_url + "/logout", function (data, status) {
                if (data.result === 0) {
                    layer.msg(I18n.logout_success);
                    setTimeout(function () {
                        window.location.href = base_url + "/";
                    }, 500);
                } else {
                    layer.open({
                        title: I18n.system_tips,
                        btn: [I18n.system_ok],
                        content: (data.msg || I18n.logout_fail),
                        icon: '2'
                    });
                }
            });
        });
    });

    //密码重置
    $("#resetPswBtn").click(function () {
        $("#resetPwdModal .form")[0].reset();
        $('#resetPwdModal').modal({backdrop: false, keyboard: false}).modal('show');
    });

    var resetPwdModalValidate = $("#resetPwdModal .form").validate({
        errorElement: 'span',
        errorClass: 'help-block',
        focusInvalid: true,
        rules: {
            loginOldPassword: {
                required: true
            },
            loginNewPassword: {
                required: true,
                minlength: 6,
                maxlength: 18,
                equalTo: "#loginConfirmPassword"
            },
            loginConfirmPassword: {
                required: true,
                minlength: 6,
                maxlength: 18,
                equalTo: "#loginNewPassword"
            }
        },
        messages: {
            loginOldPassword: {
                required: I18n.system_please_input + I18n.login_old_pwd
            },
            loginNewPassword: {
                required: I18n.system_login_new_pwd,
                equalTo: I18n.ADMIN_PASSWORD_NOT_SAME
            },
            loginConfirmPassword: {
                required: I18n.login_password_confirm,
                equalTo: I18n.ADMIN_PASSWORD_NOT_SAME
            }
        },
        highlight: function (element) {
            $(element).closest('.form-group').addClass('has-error');
        },
        success: function (label) {
            label.closest('.form-group').removeClass('has-error');
            label.remove();
        },
        errorPlacement: function (error, element) {
            element.parent('div').append(error);
        },
        submitHandler: function (form) {
            var param = getFormDataForJson($("#resetPwdModal .form"));
            $.post(base_url + "/resetPwd", param, function (data, status) {
                if (data.result === 0) {
                    $('#resetPwdModal').modal('hide');
                    layer.open({
                        title: I18n.system_tips,
                        btn: [I18n.system_ok],
                        content: I18n.system_ope_success,
                        icon: '1'
                    });
                } else {
                    layer.open({
                        title: I18n.system_tips,
                        btn: [I18n.system_ok],
                        content: (data.error_msg || I18n.system_ope_failed),
                        icon: '2'
                    });
                }
            });
        }
    });

    $("#resetPwdModal").on('hide.bs.modal', function () {
        $("#resetPwdModal .form")[0].reset();
        resetPwdModalValidate.resetForm();
        $("#resetPwdModal .form .form-group").removeClass("has-error");
        $(".remote_panel").show();
    });

    // slideToTop
    var slideToTop = $("<div />");
    slideToTop.html('<i class="fa fa-chevron-up"></i>');
    slideToTop.css({
        position: 'fixed',
        bottom: '20px',
        right: '25px',
        width: '40px',
        height: '40px',
        color: '#eee',
        'font-size': '',
        'line-height': '40px',
        'text-align': 'center',
        'background-color': '#222d32',
        cursor: 'pointer',
        'border-radius': '5px',
        'z-index': '99999',
        opacity: '.7',
        'display': 'none'
    });
    slideToTop.on('mouseenter', function () {
        $(this).css('opacity', '1');
    });
    slideToTop.on('mouseout', function () {
        $(this).css('opacity', '.7');
    });
    $('.wrapper').append(slideToTop);
    $(window).scroll(function () {
        if ($(window).scrollTop() >= 150) {
            if (!$(slideToTop).is(':visible')) {
                $(slideToTop).fadeIn(500);
            }
        } else {
            $(slideToTop).fadeOut(500);
        }
    });
    $(slideToTop).click(function () {
        $("html,body").animate({
            scrollTop: 0
        }, 100);
    });

    // left menu status v: js + server + cookie
    $('.sidebar-toggle').click(function () {
        var sport_manage_settings = $.cookie('sport_manage_settings');	// on=open，off=close
        if ('off' == sport_manage_settings) {
            sport_manage_settings = 'on';
        } else {
            sport_manage_settings = 'off';
        }
        $.cookie('sport_manage_settings', sport_manage_settings, {expires: 7});	//$.cookie('the_cookie', '', { expires: -1 });
    });

    $.ajaxSetup({
        contentType: "application/json",
        success: function (data, status, xhr) {
            var code = xhr.getResponseHeader("SESSION_TIME_OUT");
            console.info(code);
        },
        error: function (XMLHttpRequest, status, e) {
            if (XMLHttpRequest.status == 403) {
                alert('您没有权限访问此资源或进行此操作');
                return false;
            }
        },
        complete: function (XMLHttpRequest, status) {
            var sessionStatus = XMLHttpRequest.getResponseHeader("sessionStatus");
            var noPerm = XMLHttpRequest.getResponseHeader("noPermission");
            if (sessionStatus === 'timeout') {
                window.location.href = base_url;
            }
            if (noPerm === 'yes') {
                window.location.href = base_url + "/noPerm";
            }
        }
    });

    $(function () {
        changeCollapse($("#collapseListGroup1"));
        changeCollapse($("#collapseListGroup2"));
        changeCollapse($("#collapseListGroup3"));
    });

    function changeCollapse($el) {
        if (!$el) return;
        var actives = $el.find(".active");
        if (actives.length === 0) {
            $el.parent().find(".glyphicon-chevron-up").removeClass("glyphicon-chevron-up").addClass("glyphicon-chevron-down");
            $el.collapse('hide');
        } else {
            $el.parent().find(".glyphicon-chevron-down").removeClass("glyphicon-chevron-down").addClass("glyphicon-chevron-up");
            $el.collapse('show');
        }
    }

});