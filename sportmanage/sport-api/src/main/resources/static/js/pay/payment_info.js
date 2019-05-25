$(function() {
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
    $.ajax({
// get请求地址  
        url: base_url + "/bankData/getPayBankData",
        dataType: "json",
        success: function (ret) {
            if(ret.result==0) {
                var data = ret.data;
                var html="";
                for (var i = 0; i < data.length; i++) {
                    html+= "<option value='"+data[i]['key']+"'>" + data[i].value + "</option>";
                }
                $('.payBank').html(html);
                $('.payBank').selectpicker('refresh');
                $('.payBank').selectpicker('render');
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

    $('.chooseBank').on('change.bootstrapSwitch', function(e) {
       if(e.target.checked){
			$(".banks").show();
	   }else{
           $(".banks").hide();
	   }
    });
	// init date tables
	var userTable = $("#user_list").dataTable({
		"deferRender": true,
		"processing" : true, 
	    "serverSide": true,
		"scrollCollapse":true,
		"ajax": {
			url: base_url + "/payment/paymentList",
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
						"data": 'accountCompany',
						"visible" : true
					},
					{
						"data": 'businessCode',
						"visible" : true

					},
					{
						"data": 'payTypeName',
						"visible" : true

					},

					{
						"data": 'type',
						"visible" : true,
						"render": function ( data, type, row ) {

							if(data==0){
								return "入款";
							}else{
								return "出款";
							}
						}

					},
					{
						"data": 'totalMoney',
						"visible" : true

					},
					{
						"data": 'totalTime',
						"visible" : true

					},
					{
						"data": 'payLevelName',
						"visible" : true
					},
					{
						"data": 'min',
						"visible" : true

					},
					{
						"data": 'max',
						"visible" : true

					},

					{
						"data": 'status',
						"visible" : true,
						"render": function ( data, type, row ) {

							if(data==0){
								return "停用";
							}else{
								return "启用";
							}
						}

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
            accountCompany : {
                required : true
            },
            businessCode : {
                required : true
            },
            discountRate : {
                required : true,
                number:true
            },
            min : {
                required : true,
                number:true
            },
            max : {
                required : true,
                number:true
            },
            feesRate : {
                required : true,
                number:true
            },
            businessPwd : {
                required : true
            },
            serverAdmin : {
                required : true
            }
        },
		messages : {
            accountCompany : {
				required : I18n.system_please_input
			},
            businessCode : {
				required : I18n.system_please_input
			},
            discountRate : {
                required : I18n.system_please_input
            },
            min : {
				required : I18n.system_please_input
			},
            max : {
                required : I18n.system_please_input
            },
            feesRate : {
                required : I18n.system_please_input
            },
            businessPwd : {
                required : I18n.system_please_input
            },
            serverAdmin : {
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
			var param = getFormDataForObj($("#addModal .form"));
            if(param.chooseBank){
                param.payBank=$("#add_bank").val().join(",");
                param.chooseBank='1'
            }else{
                param.payBank='';
                param.chooseBank='0'
			}
			$.post(base_url + "/payment/add", JSON.stringify(param), function(data, status) {
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
        $("#addModal .form .switch div").removeClass("switch-on");
        $("#addModal .form .switch div").addClass("switch-off");
        $("#addModal .banks").hide();
	});


	// update form
	$("#user_list").on('click', '.update',function() {

		$("#passwordReset").hide();
		$("#statusReset").hide();

		var id = $(this).parent('p').attr("id");
		var row = tableData['key'+id];

		$("#updateModal .form [name='id']").val( row.id );
        $("#updateModal .form [name='accountCompany']").val( row.accountCompany );
		$("#updateModal .form [name='payUrl']").val( row.payUrl );
        $("#updateModal .form [name='businessCode']").val( row.businessCode );
        $("#updateModal .form [name='baofooid']").val( row.baofooid );
        $("#updateModal .form [name='status']").val( row.status );
        $("#updateModal .form [name='totalMoney']").val( row.totalMoney );
        $("#updateModal .form [name='totalTime']").val( row.totalTime );
        $("#updateModal .form [name='min']").val( row.min );
        $("#updateModal .form [name='max']").val( row.max );
        $("#updateModal .form [name='discountRate']").val( row.discountRate );
        $("#updateModal .form [name='notes']").val( row.notes );
        $("#updateModal .form [name='totalTime']").val( row.totalTime );
        $("#updateModal .form [name='feesRate']").val( row.feesRate );
        $("#updateModal .form [name='serverAdmin']").val( row.serverAdmin );
        $("#updateModal .form [name='businessPwd']").val( row.businessPwd );
        $("#updateModal .form [name='key2']").val( row.key2 );
		//下拉框初始化
        $("#updateModal .form [name='levelId'] option[value='"+ row.levelId +"']").prop('selected', true);
        $("#updateModal .form [name='payType'] option[value='"+ row.payType +"']").prop('selected', true);
        $("#updateModal .form [name='type'] option[value='"+ row.type +"']").prop('selected', true);
        if(row.chooseBank=="1"){
            $("#updateModal .form .switch div").removeClass("switch-off");
            $("#updateModal .form .switch div").addClass("switch-on");
            $("#updateModal .banks").show();
            $("#updateModal .form [name='payBank']").selectpicker('val', row.payBank.split(","));

		}

		$('#updateModal').modal({backdrop: false, keyboard: false}).modal('show');
	});
	var updateModalValidate = $("#updateModal .form").validate({
		errorElement : 'span',
		errorClass : 'help-block',
		focusInvalid : true,
        rules : {
            accountCompany : {
                required : true
            },
            businessCode : {
                required : true
            },
            discountRate : {
                required : true,
                number:true
            },
            min : {
                required : true,
                number:true
            },
            max : {
                required : true,
                number:true
            },
            feesRate : {
                required : true,
                number:true
            },
            businessPwd : {
                required : true
            },
            serverAdmin : {
                required : true
            }
        },
        messages : {
            accountCompany : {
                required : I18n.system_please_input
            },
            businessCode : {
                required : I18n.system_please_input
            },
            discountRate : {
                required : I18n.system_please_input
            },
            min : {
                required : I18n.system_please_input
            },
            max : {
                required : I18n.system_please_input
            },
            feesRate : {
                required : I18n.system_please_input
            },
            businessPwd : {
                required : I18n.system_please_input
            },
            serverAdmin : {
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

			var param = getFormDataForObj($("#updateModal .form"));
            if(param.chooseBank){
                param.payBank=$("#update_bank").val().join(",");
                param.chooseBank='1'
            }else{
                param.payBank='';
                param.chooseBank='0'
            }
			$.post(base_url + "/payment/update", JSON.stringify(param), function(data, status) {
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
		var url=base_url + "/payment/changeStatus";
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


