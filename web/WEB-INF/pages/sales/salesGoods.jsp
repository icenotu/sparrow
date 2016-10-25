<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="proPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
  <%@include file="/common/header.jsp"%>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <%@include file="/common/menu.jsp"%>

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3 class="page_title">添加销售订单</h3>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>销售订单 <small>信息列表</small></h2>
                  <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                    <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                      <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Settings 1</a>
                        </li>
                        <li><a href="#">Settings 2</a>
                        </li>
                      </ul>
                    </li>
                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                    </li>
                  </ul>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <p class="text-muted font-13 m-b-30">
                    从下表中添加销售信息
                  </p>
                  <div class="pull-left">
                    <button   class="btn btn-danger btn-sm" id="deleteAllPurchaseGoodsBtn">批量删除</button>
                    <button   class="btn btn-success btn-sm "  id="addPurchaseGoodsBtn">新 增</button>
                    <button   class="btn btn-primary btn-sm "  id="addBuyOrderBtn">保 存</button>
                  </div>
                  <table id="purchaseGoodsTable" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                      <th><input type="checkbox" id="checkAllPurchaseGoods"></th>
                      <th>商品编号</th>
                      <th>商品名称</th>
                      <th>单位</th>
                      <th>商品类型</th>
                      <th>商品颜色</th>
                      <th>仓库编号</th>
                      <th>销售数量</th>
                      <th>销售单价</th>
                      <th>总价</th>
                      <th>串号列表</th>
                    </tr>
                    </thead>
                    <tbody></tbody>
                  </table>
                </div>

                <div class="x_content">
                  <div class="ln_solid"></div>
                  <form id="PurchaseGoodsForm" data-parsley-validate class="form-horizontal form-label-left" method="post">

                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="scOriginal">销售订单号 <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="scOriginal" name="scOriginal" required="required" class="form-control col-md-7 col-xs-12">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="scDate">签订日期 <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input id="scDate" name="scDate" class="date-picker form-control col-md-7 col-xs-12" required="required" type="text">
                      </div>
                    </div>
                    <div class="form-group">
                      <input type="hidden" id="dtbId" name="dtbId" class="form-control">
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="dtbName">经销商名称 <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="dtbName" name="dtbName" required="required" class="form-control col-md-7 col-xs-12">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="scReceivable">应收 <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="scReceivable" name="scReceivable" required="required" class="form-control col-md-7 col-xs-12">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="scAdvanced">预收 <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="scAdvanced" name="scAdvanced" required="required" class="form-control col-md-7 col-xs-12">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="scDiscount">折扣 <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="scDiscount" name="scDiscount" required="required" class="form-control col-md-7 col-xs-12">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="scAttn">经手人 <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="scAttn" name="scAttn" required="required" class="form-control col-md-7 col-xs-12">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="scOperator">操作员 <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="scOperator" name="scOperator" required="required" class="form-control col-md-7 col-xs-12">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="scRemark">备注
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="scRemark" name="scRemark" class="form-control col-md-7 col-xs-12">
                      </div>
                    </div>
                  </form>
                </div>
              </div>


            </div>
            </div>
          </div>
          <!--新增页面开始-->
            <div class="modal fade" id="myModal-add-info" tabindex="-1" role="dialog"
                 aria-labelledby="myModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close"
                            data-dismiss="modal" aria-hidden="true">
                      &times;
                    </button>
                    <c:import url="/base/goURL/goods/goodsSelect.form"/>
                  </div>
                  <div class="modal-body">
                    <form id="addPurchaseGoodsForm" data-parsley-validate class="form-horizontal form-label-left" method="post">

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="scdAmount">销售数量 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="scdAmount" name="scdAmount" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="scdUnitPrice">销售单价 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="scdUnitPrice" name="scdUnitPrice" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="shId">发货仓库 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="shId" name="shId" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="scdImeiList">串号列表</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="scdImeiList" name="scdImeiList" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>



                    </form>
                  </div>
              </div><!-- /.modal-content -->
              </div>
        </div>
          <!--经销商选择页面开始-->
          <div class="modal fade" id="myModal-supplier-info" tabindex="-1" role="dialog"
               aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close"
                          data-dismiss="modal" aria-hidden="true">
                    &times;
                  </button>
                  <c:import url="/base/goURL/sales/distributorSelect.form"/>
                </div>
              </div><!-- /.modal-content -->
            </div>
          </div>
        <!-- /page content -->
        <!--多个删除确认对话框begin-->
        <div class="modal fade" id="deleteAllPurchaseGoods" tabindex="-1" role="dialog"
             aria-labelledby="myModalLabel" aria-hidden="true">
          <form class="form-horizontal" role="form">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close"
                          data-dismiss="modal" aria-hidden="true">
                    &times;
                  </button>
                  <h4 class="modal-title" id="myModalLabelDel">
                    提示信息
                  </h4>
                </div>
                <div class="modal-body" style="text-align: left;">
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-default"
                          data-dismiss="modal">取消
                  </button>
                  <button type="button" class="btn btn-primary" id="delAllSubmit">
                    确认
                  </button>
                </div>
              </div><!-- /.modal-content -->
            </div>
          </form>
        </div>
        <!--多个删除确认对话框end-->


        <!-- footer content -->
        <%@include file="/common/footer.jsp"%>
        <!-- /footer content -->
      </div>
    </div>

    <%@include file="/common/footerJs.jsp"%>
    <!-- Datatables -->
    <script src="${proPath}/build/js/salesTables.js"></script>
    <!-- myForms -->
    <script src="${proPath}/build/js/salesForms.js"></script>



  </body>
</html>