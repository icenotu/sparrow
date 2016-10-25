/**
 * Created by Administrator on 2016-09-21.
 */

$(function() {
    var supplierSelect;

    supplierSelect = $('#supplierSelect').DataTable({
        //aLengthMenu:[5],//设置一页展示10条记录
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
            "url"  : "../../../supplier/dataTest.form",
            "data" : function ( d ) {
                var level1 = $('#level1').val();
                //添加额外的参数传给服务器
                d.extra_search = level1;
            },
        },

        "columns": [
            { //复选框单元格
                className: "td-checkbox",
                orderable: false,
                width: "30px",
                data: "supId",
                render: function (data, type, row, meta) {
                    return '<input type="checkbox" class="check-box icheckbox_flat-green" value='+data+'>';
                }
            },
            { "data": "supId" },
            { "data": "supName" },
            { "data": "supLinkman" },
            { "data": "supPhone" },
            { "data": "supAddress" },
            { "data": "supRemark" },
            { "data": "supPay" },
            { "data": "supType" },
        ],
        "columnDefs": [
            { "orderable": false, "targets": "_all" },
            { "visible": false, "targets": [1] },
            {"className": "none","targets":[6,7,8]}
        ],
        'drawCallback': function( settings ) {
            $('#checkAll').checked = false;//取消全选状态
        }
    });

    function searchSupplier()
    {
        supplierSelect.ajax.reload();
    }
    $(document).keydown(function(event){
        if(event.keyCode==13){
            searchSupplier();
        }
    });
    $("#level2").click(function(){
            searchSupplier();
    });
    /*$("#checkAll").on("click", function () {
     alert("bb");
     if ($(this).prop("checked") === true) {
     $(".check-box").prop("checked", $(this).prop("checked"));
     $('#datatable-scroller tbody tr').addClass('selected');
     } else {
     $(".check-box").prop("checked", false);
     $('#datatable-scroller tbody tr').removeClass('selected');
     }
     });*/
    /**
     * 多选选中和取消选中,同时选中第一个单元格单选框,并联动全选单选框
     */
    $('#supplierSelect tbody').on('click', 'tr', function(event) {
        var allChecked=$('#checkAll');//关联全选单选框
        $($(this).children()[0]).children().each(function(){
            if(this.type=="checkbox" && (!$(event.target).is(":checkbox") && $(":checkbox",this).trigger("click"))){
                if(!this.checked){
                    this.checked = true;
                    var selected=supplierSelect.rows('.selected').data().length;//被选中的行数
                    //全选单选框的状态处理
                    var recordsDisplay=supplierSelect.page.info().recordsDisplay;//搜索条件过滤后的总行数
                    var iDisplayStart=supplierSelect.page.info().start;// 起始行数
                    if(selected === supplierSelect.page.len()||selected === recordsDisplay||selected === (recordsDisplay - iDisplayStart)){
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



    /**
     * 全选按钮被点击事件
     */
    $('#checkAll').click(function(){
        if(this.checked){
            $('#supplierSelect tbody tr').each(function(){
                if(!$(this).hasClass('selected')){
                    $(this).click();
                }
            });
        }else{
            $('#supplierSelect tbody tr').click();
        }
    });

    /**
     * 单击保存按钮
     */
    $(document).delegate('#saveBtn','click',function() {
        var editLength = supplierSelect.rows('.selected').data().length;
        if (editLength==1) {
            var data = supplierSelect.row('tr.selected').data();
            // alert(data.supId);
            $('#supId').val(data.supId);
            $('#supName').val(data.supName);
            $('#myModal-supplier-info').modal('hide');
            $('#myModal-supplier-info').on('hidden.bs.modal', function () {
                // 当界面不可见是取消所有勾选
                $('#supplierSelect tbody tr').each(function() {
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
});