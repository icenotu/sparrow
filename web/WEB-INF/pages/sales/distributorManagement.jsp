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
                <h3 class="page_title">经销商信息列表</h3>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>查看经销商 <small>信息列表</small></h2>
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
                    下表显示了公司经销商的信息
                  </p>
                  <div class="pull-left">
                    <button   class="btn btn-danger btn-sm" id="deleteAll">批量删除</button>
                    <button   class="btn btn-success btn-sm "  id="addBtn">新 增</button>
                    <button   class="btn btn-warning btn-sm "  id="editBtn">修 改</button>
                  </div>
                  <div class="btn pull-right">
                    <input type="text" id="level1">
                    <input type="button" id="level2" value="查询">
                  </div>
                  <table id="datatable-scroller" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                      <th><input type="checkbox" id="checkAll"></th>
                      <th>经销商编号</th>
                      <th>经销商名称</th>
                      <th>联系人</th>
                      <th>电话</th>
                      <th>地址</th>
                      <th>应收账款</th>
                      <th>经销商类别</th>
                      <th>备注</th>
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
        <!--多个删除确认对话框begin-->
        <div class="modal fade" id="deleteAllModal" tabindex="-1" role="dialog"
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
                <h4 class="modal-title" id="myModalLabelAdd">
                  新 增
                </h4>
              </div>
                <div class="modal-body">
                    <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" method="post">

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="dtbName">经销商名称 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="dtbName" name="dtbName" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="dtbLinkman">联系人 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="dtbLinkman" name="dtbLinkman" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="dtbPhone">联系电话 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="dtbPhone" name="dtbPhone" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="dtbAddress">地址 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="dtbAddress" name="dtbAddress" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="dtbReceivable">应收账款 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="dtbReceivable" name="dtbReceivable" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="dtbType">经销商类型 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="dtbType" name="dtbType" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                        <%--<div class="col-md-6 col-sm-6 col-xs-12">
                          <select class="select2_single form-control" tabindex="-1" id="dtbType" name="dtbType">
                            <c:forEach items="${applicationScope.sysParamMap.supType}" var="st">
                              <option value="${st.key}">${st.value}</option>
                            </c:forEach>
                          </select>
                        </div>--%>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="dtbRemark">备注</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="dtbRemark" name="dtbRemark" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>

                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button data-dismiss="modal" aria-hidden="true" class="btn btn-primary">Cancel</button>
                          <button type="submit" class="btn btn-success">Submit</button>
                        </div>
                      </div>

                    </form>
                </div>
            </div><!-- /.modal-content -->
          </div>
        </div>
        <!--编辑页面开始-->
        <div class="modal fade" id="myModal-edit-info" tabindex="-1" role="dialog"
             aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                  &times;
                </button>
                <h4 class="modal-title" id="myModalLabelEdit">
                  修 改
                </h4>
              </div>
              <div class="modal-body">
                <form id="demo-form" data-parsley-validate class="form-horizontal form-label-left" method="post">
                  <div class="form-group">
                    <input type="hidden" name="dtbId" class="form-control">
                  </div>
                  <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="dtbName">经销商名称 <span class="required">*</span>
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="dtbName" required="required" class="form-control col-md-7 col-xs-12">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="dtbLinkman">联系人 <span class="required">*</span>
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="dtbLinkman" required="required" class="form-control col-md-7 col-xs-12">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="dtbPhone">联系电话 <span class="required">*</span>
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="dtbPhone" required="required" class="form-control col-md-7 col-xs-12">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="dtbAddress">地址 <span class="required">*</span>
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="dtbAddress" required="required" class="form-control col-md-7 col-xs-12">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="dtbReceivable">应收账款 <span class="required">*</span>
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="dtbReceivable" required="required" class="form-control col-md-7 col-xs-12">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="dtbType">经销商类型 <span class="required">*</span>
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="dtbType" required="required" class="form-control col-md-7 col-xs-12">
                    </div>
                    <%--<div class="col-md-6 col-sm-6 col-xs-12">
                      <select class="select2_single form-control" tabindex="-1" id="dtbType" name="dtbType">
                        <c:forEach items="${applicationScope.sysParamMap.supType}" var="st">
                          <option value="${st.key}">${st.value}</option>
                        </c:forEach>
                      </select>
                    </div>--%>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="dtbRemark">备注</label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="dtbRemark" class="form-control col-md-7 col-xs-12">
                    </div>
                  </div>

                  <div class="ln_solid"></div>
                  <div class="form-group">
                    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                      <button data-dismiss="modal" aria-hidden="true" class="btn btn-primary">Cancel</button>
                      <button type="submit" class="btn btn-success">Submit</button>
                    </div>
                  </div>

                </form>
              </div>
            </div><!-- /.modal-content -->
          </div>
        </div>
        <!-- footer content -->
        <%@include file="/common/footer.jsp"%>
        <!-- /footer content -->
      </div>
    </div>

    <%@include file="/common/footerJs.jsp"%>
    <!-- Datatables -->
    <script src="${proPath}/build/js/distributorTables.js"></script>
    <!-- myForms -->
    <script src="${proPath}/build/js/distributorForms.js"></script>



  </body>
</html>