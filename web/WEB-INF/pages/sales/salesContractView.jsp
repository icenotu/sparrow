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
                <h3 class="page_title">销售订单信息列表</h3>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>查看销售订单 <small>信息列表</small></h2>
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
                    下表显示了公司的销售订单信息
                  </p>
                  <div class="form-horizontal">
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="startDate">起始日期
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input id="startDate" name="startDate" class="date-picker form-control col-md-7 col-xs-12" type="text">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="endDate">截止日期
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input id="endDate" name="endDate" class="date-picker form-control col-md-7 col-xs-12" type="text">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="keyword">关键字筛选
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="keyword" name="keyword" class="form-control col-md-7 col-xs-12">
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                        <button type="reset" class="btn btn-primary">Cancel</button>
                        <button id="ivSearch" type="submit" class="btn btn-success">Submit</button>
                      </div>
                    </div>
                  </div>
                  <table id="datatable-scroller" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                      <th>订单编号</th>
                      <th>经销商</th>
                      <th>原始单号</th>
                      <th>订单应收</th>
                      <th>订单预收</th>
                      <th>订单折扣</th>
                      <th>签订日期</th>
                      <th>经手人</th>
                      <th>备注</th>
                      <th>订单状态</th>
                      <th>订单详情</th>
                    </tr>
                    </thead>
                    <tbody></tbody>
                  </table>

                </div>
              </div>
            </div>
            </div>
          </div>
          <!--订单详情页面开始-->
          <div class="modal fade" id="myModal-check-info" tabindex="-1" role="dialog"
               aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close"
                          data-dismiss="modal" aria-hidden="true">
                    &times;
                  </button>
                <div class="btn pull-right">
                  <input type="hidden" id="orderId"/>
                  <input type="text" id="level1"/>
                  <input type="button" id="level2" value="查询"/>
                </div>
                  <table id="orderInfo" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                      <th>商品名称</th>
                      <th>单位</th>
                      <th>商品类型</th>
                      <th>商品颜色</th>
                      <th>销售数量</th>
                      <th>销售单价</th>
                      <th>销售总价</th>
                      <th>串号列表</th>
                    </tr>
                    </thead>
                    <tbody></tbody>
                  </table>
                </div>
                <div class="modal-body">

                </div>
              </div><!-- /.modal-content -->
            </div>
          </div>
          <!--订单详情页面结束-->
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <%@include file="/common/footer.jsp"%>
        <!-- /footer content -->
      </div>
    </div>

    <%@include file="/common/footerJs.jsp"%>
    <!-- Datatables -->
    <script src="${proPath}/build/js/salesContractViewTables.js"></script>
    <!-- myForms -->
    <script src="${proPath}/build/js/salesContractViewForms.js"></script>



  </body>
</html>