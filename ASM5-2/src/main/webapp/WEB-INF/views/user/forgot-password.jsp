<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/common/head.jsp"%>
</head>
<body>
<%@ include file="/common/header.jsp"%>

	
	

    <!-- Register Section Begin -->
    <div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="login-form">
                        <h2 style="color: rgb(255, 0, 0);">Forgot Password</h2>
                        <h5 class="text-danger">${message }</h5>
                        <form action="forgot-password" method="post"  modelAttribute="ac">
                            <div class="group-input">
                                <label for="varify">Username</label>
                                <input type="text" id="varify" name="username">
                            </div>
                            <div class="group-input">
                                <label for="email">Email</label>
                                <input type="email" id="email" name="email">
                            </div>
                            <button type="submit" class="site-btn login-btn">Send</button>
                        </form>
                        
                          <div class="switch-login">
                            <a href="register" class="or-login">Or Create An Account</a>
                        </div>
                      
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Register Form Section End -->
	
	
	
	
<%@ include file="/common/footer.jsp"%>
</body>
</html>