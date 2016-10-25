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
                <h3 class="page_title">系统设置</h3>
              </div>
            </div>

            <div class="clearfix"></div>
            <%--supType表格begin--%>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>供应商类型 <small>设置</small></h2>
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
                    下表显示了公司供应商的类型信息
                  </p>
                  <div class="pull-left">
                    <button   class="btn btn-danger btn-sm" id="deleteSupType">批量删除</button>
                    <button   class="btn btn-success btn-sm "  id="addSupTypeBtn">新 增</button>
                    <button   class="btn btn-warning btn-sm "  id="editSupTypeBtn">修 改</button>
                  </div>
                  <div class="btn pull-right">
                    <input type="text" id="level1">
                    <input type="button" id="level2" value="查询">
                  </div>
                  <table id="supType" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                      <th><input type="checkbox" id="checkAllSupType"></th>
                      <th>系统参数编号</th>
                      <th>系统参数类型</th>
                      <th>供应商类型编号</th>
                      <th>供应商类型</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                  </table>

                </div>
              </div>
            </div>
            </div>
            <%--supType表格end--%>

          </div>
        </div>
        <!-- /page content -->
        <!--supType多个删除确认对话框begin-->
        <div class="modal fade" id="deleteAllSupType" tabindex="-1" role="dialog"
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
                  <button type="button" class="btn btn-primary" id="delSupTypeSubmit">
                    确认
                  </button>
                </div>
              </div><!-- /.modal-content -->
            </div>
          </form>
        </div>
        <!--supType多个删除确认对话框end-->
        <!--supType新增页面开始-->
        <div class="modal fade" id="supType-add-info" tabindex="-1" role="dialog"
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
                    <form id="addSupTypeForm" data-parsley-validate class="form-horizontal form-label-left" method="post">
                      <div class="form-group">
                        <input type="hidden" name="sysParamField" class="form-control" value="supType">
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sysParamValue">供应商类型编号 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="sysParamValue" name="sysParamValue" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sysParamText">供应商类型 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="sysParamText" name="sysParamText" required="required" class="form-control col-md-7 col-xs-12">
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
        <!--supType编辑页面开始-->
        <div class="modal fade" id="supType-edit-info" tabindex="-1" role="dialog"
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
                <form id="editSupTypeForm" data-parsley-validate class="form-horizontal form-label-left" method="post">
                  <div class="form-group">
                    <input type="hidden" name="sysParamId" class="form-control">
                  </div>
                  <div class="form-group">
                    <input type="hidden" name="sysParamField" class="form-control">
                  </div>
                  <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sysParamValue">供应商类型编号 <span class="required">*</span>
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="sysParamValue" required="required" class="form-control col-md-7 col-xs-12">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sysParamText">供应商类型 <span class="required">*</span>
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="sysParamText" required="required" class="form-control col-md-7 col-xs-12">
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
  <script src="${proPath}/build/js/supTypeTables.js"></script>
  <script src="${proPath}/build/js/supTypeForms.js"></script>



  </body>
</html>