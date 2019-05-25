$(function() {
	// init date tables
    $.ajax({
// get请求地址  
        url: base_url + "/bankData/getLevelData",
        dataType: "json",
        success: function (ret) {
        	if(ret.result==0){
                var data=ret.data;
                var html="";
                for (var i = 0; i < data.length; i++) {
                   html+="<option value='"+data[i]['key']+"'>" + data[i].value + "</option>";
                }
                $('.levelId').html(html); 
                $('.levelId').selectpicker('refresh');
                $('.levelId').selectpicker('render');
			}else{
                layer.open({
                    title: I18n.system_tips,
                    btn: [ I18n.system_ok ],
                    content: (ret.error_msg || I18n.system_add_fail),
                    icon: '2'
                });
			}

        }
    });
    $.ajax({
// get请求地址  
        url: base_url + "/bankData/getPayTypeData",
        dataType: "json",
        success: function (ret) {
            if(ret.result==0) {
                var data = ret.data;
                var html="";
                for (var i = 0; i < data.length; i++) {
                  html+= "<option value='"+data[i]['key']+"'>" + data[i].value + "</option>";
                }
                $('.payType').html(html);
                $('.payType').selectpicker('refresh');
                $('.payType').selectpicker('render');
            }else{
                layer.open({
                    title: I18n.system_tips,
                    btn: [ I18n.system_ok ],
                    content: (ret.error_msg || I18n.system_add_fail),
                    icon: '2'
                });
			}
        }
    });
	var userTable = $("#user_list").dataTable({
		"deferRender": true,
		"processing" : true, 
	    "serverSide": true,
		"scrollCollapse":true,
		"ajax": {
			url: base_url + "/bankData/bankDataList",
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
						"data": 'payTypeName',
						"visible" : true
					},
	                {
	                	"data": 'bank',
						"visible" : true
					},
					{
						"data": 'bankName',
						"visible" : true
					},
					{
						"data": 'bankAccount',
						"visible" : true
					},
					{
						"data": 'levelName',
						"visible" : true
					},
					{
						"data": 'status',
						"visible" : true,
						"render": function ( data, type, row ) {
							//0-未启用1-已启用
							var str="";
							if(data=="0"){
								str="未启用";
							}else{
								str="启用";
							}
							return str;
						}

					},
					{
						"data": 'max',
						"visible" : true
					},
					{
						"data": 'min',
						"visible" : true
					},
					{
						"data": 'discountRate',
						"visible" : true
					},


	                {
						"data": I18n.system_opt ,
	                	"render": function ( data, type, row ) {
	                		return function(){
                                tableData['key'+row.id] = row;
								var html = '<p id="'+ row.id +'" >'+
									'<button class="btn btn-info btn-xs update" type="button">'+ I18n.system_opt_edit +'</button>  '+
									(row.status=="0"? '<button class="btn btn-warning btn-xs changeStatus"  type="button">'+ I18n.system_opt_open +'</button>'
										:'<button class="btn btn-danger btn-xs changeStatus"  type="button">'+ I18n.system_opt_close +'</button>')+
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
            bank : {
				required : true,
				maxlength: 18
			},
            bankName : {
				required : true
			},
            bankAccount : {
				required : true
			},
            bankAddress : {
                required : true
            }
		},
		messages : {
            bank : {
				required : I18n.system_please_input
			},
            bankName : {
				required : I18n.system_please_input
			},
            bankAddress : {
                required : I18n.system_please_input
            },
            bankAccount : {
				required : I18n.system_please_input
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
			$.post(base_url + "/bankData/add", param, function(data, status) {
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
		$("#updateModal .form [name='status']").val( row.status );
        $("#updateModal .form [name='bank']").val( row.bank );
        $("#updateModal .form [name='bankName']").val( row.bankName );
        $("#updateModal .form [name='bankAccount']").val( row.bankAccount );
        $("#updateModal .form [name='max']").val( row.max );
        $("#updateModal .form [name='min']").val( row.min );
        $("#updateModal .form [name='discountRate']").val( row.discountRate );
        $("#updateModal .form [name='imgUrl']").val( row.imgUrl );
        $("#updateModal .form [name='serverAdmin']").val( row.serverAdmin );
        $("#updateModal .form [name='bankAddress']").val( row.bankAddress );
		$("#updateModal .form [name='levelId'] option[value='"+ row.levelId +"']").prop('selected', true);
        $("#updateModal .form [name='alert'] option[value='"+ row.alert +"']").prop('selected', true);
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
			$.post(base_url + "/bankData/update", JSON.stringify(param), function(data, status) {
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
	$("#user_list").on('click', '.changeStatus',function() {
		var typeName;
		var url=base_url + "/bankData/changeStatus";
		var id = $(this).parent('p').attr("id");
        url+="/"+id;
		layer.confirm( I18n.system_ok + "改变状态吗" + '?', {
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
                            content:   I18n.system_success+"改变状态" ,
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


