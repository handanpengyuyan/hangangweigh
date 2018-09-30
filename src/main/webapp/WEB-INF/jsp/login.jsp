<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="assets/longassets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/longassets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="assets/longassets/css/form-elements.css">
        <link rel="stylesheet" href="assets/longassets/css/style.css">
        <link rel="shortcut icon" href="assets/longassets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/longassets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/longassets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/longassets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/longassets/ico/apple-touch-icon-57-precomposed.png">
          
      

</head>
       
<body>
 <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1>后台管理系统</h1>
                            <div class="description">
                            	<p>
	                            这是一个后台登陆的管理系统，马上使用它吧！
                            	</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>登陆</h3>
                            		<p>请输入用户密码:</p>
                            		<p style="color:red;">${error }</p>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-lock"></i>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form role="form" action="" method="post" class="login-form">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-username">Username</label>
			                        	<input type="text" name="username" placeholder="用户名..." class="form-username form-control" id="form-username">
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">Password</label>
			                        	<input type="password" name="password" placeholder="密码..." class="form-password form-control" id="form-password">
			                        </div>
			                        <button type="submit" class="btn">登陆</button>
			                    </form>
		                    </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 social-login">
                        	<h3>...使用其他登陆方式:</h3>
                        	<div class="social-login-buttons">
	                        	<a class="btn btn-link-2" href="#" onclick="d1()">
	                        		<i class="fa fa-facebook"></i> Facebook
	                        	</a>
	                        	<a class="btn btn-link-2" href="#" onclick="d1()">
	                        		<i class="fa fa-twitter"></i> Twitter
	                        	</a>
	                        	<a class="btn btn-link-2" href="#" onclick="d1()">
	                        		<i class="fa fa-google-plus"></i> Google Plus
	                        	</a>
                        	</div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>


        <!-- Javascript -->
        <script src="assets/longassets/js/jquery-1.11.1.min.js"></script>
        <script src="assets/longassets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/longassets/js/jquery.backstretch.min.js"></script>
        <script src="assets/longassets/js/scripts.js"></script>
         <script>
      		function d1(){
      			alert("此功能暂未开放")
      		}
         </script>
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->
</body>
</html>