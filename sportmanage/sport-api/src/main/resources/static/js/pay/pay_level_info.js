$(function() {
    $('.filterDate').daterangepicker({
        autoApply: false,
        singleDatePicker: false,
        showDropdowns: false,        // 是否显示年月选择条件
        timePicker: false, 			// 是否显示小时和分钟选择条件
        timePickerIncrement: 10, 	// 时间的增量，单位为分钟
        timePicker24Hour: true,
        alwaysShowCalendars: true,
        minView: "month",   //不显示时分秒
        opens: 'left', //日期选择框的弹出位置
        ranges: rangesConf,
        locale: {
            format: 'YYYY-MM-DD',
            separator: ' - ',
            customRangeLabel: I18n.daterangepicker_custom_name,
            applyLabel: I18n.system_ok,
            cancelLabel: I18n.system_cancel,
            fromLabel: I18n.daterangepicker_custom_starttime,
            toLabel: I18n.daterangepicker_custom_endtime,
            daysOfWeek: I18n.daterangepicker_custom_daysofweek.split(','),        // '日', '一', '二', '三', '四', '五', '六'
            monthNames: I18n.daterangepicker_custom_monthnames.split(','),        // '一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'
            firstDay: 1
        },
        startDate: rangesConf[I18n.daterangepicker_ranges_recent_week][0],
        endDate: rangesConf[I18n.daterangepicker_ranges_recent_week][1]
    });
	// init date tables
	var userTable = $("#user_list").dataTable({
		"deferRender": true,
		"processing" : true, 
	    "serverSide": true,
		"scrollCollapse":true,
		"ajax": {
			url: base_url + "/payLevel/payLevelList",
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
						"data": 'levelName',
						"visible" : true
					},
					{
						"data": 'date',
						"visible" : true,
						"render": function ( data, type, row ) {

							return row.regStart+" ~ "+row.regEnd;
						}

					},
					{
						"data": 'ctime',
						"visible" : true,
						"render": function ( data, type, row ) {

							return row.mixCtime+" ~ "+row.maxCtime;
						}

					},

					{
						"data": 'amount',
						"visible" : true,
						"render": function ( data, type, row ) {

							return row.mixAmount+" ~ "+row.maxAmount;
						}

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
            levelName : {
                required : true
            },
            serverAdmin : {
                required : true
            },
            filterDate : {
                required : true
            },
            mixCtime : {
                required : true,
                number:true
            },
            maxCtime : {
                required : true,
                number:true
            },
            mixAmount : {
                required : true,
                number:true
            },
            maxAmount : {
                required : true,
                number:true
            }
        },
		messages : {
            levelName : {
				required : I18n.system_please_input
			},
            serverAdmin : {
				required : I18n.system_please_input
			},
            filterDate : {
                required : I18n.system_please_input
            },
            mixCtime : {
				required : I18n.system_please_input
			},
            maxCtime : {
                required : I18n.system_please_input
            },
            mixAmount : {
                required : I18n.system_please_input
            },
            maxAmount : {
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
            if(!!param.filterDate){
                param.regStart = param.filterDate.split(" - ")[0];
                param.regEnd = param.filterDate.split(" - ")[1];
            }
			$.post(base_url + "/payLevel/add", JSON.stringify(param), function(data, status) {
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
		$("#updateModal .form [name='levelName']").val( row.levelName );
        $("#updateModal .form [name='serverAdmin']").val( row.serverAdmin );
        $("#updateModal .form [name='mixCtime']").val( row.mixCtime );
        $("#updateModal .form [name='maxCtime']").val( row.maxCtime );
        $("#updateModal .form [name='mixAmount']").val( row.mixAmount );
        $("#updateModal .form [name='maxAmount']").val( row.maxAmount );
        $("#updateModal .form [name='notes']").val( row.notes );
        $('#updateModal .form .filterDate').data('daterangepicker').setStartDate(row.regStart);
        $('#updateModal .form .filterDate').data('daterangepicker').setEndDate(row.regEnd);
		$('#updateModal').modal({backdrop: false, keyboard: false}).modal('show');
	});
	var updateModalValidate = $("#updateModal .form").validate({
		errorElement : 'span',
		errorClass : 'help-block',
		focusInvalid : true,
        rules : {
            levelName : {
                required : true
            },
            serverAdmin : {
                required : true
            },
            filterDate : {
                required : true
            },
            mixCtime : {
                required : true,
                number:true
            },
            maxCtime : {
                required : true,
                number:true
            },
            mixAmount : {
                required : true,
                number:true
            },
            maxAmount : {
                required : true,
                number:true
            }
        },
        messages : {
            levelName : {
                required : I18n.system_please_input
            },
            serverAdmin : {
                required : I18n.system_please_input
            },
            filterDate : {
                required : I18n.system_please_input
            },
            mixCtime : {
                required : I18n.system_please_input
            },
            maxCtime : {
                required : I18n.system_please_input
            },
            mixAmount : {
                required : I18n.system_please_input
            },
            maxAmount : {
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
            if(!!param.filterDate){
                param.regStart = param.filterDate.split(" - ")[0];
                param.regEnd = param.filterDate.split(" - ")[1];
            }
			$.post(base_url + "/payLevel/update", JSON.stringify(param), function(data, status) {
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
		var url=base_url + "/payLevel/changeStatus";
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


