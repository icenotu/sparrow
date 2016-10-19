<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<c:set var="proPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="js/jquery-3.0.0.js"></script>

  
    <title>My JSP 'json.jsp' starting page</title>
  	<%--<script type="text/javascript">
  		$(function(){
	  			$("#bt1").click(
	  				function(){
                        $.post(
		  					"supplier/doAjax.form",
		  					{supId:1001,supName:"name1001",supLinkman:"杨鹏",supPhone:"15073498702",supAddress:"钢管厂",supRemark:"一级供应商"},
		  					function(json){
		  						alert(json.supId+"||"+json.supName+"||"+json.supLinkman+"||"+json.supPhone+"||"+json.supAddress+"||"+json.supRemark);
		  					},
		  					"json"
		  				);
		  			}
	  			);	  			
	  		}
  		);
  	
  	</script>--%>


    <script type="text/javascript">
        $(function(){
                    $("#bt1").click(
                            function(){
                                $.post(
                                        "supplier/dataTest.form",
                                        function(json){
                                            alert(json.aaData[0]);
                                        },
                                        "json"
                                );
                            }
                    );
                }
        );

    </script>
  </head>  
  <body>
 	<button id="bt1" >testJson</button> 
  </body>
</html>