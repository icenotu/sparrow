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
                <h3 class="page_title">供应商信息列表</h3>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>查看供应商 <small>信息列表</small></h2>
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
                    下表显示了公司供应商的信息
                  </p>

                  <div class="btn pull-right">
                    <input type="text" id="level1">
                    <input type="button" id="level2" value="查询">
                  </div>
                  <table id="datatable-scroller" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                      <th><input type="checkbox" id="checkAll"></th>
                      <th>供应商编号</th>
                      <th>供应商名称</th>
                      <th>联系人</th>
                      <th>电话</th>
                      <th>地址</th>
                      <th>备注</th>
                      <th>应付账款</th>
                      <th>供应商类别</th>
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
                  <!--
                      <button type="button" class="btn btn-default"
                              data-dismiss="modal">取消
                      </button>
                       -->
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
                  <%--
                      <div class="form-group">
                          <label class="col-sm-3 control-label no-padding-right" >图 片：</label>
                          <div class="col-sm-5">
                              <input  type="file" name="img1" class="file" id="img1"  style="width:180px; float: left" />
                          </div>
                          <div class="col-sm-3">
                              <input class="btn btn-sm btn-info" type="button" value="上传" id="uploadimg"/><span id="t"></span>
                          </div>
                          <input name="categoryImg" type="hidden" id="imageUrl" />
                      </div>
                      --%>
                    <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" method="post">

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="supName">供应商名称 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="supName" name="supName" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="supLinkman">联系人 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="supLinkman" name="supLinkman" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="supPhone">联系电话 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="supPhone" name="supPhone" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="supAddress">地址 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="supAddress" name="supAddress" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="supRemark">备注</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="supRemark" name="supRemark" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="supPay">应付账款 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="supPay" name="supPay" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="supType">供应商类型 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <select class="select2_single form-control" tabindex="-1" id="supType" name="supType">
                            <c:forEach items="${applicationScope.sysParamMap.supType}" var="st">
                              <option value="${st.key}">${st.value}</option>
                            </c:forEach>
                          </select>
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
                <%--
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" >图 片：</label>
                        <div class="col-sm-5">
                            <input  type="file" name="img1" class="file" id="img1"  style="width:180px; float: left" />
                        </div>
                        <div class="col-sm-3">
                            <input class="btn btn-sm btn-info" type="button" value="上传" id="uploadimg"/><span id="t"></span>
                        </div>
                        <input name="categoryImg" type="hidden" id="imageUrl" />
                    </div>
                    --%>
                <form id="demo-form" data-parsley-validate class="form-horizontal form-label-left" method="post">
                  <div class="form-group">
                    <input type="hidden" name="supId" class="form-control">
                  </div>
                  <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="supName">供应商名称 <span class="required">*</span>
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="supName" required="required" class="form-control col-md-7 col-xs-12">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="supLinkman">联系人 <span class="required">*</span>
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="supLinkman" required="required" class="form-control col-md-7 col-xs-12">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="supPhone">联系电话 <span class="required">*</span>
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="supPhone" required="required" class="form-control col-md-7 col-xs-12">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="supAddress">地址 <span class="required">*</span>
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="supAddress" required="required" class="form-control col-md-7 col-xs-12">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="supRemark">备注</label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="supRemark" class="form-control col-md-7 col-xs-12">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="supPay">应付账款 <span class="required">*</span>
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="supPay" required="required" class="form-control col-md-7 col-xs-12">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="supType">供应商类型 <span class="required">*</span>
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                      <select class="select2_single form-control" tabindex="-1" name="supType">
                        <c:forEach items="${applicationScope.sysParamMap.supType}" var="st">
                          <option value="${st.key}">${st.value}</option>
                        </c:forEach>
                      </select>
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
    <script src="${proPath}/build/js/myDataTables.js"></script>
    <!-- myForms -->
    <script src="${proPath}/build/js/myForms.js"></script>



  </body>
</html>