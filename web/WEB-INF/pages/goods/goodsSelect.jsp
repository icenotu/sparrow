<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="proPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">

        <!-- page content -->
        <div class="row" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_center">
                <h3 class="page_title" style="text-align: center">请填写采购信息</h3>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>查看商品 <small>信息列表</small></h2>
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
                    请选择要采购的商品信息
                  </p>
                  <div class="row">
                    <div class="btn pull-left">
                      <button   class="btn btn-primary btn-sm "  id="addBtn"><i class="fa fa-save"></i>&nbsp;&nbsp;保&nbsp;存</button>
                    </div>
                    <div class="btn pull-right">
                      <input type="text" id="level1">
                      <input type="button" id="level2" value="查询">
                    </div>
                  </div>
                  <table id="datatable-scroller" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                      <th><input type="checkbox" id="checkAll"></th>
                      <th>商品编号</th>
                      <th>商品名称</th>
                      <th>单位</th>
                      <th>商品类型</th>
                      <th>商品颜色</th>
                      <th>仓库名</th>
                      <th>限价</th>
                      <th>佣金</th>
                      <th>供应产商</th>
                      <th>备注</th>
                      <th>商品售价</th>
                      <th>商品进价</th>
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
        <%--<%@include file="/common/footer.jsp"%>--%>
        <!-- /footer content -->
      </div>
    </div>

    <%@include file="/common/footerJs.jsp"%>
    <script src="${proPath}/build/js/goodsSelectTables.js"></script>




  </body>
</html>