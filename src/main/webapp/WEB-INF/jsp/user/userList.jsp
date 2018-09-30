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
  <jsp:include page="../common/common.jsp"></jsp:include>
  <style>
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
 	#tutu{
 	width:400px;
 	}
 	.jinyong{
 		color: red;
 	}
 	.tongguo{
 		color: 	#339933;
 	}
 </style> 
<script type="text/javascript">
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
	var roleid = roleId;
	   $.ajax({
           type: "POST",                                         //ajax的方式为post(get方式对传送数据长度有限制)
           url: "ce/toAssign?roleId="+roleid,           //一般处理程序页面AddUser.ashx(在2中会写出该页面内容)
           dataType: "json",                                   //数据传回的格式为json  
           success: function (data) {       
              
           }
       })  
 
/* 	$('#BannerModal').on('show.bs.modal', function (e) {
	  $("#BannerModal div.modal-body").load("ce/toAssign");  
	}); */
   
	$("#BannerModal").modal(); 
	$("#BannerModal").find(".modal-title").html("修改权限");
		 
}

function rolefamtter(value,row,index){
	if(value.length==0){
		return "-";
	}
	var str="";
	for(var i = 0;i<value.length;i++){
		str +=value[i].name+" ";
	}
	return str;
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
<div class="all">
<div id="toolbar" > 
		<c:if test="${fn:containsIgnoreCase(percodes,'user:add') }">
		<button type="button" class="btn btn-primary" onclick="addBanner();">添加</button> 
		</c:if>
		<c:if test="${fn:containsIgnoreCase(percodes,'user:update') }">
 		<button type="button" class="btn btn-primary" onclick="updateone();">修改</button> 
 		</c:if>
		<c:if test="${fn:containsIgnoreCase(percodes,'user:delete') }">
		<button type="button" class="btn btn-danger" onclick="batchDelete();">批量删除</button>	
		</c:if>	
	</div>
	  <table id="userTable" 
	    class="table-striped animated bounce" 
	    data-method="post"
	    data-content-type="application/x-www-form-urlencoded; charset=UTF-8"
		data-toggle="table"
		data-toolbar="#toolbar"
		data-url="userList" 
		data-show-columns="true" 
		data-show-refresh="true"
		data-show-toggle="true"  
		data-pagination="true" 
		data-toolbar-align="left"
        data-pagination="true"
        data-side-pagination="server"
        data-page-size="5"
        data-page-list="[5]"   
        data-show-pagination-switch="true">
		<thead>
			<tr>
				<th data-checkbox="true"></th>
				<th data-field="id">Id</th>
				<th data-field="username">name</th>
				<th data-field="password">password</th>
				<th data-field="salt">盐值</th>
				<th data-field="locked">锁定状态</th>
				
				<th data-field="sysRoles"  data-formatter="rolefamtter"></th>
		
			</tr>
		</thead>
	</table>
</div>   

	 
		
	<div id="BannerModal" class="modal animated bounceInRight fade" data-backdrop="static">
	  <div class="modal-dialog" style="width:600px;height:800px;">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">Modal title</h4>
	      </div>
	      <div class="modal-body">
	      
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" onclick="subForm();" >OK</button>
	      </div>
	    </div> 
	  </div> 
	</div> 
	
	
	<div id="tupianmodel" class="modal animated bounceInRight fade" data-backdrop="static">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">Modal title</h4>
	      </div>
	      <div class="modal-body">
	      <img id="tutu" src="122323" />
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" data-dismiss="modal"" data-dismiss="modal">OK</button>
	      </div>
	    </div> 
	  </div> 
	</div> 
	
	 
    
   <script type="text/javascript" >
   var $table = $("#userTable");
   
	//设置查询参数：对于表格的刷新和上一页下一页都管用：只要表格重新加载数据都器作用 
	$table.bootstrapTable({
		queryParams:function(params){
			params["uStatus"] = $("#uStatus").val();  		 
			return params;
		}
	});
	
	function setCondition(){
		$table.bootstrapTable("refresh");
	}
	

	
	
	
	
   </script> 
 </body>
</html>