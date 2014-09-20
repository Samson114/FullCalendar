<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Sale-system</title>
	</head>
		<link rel="stylesheet" type="text/css" href="css/easyui.css">
		<link rel="stylesheet" type="text/css" href="css/icon.css">
		<link rel="stylesheet" type="text/css" href="css/demo.css">
		<link rel="stylesheet" type="text/css" href="css/datagrid.css">
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
		<script src="http://code.jquery.com/jquery.js"></script>
		<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
		<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
		<style type="text/css">
     		body {
     		color:#325375;
      		background:url()
      		}
      		a {
  			color: #68abc5;
  			text-decoration: none;
			}
			a:hover,
			a:focus {
  			color: #325375;
  			text-decoration: none;
			}
     		.header { 
      		width:100%;
      		height:120px;
      		padding:0px;
      		}	
      		.breadcrumb {
  			padding: 0px 15px;
  			margin: 0px;
  			list-style: none;
  			background-color: transparent;
  			-webkit-border-radius: 0px;
     		-moz-border-radius: 0px;
          	border-radius: 0px;
			}
			.breadcrumb > li {
  			display: inline-block;
  			*display: inline;
  			text-shadow: 0 1px 0 #f4f4f4;
  			*zoom: 1;
			}
			.breadcrumb > li > .divider {
  			padding: 0 5px;
  			color: #325375;
  			font-size:20px;
			}

			.breadcrumb > .active {
  			color: #000000;
			}
			dh{
			position:relative;
			top:4px;
			}
			
     	</style>
	<body>
	<div class="header">
	<div class="row-fluid">
		<div class="row" style="height:120px; background:url(images/dh.png);">
			<div class="span2"></div>
			<div class="span6" >
			<h1 style="color:#f4f4f4;padding-top:28px;font-size:64px;font-family:'黑体'">营销管理系统</h1>
			</div>
			<div class="span1" align="right">
				<a href="login.jsp"  style="position:relative;top:75px;">
					<i class="icon-user icon-white"></i>
				</a>
			</div>
			
			<!-- 跳转到登陆页面"login.jsp"-->
			<div class="span1">
				<a href="login.jsp"  style="position:relative;top:73px;color:#f4f4f4">登 陆
				</a>
			</div>
			
			
			<div class="span2"></div>
		</div>
		</div>
    </div>
			<div class="row-fluid" >
			<div class="row" style="font-family:'黑体';background:url(images/dh_f.png);" >
    		<div class="span2" style="padding-left:30px;padding-top:14px;border-right: 3px solid #325375;height:42px;">
    		<p style="color:#325375;font-size:24px;font-weight:700;font-family:'黑体'">客户管理系统</p>
    		</div>
    		
    		<div class="span10" style="padding-left:20px;padding-top:14px;height:42px;">
    		<ul class="breadcrumb">
  				<li>
    			<a href="#" style="font-size:20px;">营销管理系统</a> <span class="divider">/</span>
  				</li>
  				<li>
    			<a href="#" style="font-size:20px;">销售机会管理</a> <span class="divider">/</span>
  				</li>
  				<li class="active" style="color:#b57f7f;font-size:20px;">所有机会</li>
				</ul>
    		</div>
    	</div>
			<div class="row" style="font-family:'黑体';border-bottom: 3px solid #325375;" align="right" >
    		<div class="span2" style="padding-left:20px;height:600px;border-right: 3px solid #325375;">
    		<div class="easyui-accordion" data-options="fit:true,selected:true" style="border-width:4px;border-color:transparent;">
				<div title="营销管理">
					<ul class="easyui-tree" style="color:#68abc5;">
			
				<li>
					<span><a href="SaleChance.jsp">销售机会管理</a></span>
					<ul>
						<li>
							<span><a href="no_assigned.jsp">未分配的机会</a></span>
						</li>
						<li>
							<span><a href="assigned.jsp">已分配的机会</a></span>
						</li>
					</ul>
				</li>
				<li data-options="state:'closed'">
					<span><a href="Development_plan.jsp">客户开发计划</a></span>
					<ul>
						<li><a href="success_plan.jsp">已成功开发</a></li>
						<li><a href="execution_plan.jsp">进行中开发</a></li>
						<li><a href="failure_plan.jsp">失败开发</a></li>
						<li data-options="state:'closed'">
						<span><a href="my_plan.jsp">我的计划</a></span>
						<ul>
						<li><a href="my_success.jsp">成功开发</a></li>
						<li><a href="my_execution.jsp">开发中</a></li>
						<li><a href="my_failure.jsp">开发失败</a></li>
						</ul>
						</li>
					</ul>
				</li>
	</ul>

				</div>
				<div title="客户管理">
				</div>
				<div title="服务管理">
				</div>
				<div title="统计报表">
				</div>
				<div title="基础数据">
				</div>
			</div>
    		</div>
    		
    		<div class="span10">
    		<div class="row-fluid">
		<div class="row" style="height:37px;border-top: 4px solid #f4f4f4;padding-top:4px">
		<div class="span11" >
		
		<!-- 表单，查询，新增 -->
		<form class="navbar-form pull-left">
  		<dh>客户名称: </dh><input type="text"  placeholder="Clientname" name="clientname" class="span2">&nbsp;&nbsp;
  		<dh>联系人: </dh><input type="text" placeholder="Contacts" name="contacts"  class="span2">&nbsp;&nbsp;
  		<dh>概要: </dh><input type="text" placeholder="Summary" name="summary"  class="span3">
  		<button class="btn" type="submit" value="登陆">
        					<i class="icon-search"></i> 查询
        					</button>
        					<a class="btn btn-success" type="submit" value="登陆" href="update.jsp">
        					<i class="icon-plus icon-white"></i> 新增
        					</a>
		</form >
    			</div>
    			<div class="span1"></div>
    			</div>
    			</div>
    			<div class="row" style="padding-top:20px;padding-right:8px;">
    	
    	<!--表单，提取所有销售机会-->		
    	<form style="height:458px;">		
    			<table id="dg" class="easyui-datagrid" style="height:auto"
			data-options="
			iconCls: 'icon-edit',
						singleSelect: true,
						rownumbers:true,
						toolbar: '#tb',
						fit: true,
						fitColumns: true,
						onClickRow: onClickRow,
						pagination:true,
						url: 'datagrid_data1.json',
			">
	</table>
   
