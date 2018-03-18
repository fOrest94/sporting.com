<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML>
<html lang="pl_PL">
<head>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/font-awesome.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet">

    <title>Rejestracja</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body style="background-color: #F9F9F9;">

<div class="container" style=" margin-top: 250px;">
    <div id="signupbox" style="margin-top:50px" class="col-md-8 col-md-offset-2" data-scrollreveal="enter bottom and move 300px, wait 0.2s">
        <div class="panel"  style="border-color: #428bca;">
            <div class="panel-heading" style="background-color: #428bca;">
                <div class="panel-title"  >Dodaj obiekt</div>
            </div>
            <div class="panel-body" >
                <form:form method="POST" modelAttribute="objectForm" class="form-signin">

                    <div class="form-group">
                        <label for="place" class="text-left col-md-3 control-label " style="text-align: left">Nazwa okiektu</label>
                        <div class="col-md-4 " style="margin-right: 150px;">
                            <spring:bind path="name">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="name" class="form-control" placeholder="Obiekt"
                                                autofocus="true"></form:input>
                                    <form:errors path="name"></form:errors>
                                </div>
                            </spring:bind>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="place" class="text-left col-md-3 control-label " style="text-align: left">Miejscowość</label>
                        <div class="col-md-4 " style="margin-right: 150px;">
                            <spring:bind path="place">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="place" class="form-control" placeholder="Miejscowość"
                                                autofocus="true"></form:input>
                                    <form:errors path="place"></form:errors>
                                </div>
                            </spring:bind>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="street" class="text-left col-md-3 control-label " style="text-align: left">Ulica</label>
                        <div class="col-md-4 " style="margin-right: 150px;">
                            <spring:bind path="street">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="street" class="form-control" placeholder="Ulica"
                                                autofocus="true"></form:input>
                                    <form:errors path="street"></form:errors>
                                </div>
                            </spring:bind>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="description" class="text-left col-md-3 control-label " style="text-align: left">Kod pocztowy</label>
                        <div class="col-md-4 " style="margin-right: 150px;">
                            <spring:bind path="postKey">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="postKey" class="form-control" placeholder="Kod pocztowy (00-000)"
                                                autofocus="true"></form:input>
                                    <form:errors path="postKey"></form:errors>
                                </div>
                            </spring:bind>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="description" class="text-left col-md-3 control-label " style="text-align: left">Opis obiektu</label>
                        <div class="col-md-4 " style="margin-right: 150px;">
                            <spring:bind path="description">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="description" class="form-control" placeholder="Opis obiektu"
                                                autofocus="true"></form:input>
                                    <form:errors path="description"></form:errors>
                                </div>
                            </spring:bind>
                        </div>
                    </div>

                    <div class="form-group">
                        <!-- Button -->
                        <div class="col-md-offset-3 col-md-9">
                            <input type="submit" value="Zarejestruj się" class="btn btn-primary" style="width: 150px;">
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
<div class="footer navbar-fixed-bottom" style="background-color: whitesmoke">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <ul class="nav nav-pills nav-justified">
                    <li><a href="/" style="color: black;">© 2016 kennyS.</a></li>
                    <li><a href="#" style="color: black;">Warunki korzystania z serwisu</a></li>
                    <li><a href="#" style="color: black;">Polityka prywatności</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrollReveal.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
</body>
</html>