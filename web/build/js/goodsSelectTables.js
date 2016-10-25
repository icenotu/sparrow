/**
 * Created by Administrator on 2016-09-21.
 */
var table;
$(function() {
    
    table = $('#datatable-scroller').DataTable({
        dom: "lrtip",
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
            "url"  : "../../../goods/select.form",
            "data" : function ( d ) {
                var level1 = "%"+$('#level1').val()+"%";
                //添加额外的参数传给服务器
                d.keyword = level1;
            },
        },

        "columns": [
            { //复选框单元格
                className: "td-checkbox",
                orderable: false,
                width: "30px",
                data: "goodsId",
                render: function (data, type, row, meta) {
                    return '<input type="checkbox" class="check-box" value='+data+'>';
                }
            },
            { "data": "goodsId" },
            { "data": "goodsName" },
            { "data": "goodsUnit" },
            { "data": "goodsType" },
            { "data": "goodsColor" },
            { "data": "goodsStore" },
            { "data": "goodsLimit" },
            { "data": "goodsCommission" },
            { "data": "goodsProducer" },
            { "data": "goodsRemark" },
            { "data": "goodsSelPrice" },
            { "data": "goodsBuyPrice" }
        ],
        "columnDefs": [
            { "orderable": false, "targets": "_all" },
            { "visible": false, "targets": [1] },
            { "defaultContent":"", "targets":"_all"},
            {"className": "none","targets":[6,7,8,9,10,11,12]}
        ],
        initComplete:initComplete,
        'drawCallback': function( settings ) {
            $('#checkAll').checked = false;//取消全选状态
        }
//          deferRender: true,
//          scrollY: 380,
//          scrollCollapse: true,
//          scroller: true
    });
    /*var purchaseTable;
    purchaseTable = $("#purchaseGoodsTable").DataTable({
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

        "columns": [
            { //复选框单元格
                className: "td-checkbox",
                orderable: false,
                width: "30px",
                data: "goodsId",
                render: function (data, type, row, meta) {
                    return '<input type="checkbox" class="check-box" value='+data+'>';
                }
            },
            { "data": "goodsId" },
            { "data": "goodsName" },
            { "data": "goodsUnit" },
            { "data": "goodsType" },
            { "data": "goodsColor" },
            { "data": "bodAmount" },
            { "data": "bodBuyPrice" },
            { "data": "bodTotalPrice" },
            { "data": "bodImeiList" },

        ],
        "columnDefs": [
            { "orderable": false, "targets": "_all" },
            { "visible": false, "targets": [1] },
            { "defaultContent":"", "targets":"_all"}
        ],

    });*/

    /*$(document).delegate('#addBtn','click',function() {
        $.listen('parsley:field:validate', function() {
            validateFrontPurchase();
        });
        var validateFrontPurchase = function() {
            if (true === $('#addPurchaseGoodsForm').parsley().isValid()) {
                $('.bs-callout-info').removeClass('hidden');
                $('.bs-callout-warning').addClass('hidden');
                return true;
            } else {
                $('.bs-callout-info').addClass('hidden');
                $('.bs-callout-warning').removeClass('hidden');
                return false;
            }
        };
        $('#addPurchaseGoodsForm').parsley().validate();
        validateFrontPurchase();
        if (!validateFrontPurchase()){
            return false;
        }
        var length = table.rows('.selected').data().length;
        if (length==1) {
            var data = table.row('tr.selected').data();
            // alert(data.goodsId);
            purchaseTable.row.add({
                goodsId:data.goodsId,
                goodsName:data.goodsName,
                goodsUnit:data.goodsUnit,
                goodsType:data.goodsType,
                goodsColor:data.goodsColor,
                bodAmount:$("#bodAmount").val(),
                bodBuyPrice:$("#bodBuyPrice").val(),
                bodTotalPrice:Number($("#bodAmount").val()*$("#bodBuyPrice").val()).toFixed(2),
                bodImeiList:$("#bodImeiList").val(),
            }).draw( false );
            $('#myModal-add-info').modal('hide');
            $('#myModal-add-info').on('hidden.bs.modal', function () {
                // $(":checkbox").attr("checked", false);
                $('#datatable-scroller tbody tr').each(function() {
                    if($(this).hasClass('selected')){
                        $(this).click();
                        $($(this).children()[0]).attr("checked",false);
                    }
                })
            })
        } else {
            alert("请选择一条您要修改的记录！")
        }
    });*/

    function initComplete(data) {
        var editButtons = '<button   class="btn btn-danger btn-sm" id="deleteAll">批量删除</button> <button   class="btn btn-success btn-sm "  id="addBtn">新 增</button> <button   class="btn btn-warning btn-sm "  id="editBtn">修 改</button>';
        $("#editButtons").append(editButtons);//在表格上方topPlugin DIV中追加HTML
    }
    function search()
    {
        table.ajax.reload();
    }
    $(document).keydown(function(event){
        if(event.keyCode==13){
            search();
        }
    });
    $("#level2").click(function(){
            search();
    });
    /**
     * 多选选中和取消选中,同时选中第一个单元格单选框,并联动全选单选框
     */
    $('#datatable-scroller tbody').on('click', 'tr', function(event) {
        var allChecked=$('#checkAll');//关联全选单选框
        $($(this).children()[0]).children().each(function(){
            if(this.type=="checkbox" && (!$(event.target).is(":checkbox") && $(":checkbox",this).trigger("click"))){
                if(!this.checked){
                    this.checked = true;
                    var selected=table.rows('.selected').data().length;//被选中的行数
                    //全选单选框的状态处理
                    var recordsDisplay=table.page.info().recordsDisplay;//搜索条件过滤后的总行数
                    var iDisplayStart=table.page.info().start;// 起始行数
                    if(selected === table.page.len()||selected === recordsDisplay||selected === (recordsDisplay - iDisplayStart)){
                        allChecked.checked = true;
                    }
                }else{
                    this.checked = false;
                    allChecked.checked = false;
                }
            }
        });
        $(this).toggleClass('selected');//放在最后处理，以便给checkbox做检测
    });

    /*$('#purchaseGoodsTable tbody').on('click', 'tr', function(event) {
        var allChecked=$('#checkAllPurchaseGoods');//关联全选单选框
        $($(this).children()[0]).children().each(function(){
            if(this.type=="checkbox" && (!$(event.target).is(":checkbox") && $(":checkbox",this).trigger("click"))){
                if(!this.checked){
                    this.checked = true;
                    var selected=table.rows('.selected').data().length;//被选中的行数
                    //全选单选框的状态处理
                    var recordsDisplay=table.page.info().recordsDisplay;//搜索条件过滤后的总行数
                    var iDisplayStart=table.page.info().start;// 起始行数
                    if(selected === table.page.len()||selected === recordsDisplay||selected === (recordsDisplay - iDisplayStart)){
                        allChecked.checked = true;
                    }
                }else{
                    this.checked = false;
                    allChecked.checked = false;
                }
            }
        });
        $(this).toggleClass('selected');//放在最后处理，以便给checkbox做检测
    });*/

    /**
     * 全选按钮被点击事件
     */
    $('#checkAll').click(function(){
        if(this.checked){
            $('#datatable-scroller tbody tr').each(function(){
                if(!$(this).hasClass('selected')){
                    $(this).click();
                }
            });
        }else{
            $('#datatable-scroller tbody tr').click();
        }
    });

   /* $('#checkAllPurchaseGoods').click(function(){
        if(this.checked){
            $('#purchaseGoodsTable tbody tr').each(function(){
                if(!$(this).hasClass('selected')){
                    $(this).click();
                }
            });
        }else{
            $('#purchaseGoodsTable tbody tr').click();
        }
    });*/

   
});



/**
 * 点击新增按钮事件
 */
/*$(document).delegate('#addBtn','click',function() {
    $("#myModal-add-info").modal('show');
});*/
