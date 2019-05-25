$(function() {
	// init date tables
	var userTable = $("#user_list").dataTable({
		"deferRender": true,
		"processing" : true, 
	    "serverSide": true,
		"ajax": {
			url: base_url + "/bulletin/messageList",
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
						"data": 'fromUserName',
						"visible" : true,
					},
	                {
	                	"data": 'title',
						"visible" : true
					},
					{
						"data": 'context',
						"visible" : true,
                        "render": function ( data, type, row ) {
                            if(data!=null&&data.length>20){
                                return"<span title='"+data+"'>"+ data.substr(0,20)+"...<span/>"
                            }
                            return data;
                        }
					},
					{
						"data": 'toUserName',
						"visible" : true,
					},
					{
						"data": 'addTime',
						"visible" : true
					},
					{
						"data": 'fromType',
						"visible" : true,
                        "render": function ( data, type, row ) {
							//发信人类型，0-管理员1-代理
							var str="";
							if(data==0){
								str="管理员";
							}else{
								str="代理";
							}
							return str;
						}

					},
					{
						"data": 'replyId',
						"visible" : true

					},
	                {
						"data": I18n.system_opt ,
	                	"render": function ( data, type, row ) {
	                		return function(){
                                tableData['key'+row.id] = row;
								var html = '<p id="'+ row.id +'" >'+
									'<button class="btn btn-info btn-xs update" type="button">'+ I18n.system_show +'</button>  '+
									'<button class="btn btn-danger btn-xs notice_operate" _type="notice_del" type="button">'+ I18n.system_opt_del +'</button>  '+
									'</p>';
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

	// update form
	$("#user_list").on('click', '.update',function() {

		$("#passwordReset").hide();
		$("#statusReset").hide();

		var id = $(this).parent('p').attr("id");
		$.post(base_url + "/bulletin/viewMessage/"+id,function(data){
            if (data.result === 0) {
                var row = data.data;
                $("#updateModal .form [name='id']").val(row.id);
                $("#updateModal .form [name='context']").val(row.context);
                $("#updateModal .form [name='title']").val(row.title);
                $("#updateModal .form [name='fromUserName']").val(row.fromUserName);
                $("#updateModal .form [name='fromType'] option[value='" + row.fromType + "']").prop('selected', true);
                $("#updateModal .form [name='serverAdmin']").val(row.serverAdmin);
                var tb="";
                for(var i=0;i<row.infos.length;i++){
					tb+="<tr><td>"+row.infos[i].username+"</td><td>"+(row.infos[i].readStatus?"是":"否")+"</td><td>"+(row.infos[i].delStatus?"是":"否")+"</td></tr>";
				}
				$("#tb").html(tb);
                $('#updateModal').modal({backdrop: false, keyboard: false}).modal('show');
            }else{
                layer.open({
                    title: I18n.system_tips ,
                    btn: [ I18n.system_ok ],
                    content: (data.error_msg || I18n.system_update_fail ),
                    icon: '2'
                });
			}
		})


	});
	// delete form
	$("#user_list").on('click', '.notice_operate',function() {
		var typeName;
		var url=base_url + "/bulletin/deleteMessage";
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


