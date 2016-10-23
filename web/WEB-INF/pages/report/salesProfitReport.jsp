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
                <h3 class="page_title">销售利润表</h3>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>查看销售利润 <small>信息</small></h2>
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
                    下表显示了公司的销售利润情况
                  </p>
                  <div class="form-horizontal">
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="endDate">截止日期
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input id="endDate" name="endDate" class="date-picker form-control col-md-7 col-xs-12" type="text">
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                        <button type="reset" class="btn btn-primary">Cancel</button>
                        <button id="ivSearch" type="submit" class="btn btn-success">Submit</button>
                      </div>
                    </div>
                  </div>
                  <%--<div class="pull-left">
                    <button   class="btn btn-primary btn-sm "  id="saveBtn">保 存</button>
                  </div>--%>
                  <table id="datatable-scroller" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                      <th>编号</th>
                      <th>仓库号</th>
                      <th>日期</th>
                      <th>商品编号</th>
                      <th>商品名称</th>
                      <th>商品单位</th>
                      <th>商品类型</th>
                      <th>商品颜色</th>
                      <th>销售数量</th>
                      <th>销售单价</th>
                      <th>销售总额</th>
                      <th>销售单位成本</th>
                      <th>销售总成本</th>
                      <th>销售单位利润</th>
                      <th>销售总利润</th>
                    </tr>
                    </thead>
                    <tbody></tbody>
                  </table>

                </div>
              </div>
            </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <%@include file="/common/footer.jsp"%>
        <!-- /footer content -->
      </div>
    </div>

    <%@include file="/common/footerJs.jsp"%>
    <!-- Datatables -->
    <script src="${proPath}/build/js/salesProfitReportTables.js"></script>
    <!-- myForms -->
    <script src="${proPath}/build/js/salesProfitReportForms.js"></script>



  </body>
</html>