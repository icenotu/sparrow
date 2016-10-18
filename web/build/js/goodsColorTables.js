/**
 * Created by Administrator on 2016-09-30.
 */
/**
 * Created by Administrator on 2016-09-21.
 */
var table;
$(function() {
    table = $('#goodsColor').DataTable({
        // dom: "f<'clear'>l<'#editButtons'<'pull-right'B>>rtip",
        dom: "l<'#editButtons'<'pull-right'B>>rtip",
        "pagingType": "full_numbers",//设置分页控件的模式
        buttons: [
            {
                extend: "copy",
                className: "btn-sm pull-right",
                title: 'GoodsColor List',
                exportOptions:{
                    columns: "thead th:not(.td-checkbox)"
                }
            },
            {
                extend: "csv",
                className: "btn-sm pull-right",
                title: 'GoodsColor List',
                exportOptions:{
                    columns: "thead th:not(.td-checkbox)"
                }
            },
            {
                extend: "excel",
                className: "btn-sm pull-right",
                title: 'GoodsColor List',
                exportOptions:{
                    columns: "thead th:not(.td-checkbox)"
                }
            },
            {
                extend: "print",
                className: "btn-sm pull-right",
                title: 'GoodsColor List',
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
        "columnDefs": [
            { "orderable": false, "targets": "_all" },
            { "visible": false, "targets": [1,2] }
        ],
        serverSide:true,
        ajax: {
            "url"  : "../../../sysParam/selectGoodsColor.form?paramType=goodsColor",
            "data" : function ( d ) {
                var level1 = "%"+$('#searchColor1').val()+"%";
                //添加额外的参数传给服务器
                d.keyword = level1;
            }},

        "columns": [
            { //复选框单元格
                className: "td-checkbox",
                orderable: false,
                width: "30px",
                data: "sysParamId",
                render: function (data, type, row, meta) {
                    return '<input type="checkbox" class="check-box" value='+data+'>';
                }
            },
            { "data": "sysParamId" },
            { "data": "sysParamField" },
            { "data": "sysParamValue" },
            { "data": "sysParamText" },
        ],
        
        initComplete:initComplete,
        'drawCallback': function( settings ) {
            $('#checkAllGoodsColor').checked = false;//取消全选状态
        }
    });


    function initComplete(data) {
        var editButtons = '<button   class="btn btn-danger btn-sm" id="deleteGoodsColor">批量删除</button> <button   class="btn btn-success btn-sm "  id="addGoodsColorBtn">新 增</button> <button   class="btn btn-warning btn-sm "  id="editGoodsColorBtn">修 改</button>';
        $("#editButtons").append(editButtons);//在表格上方topPlugin DIV中追加HTML
    }
    function searchGoodsColor()
    {
        table.ajax.reload();
    }
    $(document).keydown(function(event){
        if(event.keyCode==13){
            searchGoodsColor();
        }
    });
    $("#searchColor2").click(function(){
        searchGoodsColor();
    });
    /**
     * 多选选中和取消选中,同时选中第一个单元格单选框,并联动全选单选框
     */
    $('#goodsColor tbody').on('click', 'tr', function(event) {
        var allChecked=$('#checkAllSupType');//关联全选单选框
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
    $('#checkAllSupType').click(function(){
        if(this.checked){
            $('#goodsColor tbody tr').each(function(){
                if(!$(this).hasClass('selected')){
                    $(this).click();
                }
            });
        }else{
            $('#goodsColor tbody tr').click();
        }
    });
    /**
     * 批量删除
     */
    $(document).delegate('#deleteGoodsColor','click',function() {
        var theArray=[];
        $(".check-box:checked").each(function() {
            theArray.push($(this).val());
        });
        if(theArray.length<1){
            alert("请至少选择一个");
        }else{
            $("#delGoodsColorSubmit").val(theArray);
            $(".modal-body").append('<h5>您确定要删除选中的<strong><span class="text-danger">'+theArray.length+'</span></strong>条记录吗？</h5>');
            $("#deleteAllGoodsColor").modal('show');
        }

    });
    /**
     * 点击确认删除按钮
     */
    $(document).delegate('#delGoodsColorSubmit','click',function(){
        var theArray = $(this).val();
        $('#deleteAllGoodsColor').modal('hide');
        $.ajax({
            url:"../../../sysParam/delSysParam.form",
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
    $(document).delegate('#editGoodsColorBtn','click',function() {
        var editLength = table.rows('.selected').data().length;
        if (editLength==1) {
            var data = table.row('tr.selected').data();

            $("#editGoodsColorForm").find(".form-control").each(function () {
                var text = eval("data." + $(this).attr("name"));
                $(this).val(text);
            });

            $('#goodsColor-edit-info').modal('show');
        } else {
            alert("请选择一条您要修改的记录！")
        }
    });

    /**
     * 点击新增按钮事件
     */
    $(document).delegate('#addGoodsColorBtn','click',function() {
        $("#goodsColor-add-info").modal('show');
    });
});


