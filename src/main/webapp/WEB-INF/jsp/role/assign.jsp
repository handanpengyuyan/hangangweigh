<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	var roleId=${roleId}
	$.post("ce/getPermissions",{roleId:roleId},function(d){
		$("#assignTree").tree({
			loadFilter : function(data){
				$.each(data,function(){
					$.each(this.children,function(){
						
						if($.inArray(this.id,d)!=-1){
							this.checked = true;
						}
					})
				})
				return data;
			}
		})
	});
	
});
</script>



<ul id="assignTree" data-options="url:'ce/list',checkbox:true">   

