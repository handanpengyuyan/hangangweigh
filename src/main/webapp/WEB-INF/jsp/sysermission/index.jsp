<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<base href="<%=basePath%>">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../common/commoneasyui.jsp" %>
<script type="text/javascript">
	$(function(){
		$("#permissionTable").treegrid({
			toolbar:"#tb",
			idField:"id",
			treeField:"text",
			animate:true,
			onLoadSuccess : function(){
				//$(this).treegrid("collapseAll");
			},
			loadFilter : function(data){
				$.each(data,function(){
					this.state = "open";
				});
				return data;
			}
		});
	});
</script>
</head>
<body>
<table id="permissionTable"  title="Permission List"
        data-options="url:'ce/list',fitColumns:true,striped:true,iconCls:'icon-search'">
    <thead>
        <tr>
            <th data-options="field:'text',width:100,sortable:true">Text</th>
            <th data-options="field:'available',width:100,sortable:true">Available</th>
            <th data-options="field:'url',width:50">Url</th>
        </tr>
    </thead>
</table>
<div id="tb">
<c:if test="${fn:containsIgnoreCase(percodes,'sysermission:add') }">
<a href="javascript:void(0)" class="easyui-linkbutton" onclick="add_role();" data-options="iconCls:'icon-add',plain:true">添加</a>
</c:if>
<c:if test="${fn:containsIgnoreCase(percodes,'sysermission:update') }">
<a href="javascript:void(0)" class="easyui-linkbutton" onclick="edit_role();" data-options="iconCls:'icon-edit',plain:true">修改</a>
</c:if>
<c:if test="${fn:containsIgnoreCase(percodes,'sysermission:delete') }">
<a href="javascript:void(0)" class="easyui-linkbutton" onclick="delete_role();" data-options="iconCls:'icon-remove',plain:true">删除</a>
</c:if>
<c:if test="${fn:containsIgnoreCase(percodes,'sysermission:export') }">
<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true">导出</a>
</c:if>
<c:if test="${fn:containsIgnoreCase(percodes,'sysermission:import') }">
<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-sum',plain:true">批量导入</a>
</c:if>
</div>
</body>
</html>




