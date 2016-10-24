<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="proPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<%@include file="/common/header.jsp"%>
<body class="nav-md">
    <div class="container body">
      <div class="main_container">
          <%--<div class="col-md-3 left_col">
              <div class="left_col scroll-view">
                  <div class="navbar nav_title" style="border: 0;">
                      <a href="${proPath}/base/goURL/index/index.form" class="site_title"><i class="fa fa-paw"></i> <span>Gentellela Alela!</span></a>
                  </div>

                  <div class="clearfix"></div>

                  <!-- menu profile quick info -->
                  <div class="profile">
                      <div class="profile_pic">
                          <img src="${proPath}/images/img.jpg" alt="..." class="img-circle profile_img">
                      </div>
                      <div class="profile_info">
                          <span>Welcome,</span>
                          <h2>John Doe</h2>
                      </div>
                  </div>
                  <!-- /menu profile quick info -->

                  <br />

                  <!-- sidebar menu -->
                  <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                      <div class="menu_section">
                          <h3>General</h3>
                          <ul class="nav side-menu">
                              <li class="active"><a><i class="fa fa-home"></i> 主页 <span class="fa fa-chevron-down"></span></a>
                                  <ul class="nav child_menu" style="display: block">
                                      <li class="current-page"><a href="${proPath}/base/goURL/index/index.form">公司简介</a></li>
                                  </ul>
                              </li>
                              <li><a><i class="fa fa-edit"></i> 供应商管理 <span class="fa fa-chevron-down"></span></a>
                                  <ul class="nav child_menu">
                                      <li><a href="${proPath}/base/goURL/suppliers/supplierManagement.form">供应商信息</a></li>
                                  </ul>
                              </li>
                          </ul>
                      </div>
                  </div>
                  <!-- /sidebar menu -->
              </div>
          </div>

          <!-- top navigation -->
          <div class="top_nav">
              <div class="nav_menu">
                  <nav class="" role="navigation">
                      <div class="nav toggle">
                          <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                      </div>

                      <ul class="nav navbar-nav navbar-right">
                          <li class="">
                              <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                  <img src="${proPath}/images/img.jpg" alt="">John Doe
                                  <span class=" fa fa-angle-down"></span>
                              </a>
                              <ul class="dropdown-menu dropdown-usermenu pull-right">
                                  <li><a href="javascript:;"> Profile</a></li>
                                  <li>
                                      <a href="javascript:;">
                                          <span class="badge bg-red pull-right">50%</span>
                                          <span>Settings</span>
                                      </a>
                                  </li>
                                  <li><a href="javascript:;">Help</a></li>
                                  <li><a href="../login.html"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                              </ul>
                          </li>

                          <li role="presentation" class="dropdown">
                              <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                                  <i class="fa fa-envelope-o"></i>
                                  <span class="badge bg-green">6</span>
                              </a>
                              <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                                  <li>
                                      <a>
                                          <span class="image"><img src="${proPath}/images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                                      </a>
                                  </li>
                                  <li>
                                      <a>
                                          <span class="image"><img src="${proPath}/images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                                      </a>
                                  </li>
                                  <li>
                                      <a>
                                          <span class="image"><img src="${proPath}/images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                                      </a>
                                  </li>
                                  <li>
                                      <a>
                                          <span class="image"><img src="${proPath}/images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                                      </a>
                                  </li>
                                  <li>
                                      <div class="text-center">
                                          <a>
                                              <strong>See All Alerts</strong>
                                              <i class="fa fa-angle-right"></i>
                                          </a>
                                      </div>
                                  </li>
                              </ul>
                          </li>
                      </ul>
                  </nav>
              </div>
          </div>
          <!-- /top navigation -->--%>
              <%@include file="/common/menu.jsp"%>
        <!-- page content -->
        <div class="right_col" role="main">
          <h1 align="center">欢迎使用Icenotu进销存管理系统</h1>
        </div>
        <!-- /page content -->
        <%@include file="/common/footer.jsp"%>
      </div>
    </div>

    <%@include file="/common/footerJs.jsp"%>


  </body>
</html>