</form>
   <div class="easyui-pagination" style="border-top: 4px solid #f4f4f4;" data-options="
				total: 114,
				showPageList: false,
				showRefresh: false,
				displayMsg: ''
			"></div>
	
    			</div>
    		</div>
    	</div>
	
    	<div class="row" style="font-family:'黑体';height:26px;" align="right" >
    		<div class="span3"></div>
    		
    		<div class="span6" style="margin-top:8px;">
    			<p style="font-size:15px;">制作人：&nbsp;&nbsp;周亚平&nbsp;&nbsp;吕培楠&nbsp;&nbsp;赵燕如</p>
    			
    		</div>
    		
    		<div class="span2" style="margin-top:8px;"><p style="font-size:15px;"> © 2013 ZXT</p></div>
    		<div class="span1"></div>
    	</div>
			</div>
	
	
	
	<script type="text/javascript">
		var editIndex = undefined;
		function endEditing(){
			if (editIndex == undefined){return true}
			if ($('#dg').datagrid('validateRow', editIndex)){
				var ed = $('#dg').datagrid('getEditor', {index:editIndex,field:'productid'});
				var productname = $(ed.target).combobox('getText');
				$('#dg').datagrid('getRows')[editIndex]['productname'] = productname;
				$('#dg').datagrid('endEdit', editIndex);
				editIndex = undefined;
				return true;
			} else {
				return false;
			}
		}
		function onClickRow(index){
			$('#win').window({  
			   width:800,  
				   height:400,
				    modal:true
				    
				});  
			$('#win').show();
			
		}
		function remove(){
			if (editIndex !== undefined){return}
			$('#win').window('close');
			$.messager.confirm('Confirm','您确定删除本条机会?',function(r){ 

				if (r){ 

				alert('删除成功'); 

				} 

				});
		}
		$(function(){
			$('#dg').datagrid({ 

				columns:[[ 
				{field:'status',width:30,align:'center',editor:{type:'checkbox',options:{on:'P',off:''}}},
				{field:'num',width:80},
				{field:'creater',width:80},
				{field:'S_condition',width:80},
				{field:'clientname',width:80}, 
				{field:'summary',width:80}, 
				{field:'contacts',width:80},
				{field:'contactphone',width:80},
				{field:'productid',
					width:80,
					title:'productid',
					align:'right',
					formatter:function(value,rowData,rowIndex){
						var pkV = rowData.evtrenewaid;
						var parentId = rowData.evtrenewacode;
						var opertorString='';
						// 判断是否使用编辑
						opertorString="<img style=\"cursor:pointer;\" title=\"编辑\" sytle=\"cursor:pointer;\" src=\"images/append.png\" onclick=\"location='zhipai.jsp';\"/>&nbsp;&nbsp;&nbsp;&nbsp;";
						//判断是否使用查看
						opertorString=opertorString+"<img style=\"cursor:pointer;\" title=\"查看详情\" sytle=\"cursor:pointer;\" src=\"images/zhipai.png\" onclick=\"location='zhipai.jsp';\"/>&nbsp;&nbsp;&nbsp;&nbsp;";
						//删除列
						opertorString=opertorString+"<img style=\"cursor:pointer;\" title=\"删除\" sytle=\"cursor:pointer;\" src=\"images/remove.png\" onclick=\"remove();\"/>&nbsp;&nbsp;&nbsp;&nbsp;";
						return opertorString;
					}
					} 
				]] 
				}); 
			
		})
		
	</script>
	<div id="win"  title="详细信息"  style="display:none;"  
        data-options="iconCls:'icon-save',modal:true"> 
           <table class="table table-bordered" style="margin-top:20px;color:#325375;border:4px solid #325375;">
          <tr>
            <td class="span3" style="background-color:#325375;color:#f4f4f4;font-weight:700;">编号</td>
            <td class="span3" style="background-color:#dddddd;">1</td>
            <td class="span3" style="background-color:#325375;color:#f4f4f4;font-weight:700;">机会来源</td>
            <td class="span3" style="background-color:#dddddd;">天上掉的</td>
          </tr>
            <tr>
            <td  style="background-color:#325375;color:#f4f4f4;font-weight:700;">客户名称</td>
            <td  style="background-color:#dddddd;">大连交通大学</td>
            <td  style="background-color:#325375;color:#f4f4f4;font-weight:700;">成功几率</td>
            <td  style="background-color:#dddddd;">70%</td>
          </tr>
           <tr>
            <td  style="background-color:#325375;color:#f4f4f4;font-weight:700;">概要</td>
            <td  colspan="3" style="background-color:#dddddd;text-align: left;padding-left:20px;">采购联想Lenovo_v470c意向</td>
          </tr>
           <tr>
            <td  style="background-color:#325375;color:#f4f4f4;font-weight:700;">联系人</td>
            <td  style="background-color:#dddddd;">刘西厚</td>
            <td  style="background-color:#325375;color:#f4f4f4;font-weight:700;">联系电话</td>
            <td  style="background-color:#dddddd;">13576777585</td>
          </tr>
           <tr>
            <td  style="background-color:#325375;color:#f4f4f4;font-weight:700;">机会描述</td>
            <td  colspan="3"style="background-color:#dddddd;text-align: left;padding-left:20px;">为提高教学能力，培养学生动手能力，大连交通大学预购Lenovo_479c：90台</td>
          </tr>
          <tr>
            <td  style="background-color:#325375;color:#f4f4f4;font-weight:700;">创建人</td>
            <td  style="background-color:#dddddd;">大糖饼麻子</td>
            <td  style="background-color:#325375;color:#f4f4f4;font-weight:700;">创建时间</td>
            <td  style="background-color:#dddddd;">2013年5月17日</td>
          </tr>
      </table> 
      <div class="row">
      <div class="span4"></div>
      <div class="span4">
      <a href="zhipai.jsp" class="btn" type="submit" onclick="reject()"value="指派">
        					<i class="icon-repeat"></i>编辑
        					</a>
      <a href="javascript:void(0)" class="btn btn-danger" type="submit" onclick="remove()" value="删除">
        					<i class="icon-remove icon-white"></i>删除
        					</a></div>
      <div class="span4"></div>
     
        					</div>
        </div> 
        
        
       
        
	</body>
</html>
