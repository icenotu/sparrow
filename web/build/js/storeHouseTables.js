/**
 * Created by Administrator on 2016-09-21.
 */
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
            "url"  : "../../../storeHouse/select.form",
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
                data: "shId",
                render: function (data, type, row, meta) {
                    return '<input type="checkbox" class="check-box" value='+data+'>';
                }
            },
            { "data": "shId" },
            { "data": "shName" },
            { "data": "shResponsible" },
            { "data": "shPhone" },
            { "data": "shAddress" },
            { "data": "shType" },
            { "data": "shRemark" },
        ],
        "columnDefs": [
            { "orderable": false, "targets": "_all" },
            { "visible": false, "targets": [1] },
            { "defaultContent":"", "targets":"_all"}
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

//         $('#datatable-fixed-header').DataTable({
//          fixedHeader: true
//        });

//        TableManageButtons.init();
//        table.on('change', 'tbody tr .check-box', function () {
//          $(this).parents('tr').toggleClass("selected");
//          alert($(this).val());
//        });
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
});
/**
 * 批量删除
 */
$(document).delegate('#deleteAll','click',function() {
    var theArray=[];
    $(".check-box:checked").each(function() {
        theArray.push($(this).val());
    });
    if(theArray.length<1){
        alert("请至少选择一个");
    }else{
        $("#delAllSubmit").val(theArray);
        $(".modal-body").append('<h5>您确定要删除选中的<strong><span class="text-danger">'+theArray.length+'</span></strong>条记录吗？</h5>');
        $("#deleteAllModal").modal('show');
    }

});
/**
 * 点击确认删除按钮
 */
$(document).delegate('#delAllSubmit','click',function(){
    var theArray = $(this).val();
    $('#deleteAllModal').modal('hide');
    $.ajax({
        url:"../../../storeHouse/delAll.form",
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
    });
});
/**
 * 单击修改按钮
 */
$(document).delegate('#editBtn','click',function() {
    var editLength = table.rows('.selected').data().length;
    if (editLength==1) {
        var data = table.row('tr.selected').data();
        //
        // var abc = "supName";

        // alert(eval("data."+abc));
        // for(x in data) {
        //     alert(data[x]);
        // }
        $("#demo-form").find(".form-control").each(function () {
            var text = eval("data." + $(this).attr("name"));
            $(this).val(text);
        });

        $('#myModal-edit-info').modal('show');
    } else {
        alert("请选择一条您要修改的记录！")
    }
    // alert(table.rows('.selected').length);
    // alert(typeof data);
    // $.each(data, function(key,val) {
    //     alert("xx");
    //     alert(this);
    // });
});

/**
 * 点击新增按钮事件
 */
$(document).delegate('#addBtn','click',function() {
    $("#myModal-add-info").modal('show');
});
