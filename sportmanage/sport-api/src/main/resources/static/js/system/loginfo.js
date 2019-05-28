$(function () {

    // init date tables
    var logTable = $("#log_info").dataTable({
        "deferRender": true,
        "processing": true,
        "serverSide": true,
        "ajax": {
            url: base_url + "/log/logList",
            type: "post",
            data: function (d) {
                return buildParams("#searchForm :input", d);
            }
        },
        "searching": false,
        "ordering": false,
        "columns": [
            {
                "data": 'userName',
                "bSortable": false,
                "width":'5%',
                "visible": true
            },
            {
                "data": 'ip',
                "bSortable": false,
                "width":'5%',
                "visible": true
            },
            {
                "data": 'dateTime',
                "bSortable": false,
                "width":'10%',
                "visible": true,
                "render": function (data, type, row) {
                    return data ? moment(new Date(data)).format("YYYY-MM-DD HH:mm:ss") : "";
                }
            },
            {
                "data": 'url',
                "bSortable": false,
                "width":'15%',
                "visible": true
            },
            {
                "data": 'param',
                "bSortable": false,
                "width":'50%',
                "visible": true
            },
            {
                "data": 'type',
                "bSortable": false,
                "width":'5%',
                "visible": true,
                "render": function (data, type, row) {
                    switch (parseInt(data)) {
                        case 0:
                            return "管理员";
                        case 1:
                            return "代理";
                        case 2:
                            return "会员";
                    }
                }
            },
            {
                "data": 'serverAdmin',
                "bSortable": false,
                "width":'5%',
                "visible": true
            }
        ],
        "language": language_table
    });

    $('#searchBtn').on('click', function () {
        logTable.fnDraw();
    });

});
