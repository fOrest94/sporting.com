<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="pl_PL">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>sporting.com</title>
    <link href="https://fonts.googleapis.com/css?family=Audiowide" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Play" rel="stylesheet">
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../resources/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="../resources/css/style.css"/>
    <script src="../resources/js/jquery.js"></script>
    <script src="../resources/js/bootstrap.min.js"></script>
    <script src="../resources/js/script.js"></script>
    <script src="../resources/js/scrollReveal.js"></script>
    <script src="../resources/js/custom.js"></script>
</head>
<body>
<div class="navbar navbar-inverse navbar-fixed-top" >
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="/">sporting.com</a>
        </div>
        <div class=" navbar-right">
            <div class="container-fluid">
                <c:if test="${pageContext.request.userPrincipal.name == null}">
                    <button class="btn btn-primary navbar-btn">
                        <a href="/sss" style="color: white"><span>Dodaj obiekt</span></a>
                    </button>
                    <button style="margin-left: 10px; margin-right: 10px" class="btn btn-light navbar-btn">
                        <a href="/login" style="color: black"><span>Zaloguj się</span></a>
                    </button>
                    <button class="btn btn-light navbar-btn">
                        <a href="/registration" style="color: black"><span>Zarejestruj się</span></a>
                    </button>
                </c:if>
                <sec:authorize access="hasRole('ROLE_USER')">
                    <c:url value="/logout" var="logoutUrl" />
                    <form action="${logoutUrl}" method="post" id="logoutForm">
                        <input type="hidden" name="${_csrf.parameterName}"
                               value="${_csrf.token}" />
                    </form>
                    <script>
                        function formSubmit() {
                            document.getElementById("logoutForm").submit();
                        }
                    </script>

                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <div class="col-md-4">
                            <button class="btn btn-primary navbar-btn">
                                <a href="userProfile" style="color: white"><strong>Mój profil</strong></a>
                            </button>
                        </div>
                        <div class="col-md-8" style="background-color: white; font-size: 110%; margin-top: 8px; height: 34px; border-radius: 2px;">
                            <div class="col-md-12" style="padding-top: 5px">
                                Witaj, ${pageContext.request.userPrincipal.name}/
                                <strong><a href="javascript:formSubmit()" style="color: black; "> Wyloguj</a></strong>
                            </div>
                        </div>
                    </c:if>
                </sec:authorize>
            </div>
        </div>
    </div>
</div>
<div class="navbar navbar-default" style="padding-top: 50px;">
    <div class="container" style="padding-left: 0px;">
        <ul class="nav navbar-nav" >
            <li><a style="color:#428bca;" href="/">Wyszukaj ośrodek</a></li>
            <li><a style="color:#428bca;" href="/news">Aktualności</a></li>
            <li><a style="color:#428bca;" href="/contact">Kontakt</a></li>
        </ul>
    </div>
