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
			select:true
				/*  function(start, end, allDay) {
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
			} */,
			editable: true,
			//显示功能  start
 			viewDisplay: function(view) {    
	            var viewStart = $.fullCalendar.formatDate(view.start,"yyyy-MM-dd HH:mm:ss");  
	            var viewEnd = $.fullCalendar.formatDate(view.end,"yyyy-MM-dd HH:mm:ss");    
            	$("#calendar").fullCalendar('removeEvents');  
				            	$.ajax({
							        type: "POST",
							       data: "name=jhon",
							       url: "Json_me",
							       success: function (data1){
							    	   //alert("data1="+data1);							    	 							    	  
							    	   	
							    	   var data=eval("("+data1+")");//转换为json对象  
							    	   /* alert("data_json="+data);	
							    	   alert("data_length="+data.length);
							    	   alert("data_id="+data.id);
							    	   alert("data_title="+data.title); */
				           	
				            				//数组
				            				for(var i=0;i<data.length;i++) {     
									    	 var obj = new Object();				              	 
							            	 obj.id=data[i].id;	            	 	                     	 
							                 obj.title = data[i].title;		            
							                 obj.start = $.fullCalendar.parseDate(data[i].start);                   
							                 obj.end = $.fullCalendar.parseDate(data[i].end);   
						                 	 $("#calendar").fullCalendar('renderEvent',obj,true);
									    	}  
							       }
							  });
 			},
			//显示功能  end	
			
			//日程点击：添加日程 start
	      	dayClick: function(date, allDay, jsEvent, view) {
	      			//alert("执行到日程点击");
	    	     var obj =new Object(); 
	    	    	    		 
	    		  art.dialog.open('11.html',{
		    	 	title: '添加日程1',
		    		lock: true,
		    		width:300,
	                height:400,
		            fixed: true, //固定定位
		    		background: '#600', // 背景色
		    		opacity: 0.6,	// 透明度
		    		// 在open()方法中，init会等待iframe加载完毕后执行
		    		init: function () {
		    			
		    			//alert("执行到日程点击html");
		    			
		    			var iframe = this.iframe.contentWindow;
		    		    //var top = art.dialog.top;// 引用顶层页面window对象
		    		    var start = iframe.document.getElementById('form-start');//取得  选中的哪天的时间    		
		    		    start.value = $.fullCalendar.formatDate(date,"yyyy-MM-dd HH:mm:ss");		    		        
		    		 },
		    		 okVal:'提交',
		    		 ok: function () {
		    		 	var iframe = this.iframe.contentWindow;
		    		    if (!iframe.document.body) {
		    		        alert('iframe还没加载完毕呢');
		    		        return false;
		    		    };
		    		    
		    		    var start = iframe.document.getElementById('form-start').value;
		    		    var end = iframe.document.getElementById('form-end').value;
		    		    //var remindertime = iframe.document.getElementById('form-remindertime').value;
		    		    obj.title = iframe.document.getElementById('form-title').value;
		    		    //obj.description = iframe.document.getElementById('form-description').value;
		    		    obj.start = $.fullCalendar.parseDate(start);
		    		    obj.end = $.fullCalendar.parseDate(end);		    		    		    
		    		 	//obj.color = iframe.document.getElementById('form-color').value;
		    		    if (obj.title== '') {
		    		        alert("标题不能为空");
		    		        return false;
		    		     }else if(start== '') {
		    		     	alert("开始日期不能为空");
		    		        return false;
		    		     }else if(end == '') {
		    		        alert("结束日期不能为空");
		    		        return false;
		    		     }
		    		     	   			    		    
		    		     $.post("Click",{//把刚输入的日程计划信息传到后台，保存到数据库     
	                     	title: obj.title,     
	                        start:start,     
	                        end:end,	                        	                       
	                        },
	                        function (data){
	                        	alert("data="+data);
								obj.id = data;
	                        }, "text"
	                      );
		    		     		    		    
		    		      $('#calendar').fullCalendar('renderEvent', obj);  //核心的更新代码
		    		      $('#calendar').fullCalendar('unselect');		    		      
			    		  return true;		    		        	
		    		   },
		    		    cancel: true
		    		});	//日程点击：添加日程 end	
	    	},
	    	
	    	//点击日程  修改 删除start---------------------------------------------
	    	eventClick:function(calEvent, jsEvent, view){	  
		    	art.dialog.open('newschedule.html', {
	    		    title: '更新日程',
	    		    lock: true,
	    		    width:300,
	                height:400,
	    		    //background: '#600', // 背景色
	    		    opacity: 0.6,	// 透明度
	    		    // 在open()方法中，init会等待iframe加载完毕后执行
	    		    init: function () {
	    		      	var iframe = this.iframe.contentWindow;
	    		    	//var top = art.dialog.top;// 引用顶层页面window对象
	    		    	iframe.document.getElementById('form-start').value = $.fullCalendar.formatDate(calEvent.start,"yyyy-MM-dd HH:mm:ss");		    		
	    		    	iframe.document.getElementById('form-end').value = $.fullCalendar.formatDate(calEvent.end,"yyyy-MM-dd HH:mm:ss");
	    		    	//iframe.document.getElementById('form-description').value = calEvent.description;
	    		    	iframe.document.getElementById('form-title').value = calEvent.title;
	    		    	/* if(calEvent.messagenotice == 1) {
	    		    		iframe.document.getElementById('form-messagenotice').checked = true;	    		    		
	    		    		iframe.document.getElementById('form-remindertime').value =  $.fullCalendar.formatDate(calEvent.remindertime,"yyyy-MM-dd HH:mm:ss");
	    		    		iframe.document.getElementById('showtxt').style.display='block';
	    		    	}else {	    		    		
	    		    	}
	    		    	iframe.document.getElementById('form-color').value = calEvent.color; */	    		    	
	    		    },
	    		    okVal:'修改日程',
	    		    ok: function () {
	    		    	var iframe = this.iframe.contentWindow;
	    		    	if (!iframe.document.body) {
	    		        	alert('iframe还没加载完毕呢')
	    		        	return false;
	    		        };
	    		        
	    		        var start = iframe.document.getElementById('form-start').value;
		    		    var end = iframe.document.getElementById('form-end').value;
		    		    //var remindertime = iframe.document.getElementById('form-remindertime').value;
		    		    calEvent.title = iframe.document.getElementById('form-title').value;
		    		    //calEvent.description = iframe.document.getElementById('form-description').value;
		    		    calEvent.start = $.fullCalendar.parseDate(start);
		    		    calEvent.end = $.fullCalendar.parseDate(end);		    		    		    
		    		    //calEvent.color = iframe.document.getElementById('form-color').value;
		    		    if (calEvent.title== '') {
		    		        alert("标题不能为空");
		    		        return false;
		    		     }else if(start== '') {
		    		     	alert("开始日期不能为空");
		    		        return false;
		    		     }else if(end == '') {
		    		        alert("结束日期不能为空");
		    		        return false;
		    		     } 			      
	    		        $.post("Update",{//把要更新的日程计划信息传到后台，保存到数据库
		    		        	id:calEvent.id,
		                        title: calEvent.title,     
		                        start:start,     
		                        end:end,
		                        //description:calEvent.description,		                        
		                        //color:calEvent.color,
		                        //remindertime:remindertime,
		                        //messagenotice:calEvent.messagenotice
	                        }	             	    		        
	                    ); 	 
	    		        $('#calendar').fullCalendar('updateEvent', calEvent);
	    		        //弹出提示
	    		         /* art.dialog.notice({
	    		            title: '笔记之家',
	    		            width: 150,// 必须指定一个像素宽度值或者百分比，否则浏览器窗口改变可能导致artDialog收缩
	    		            content: '日程已更新！',
	    		            icon: 'face-smile',
	    		            time: 3
	    		        });  */
		    		    return true;				        	
	    		    },
	    		    cancel: true,
	    		  //删除日程，保存到数据库
	    		    button: [{
	    		    	name: '删除日程',
	    		        callback: function () {
		    		        //this.content('你同意了').time(2);
		    		         $.post("Delete",{
				    		 	id:calEvent.id
				    		 	
		                     });		    		
		    		        
	    		        	$('#calendar').fullCalendar('removeEvents',calEvent.id);
	    		        	
	    		        	/* art.dialog.notice({
		    		            title: '笔记之家',
		    		            width: 150,// 必须指定一个像素宽度值或者百分比，否则浏览器窗口改变可能导致artDialog收缩
		    		            content: '日程已删除！',
		    		            icon: 'face-smile',
		    		            time: 3
		    		        }); */
							return true;
	    		         }	
	    		    
	    		         }]
	    		    
	    		   });
		    	}		    
	    	//点击日程 修改 删除 end-----------------------------------------------
     
		});    
		
	});
	 
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