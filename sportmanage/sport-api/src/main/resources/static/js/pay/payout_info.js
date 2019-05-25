$(function() {
	// init date tables
	var userTable = $("#user_list").dataTable({
		"deferRender": true,
		"processing" : true, 
	    "serverSide": true,
		"ajax": {
			url: base_url + "/pay/payOutList",
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
						"data": 'orderCode',
						"visible" : true,
					},
					{
						"data": 'username',
						"visible" : true,
					},
	                {
	                	"data": 'goldf',
						"visible" : true
					},
					{
						"data": 'gold',
						"visible" : true
					},
					{
						"data": 'golds',
						"visible" : true
					},
					{
						"data": 'type',
						"visible" : true,
						"render": function ( data, type, row ) {


                    //0-会员提款1-代理提款3-人工扣款
                            return getTypeStr(data);
						}
					},
					{
						"data": 'status',
						"visible" : true,
						"render": function ( data, type, row ) {
							//0-未审核1-审核成功2-已出款-3-审核失败-4-出款中-5-撤销出款
							var str="";
							if(data==0){
								str="待审核"
							}else if(data==1){
                                str="待出款"
							}else if(data==2){
								str="已出款"
							}else if(data==3){
                                str="已驳回"
                            }else if(data==4){
                                str="出款中"
                            }else if(data==5){
                                str="已撤销"
                            }
							return str;
						}
					},
					{
						"data": 'addDate',
						"visible" : true
					},
					{
						"data": 'notes',
						"visible" : true,
                        "render": function ( data, type, row ) {
                            if(data!=null&&data.length>20){
                                return"<span title='"+data+"'>"+ data.substr(0,20)+"...<span/>"
                            }
                            return data;
                        }
					},
	                {
						"data": I18n.system_opt ,
	                	"render": function ( data, type, row ) {
	                		return function(){
                                //0-未审核1-审核成功2-已出款-3-审核失败-4-出款中-5-撤销出款
	                			var html='';
                                if(row.status==0){
                                    html='<p id="'+ row.id +'" ><button class="btn btn-info btn-xs checks" type="button">'+ "审核" +'</button>  ' ;
                                }else if(row.status==1){
                                    html='<p id="'+ row.id +'" ><button class="btn btn-warning  btn-xs update" to_status="2" type="button">'+ "出款" +'</button> ' ;
                                }else if(row.status==2){
                                    html='<p id="'+ row.id +'" ><button class="btn btn-danger btn-xs update" to_status="5" type="button">'+ "撤销" +'</button>  </p>';
                                }else if(row.status==3){
                                    html="已驳回"
                                }else if(row.status==4){
                                    html="出款中"
                                }else if(row.status==5){
                                    html='<p id="'+ row.id +'" ><button class="btn btn-warning  btn-xs update" to_status="2" type="button">'+ "出款" +'</button> ' ;
                                }
                                tableData['key'+row.id] = row;
	                			return html;
							};
	                	}
	                }
	            ],
			"language" : language_table
		});

    var tableData = {};
	$('#searchBtn').on('click', function(){
		userTable.fnDraw();
	});
	// delete form
	$("#user_list").on('click', '.update',function() {
            updateStatus(this);
	});
    $(".update").on('click',function() {
        updateStatus(this);
    });
    // update form
    $("#user_list").on('click', '.checks',function() {
        var id = $(this).parent('p').attr("id");
        var rowData= tableData['key'+id]
        var url="/pay/payOutCountFlow/"+rowData.userid;
		$.post(url,function(data){
			if(data.result==0){
				var row=data.data;
                $("#updateModal #type").html( getTypeStr(rowData.type) );
                $("#updateModal #alias").html( row.alias );
                $("#updateModal #bankAccount").html( rowData.bankAccount==null?"空":rowData.bankAccount );
                $("#updateModal #gold").html(rowData.gold);
                $("#updateModal #lastPayInAmount").html( row.lastPayIn );
                $("#updateModal #lastFlowAmount").html( row.lastFlowCount );
                $("#updateModal #payInAmount").html( row.payInCount );
                $("#updateModal #flowAmount").html(row.flowCount);
                $(".btn_p").attr("id",rowData.id);
                $('#updateModal').modal({backdrop: false, keyboard: false}).modal('show');
			}else {
                layer.open({
                    title: I18n.system_tips ,
                    btn: [ I18n.system_ok ],
                    content: (data.error_msg || I18n.system_update_fail ),
                    icon: '2'
                });
            }

		});

    });
    $("#updateModal").on('hide.bs.modal', function () {
        $("#updateModal .personalinfo .text").html("");
    });

    $("#status").change(function(){
        $("input[name=statusStr]").val($("#status").val())
    })
    function getTypeStr(data) {
        var str = "";
        if (data == 0) {
            str = "会员提款"
        } else if (data == 1) {
            str = "代理提款"
        } else if (data == 3) {
            str = "人工扣款"
        }
        return str;
    }

    function updateStatus(obj){
        var url=base_url + "/pay/updateStatus/";
        var id = $(obj).parent('p').attr("id");
        var toStatus=$(obj).attr("to_status");
        url+=id;
        layer.confirm( I18n.system_ok + "改变此出款状态吗" + '?', {
            icon: 3,
            title: I18n.system_tips ,
            btn: [ I18n.system_check, I18n.system_cancel ]
        }, function(index){
            layer.close(index);
            $.ajax({
                type : 'POST',
                url : url,
                data:toStatus,
                success : function(data){
                    if ( data.result== 0) {
                        $('#updateModal').modal('hide');
                        layer.open({
                            title: I18n.system_tips,
                            btn: [ I18n.system_ok ],
                            content: I18n.system_opt_suc ,
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
    }
});


