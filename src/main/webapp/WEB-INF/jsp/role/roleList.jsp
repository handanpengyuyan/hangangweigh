<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <base href="<%=basePath%>>">  
    <title>管理工具</title>        
  <jsp:include page="../common/commoneasyui.jsp"></jsp:include>
 
<script type="text/javascript">
	$(function(){
		$("#roleTable").datagrid({
			pagination : true,
			toolbar : "#tb",
			idField : "id",
			onLoadSuccess:function(){
				$("a.op").tooltip({
					position: 'right'
				});
			}
		});
	})
	
	function availableFormatter(value,row,index){
		if(value == 0){
			return "否";
		}
		return "是";
	}

	function opFormatter(value,row,index){
		return "<a href='javascript:void(0)' title='分配权限' onclick='assignPermission("+row.id+");' class='op'><img src='assets/easyui/themes/icons/large_chart.png' width='16'/></a>";
	}

	function assignPermission(roleId){
	
		$("#roleTable").datagrid("clearSelections");
		var d = $("<div></div>").appendTo("body");
		d.dialog({
			title : "分配权限",
			width:250,
			height:350,
			href : "ce/toAssign?roleId="+roleId,
			modal:true,
			onClose:function(){$(this).dialog("destroy");},
			buttons:[{
				iconCls:"icon-ok",
				text:"确定",
				handler : function(){
					//获取选中的节点：checked indeterminate
					var nodes = $("#assignTree").tree("getChecked","checked");
					var half_nodes = $("#assignTree").tree("getChecked","indeterminate");
					$.merge(nodes,half_nodes);
					//获取选中节点的编号，权限编号
					var postData = "";
					for(var i = 0; i<nodes.length;i++){
						postData += "ids="+nodes[i].id + "&";
					}
					postData += "roleId="+roleId;
					//发送异步请求，带 角色编号、一组权限编号
					$.post("ce/assign",postData,function(data){
						$.messager.show({
							title:'提示',
							msg:'授权成功！重新登录后生效！',
							timeout:2000,
							showType:'slide'
						});
						d.dialog("close");
						//弹框提示！
					});
				}
			},{
				iconCls:"icon-cancel",
				text:"取消",
				handler : function(){
					d.dialog("close");
				}
			}]
		});
	}

	function setCondition(){
		var postData = {rolename : $("#rolename").val()};
	/* 	var ids = $("#roles").combobox("getValues");
		for(var i = 0; i < ids.length ; i++){
			postData["sysRoles["+i+"].id"] = ids[i];
		} */
		
		$("#roleTable").datagrid("reload",postData);
	}

	function resetCondition(){
		$("#roleCondition").form("clear");
	}

	//删除选中的用户
	function delete_role(){
		//1. 获取选中的数据，如果没有选中，则提示必须选中数据
		var selRows = $("#roleTable").datagrid("getSelections");
		if(selRows.length == 0){
			$.messager.alert("提示","请选择要删除的数据行！","warning");
			return;
		}
		//2. 提示是否删除？是
		$.messager.confirm("提示","确定要删除选中的数据吗？",function(r){
			if(r){
				//3. 发送异步请求，带选中行的编号
				//拼接删除条件
				var postData = "";
				$.each(selRows,function(i){
					postData += "ids="+this.id;
					if(i < selRows.length - 1){
						postData += "&";
					}
				});
				$.post("role/batchDelete",postData,function(data){
					if(data.result == true){
						//4. 删除成功后，刷新表格 reload
						$("#roleTable").datagrid("reload");
					}
				});
			}
		});
	}

	function add_role(){
		var d = $("<div></div>").appendTo("body");
		d.dialog({
			title : "添加用户",
			iconCls : "icon-add",
			width:500,
			height:300,
			modal:true,
			href : "ce/from",
			onClose:function(){$(this).dialog("destroy"); },
			buttons:[{
				iconCls:"icon-ok",
				text:"确定",
				handler:function(){
					$("#roleForm").form("submit",{
						url : "role/add",
						success : function(data){
							d.dialog("close");
							$("#roleTable").datagrid("reload");
						}
					});
				}
			},{
				iconCls:"icon-cancel",
				text:"取消",
				handler:function(){
					d.dialog("close");
				}
			}]
		});
	}

	function edit_role(){
		var row = $("#roleTable").datagrid("getSelected");
		if(row == null){
			return;
		}

		//如果选中了多个，只保留row这个
		$("#roleTable").datagrid("clearSelections");
		$("#roleTable").datagrid("selectRecord",row.id);
		
		var d = $("<div></div>").appendTo("body");
		d.dialog({
			title : "编辑用户",
			iconCls : "icon-edit",
			width:500,
			height:300,
			modal:true,
			href : "role/form",
			onClose:function(){$(this).dialog("destroy"); },
			onLoad:function(){
				//发送异步请求，查询数据
				$.post("role/view",{id:row.id},function(data){
					$("#roleForm").form("load",data);
					var roles = new Array();
					$.each(data.sysRoles,function(){
						roles.push(this.id);
					});
					$("#roles_form").combobox("setValues",roles);
				});
			},
			buttons:[{
				iconCls:"icon-ok",
				text:"确定",
				handler:function(){
					$("#roleForm").form("submit",{
						url : "role/edit",
						success : function(data){
							d.dialog("close");
							$("#roleTable").datagrid("reload");
						}
					});
				}
			},{
				iconCls:"icon-cancel",
				text:"取消",
				handler:function(){
					d.dialog("close");
				}
			}]
		});
	}
