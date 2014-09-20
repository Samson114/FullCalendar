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
			
			<script src="extra_drag/extra_drag.js" charset="utf-8"></script>

<STYLE>
BODY {
	TEXT-ALIGN: center; MARGIN-TOP: 40px; FONT-FAMILY: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif; FONT-SIZE: 14px
}
#wrap {
	MARGIN: 0px auto; WIDTH: 1100px
}
#external-events {
	BORDER-BOTTOM: #ccc 1px solid; TEXT-ALIGN: left; BORDER-LEFT: #ccc 1px solid; PADDING-BOTTOM: 0px; PADDING-LEFT: 10px; WIDTH: 150px; PADDING-RIGHT: 10px; BACKGROUND: #eee; FLOAT: left; BORDER-TOP: #ccc 1px solid; BORDER-RIGHT: #ccc 1px solid; PADDING-TOP: 0px
}
#external-events H4 {
	MARGIN-TOP: 0px; FONT-SIZE: 16px; PADDING-TOP: 1em
}
.external-event {
	PADDING-BOTTOM: 2px; MARGIN: 10px 0px; PADDING-LEFT: 4px; PADDING-RIGHT: 4px; BACKGROUND: #3366cc; COLOR: #fff; FONT-SIZE: 0.85em; CURSOR: pointer; PADDING-TOP: 2px
}
#external-events P {
	MARGIN: 1.5em 0px; COLOR: #666; FONT-SIZE: 11px
}
#external-events P INPUT {
	MARGIN: 0px; VERTICAL-ALIGN: middle
}
#calendar {
	WIDTH: 900px; FLOAT: right
}
</STYLE>


<BODY>
	<div id=wrap>
	<div id=external-events>
		<H4>Draggable Events</H4>
		<div class=external-event>My Event 1</div>
		<div class=external-event>My Event 2</div>
		<div class=external-event>My Event 3</div>
		<div class=external-event>My Event 4</div>
		<div class=external-event>My Event 5</div>
		<P><INPUT id=drop-remove type=checkbox> <LABEL for=drop-remove>remove after drop</LABEL> </P></div>
		
		<div id='calendar'></div>
		<div style="CLEAR: both"></div>

	</div>
</BODY>
</HTML>
