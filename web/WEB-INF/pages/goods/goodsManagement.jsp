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
                <h3 class="page_title">商品信息列表</h3>
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
                    下表显示了公司所有商品的信息
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
                    <form id="addGoodsForm" data-parsley-validate class="form-horizontal form-label-left" method="post">

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="goodsName">商品名称 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="goodsName" name="goodsName" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="goodsUnit">单位
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="goodsUnit" name="goodsUnit" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="goodsType">商品类型
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="goodsType" name="goodsType" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="goodsColor">商品颜色 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <select class="select2_single form-control" tabindex="-1" id="goodsColor" name="goodsColor" required="required">
                            <c:forEach items="${applicationScope.sysParamMap.goodsColor}" var="gc">
                              <option value="${gc.key}">${gc.value}</option>
                            </c:forEach>
                          </select>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="goodsStore">仓库名
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="goodsStore" name="goodsStore" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="goodsLimit">限价
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="goodsLimit" name="goodsLimit" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="goodsCommission">佣金
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="goodsCommission" name="goodsCommission" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="goodsProducer">供应产商
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="goodsProducer" name="goodsProducer" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="goodsRemark">备注</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="goodsRemark" name="goodsRemark" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="goodsSelPrice">商品售价 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="goodsSelPrice" name="goodsSelPrice" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="goodsBuyPrice">商品进价 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="goodsBuyPrice" name="goodsBuyPrice" required="required" class="form-control col-md-7 col-xs-12">
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
                    <input type="hidden" name="goodsId" class="form-control">
                  </div>
                  <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="goodsName">商品名称 <span class="required">*</span>
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="goodsName" required="required" class="form-control col-md-7 col-xs-12">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="goodsUnit">单位
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="goodsUnit" class="form-control col-md-7 col-xs-12">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="goodsType">商品类型
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="goodsType" class="form-control col-md-7 col-xs-12">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="goodsColor">商品颜色 <span class="required">*</span>
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                      <select class="select2_single form-control" tabindex="-1" name="goodsColor" required="required">
                        <c:forEach items="${applicationScope.sysParamMap.goodsColor}" var="gc">
                          <option value="${gc.key}">${gc.value}</option>
                        </c:forEach>
                      </select>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="goodsStore">仓库名
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="goodsStore" class="form-control col-md-7 col-xs-12">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="goodsLimit">限价
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="goodsLimit" class="form-control col-md-7 col-xs-12">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="goodsCommission">佣金
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="goodsCommission" class="form-control col-md-7 col-xs-12">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="goodsProducer">供应产商
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="goodsProducer" class="form-control col-md-7 col-xs-12">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="goodsRemark">备注</label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="goodsRemark" class="form-control col-md-7 col-xs-12">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="goodsSelPrice">商品售价 <span class="required">*</span>
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="goodsSelPrice" required="required" class="form-control col-md-7 col-xs-12">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="goodsBuyPrice">商品进价 <span class="required">*</span>
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="goodsBuyPrice" required="required" class="form-control col-md-7 col-xs-12">
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
    <script src="${proPath}/build/js/goodsTables.js"></script>
    <!-- myForms -->
    <script src="${proPath}/build/js/goodsForms.js"></script>



  </body>
</html>