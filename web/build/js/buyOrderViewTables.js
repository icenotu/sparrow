/**
 * Created by Administrator on 2016-09-21.
 */
var table;
$(function() {
    
    var now = new Date(); //当前日期
    var nowDayOfWeek = now.getDay(); //今天本周的第几天
    var nowDay = now.getDate(); //当前日
    var nowMonth = now.getMonth(); //当前月
    var nowYear = now.getFullYear(); //当前年
    //获得某月的天数
    function getMonthDays(myMonth){
        var monthStartDate = new Date(nowYear, myMonth, 1);
        var monthEndDate = new Date(nowYear, myMonth + 1, 1);
        var days = (monthEndDate - monthStartDate)/(1000 * 60 * 60 * 24);
        return days;
    }
    //获取本月第一天
    function getFirstDay() {
        return new Date(nowYear, nowMonth, 1)
    }
    //获取本月最后一天
    function getLastDay() {
        return new Date(nowYear, nowMonth, getMonthDays(nowMonth))
    }
    
    table = $('#datatable-scroller').DataTable({
        dom: "l<'pull-right'B>rtip",
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
            "url"  : "../../../buyOrder/select.form",
            "data" : function ( d ) {
                var keyword = "%"+$('#keyword').val()+"%";
                //添加额外的参数传给服务器
                d.keyword = keyword;
                var startDate = $("#startDate").val();
                if(startDate!="") {
                    d.startDate = new Date(startDate);
                }else {
                    d.startDate = getFirstDay();
                }
                var endDate = $("#endDate").val();
                if(endDate!="") {
                    d.endDate = new Date(endDate);
                }else {
                    d.endDate = getLastDay();
                }
            }
        },

        "columns": [
            {"data": "boId"},
            {"data": "supId"},
            {"data": "boOriginal"},
            {"data": "boPayable"},
            {"data": "boPaid"},
            {"data": "boArrears"},
            {"data": "boDate",
                render: function (data, type, row, meta) {
                    return new Date(data).toLocaleDateString();
                }
            },
            {"data": "boAttn"},
            {"data": "boRemark"},
            { //复选框单元格
                "data": "boId",
                render: function (data, type, row, meta) {
                    return '<button  id="checkInfo" class="btn btn-primary btn-sm" name='+data+'>查看详情</button>'
                }
            }
        ],
        "columnDefs": [
            { "orderable": false, "targets": "_all" },
            { "defaultContent":"", "targets":"_all"},
            { "visible": false, "targets": [0] },
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
    
    
    var info;
    /**
     * 点击查看详情按钮事件
     */
        $(document).delegate('#checkInfo','click',function() {
        var boId= $(this).attr("name");
            $("#orderId").val(boId);
            info.ajax.reload();//表格初始化是获取不到boId，需要重新加载才能获取得到
        $("#myModal-check-info").modal('show')/*.children(".modal-dialog").css({
            // width:"75%",
            'margin-right': 5,
            // 'width':1200
            width: function () {
                return ($(this).parents(".right_col").width());
            }
            
        })*/
    });
        info = $('#orderInfo').DataTable({
            dom: "l<'pull-right'B>rtip",
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
                "url"  : "../../../buyOrder/checkInfo.form",
                "data" : function ( d ) {
                    var level1 = "%"+$('#level1').val()+"%";
                    //添加额外的参数传给服务器
                    d.keyword = level1;
                    var boId = $("#orderId").val();
                    d.orderId = boId;
                }
            },
    
            "columns": [
                {"data": "goodsName"},
                {"data": "goodsUnit"},
                {"data": "goodsType"},
                {"data": "goodsColor"},
                {"data": "bodAmount"},
                {"data": "bodBuyPrice"},
                {"data": "bodTotalPrice"},
                {"data": "bodImeiList"}
            ],
            "columnDefs": [
                { "orderable": false, "targets": "_all" },
                { "defaultContent":"", "targets":"_all"},
                {"render":$.fn.dataTable.render.number(',', '.', 2),"targets":[4,5,6]},
                {"className": "none","targets":[3,4,5,6,7]}
            ],
    
        });


        function search2()
        {
            info.ajax.reload();
        }
        $(document).keydown(function(event){
            if(event.keyCode==13){
                search2();
            }
        });
        $("#level2").click(function(){
            search2();
        });
    
});