</script>
 </head>  
 <style>
 
   
 	#tutu{
 	width:400px;
 	}
 	.jinyong{
 		color: red;
 	} 
 
 	.all{
 		margin:9px 0px 0px 13px;
 		width:98%;
 	}
 	 
 	.zhi1{
 		height:33px;
 		width:131px;
 		border-radius:5px;
 		background-color:#FAFAFA;
 		outline:none;
 	}
 	.zhi2{
 		height:33px;
 		width:131px;
 		border-radius:5px;
 		background-color:#FAFAFA;
 		outline:none;
 	}
 	.zhi2 option{
 	border-radius:2px;
 	}
 	 	.jinyong{
 		color: red;
 	}
 	.tongguo{
 		color: 	#339933;
 	}
 	 .glyphicon-send{
            color:blue;
            font-size:23px;
   	}
   	.glyphicon-send :hover{
           cursor: pointer;
           color:red;
   	}
   	.fou{
   		color: red;
   	}
 </style> 
  
 
 <body>  
<form id="roleCondition">
<div class="easyui-panel" title="设置查询条件" style="padding:15px 10px;">
	rolename : <input type="text" name="rolename" id="rolename" />
	<a id="btn" href="javascript:void(0)" onclick="setCondition();" class="easyui-linkbutton" data-options="iconCls:'icon-search'">Search</a>
	<a id="btn" href="javascript:void(0)" onclick="resetCondition()" class="easyui-linkbutton" data-options="iconCls:'icon-undo'">Reset</a>
</div>
</form>
<table id="roleTable"  title="User List"
        data-options="url:'ce/roleList',fitColumns:true,striped:true,rownumbers:true,iconCls:'icon-search'">
    <thead>
        <tr>
        		<th data-options="field:'tyu',checkbox:true"></th>
        		<th data-options="field:'id',width:30,sortable:true,order:'desc'">Id</th>
            <th data-options="field:'name',width:100,sortable:true">Name</th>
            <th data-options="field:'available',width:100,sortable:true,formatter:availableFormatter">Available</th>
            <th data-options="field:'world',width:50,formatter:opFormatter">操作</th>
        </tr>
    </thead>
</table>
<div id="tb">
<c:if test="${fn:containsIgnoreCase(percodes,'role:add') }">
<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>
</c:if>
<c:if test="${fn:containsIgnoreCase(percodes,'role:update') }">
<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
</c:if>
<c:if test="${fn:containsIgnoreCase(percodes,'role:delete') }">
<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
</c:if>
<c:if test="${fn:containsIgnoreCase(percodes,'role:import') }">
<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true">导出</a>
</c:if>
<c:if test="${fn:containsIgnoreCase(percodes,'role:export') }">
<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-sum',plain:true">批量导入</a>
</c:if>
</div>
 </body>
</html>