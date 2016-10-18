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
                <h3 class="page_title">添加采购订单</h3>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>采购订单 <small>信息列表</small></h2>
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
                    从下表中添加采购信息
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
                      <th>采购数量</th>
                      <th>采购进价</th>
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
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="boOriginal">采购订单号 <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="boOriginal" name="boOriginal" required="required" class="form-control col-md-7 col-xs-12">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="boDate">采购日期 <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input id="boDate" name="boDate" class="date-picker form-control col-md-7 col-xs-12" required="required" type="text">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="shId">仓库 <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="shId" name="shId" required="required" class="form-control col-md-7 col-xs-12">
                      </div>
                    </div>
                    <div class="form-group">
                      <input type="hidden" id="supId" name="supId" class="form-control">
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="supName">供应商名称 <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="supName" name="supName" required="required" class="form-control col-md-7 col-xs-12">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="boPayable">应付 <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="boPayable" name="boPayable" required="required" class="form-control col-md-7 col-xs-12">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="boPaid">已付 <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="boPaid" name="boPaid" required="required" class="form-control col-md-7 col-xs-12">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="boArrears">欠款 <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="boArrears" name="boArrears" required="required" class="form-control col-md-7 col-xs-12">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="boAttn">经手人 <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="boAttn" name="boAttn" required="required" class="form-control col-md-7 col-xs-12">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="boOperator">操作员 <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="boOperator" name="boOperator" required="required" class="form-control col-md-7 col-xs-12">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="boRemark">备注
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="boRemark" name="boRemark" class="form-control col-md-7 col-xs-12">
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
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="bodAmount">采购数量 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="bodAmount" name="bodAmount" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="bodBuyPrice">采购进价 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="bodBuyPrice" name="bodBuyPrice" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="bodImeiList">串号列表</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="bodImeiList" name="bodImeiList" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>



                    </form>
                  </div>
              </div><!-- /.modal-content -->
              </div>
        </div>
          <!--供应商选择页面开始-->
          <div class="modal fade" id="myModal-supplier-info" tabindex="-1" role="dialog"
               aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close"
                          data-dismiss="modal" aria-hidden="true">
                    &times;
                  </button>
                  <c:import url="/base/goURL/suppliers/supplierSelect.form"/>
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
    <script src="${proPath}/build/js/purchaseTables.js"></script>
    <!-- myForms -->
    <script src="${proPath}/build/js/purchaseForms.js"></script>



  </body>
</html>