</div>
<div id="content-contact" style="padding-top: 150px;">
    <c:if test="${contactObject.id != null}">
        <div class="container" style=" background-color: rgba(0,0,0,0.5); min-height: 500px; width: 800px">
            <div class="col-md-12 text-justify" data-scrollreveal="enter top and move 100px, wait 0.3s" style=" padding-bottom: 20px;">
                <h1 style="font-family: console;  color: white"><h3 style=" color: white"><strong>Napisz wiadomość</strong><br></h3> <hr/>
                    <form:form method="POST" modelAttribute="contactForm" >
                    <form:hidden path="userId" value="${ownerOfObject}"/>
                    <div class="row">
                        <div class="form-group col-md-12">
                            <div class="col-md-6" style="margin: 0%; padding: 0%">
                            <c:if test="${(userName.firstName != null)}">
                                <div style="color: white">Twoje imię</div>
                                <spring:bind path="contactName">
                                    <div class="form-group ${status.error ? 'has-error' : ''}">
                                        <div style="color: lightgoldenrodyellow; font-size: 150%; margin-bottom: 0%; padding-bottom: 0%"> <form:label path="contactName">${userName.firstName}</form:label></div>
                                        <form:errors path="contactName"></form:errors>
                                    </div>
                                </spring:bind>
                            </c:if>
                            <c:if test="${(userName.firstName == null)}">
                                <div style="color: white">Twoje imię</div>
                                <spring:bind path="contactName">
                                    <div class="form-group ${status.error ? 'has-error' : ''}">
                                        <form:input path="contactName" class="form-control" placeholder="Wpisz swoję imię"/>
                                        <form:errors path="contactName"></form:errors>
                                    </div>
                                </spring:bind>
                            </c:if>
                        </div>
                        </div>
                        <div class="form-group col-md-12">
                            <div class="col-md-6" style="margin: 0%; padding: 0%">
                            <c:if test="${(userName.email != null)}">
                                <div style="color: white">Adres email</div>
                                <spring:bind path="contactEmail">
                                    <div class="form-group ${status.error ? 'has-error' : ''}">
                                        <div style="color: lightgoldenrodyellow; font-size: 150%; margin-bottom: 0%; padding-bottom: 0%"> <form:label path="contactEmail">${userName.email}</form:label></div>
                                        <form:errors path="contactEmail"></form:errors>
                                    </div>
                                </spring:bind>
                            </c:if>
                            <c:if test="${(userName.firstName == null)}">
                                <div style="color: white">Adres email</div>
                                <spring:bind path="contactEmail">
                                    <div class="form-group ${status.error ? 'has-error' : ''}">
                                        <form:input path="contactEmail" class="form-control" placeholder="Wpisz adres email"/>
                                        <form:errors path="contactEmail"></form:errors>
                                    </div>
                                </spring:bind>
                            </c:if></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 ">
                            <div style="color: white">Wiadomość</div>
                            <spring:bind path="contactContent">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:textarea path="contactContent" class="form-control" rows="7"  placeholder="Zadaj pytanie"/>
                                    <form:errors path="contactContent"></form:errors>
                                </div>
                            </spring:bind>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-default" style="margin-bottom: 20px;">Wyślij!</button>
                    </form:form>
            </div>
        </div>
    </c:if>
    <c:if test="${contactObject.id == null}">
    <div class="container" style=" background-color: rgba(0,0,0,0.5); height: 400px;">
        <div class="col-md-8 col-md-offset-2 text-center" data-scrollreveal="enter top and move 100px, wait 0.3s" style=" padding-bottom: 20px;">
            <h1 style="font-family: console; color: white"><div id="red"><strong>Kontakt / Napisz do nas</strong></div></h1>
        </div>

        <div class="col-md-6 text-justify" data-scrollreveal="enter top and move 100px, wait 0.3s" style=" padding-bottom: 20px;">
            <h3 style="margin-top: 15px;  color: white;"><strong>Nasza lokalizacja</strong></br>
                <hr /><h3 style=" color: white">Skarżyńskiego 3, 31-866 Kraków</br>Telefon: +48 070 099 769</br>Email: sporting@gmail.com</h3>
        </div>

        <div class="col-md-6 text-justify" data-scrollreveal="enter top and move 100px, wait 0.3s" style=" padding-bottom: 20px;">
            <h1 style="font-family: console;  color: white"><h3 style=" color: white"><strong>Napisz wiadomość</strong><br></h3> <hr/>

                <form:form method="POST" modelAttribute="contactForm">
                <div class="row">
                    <div class="form-group col-md-6 ">
                        <spring:bind path="contactName">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <form:input path="contactName" class="form-control" placeholder="Twoje imię"/>
                                <form:errors path="contactName"></form:errors>
                            </div>
                        </spring:bind>
                    </div>

                    <div class="form-group col-md-6 ">
                        <spring:bind path="contactEmail">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <form:input path="contactEmail" class="form-control" placeholder="Email"/>
                                <form:errors path="contactEmail"></form:errors>
                            </div>
                        </spring:bind>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12 ">
                        <spring:bind path="contactContent">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <form:textarea path="contactContent" class="form-control" rows="3"  placeholder="Message"/>
                                <form:errors path="contactContent"></form:errors>
                            </div>
                        </spring:bind>
                    </div>
                </div>
                <button type="submit" class="btn btn-default">Wyślij!</button>
                </form:form>
        </div>
    </div>
    </c:if>
</div>
</div>

<div class="footer navbar-fixed-bottom" style="background-color: #cccccc">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <ul class="nav nav-pills nav-justified">
                    <li><a href="/" style="color: black;">@ 2018 sporting.com.</a></li>
                    <li><a href="#" style="color: black;">Warunki korzystania z serwisu</a></li>
                    <li><a href="#" style="color: black;">Polityka prywatności</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>