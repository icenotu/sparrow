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
    //获取上月第一天
    function getLastMonthFirstDay() {
        return new Date(nowYear, nowMonth-1, 1)
    }
    //获取上月最后一天
    function getLastMonthLastDay() {
        return new Date(nowYear, nowMonth-1, getMonthDays(nowMonth-1))
    }
    
    table = $('#datatable-scroller').DataTable({
        dom: "<'#editButtons'<'pull-right'B>>rt",
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
            "url"  : "../../../report/salesCost.form",
            "data" : function ( d ) {
                var endDate = $("#endDate").val();
                if(endDate!="") {
                    var myDate = new Date(endDate);
                    var nowMonth = myDate.getMonth(); //当前月
                    var nowYear = myDate.getFullYear(); //当前年
                    //获得某月的天数
                    function getMonthDays(myMonth){
                        var monthStartDate = new Date(nowYear, myMonth, 1);
                        var monthEndDate = new Date(nowYear, myMonth + 1, 1);
                        var days = (monthEndDate - monthStartDate)/(1000 * 60 * 60 * 24);
                        return days;
                    }
                    d.startDate = new Date(nowYear, nowMonth, 1);
                    d.endDate = new Date(nowYear, nowMonth, getMonthDays(nowMonth));
                    d.lastMonthStartDate = new Date(nowYear, nowMonth-1, 1);
                    d.lastMonthEndDate = new Date(nowYear, nowMonth-1, getMonthDays(nowMonth-1));
                }else {
                    d.endDate = getLastDay();
                    d.startDate = getFirstDay();
                    d.lastMonthStartDate = getLastMonthFirstDay();
                    d.lastMonthEndDate = getLastMonthLastDay();
                }
            }
        },

        "columns": [
            {"data": "scrId"},
            {"data": "shId"},
            {"data": "scrDate",
                render: function (data, type, row, meta) {
                    return new Date(data).toLocaleDateString();
                }
            },
            {"data": "goodsId"},
            {"data": "goodsName"},
            {"data": "goodsUnit"},
            {"data": "goodsType"},
            {"data": "goodsColor"},
            {"data": "scdAmount"},
            {"data": "scdUnitCost"},
            {"data": "scdTotalCost"},
            {"data": "openIvAmount"},
            {"data": "openUnitCost"},
            {"data": "openTotalCost"},
            {"data": "bodAmount"},
            {"data": "bodUnitCost"},
            {"data": "bodTotalCost"},
            {"data": "ivAmount"},
            {"data": "ivUnitCost"},
            {"data": "ivTotalCost"}
        ],
        "columnDefs": [
            { "orderable": false, "targets": "_all" },
            { "defaultContent":"", "targets":"_all"},
            { "visible": false, "targets": [0,3] },
            {"render":$.fn.dataTable.render.number(',', '.', 2),"targets":[8,9,10,11,12,13,14,15,16,17,18,19]}
        ],
        initComplete:initComplete,

    });
    function initComplete(data) {
        var editButtons = '<button   class="btn btn-primary btn-sm "  id="saveBtn">保 存</button>';
        $("#editButtons").append(editButtons);//在表格上方topPlugin DIV中追加HTML
    }
    /**
     * 单击保存按钮
     */
    $(document).delegate('#saveBtn','click',function() {
        // var rows = table.rows().data();
        // alert(rows.length);
        // var array1 = new Array();
        // for(var i=0;i<rows.length;i++) {
        //     array1.push(rows[i]);
        // }
        var array1 = table.rows().data().toArray();
        $.ajax({
            url: "../../../report/insert.form",
            type: "POST",
            data: {
                "rows": JSON.stringify(array1)
            },
            data_type: "json"
        });
    });
    
    function search()
    {
        table.ajax.reload();
    }

    $("#ivSearch").click(function(){
        search();
    });
    
    
    


});


