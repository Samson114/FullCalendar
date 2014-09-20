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
			<script src="js/mother.js"></script>
			<script src="bootstrap/js/bootstrap.min.js"></script>
			
<script>
	$(document).ready(function() {
	//http://blog.csdn.net/my_session/article/details/7939718
		var calendar;
		var date1 = new Date();
		var d = date1.getDate();
		var m = date1.getMonth();
		var y = date1.getFullYear();
		
		var calendar = $('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			selectable: true,
			selectHelper: true,
			select: function(start, end, allDay) {
				var title = prompt('Event Title:');
				
				alert("day"+d+"month"+m+"year"+y);
				
				if (title) {
					calendar.fullCalendar('renderEvent',
						{
							title: title,
							start: start,
							end: end,
							allDay: allDay
						},
						true // make the event "stick"
					);
				}
				calendar.fullCalendar('unselect');
			},
			editable: true,
 			viewDisplay: function(view) {    
	            var viewStart = $.fullCalendar.formatDate(view.start,"yyyy-MM-dd HH:mm:ss");  
	            var viewEnd = $.fullCalendar.formatDate(view.end,"yyyy-MM-dd HH:mm:ss");    
            	$("#calendar").fullCalendar('removeEvents');  
            	$.ajax({
			        type: "POST",
			       data: "name=jhon",
			       url: "Json_me",
			       success: function (data1){
			    	   alert("data1="+data1);
			    	   //alert("data_leng="+data1.length);
			    	   	data1=data1.replace("[",""); 
			    	   	data1=data1.replace("]",""); 
			    	   	alert("data1="+data1);
			    	   	
			    	  	var data=eval("("+data1+")");//转换为json对象  
			    	   alert("data_json="+data);	
			    	   alert("data_length="+data.length);
			    	   alert("data_id="+data.id);
			    	   alert("data_title="+data.title);
			    	  /*  alert("data_start="+data.start);
			    	   alert("data_end="+data.end); */
			    	   
			    	   //alert("data_y0="+data.y0);
			    	   //alert("data_m0="+data.m0);
			    	   
			    	  
			    	   
						//输出每个子对象的名称和值  
						// alert("id:"+data.id+",title:"+data.title);
			    	   
					    	 
			              	 var obj = new Object();				              	 
			            	 obj.id=data.id;	            	 	                     	 
			                 obj.title = data.title;
			                 //obj.start = new Date(y, m, d, 12, 0);                   
			                 //obj.end = new Date(y, m, d, 14, 0);
			                 
			                 obj.start = $.fullCalendar.parseDate(data.start);                   
			                 obj.end = $.fullCalendar.parseDate(data.end);   
			                 
			                 //obj.start = data.start;                  
			                 //obj.end = data.end;
			                //obj.start = new Date(data.y0, data.m0, data.d0, 12, 0);                   
			                //obj.end = new Date(data.y1, data.m1, data.d1, 14, 0);
			                 
			                 //原来
			                 /* var obj = new Object();
			                 obj.id='111';
			                 obj.title = 'sadfsa';
			                 obj.start = new Date(y, m, d, 12, 0);                   
			                 obj.end = new Date(y, m, d, 14, 0);   */
			                 
			               $("#calendar").fullCalendar('renderEvent',obj,true);
					    	 
            	
            				//数组
            				/* for(var i=0;i<data.length;i++) {     
					    	 var obj = new Object();				              	 
			            	 obj.id=data[i].id;	            	 	                     	 
			                 obj.title = data[i].title;		            
			                 obj.start = $.fullCalendar.parseDate(data[i].start);                   
			                 obj.end = $.fullCalendar.parseDate(data[i].end);   
		                 	 $("#calendar").fullCalendar('renderEvent',obj,true);
					    	}  */
			       }
			       });
 			}
    			 
						    	    
     
		});    
		
	});
	 /* var y0=data.y0;
	   var m0=data.m0;
	   var d0=data.d0;
	   var y1=data.y1;
	   var m1=data.m1;
	   var d1=data.d1; */
	   
	   /*   for(var i=0;i<data.length;i++) {    
       var obj = new Object();    
       obj.id = data[i].id;    
     	obj.title = data[i].title; 
     	
     	obj.start = new Date(y, m, d, 12, 0);    
     	obj.end = new Date(y, m, d, 14, 0); 
     	$("#calendar").fullCalendar('renderEvent',obj,true);
	// 把从后台取出的数据进行封装以后在页面上以fullCalendar的方式进行显示  
	
}
});
*/
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
	<center><body onload="!sayHello()">
		<!-- 滚动标语 -->
		<div class="header">
			<h1>❤Welcome:<%=session.getAttribute("username")%><%Date dt=new Date();out.println(dt.getYear()+"-"+dt.getMonth()+"-"+dt.getDay()); %></h1> 
		
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="row">
				<div class="span1"></div>
					<div class="span8" align="center">
						<div class="navbar"> 
		 					<div class="navbar-inner">  
		   					<a class="brand" href="#">Title</a>  
		     					<ul class="nav">      
		     						<li class="active"><a href="#">首页</a></li> 
		     						   
		      						<li><a >日志</a></li> 
		      						
		         					<li><a >照片</a></li>
		         					<li><a href="#">更多</a></li>  
		           				</ul>  
		     				</div>
		     				<div id='calendar'></div>
		     		</div>
		     		</div>
		     		
		     		<div class="span2" align="center"style="padding-top:42px;">
		     		<img src="images/shilie.jpg"  herf="#" class="img-rounded"></img>
		     		
		     		
		     		<table class="table table-hover" style="margin-top:60px;" >
		     			<tr>
		     			<td><strong>MaMa:</strong></td>
		     			<td>Mama() %</td>
		     			
		     			</tr> 
		     			<tr>
		     				<td><strong>PaPa:</strong></td>
		     				<td>%=i() %</td>
		     			
		     			</tr> 
		     			<tr>
		     				<td><strong>BaBy:</strong></td>
		     				<td>%=ib.getBaby() %</td>
		     			</tr> 
		     			<tr>
		     				<td><strong>BaBy-Sex:</strong></td>
		     				<td>%=ib.getSex() %</td>
		     			</tr> 
		     			<tr>
		     				<td><strong>BaBy-birth:</strong></td>
		     				<td>%=ib.getBirth() %</td>
		     			</tr> 
		     			<tr>
		     				<td><strong>BaBy-Age:</strong></td>
		     				<td>ib.getAge</td>
		     			</tr> 
					</table>
					<a href="shouye.jsp"><img src="images/zhuye.jpg"  class="img-rounded" style="padding-top:40px;"></img></a>
					</div>
					<div class="span1"></div>
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

		
	</body></center>
	<script language="javascript">
       //创建XMLHttpReques对象
       function createXMLHttpRequest() {
          if (window.XMLHttpRequest) {
               //Mozilla 浏览器 
               XMLHttpReq = new XMLHttpRequest();
            } else{
                // IE浏览器
                if (window.ActiveXObject) {
                  try {
                         XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
                      }catch (e) {
                         try {
                                XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
                             }catch (e) { }
                      }
                 }
            }
        } 
       
      //发送客户端的请求
      function sendRequest(url) {
            createXMLHttpRequest();
            XMLHttpReq.open("POST", url, true);
            xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
            //指定响应函数
            XMLHttpReq.onreadystatechange = handleResponse;
            // 发送请求
            XMLHttpReq.send(null); 
       }
       //开始调用Ajax的功能
      function sayHello()
      {
        
         sendRequest("home"); 
      }
     </script>
</html>