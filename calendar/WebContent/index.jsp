<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  errorPage="errorPage.jsp"%>
<%@ page import="java.util.Date" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>**的成长日记</title>
    		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    		<link href="fullcalendar1/fullcalendar/fullcalendar.css" rel="stylesheet" />
			<link href="fullcalendar1/fullcalendar/fullcalendar.print.css" rel="stylesheet" media="print" />
			<script src="fullcalendar1/jquery/jquery-1.9.1.min.js"></script>
			<script src="fullcalendar1/jquery/jquery-ui-1.10.2.custom.min.js"></script>
			<script src="fullcalendar1/fullcalendar/fullcalendar.min.js"></script>
			<!-- <script src="js/mother.js"></script> -->
			<script src="bootstrap/js/bootstrap.min.js"></script>
			
			<!-- artdialog包  start
			弹出dialog 所需的组件
			-->			
			<script src="artdialog/artDialog.js"></script>			
			<script src="artdialog/jquery.artDialog.js"></script>			
			<!-- artdialog包 end -->	
			
			<!-- artdialog 属性的组件
			如：dialog位置的计算等
			start -->	
			<script src="artdialog/plugins/iframeTools.source.js"></script>
			<script src="artdialog/_doc/demo.js"></script>
			<script src="artdialog/_doc/highlight/highlight.pack.js"></script>
			<script src="artdialog/_doc/highlight/languages/javascript.js"></script>
			<!-- artdialog 属性的组件 end -->
			
			<!-- dialog的样式 start-->
			<link type="text/css" rel="stylesheet" href="artdialog/skins/default.css"><!--必须  -->
			<!-- dialog的样式 end-->
			
			<!-- 提取出来  主js-->
			<script src="artdialog/mycalendar.js" charset="utf-8"></script>
			
			 
			
			<!--  事件拖动的js  加上以后不好用 
			<script src="artdialog/ui.draggable.js" charset="utf-8"></script> 
			<script src="artdialog/ui.core.js" charset="utf-8"></script>
			<script src="artdialog/ui.resizable.js" charset="utf-8"></script>
			 -->
			
<script>
	
	 
</script>
     			<style type="text/css">
     			body {
      				padding-top:10px;
      				font-family:"Segoe Script";
      				font-size:14px;
      				}
     			.header { 
      				width:100%;
      				margin-top:5px;
      				}
      			.container-fluid{
      				height:620px;
      				margin-top:5px;
      				background:url(images/create_bg.jpg);
      			}
      			.span8{
				}
				.span3{
				margin-left:10px;
				}
     			.navbar{
     				height:60px;
     				text-align:left;
      				padding-top:40px;
      				margin:0px;
      				width:80%;
      				
     			}
      			.nav{
      				margin:0px;
      				
      			}
      			.navbar-inner{
      				background-color:red;
      			}
      			#calendar {
      			
		width: 100%;
		margin: 0 auto;
		padding-top:30px;
		}
     			</style>
     			
	</head>
	<center>
	<body>
		
		
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="row">
				<div class="span1"></div>
					<div class="span8" align="center">
						<div class="navbar"> 
		 					
		     				<div id='calendar'></div>
		     		</div>
		     		</div>		     				     		
					
          		</div>
				</div>
				</div>
				<div class="header" style="padding-top:100px;">
					<div class="row">
					<div class="span6" align="center"></div>
					<div class="span4" align="center">
			<h1>Mother's Love</h1>
		</div>
				<div class="span2" align="center"></div>
			</div>
			</div>

		
	</body>
	</center>
	
      
</html>