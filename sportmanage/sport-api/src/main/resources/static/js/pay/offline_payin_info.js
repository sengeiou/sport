$(function() {
	// init date tables
	var userTable = $("#user_list").dataTable({
		"deferRender": true,
		"processing" : true, 
	    "serverSide": true,
		"ajax": {
			url: base_url + "/pay/offlinePayInList",
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
						"data": 'youhuiGold',
						"visible" : true
					},
					{
						"data": 'status',
						"visible" : true,
						"render": function ( data, type, row ) {
							//0-未审核2-已入款
							var str="";
							if(data==2){
								str="已入款"
							}else{
								str="未审核"
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
	                			var html='<button class="btn btn-warning btn-xs update" type="button">'+ I18n.system_check +'</button>  ';
								if(row.status==2){
									html='<button class="btn btn-danger btn-xs update" type="button">反审核</button>';
								}
                                tableData['key'+row.id] = row;
								var html = '<p id="'+ row.id +'" >'+html +'</p>';
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
		var typeName;
		var url=base_url + "/pay/payInCheck/";
		var id = $(this).parent('p').attr("id");
		url+=id;
		layer.confirm( I18n.system_ok + I18n.system_check + '?', {
			icon: 3,
			title: I18n.system_tips ,
			btn: [ I18n.system_check, I18n.system_cancel ]
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
	});


});


