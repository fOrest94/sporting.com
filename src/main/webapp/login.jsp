<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Logowanie</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/font-awesome.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet">

    <script src="${contextPath}/resources/js/jquery.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${contextPath}/resources/js/scrollReveal.js"></script>
    <script src="${contextPath}/resources/js/custom.js"></script>
</head>

<body onload='document.loginForm.username.focus();' style="background-color: #F9F9F9;">
    <div class="container" style="margin-top: 250px;">
        <div class=" col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3"
             data-scrollreveal="enter bottom and move 300px, wait 0.2s">
            <div class="panel " style="border-color: #428bca;">
                <div class="panel-heading"style="background-color: #428bca;">
                    <div style="font-family: 'Itim', cursive; font-size: 21px;">Zaloguj się</div>
                    <div class="forgotPasswd">
                        <a href="#" style="color: inherit; font-size: 80%;">Zapomniałeś hasła?</a>
                    </div>
                </div>

                <div style="padding-top: 15px" class="panel-body">

                    <div style="display: none" id="login-alert"
                         class="alert alert-danger col-sm-12"></div>

                    <form method="POST" action="${contextPath}/login" class="form-signin">

                        <div class="form-group ${error != null ? 'has-error' : ''}">
                            <div style="height: 30px;"> ${message}${error}</div>

                            <div style="margin-bottom: 25px" class="input-group">
                                <input name="username" type="text" class="form-control" placeholder="Nazwa użytkownika"
                                       autofocus="true" style="width: 250px; border-radius: 2px;"/>
                            </div>
                            <input type="hidden" name="id" value="Norway">

                            <div style="margin-bottom: 25px" class="input-group">
                                <input type="password" name="password"
                                       class="form-control" placeholder="Hasło" style="width: 250px; border-radius: 2px;"/>
                            </div>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                                <div class="col-lg-12 controls" style="margin-bottom: 10px; padding-left: 0px;">
                                        <input type="submit" name="submit" value="Zaloguj" class="btn btn-primary" style="width: 100px;">
                                </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12 control">
                                <div
                                        style="border-top: 1px solid #888; padding-top: 15px; font-size: 85%">
                                    Nie masz konta! <a href="${contextPath}/registration">
                                    Zarejestruj się tutaj! </a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
