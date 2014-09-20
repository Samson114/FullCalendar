<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  errorPage="errorPage.jsp"%>
<%@ page import="java.util.Date" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>fullcalendar</title>
    		
    		<link href="fullcalendar/css/fullcalendar.css" rel="stylesheet" />
			<link href="fullcalendar/css/fullcalendar.print.css" rel="stylesheet" media="print" />
			<script src="fullcalendar/jquery/jquery-1.9.1.min.js"></script>
			<script src="fullcalendar/jquery/jquery-ui-1.10.2.custom.min.js"></script>
			<script src="fullcalendar/js/fullcalendar.min.js"></script>
			
			
			
			<!-- artdialog包  start弹出dialog 所需的组件-->			
			<script src="fullcalendar/js/artDialog.js"></script>						
			<!-- artdialog包 end -->	
			
			<!-- artdialog 属性的组件
			如：dialog位置的计算等
			start -->	
			<script src="fullcalendar/js/iframeTools.source.js"></script>
			
			<!-- artdialog 属性的组件 end -->
			
			<!-- dialog的样式 start-->
			<link type="text/css" rel="stylesheet" href="fullcalendar/css/default.css"><!--必须  -->
			<!-- dialog的样式 end-->
			
			<!-- 提取出来  主js-->
			<script src="fullcalendar/mycalendar.js" charset="utf-8"></script>
			
			 
			
<STYLE>
body {
	text-align: center; margin-top: 40px; font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif; font-size: 14px
}
#wrap {
	margin: 0px auto; width: 1100px
}
#external-events {
	border-bottom: #ccc 1px solid; text-align: left; border-left: #ccc 1px solid; padding-bottom: 0px; padding-left: 10px; width: 150px; padding-right: 10px; BACKGROUND: #eee; float: left; border-top: #ccc 1px solid; border-right: #ccc 1px solid; padding-top: 0px
}
#external-events h4 {
	margin-top: 0px; font-size: 16px; padding-top: 1em
}
.external-event {
	padding-bottom: 2px; margin: 10px 0px; padding-left: 4px; padding-right: 4px; background: #3366cc; color: #fff; font-size: 0.85em; cursor: pointer; padding-top: 2px
}
#external-events p {
	margin: 1.5em 0px; color: #666; font-size: 11px
}
#external-events p input {
	margin: 0px; vertical-align: middle
}
#calendar {
	width: 900px; float: right
}
</STYLE>
     			
     			
	</head>
	
	<body>	
	<div id=wrap>
		<div id=external-events>
			<H4>Draggable Events</H4>
			<div class=external-event>My Event 1</div>			
			<div class=external-event>My Event 2</div>
			<div class=external-event>My Event 3</div>
			<div class=external-event>My Event 4</div>
			<div class=external-event>My Event 5</div>
			<P><INPUT id=drop-remove type=checkbox> <LABEL for=drop-remove>remove after drop</LABEL> </P>
		</div>
		
		<div id='calendar'></div>
		<div style="clear: both"></div>

	</div>
	</body>
	
	
      
</html>