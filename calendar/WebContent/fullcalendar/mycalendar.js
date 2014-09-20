//如果报错 或乱码  将字符编码改为utf-8 
$(document).ready(function() {

	
	//参考文件来自：http://blog.csdn.net/my_session/article/details/7939718
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
			allDayDefault:false,
			draggable: true,
			allDay:false,
			droppable: true, // this allows things to be dropped onto the calendar !!!
			 //从外部拖入事件 start-----
            drop: function(date, allDay) { // this function is called when something is dropped								
				// retrieve the dropped element's stored Event Object
				var originalEventObject = $(this).data('eventObject');
				
				// we need to copy it, so that multiple events don't have a reference to the same object
				var copiedEventObject = $.extend({}, originalEventObject);
												
				// assign it the date that was reported
				copiedEventObject.start = date;
				copiedEventObject.allDay = allDay;
				
				// render the event on the calendar
				// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
				$('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
				
				var viewStart = $.fullCalendar.formatDate(copiedEventObject.start,"yyyy-MM-dd HH:mm:ss");//  
		        var viewEnd = $.fullCalendar.formatDate(copiedEventObject.end,"yyyy-MM-dd HH:mm:ss");  
		        																
		        $.post("Click",{//把要更新的日程计划信息传到后台，保存到数据库
		        	title:copiedEventObject.title,     
                    start:viewStart,
                    end:viewStart 
                    },
	                        function (data){//从数据库生成 一个id 给刚插入的日程
	                        	//alert("data="+data);
								copiedEventObject.id = data;
	                        }, "text"
	                      );                                          	          	 
	          $('#calendar').fullCalendar('updateEvent', copiedEventObject);	          	          
				// is the "remove after drop" checkbox checked?
				if ($('#drop-remove').is(':checked')) {
					// if so, remove the element from the "Draggable Events" list
					$(this).remove();
				}
				
			},
            //从外部拖入事件 end ---------  

			editable: true,
			//显示日程功能  start
 			viewDisplay: function(view) {    
	            var viewStart = $.fullCalendar.formatDate(view.start,"yyyy-MM-dd HH:mm:ss");//  
	            var viewEnd = $.fullCalendar.formatDate(view.end,"yyyy-MM-dd HH:mm:ss");    
            	$("#calendar").fullCalendar('removeEvents');  
				            	$.ajax({
							        type: "POST",
							       data: "name=test",//测试是否传到后台
							       url: "Json_me",
							       success: function (data1){							    	  					    	 							    	  							    	   	
							    	   var data=eval("("+data1+")");//转换为json对象  							    	   				           	
				            				//遍历json对象
				            				for(var i=0;i<data.length;i++) {     
									    	 var obj = new Object();				              	 
							            	 obj.id=data[i].id;	            	 	                     	 
							                 obj.title = data[i].title;		            
							                 obj.start = $.fullCalendar.parseDate(data[i].start);                   
							                 obj.end = $.fullCalendar.parseDate(data[i].end);
							                 //allDay attr
							                 obj.allDay = data[i].allDay;	
						                 	 $("#calendar").fullCalendar('renderEvent',obj,true);//将后台的值显示到页面
									    	}  
							       }
							  });
 			},
			//显示日程功能  end	
			
			//日程点击：添加日程 start
	      	dayClick: function(date, allDay, jsEvent, view) {
	      		
	      		allDay=false;
	    	     var obj =new Object(); 
	    	        		 
	    		  art.dialog.open('fullcalendar/newschedule.html',{//打开newschedule.html页面 ，并加载到dialog对话框中
		    	 	title: '添加日程',//对话框标题
		    		lock: true,
		    		width:225,//宽度
	                height:125,//高度
		            fixed: true, //固定定位
		    		background: '#600', // 背景色
		    		opacity: 0.6,	// 透明度
		    		// 在open()方法中，init会等待iframe加载完毕后执行
		    		init: function () {		    					    					    			
		    			var iframe = this.iframe.contentWindow;
		    		    //var top = art.dialog.top;// 引用顶层页面window对象
		    		    var start = iframe.document.getElementById('form-start');//取得  选中的哪天的时间    		
		    		    start.value = $.fullCalendar.formatDate(date,"yyyy-MM-dd HH:mm:ss");//将取得的开始时间显示在dialog中		    		        
		    		 },
		    		 okVal:'提交',//提交按钮
		    		 ok: function () {
		    		 	var iframe = this.iframe.contentWindow;
		    		    if (!iframe.document.body) {
		    		        alert('iframe还没加载完毕呢');
		    		        return false;
		    		    };
		    		    
		    		    var start = iframe.document.getElementById('form-start').value;//从dialog中取得数据
		    		    var end = iframe.document.getElementById('form-end').value;		    		    
		    		    obj.title = iframe.document.getElementById('form-title').value;		    		 
		    		    obj.start = $.fullCalendar.parseDate(start);
		    		    obj.end = $.fullCalendar.parseDate(end);		    		    		    
		    		    if (obj.title== '') {//判断dialog中内容是否为空
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
	                        end:end	                        
	                        },
	                        function (id){//从数据库生成 一个id 给刚插入的日程
	                        	
								obj.id = id;
								obj.allDay=false;
	                        }, "text"
	                      );
		    		     
		    		      $('#calendar').fullCalendar('renderEvent', obj);  //核心的更新代码
		    		      //$('#calendar').fullCalendar('updateEvent', obj);
//		    		      $('#calendar').fullCalendar('refetchEvents');	
		    		      $('#calendar').fullCalendar('clientEvents');	
			    		  return true;		    		        	
		    		   },
		    		    cancel: true
		    		});	//日程点击：添加日程 end	
	    	},
	    	
	    	//点击日程  修改 删除 功能start---------------------------------------------
	    	//修改功能 start
	    	eventClick:function(calEvent, jsEvent, view){	  
		    	art.dialog.open('fullcalendar/newschedule.html', {
	    		    title: '更新日程',
	    		    lock: true,
	    		    width:225,
	                height:125,
	    		    //background: '#600', // 背景色
	    		    opacity: 0.6,	// 透明度
	    		    // 在open()方法中，init会等待iframe加载完毕后执行
	    		    init: function () {
	    		      	var iframe = this.iframe.contentWindow;
	    		    	iframe.document.getElementById('form-start').value = $.fullCalendar.formatDate(calEvent.start,"yyyy-MM-dd HH:mm:ss");		    		
	    		    	iframe.document.getElementById('form-end').value = $.fullCalendar.formatDate(calEvent.end,"yyyy-MM-dd HH:mm:ss");
	    		    	iframe.document.getElementById('form-title').value = calEvent.title;
	    		    	   		    	
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
		    		    calEvent.title = iframe.document.getElementById('form-title').value;
		    		    calEvent.start = $.fullCalendar.parseDate(start);
		    		    calEvent.end = $.fullCalendar.parseDate(end);		    		    		    
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
		                        
	                        }	             	    		        
	                    ); 	 
	    		        $('#calendar').fullCalendar('updateEvent', calEvent);	    		        
		    		    return true;				        	
	    		    },
	    		    cancel: true,
	    		    // 修改 功能end
	    		    
	    		  //删除日程功能start
	    		    button: [{
	    		    	name: '删除日程',
	    		        callback: function () {
		    		        //this.content('你同意了').time(2);
		    		         $.post("Delete",{
				    		 	id:calEvent.id
				    		 	
		                     });		    				    		        
	    		        	$('#calendar').fullCalendar('removeEvents',calEvent.id);	    		        		    		        	
	    		        	$('#calendar').fullCalendar('clientEvents');	   
			    		      //$('#calendar').fullCalendar('unselect');	
	    		        	
							return true;
	    		         }	
	    		    
	    		         }]
	    		   // 删除日程功能end
	    		   });
		    	},		    
	    	//点击日程 修改 删除 功能end-----------------------------------------------
     
	    	//拖动事件 start *****************
		    	  
		          eventDrop: function( event, dayDelta, minuteDelta, allDay, revertFunc, jsEvent, ui, view ) { 
		        	 
		        	  var eventStart = $.fullCalendar.formatDate(event.start,"yyyy-MM-dd HH:mm:ss");		        	  
			          var eventEnd = $.fullCalendar.formatDate(event.end,"yyyy-MM-dd HH:mm:ss");
			          			          
				          $.post("Drag",{//把要更新的日程计划信息传到后台，保存到数据库
		    		        	id:event.id,     
		                        start:eventStart,     
		                        end:eventEnd		                       
				          });	 
				          $('#calendar').fullCalendar('updateEvent', event);
		              },
		         
		          eventResize: function(event,dayDelta,minuteDelta,revertFunc) {		        	 		        	  
		        	  var eventStart = $.fullCalendar.formatDate(event.start,"yyyy-MM-dd HH:mm:ss");
		        	  var eventEnd = $.fullCalendar.formatDate(event.end,"yyyy-MM-dd HH:mm:ss");
			        	  $.post("Resize",{//把要更新的日程计划信息传到后台，保存到数据库
		    		        	id:event.id,     
		    		        	day:dayDelta,
		    		        	start:eventStart, 
		    		        	end:eventEnd
		                       
				          });
			        	  $('#calendar').fullCalendar('updateEvent', event);
		              },

	    	//拖动事件 end  *************************
		              
		         
		}); 
////////////////////////////////////////////////////////////以下为函数////////////////////////////////////////////
		
		//从外部托人事件 start---------
		$('#external-events div.external-event').each(function() {
			
			// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
			// it doesn't need to have a start or end
			var eventObject = {
				title: $.trim($(this).text()) // use the element's text as the event title
			};
			
			// store the Event Object in the DOM element so we can get to it later
			$(this).data('eventObject', eventObject);
			
			// make the event draggable using jQuery UI
			$(this).draggable({
				zIndex: 999,
				revert: true,      // will cause the event to go back to its
				revertDuration: 0  //  original position after the drag
			});
			
		});
	//从外部托人事件 end---------
		
	});


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
