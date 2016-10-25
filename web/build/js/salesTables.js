var purchaseTable;
$(function () {
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
            { "data": "shId" },
            { "data": "scdAmount" },
            { "data": "scdUnitPrice" },
            { "data": "scdTotalPrice" },
            { "data": "scdImeiList" },

        ],
        "columnDefs": [
            { "orderable": false, "targets": "_all" },
            { "visible": false, "targets": [1] },
            { "defaultContent":"", "targets":"_all"}
        ],

    });

    $(document).delegate('#addBtn','click',function() {
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
                shId:$("#shId").val(),
                scdAmount:$("#scdAmount").val(),
                scdUnitPrice:$("#scdUnitPrice").val(),
                scdTotalPrice:Number($("#scdAmount").val()*$("#scdUnitPrice").val()).toFixed(2),
                scdImeiList:$("#scdImeiList").val(),
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
    });

    $('#purchaseGoodsTable tbody').on('click', 'tr', function(event) {
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
    });

    $('#checkAllPurchaseGoods').click(function(){
        if(this.checked){
            $('#purchaseGoodsTable tbody tr').each(function(){
                if(!$(this).hasClass('selected')){
                    $(this).click();
                }
            });
        }else{
            $('#purchaseGoodsTable tbody tr').click();
        }
    });

    /**
     * 批量删除
     */
    $(document).delegate('#deleteAllPurchaseGoodsBtn','click',function() {
        var theArray=[];
        $(".check-box:checked").each(function() {
            theArray.push($(this).val());
        });
        if(theArray.length<1){
            alert("请至少选择一个");
        }else{
            $("#delAllSubmit").val(theArray);
            $(".modal-body").append('<h5>您确定要删除选中的<strong><span class="text-danger">'+theArray.length+'</span></strong>条记录吗？</h5>');
            $("#deleteAllPurchaseGoods").modal('show');
        }

    });
    /**
     * 点击确认删除按钮
     */
    $(document).delegate('#delAllSubmit','click',function(){
        purchaseTable.rows(".selected").remove().draw();
        var theArray = $(this).val();
        $('#deleteAllPurchaseGoods').modal('hide');
        /*$.ajax({
         url:"../../../goods/delAll.form",
         //          async:true,
         type:"POST",
         dataType:"json",
         data: {
         "theArray":theArray
         },
         cache:false,    //不允许缓存
         success: function(data){
         //            var obj = eval(data);
         if(data>0)
         {
         window.location.reload();
         }
         else
         {
         alert("删除失败");
         }

         },
         error:function(data){
         alert("请求异常");
         }
         });*/
    });
    /**
     * 单击保存按钮
     */
    $(document).delegate('#addBuyOrderBtn','click',function() {
        var rows = purchaseTable.rows().data();
        // rows = JSON.stringify(rows);
        alert(rows.length);
        var array = {};
        var array1 = new Array();
        for(var i=0;i<rows.length;i++) {
            array1.push(rows[i]);
            // array[i] = rows[i];
        }
        // alert(jQuery.isArray(rows));
        /*$.each(rows,function (n,value) {
         // alert(n + "" + value);
         alert(value.goodsName);
         $.each(value,function (x,zhi) {
         // alert(x + "" + zhi);
         array[x]=zhi;
         })
         /!*$.each(array,function (y,z) {
         alert(y+" "+z);
         })*!/
         array1.push(array);
         /!*$.each(array1,function (y,z) {
         alert(y+" "+z.goodsName);
         })*!/
         })*/
        $.ajax({
            url: "../../../salesContract/insert.form",
            type: "POST",
            data: {
                "dtbId": $("#dtbId").val(),
                "scDate": $("#scDate").val(),
                "scReceivable": $("#scReceivable").val(),
                "scAdvanced": $("#scAdvanced").val(),
                "scDiscount": $("#scDiscount").val(),
                "scOriginal": $("#scOriginal").val(),
                "scRemark": $("#scRemark").val(),
                "scAttn": $("#scAttn").val(),
                "scOperator": $("#scOperator").val(),
                "rows": JSON.stringify(array1)
                // "buyOrderDetails":rows
            },
            data_type: "json"
        });
    });
    /*function initComplete(data) {
     var editButtonsPurchase = '<button   class="btn btn-danger btn-sm" id="deleteAllPurchase">批量删除</button> <button   class="btn btn-success btn-sm "  id="addPurchaseBtn">新 增</button> <button   class="btn btn-warning btn-sm "  id="editPurchaseBtn">修 改</button>';
     $("#editButtonsPurchase").append(editButtonsPurchase);//在表格上方topPlugin DIV中追加HTML
     }*/
})

/**
 * 点击新增按钮事件
 */
$(document).delegate('#addPurchaseGoodsBtn','click',function() {
    
    $("#myModal-add-info").modal('show')/*.children(".modal-dialog").css({
     // width:"75%",
     'margin-right':5,
     // 'width':1200
     width: function () {
     return ($(this).parents(".right_col").width());
     }
     // 'margin-left': function () {
     //     return ($(this).parents(".right_col").width());
     // }
    });*/

});
