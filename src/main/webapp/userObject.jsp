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
                        <a href="/addObject" style="color: white"><span>Dodaj obiekt</span></a>
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

<div class="navbar navbar-default" style="padding-top: 50px; padding-bottom: 0px; margin-bottom: 0px; background-color: #cccccc">
    <div class="container" style="padding-left: 0px;">
        <ul class="nav navbar-nav" >
            <li><a style="color:#428bca;" href="/">Wyszukaj ośrodek</a></li>
            <li><a style="color:#428bca;" href="/news">Aktualności</a></li>
            <c:if test="${user.role != 'ADMINISTRATOR'}"><li><a style="color:#428bca;" href="/contact">Kontakt</a></li></c:if>
        </ul>
    </div>
</div>
<div id="content-home" >
    <div class="container" style="padding-top: 20px; background-color: white">
        <div class="col-lg-3 col-lg-offset-1">
            <div class="panel-custom-container" >
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><a href="/userProfile">Profil</a></h3>
                    </div>
                    <c:if test="${user.objectId != null}">
                        <div class="panel-body">
                            <h3 class="panel-title"><a href="/userObject/${user.objectId}">Obiekt</a></h3>
                        </div>
                    </c:if>
                    <c:if test="${user.role != 'ADMINISTRATOR'}">
                        <div class="panel-body">
                            <h3 class="panel-title"><a href="/userProfileReservation">Rezerwacje</a></h3>
                        </div>
                    </c:if>
                    <div class="panel-body">
                        <h3 class="panel-title"><a href=" /userProfileEdit">Ustawienia</a></h3>
                    </div>
                    <div class="panel-body">
                        <h3 class="panel-title"><a href="/userProfileMessages">Wiadomości</a></h3>
                    </div>
                    <c:if test="${user.role == 'ADMINISTRATOR'}">
                        <div class="panel-body">
                            <h3 class="panel-title"><a href="/userProfileSettings">Dodaj aktualność</a></h3>
                        </div>
                        <div class="panel-body">
                            <h3 class="panel-title"><a href="/userObjectManagement">Zarządzanie obiektami</a></h3>
                        </div>
                        <div class="panel-body">
                            <h3 class="panel-title"><a href="/reports">Raporty</a></h3>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
        <div class="col-lg-7">
            <div class="container">
                <div class="row">
                    <div class="col-md-7 ">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="box box-info">
                                    <div class="box-body">
                                        <div class="col-sm-6">
                                            <div align="center"><img alt="User Pic"
                                                                     src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg"
                                                                     id="profile-image1"
                                                                     class="img-circle img-responsive">

                                                <input id="profile-image-upload" class="hidden" type="file">
                                            </div>
                                            <br>
                                        </div>
                                        <div class="col-sm-6">
                                            <h4 style="font-family: 'Audiowide', cursive; font-size: 150%; color:#428bca;">${user.username} </h4></span>
                                            <span>${user.firstName} ${user.lastName}</p></span>
                                        </div>
                                        <div class="clearfix"></div>
                                        <hr style="margin:5px 0 5px 0;">

                                        <c:if test="${user.role == 'USER'}">
                                            <div class="col-lg-12">

                                                <form:form method="POST" modelAttribute="objectForm" action="/userObject/${objectForm.id}" class="form-horizontal">
                                                    <fieldset>
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label" for="name">Pokaż profil:</label>
                                                            <div class="col-md-3" style="padding-left: 0%; margin-left: 0%">
                                                                <a class="btn btn-success" href="/object/${user.objectId}">Wyświetl obiekt</a>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label" for="name">Obiekt:</label>
                                                            <div class="col-md-8">
                                                                <spring:bind path="name">
                                                                    <div class="form-group ${status.error ? 'has-error' : ''}">
                                                                        <form:input type="text" path="name" class="form-control input-md"
                                                                                    placeholder="${objectForm.name}" autofocus="true"
                                                                                    required="true"/>
                                                                        <form:errors path="name"></form:errors>
                                                                    </div>
                                                                </spring:bind>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label" for="street">Lokalizacja:</label>
                                                            <div class="col-md-8" >
                                                                <spring:bind path="street">
                                                                    <div class="form-group ${status.error ? 'has-error' : ''}">
                                                                        <form:input type="text" path="street" class="form-control input-md"
                                                                                    placeholder="${objectForm.street}" autofocus="true"
                                                                                    required="true"/>
                                                                        <form:errors path="street"></form:errors>
                                                                    </div>
                                                                </spring:bind>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label" for="street">Miejscowość:</label>
                                                            <div class="col-md-3" style="padding-right: 0%; margin-right: 0%">
                                                                <spring:bind path="place">
                                                                    <div class="form-group ${status.error ? 'has-error' : ''}">
                                                                        <form:input type="text" path="place" class="form-control input-md"
                                                                                    placeholder="${objectForm.street}" autofocus="true"
                                                                                    required="true"/>
                                                                        <form:errors path="place"></form:errors>
                                                                    </div>
                                                                </spring:bind>
                                                            </div>
                                                            <label  style="margin-left: 0%; margin-left: 0%" class="col-md-2 control-label" for="street">, kod</label>
                                                            <div class="col-md-2">
                                                                <spring:bind path="postKey">
                                                                    <div class="form-group ${status.error ? 'has-error' : ''}">
                                                                        <form:input type="text" path="postKey" class="form-control input-md"
                                                                                    placeholder="${objectForm.place}" autofocus="true"
                                                                                    required="true"/>
                                                                        <form:errors path="postKey"></form:errors>
                                                                    </div>
                                                                </spring:bind>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label">Opis</label>
                                                            <div class="col-md-8">
                                                                <spring:bind path="description">
                                                                    <div class="form-group ${status.error ? 'has-error' : ''}">
                                                                        <form:textarea path="description" class="form-control" name="description" rows="8" cols="62"
                                                                                       placeholder="${objectForm.description}"
                                                                                       required="true"></form:textarea>
                                                                        <form:errors path="description"></form:errors>
                                                                    </div>
                                                                </spring:bind>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label" for="name">Cena:</label>
                                                            <div class="col-md-2">
                                                                <spring:bind path="price">
                                                                    <div class="form-group ${status.error ? 'has-error' : ''}">
                                                                        <form:input type="text" path="price" class="form-control input-md"
                                                                                    placeholder="${objectForm.price}" autofocus="true"
                                                                                    required="true" />
                                                                        <form:errors path="price"></form:errors>
                                                                    </div>
                                                                </spring:bind>
                                                            </div>
                                                            <div class="col-md-1" style="padding-top: 5px; padding-left: 0%">
                                                                zł/h
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label" for="name">Cena ulgowa:</label>
                                                            <div class="col-md-1">
                                                                <spring:bind path="extraPrice">
                                                                    <div class="form-check" style="padding-top: 5px">
                                                                        <form:checkbox path="extraPrice" class="form-check-input position-static" id="checkbox1" value="1"/>
                                                                    </div>
                                                                </spring:bind>

                                                            </div>
                                                            <label class="col-md-3 control-label" for="name">Wartość zniżki:</label>
                                                            <div class="col-md-1"  style="padding-top: 5px; padding-left: 0%">
                                                                <spring:bind path="extraPriceValue">
                                                                    <form:select path="extraPriceValue" id="hourOfEndReservation"
                                                                                 onchange="evaluatePrice()"
                                                                                 style="border-radius: 3px; border-width: 1px; font-size: 16px;">
                                                                        <option value="5">5</option>
                                                                        <option value="10">10</option>
                                                                        <option value="15">15</option>
                                                                        <option value="20">20</option>
                                                                        <option value="25">25</option>
                                                                        <option value="30">30</option>
                                                                        <option value="35">35</option>
                                                                        <option value="40">40</option>
                                                                        <option value="45">45</option>
                                                                        <option value="50">50</option>
                                                                        <option value="55">55</option>
                                                                        <option value="60">60</option>
                                                                    </form:select>
                                                                </spring:bind>
                                                            </div>
                                                            <div class="col-md-1" style="padding-top: 5px; padding-left: 0%">
                                                                %
                                                            </div>
                                                        </div>
                                                        <form:hidden path="id" value="${objectForm.id}"/>
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label" for="singlebutton"></label>
                                                            <div class="col-md-3 col-md-offset-5">
                                                                <button id="singlebutton" name="singlebutton"
                                                                        class="btn"  style="background-color:#428bca; color: white">Aktualizuj
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </form:form>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
