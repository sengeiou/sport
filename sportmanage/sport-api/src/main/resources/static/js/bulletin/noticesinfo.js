$(function() {
	// init date tables
	var userTable = $("#user_list").dataTable({
		"deferRender": true,
		"processing" : true, 
	    "serverSide": true,
		"scrollCollapse":true,
		"ajax": {
			url: base_url + "/bulletin/noticesList",
			type:"post",
	        data : function ( d ) {
                return buildParams("#searchForm :input", d);
            }
	    },
	    "searching": false,
	    "ordering": false,
	    "columns": [
	                {
	                	"data": 'id',
						"bSortable": false,
						"visible" : false
					},
	                {
	                	"data": 'title',
						"visible" : true
					},
					{
						"data": 'context',
						"visible" : true,
                        "render": function ( data, type, row ) {
                            //0-为登陆弹框1-支付中心弹框2-消息中心展示
                            if(data!=null&&data.length>32){
                            	return"<span title='"+data+"'>"+ data.substr(0,32)+"...<span/>"
							}
							return data;
                        }
					},
					{
						"data": 'alert',
						"visible" : true,
                        "render": function ( data, type, row ) {
							//0-为登陆弹框1-支付中心弹框2-消息中心展示
							var str="";
							if(data==0){
								str="登陆弹框";
							}else if(data==1){
								str="支付中心弹框";
							}else{
								str="消息中心展示";
							}
							return str;
						}

					},
					{
						"data": 'type',
						"visible" : true,
						"render": function ( data, type, row ) {
							//1=会员 2=代理
							var str="";
							if(data==1){
								str="会员";
							}else{
								str="代理";
							}
							return str;
						}

					},
					{
						"data": 'serverAdmin',
						"visible" : true
					},
					{
						"data": 'addDate',
						"visible" : true
					},
	                {
						"data": I18n.system_opt ,
	                	"render": function ( data, type, row ) {
	                		return function(){
                                tableData['key'+row.id] = row;
								var html = '<p id="'+ row.id +'" >'+
									'<button class="btn btn-warning btn-xs update" type="button">'+ I18n.system_opt_edit +'</button>  '+
									'<button class="btn btn-danger btn-xs notice_operate" _type="notice_del" type="button">'+ I18n.system_opt_del +'</button>  '+
									'</p>';
	                			return html;
							};
	                	}
	                }
	            ],
			"language" : language_table
		});
    //表格超出宽度鼠标悬停显示td内容
    function paramsMatter(value,row,index, field) {
        var span=document.createElement("span");
        span.setAttribute("title",value);
        span.innerHTML = value;
        return span.outerHTML;
    }
    //td宽度以及内容超过宽度隐藏
    function formatTableUnit(value, row, index) {
        return {
            css: {
				"white-space": "nowrap",
				"text-overflow": "ellipsis",
				"overflow": "hidden",
				"max-width":"150px"
    			}
    		}
    }
    var tableData = {};
	$('#searchBtn').on('click', function(){
		userTable.fnDraw();
	});

	// add form
	$(".add").click(function(){
		$("#addModal .form")[0].reset();
		$('#addModal').modal({backdrop: false, keyboard: false}).modal('show');
	});

	var addModalValidate = $("#addModal .form").validate({
		errorElement : 'span',
		errorClass : 'help-block',
		focusInvalid : true,
		rules : {
			title : {
				required : true,
				maxlength: 18
			},
			content : {
				required : true
			},
			serverAdmin : {
				required : true
			}
		},
		messages : {
            title : {
				required : I18n.system_please_input
			},
            content : {
				required : I18n.system_please_input
			},
			serverAdmin : {
				required : I18n.system_please_input
			},
			type:{
				required: I18n.system_please_choose

			},
			alert:{
				required: I18n.system_please_choose
			}
		},
		highlight : function(element) {
			$(element).closest('.form-group').addClass('has-error');
		},
		success : function(label) {
			label.closest('.form-group').removeClass('has-error');
			label.remove();
		},
		errorPlacement : function(error, element) {
			element.parent('div').append(error);
		},
		submitHandler : function(form) {

			var param = getFormDataForJson($("#addModal .form"));
			$.post(base_url + "/bulletin/addNotices", param, function(data, status) {
				if (data.result === 0) {
					$('#addModal').modal('hide');
					layer.open({
						title: I18n.system_tips ,
						btn: [ I18n.system_ok ],
						content: I18n.system_add_suc ,
						icon: '1',
						end: function(layero, index){
							userTable.fnDraw();
						}
					});
				} else {
					layer.open({
						title: I18n.system_tips,
						btn: [ I18n.system_ok ],
						content: (data.error_msg || I18n.system_add_fail),
						icon: '2'
					});
				}
			});
		}
	});

	$("#addModal").on('hide.bs.modal', function () {
		$("#addModal .form")[0].reset();
		addModalValidate.resetForm();
		$("#addModal .form .form-group").removeClass("has-error");
		$(".remote_panel").show();
		$("#addModal .form input[name='userName']").removeAttr("readonly");
	});



	$("#pswSelect").click(function(){
		if($(this).is(':checked')){
			$("#passwordReset").show();
		}else{
			$("#passwordReset").hide();
		}
	});

	$("#statusSelect").click(function(){
		if($(this).is(':checked')){
			$("#statusReset").show();
		}else{
			$("#statusReset").hide();
		}
	});


	// update form
	$("#user_list").on('click', '.update',function() {

		$("#passwordReset").hide();
		$("#statusReset").hide();

		var id = $(this).parent('p').attr("id");
		var row = tableData['key'+id];

		$("#updateModal .form [name='id']").val( row.id );
		$("#updateModal .form [name='context']").val( row.context );
		$("#updateModal .form [name='title']").val( row.title );
		$("#updateModal .form [name='type'] option[value='"+ row.type +"']").prop('selected', true);
        $("#updateModal .form [name='alert'] option[value='"+ row.alert +"']").prop('selected', true);
		$("#updateModal .form [name='serverAdmin']").val( row.serverAdmin );
		$('#updateModal').modal({backdrop: false, keyboard: false}).modal('show');
	});
	var updateModalValidate = $("#updateModal .form").validate({
		errorElement : 'span',
		errorClass : 'help-block',
		focusInvalid : true,

        rules : {
            title : {
                required : true,
                maxlength: 18
            },
            content : {
                required : true
            },
            serverAdmin : {
                required : true
            }
        },
        messages : {
            title : {
                required : I18n.system_please_input
            },
            content : {
                required : I18n.system_please_input
            },
            serverAdmin : {
                required : I18n.system_please_input
            },
            type:{
                required: I18n.system_please_choose

            },
            alert:{
                required: I18n.system_please_choose
            }
        },
		highlight : function(element) {
			$(element).closest('.form-group').addClass('has-error');
		},
		success : function(label) {
			label.closest('.form-group').removeClass('has-error');
			label.remove();
		},
		errorPlacement : function(error, element) {
			element.parent('div').append(error);
		},
		submitHandler : function(form) {

			var param = getFormDataForObj($("#updateModal .form"));
			$.post(base_url + "/bulletin/updateNotices", JSON.stringify(param), function(data, status) {
				if (data.result === 0) {
					$('#updateModal').modal('hide');
					layer.open({
						title: I18n.system_tips,
						btn: [ I18n.system_ok ],
						content: I18n.system_update_suc,
						icon: '1',
						end: function(layero, index){
							userTable.fnDraw();
						}
					});
				} else {
					layer.open({
						title: I18n.system_tips ,
						btn: [ I18n.system_ok ],
						content: (data.error_msg || I18n.system_update_fail ),
						icon: '2'
					});
				}
			});
		}
	});
	$("#updateModal").on('hide.bs.modal', function () {
		$("#updateModal .form")[0].reset()
	});


	// delete form
	$("#user_list").on('click', '.notice_operate',function() {
		var typeName;
		var url=base_url + "/bulletin/deleteNotices";
		var id = $(this).parent('p').attr("id");
        url+="/"+id;
		layer.confirm( I18n.system_ok + I18n.system_opt_del + '?', {
			icon: 3,
			title: I18n.system_tips ,
			btn: [ I18n.system_ok, I18n.system_cancel ]
		}, function(index){
			layer.close(index);
			$.ajax({
				type : 'POST',
				url : url,
				success : function(data){
                    if ( data.result== 0) {
                        layer.open({
                            title: I18n.system_tips,
                            btn: [ I18n.system_ok ],
                            content: I18n.system_opt_del + I18n.system_success ,
                            icon: '1',
                            end: function(layero, index){
                                userTable.fnDraw(false);
                            }
                        });
                    } else {
                        layer.open({
                            title: I18n.system_tips,
                            btn: [ I18n.system_ok ],
                            content: (data.error_msg || I18n.system_fail ),
                            icon: '2'
                        });
                    }
				},
			});
		});
	});


});


