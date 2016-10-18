/**
 * Created by Administrator on 2016-09-21.
 */
/*
var table;
$(function() {

    table = $('#datatable-scroller').DataTable({
        dom: "l<'pull-right'B>rtip",
        "pagingType": "full_numbers",//设置分页控件的模式
        buttons: [
            {
                extend: "copy",
                className: "btn-sm pull-right",
                title: 'Supplier List',
                exportOptions: {
                    columns: "thead th:not(.td-checkbox)"
                }
            },
            {
                extend: "csv",
                className: "btn-sm pull-right",
                title: 'Supplier List',
                exportOptions: {
                    columns: "thead th:not(.td-checkbox)"
                }
            },
            {
                extend: "excel",
                className: "btn-sm pull-right",
                title: 'Supplier List',
                exportOptions: {
                    columns: "thead th:not(.td-checkbox)"
                }
            },
            {
                extend: "print",
                className: "btn-sm pull-right",
                title: 'Supplier List',
                exportOptions: {
                    columns: "thead th:not(.td-checkbox)"
                }
            },

        ],
        responsive: true,
        searching: false,//屏蔽datatales的查询框
        "lengthMenu": [
            [5, 10, 20, 50, 100, 150, -1],
            [5, 10, 20, 50, 100, 150, "All"] // change per page values here
        ],
        "bLengthChange": true,//屏蔽tables的一页展示多少条记录的下拉列表
        "oLanguage": {  //对表格国际化
            "sLengthMenu": "每页显示 _MENU_条",
            "sZeroRecords": "没有找到符合条件的数据",
            //  "sProcessing": "&lt;img src=’./loading.gif’ /&gt;",
            "sInfo": "当前第 _START_ - _END_ 条　共计 _TOTAL_ 条",
            "sInfoEmpty": "木有记录",
            "sInfoFiltered": "(从 _MAX_ 条记录中过滤)",
            "sSearch": "搜索：",
            "oPaginate": {
                "sFirst": "首页",
                "sPrevious": "前一页",
                "sNext": "后一页",
                "sLast": "尾页",
                "page": "Page",
                "pageOf": "of"
            }
        },
        "processing": true, //打开数据加载时的等待效果
        serverSide: true,
        ajax: {
            "url": "../../../inventory/select.form",
            "data": function (d) {
                var keyword = "%" + $('#keyword').val() + "%";
                //添加额外的参数传给服务器
                d.keyword = keyword;
                var endDate = $("#endDate").val();
                if(endDate!="") {
                    d.endDate = new Date(endDate);
                }else {
                    d.endDate = new Date();
                }
            },
        },

        "columns": [
            {"data": "goodsName"},
            {"data": "goodsUnit"},
            {"data": "goodsColor"},
            {"data": "ivAmount"},
            {"data": "ivUnitCost"},
            {"data": "ivTotalCost"},
            { //复选框单元格
                "data": null,
                render: function (data, type, row, meta) {
                    var endDate = $("#endDate").val();
                    if(endDate!="") {
                        return endDate;
                    }else {
                        return new Date().toDateString();
                    }
                }
            }
        ],
        "columnDefs": [
            {"orderable": false, "targets": "_all"},
            {"visible": false, "targets": [1]},
            {"defaultContent": "", "targets": "_all"}
        ],
    });

    function search() {
        table.ajax.reload();
    }

    $("#ivSearch").click(function () {
        search();
    });
});    
*/
/**
 * Created by Administrator on 2016-09-21.
 */
var table;
$(function() {

    table = $('#datatable-scroller').DataTable({
        dom: "l<'#editButtons'<'pull-right'B>>rtip",
        "pagingType": "full_numbers",//设置分页控件的模式
        buttons: [
            {
                extend: "copy",
                className: "btn-sm pull-right",
                title: 'Supplier List',
                exportOptions:{
                    columns: "thead th:not(.td-checkbox)"
                }
            },
            {
                extend: "csv",
                className: "btn-sm pull-right",
                title: 'Supplier List',
                exportOptions:{
                    columns: "thead th:not(.td-checkbox)"
                }
            },
            {
                extend: "excel",
                className: "btn-sm pull-right",
                title: 'Supplier List',
                exportOptions:{
                    columns: "thead th:not(.td-checkbox)"
                }
            },
            {
                extend: "print",
                className: "btn-sm pull-right",
                title: 'Supplier List',
                exportOptions:{
                    columns: "thead th:not(.td-checkbox)"
                }
            },

        ],
        responsive: true,
        searching: false,//屏蔽datatales的查询框
        "lengthMenu": [
            [5,10, 20, 50, 100, 150, -1],
            [5,10, 20, 50, 100, 150, "All"] // change per page values here
        ],
        "bLengthChange": true,//屏蔽tables的一页展示多少条记录的下拉列表
        "oLanguage": {  //对表格国际化
            "sLengthMenu": "每页显示 _MENU_条",
            "sZeroRecords": "没有找到符合条件的数据",
            //  "sProcessing": "&lt;img src=’./loading.gif’ /&gt;",
            "sInfo": "当前第 _START_ - _END_ 条　共计 _TOTAL_ 条",
            "sInfoEmpty": "木有记录",
            "sInfoFiltered": "(从 _MAX_ 条记录中过滤)",
            "sSearch": "搜索：",
            "oPaginate": {
                "sFirst": "首页",
                "sPrevious": "前一页",
                "sNext": "后一页",
                "sLast": "尾页",
                "page": "Page",
                "pageOf": "of"
            }
        },
        "processing": true, //打开数据加载时的等待效果
        serverSide:true,
        ajax: {
            "url"  : "../../../inventory/select.form",
            "data" : function ( d ) {
                var keyword = "%"+$('#keyword').val()+"%";
                //添加额外的参数传给服务器
                d.keyword = keyword;
                var endDate = $("#endDate").val();
                if(endDate!="") {
                    d.endDate = new Date(endDate);
                }else {
                    d.endDate = new Date();
                }
            },
        },

        "columns": [
            {"data": "goodsName"},
            {"data": "goodsUnit"},
            {"data": "goodsColor"},
            {"data": "ivAmount"},
            {"data": "ivUnitCost"},
            {"data": "ivTotalCost"},
            { //复选框单元格
                "data": null,
                render: function (data, type, row, meta) {
                    var endDate = $("#endDate").val();
                    if(endDate!="") {
                        return endDate;
                    }else {
                        return new Date().toLocaleDateString();
                    }
                }
            }
        ],
        "columnDefs": [
            { "orderable": false, "targets": "_all" },
            { "defaultContent":"", "targets":"_all"},
            {"render":$.fn.dataTable.render.number(',', '.', 2),"targets":[3,4,5]}
        ],
       

    });


    function search()
    {
        table.ajax.reload();
    }

    $("#ivSearch").click(function(){
        search();
    });
   
});


