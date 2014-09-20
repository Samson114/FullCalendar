<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ page import="java.util.Date" %>
<%@ page import="beans.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN" xml:lang="zh-CN">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Mother's Love</title>
    		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    		<link href="fullcalendar1/fullcalendar/fullcalendar.css" rel="stylesheet" />
			<link href="fullcalendar1/fullcalendar/fullcalendar.print.css" rel="stylesheet" media="print" />
			<script src="fullcalendar1/jquery/jquery-1.9.1.min.js"></script>
			<script src="fullcalendar1/jquery/jquery-ui-1.10.2.custom.min.js"></script>
			<script src="fullcalendar1/fullcalendar/fullcalendar.min.js"></script>
			<script src="js/mother.js"></script>
			<script src="bootstrap/js/bootstrap.min.js"></script>
			<!-- 改 -->
			<script src="fullcalendar/mycalendar.js" charset="utf-8"></script>
			<!-- dialog的样式 start-->
			<!-- <link type="text/css" rel="stylesheet" href="fullcalendar/css/default.css">必须  -->
			<!-- dialog的样式 end-->
			<script src="fullcalendar/js/iframeTools.source.js"></script>
			<script src="fullcalendar/js/artDialog.js"></script>
			
			<!-- <link href="fullcalendar/css/fullcalendar.css" rel="stylesheet" />
			<link href="fullcalendar/css/fullcalendar.print.css" rel="stylesheet" media="print" />
			<script src="fullcalendar/jquery/jquery-1.9.1.min.js"></script>
			<script src="fullcalendar/jquery/jquery-ui-1.10.2.custom.min.js"></script>
			<script src="fullcalendar/js/fullcalendar.min.js"></script> -->
			
	<style type="text/css">
     			body {
      				font-size:14px;
      				color:#000000;
      				background:#dddddd;
      				}
      				p{
      				font-family:"黑体";
      				font-size:15px;
      				}
      				p.lead{
      				line-height:2; 
      				}
     			.header { 
      				width:100%;
      				position:fixed;
      				height:120px;
      				padding:0px;
      				}
      				.navbar-inverse .navbar-inner {
  background-color: transparent;
  background-image:url(images/dh.png);
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff222222', endColorstr='#ff111111', GradientType=0);
}
.navbar .nav > li > a {
  float: none;
  padding: 5px 20px 5px;
}
.navbar-inner {
	padding-top:0px;
  min-height: 30px;
  }
  .carousel-inner{
	font-family:"黑体";
  }
      			.row-fluid{
      				padding-top:100px;
      			}
      			.table{
				margin-top:20px;
				}
				.table tr{		
				text-align:right;
				border:0px;
					}
				.table td{
  					text-align:left;
  					padding:1px;
  					margin:2px;	
  					border:0px;		
				}
      			
     			</style>
     			
	</head>
<body>
			<script src="js/mother.js"></script>
			<script src="bootstrap/js/bootstrap.min.js"></script>
		<!-- 滚动标语 -->
		<div class="navbar navbar-inverse navbar-fixed-top" style="position:relative;" >
		<div class="header">
		<div class="row" style="height:120px; background:url(images/dh.png);">
			<div class="span2"></div>
			<div class="span2"><img src="images/logo.png" style="position:relative;top:10px;"></img></div>
			<div class="span10" >
			<h1 style="color:#F093CB; padding-top:20px; ">Mother's love</h1>
			<h4 style="color:#ffffff; padding-top:5px;">**Welcome to mother's love</h4>
			</div>
			<div class="span2"><a href="index.jsp"  style="position:relative;top:100px;">注销</a></div>
		</div>
		
      <div class="navbar-inner">
        <div class="container">
          <div class="nav-collapse collapse" >
            <ul class="nav">
              <li class="active">
                <a  href=home>主页</a>
              </li>
              <li class="" >
                <a href=log>日志</a>
              </li>
              <li class="">
                <a href=album>相册</a>
              </li>
              <li class="">
                <a href="more.jsp">更多</a>
              </li>
              <li class="">
                <a href="#" class="bootstro">About</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    </div>
			<div class="row-fluid">
				<div class="row" align="left">
    		<div class="span2"></div>
    		<div class="span6" style="padding-top:60px;"> 
    		<div id='calendar'></div>
    		<div style="clear: both"></div>
    		</div>
    		
    		<div class="span2" style="padding-top:60px;" align="center">
		     		<a href="xiangce.jsp"><img src="images/love.jpg" class="img-rounded"></img></a>
		     		<table class="table table-hover" style="margin-top:30px;" >
		     			<tr>
		     			<td><h5>个人资料</h5></td>
		     			</tr>
		     			<tr>
		     			<td><strong>MaMa:</strong></td>
		     			<td></td>
		     			
		     			</tr> 
		     			<tr>
		     				<td><strong>PaPa:</strong></td>
		     				<td></td>
		     			
		     			</tr> 
		     			<tr>
		     				<td><strong>BaBy:</strong></td>
		     				<td></td>
		     			</tr> 
		     			<tr>
		     				<td><strong>BaBy-Sex:</strong></td>
		     				<td></td>
		     			</tr> 
		     			<tr>
		     				<td><strong>BaBy-birth:</strong></td>
		     				<td></td>
		     			</tr> 
		     			 
					</table>
					</div>
					<div class="span2"></div>
    	</div>
    	
    		<div class="row" style="font-family:'黑体';background-color:#333333;padding-top:10px;line-height:0.5;" align="left">
    		<div class="span2"></div>
    		<div class="span2"></div>
    		<div class="span2"><h4 style="color:#F093CB;">指导老师</h4>
    			<p style="color:#ffffff;">&nbsp;黄淋</p>
    		</div>
    		<div class="span2"><h4 style="color:#F093CB;">制作人员</h4>
    			<p style="color:#ffffff;">&nbsp;周亚平</p>
    			<p style="color:#ffffff;">&nbsp;刘志鹏</p>
    			<p style="color:#ffffff;">&nbsp;赵燕如</p>
    		</div>
    		<div class="span2">
    			<h4 style="color:#F093CB;">相关链接</h4>
    			<a href="http://www.bootcss.com/"><p style="color:#ffffff;">&nbsp;Bootstrp</p></a>
    			<a href="http://www.baidu.com/"><p style="color:#ffffff;">&nbsp;百 度</p></a>
    			<a href="http://www.google.com.hk/"><p style="color:#ffffff;">&nbsp;谷 歌</p></a>
    			<a href="http://www.w3school.com.cn/ajax/"><p style="color:#ffffff;">&nbsp;Ajax</p></a>
    			<a href="http://www.webps.cn/"><p style="color:#ffffff;">&nbsp;Photoshop</p></a>
    		</div>
    		
    		<div class="span2"><h4 style="color:#ffffff;position:relative;top:100px;"> © 2013 ZXT</h4></div>
    	</div>
    	</div>
</html>
