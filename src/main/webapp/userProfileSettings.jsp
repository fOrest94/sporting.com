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
    <title>kennyS - centrum sportowe</title>
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
            <li><a style="color:#428bca;" href="/contact">Kontakt</a></li>
        </ul>
    </div>

<div id="content-home">
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
                                        </div>
                                        <br>
                                        <div class="col-sm-6">
                                            <h4 style="color:#428bca;">${user.username} </h4></span>
                                            <span>${user.role} </p></span>
                                        </div>
                                        <c:if test="${user.role == 'ADMINISTRATOR'}">
                                        <div class="col-lg-12">
                                        <form:form method="POST" modelAttribute="newsForm" action="/userProfileSettings" class="form-horizontal">
                                            <fieldset>
                                                    <form:hidden path="id" value="${newsForm.id}"/>
                                                <c:if test="${newsForm.id == null}">
                                                <legend>Dodaj aktualność</legend>
                                                </c:if>
                                                <c:if test="${newsForm.id != null}">
                                                    <legend>Edytuj aktualność</legend>
                                                </c:if>
                                                <div class="form-group">
                                                    <label class="col-md-4 control-label" for="title">Tytuł
                                                        aktualności</label>
                                                    <div class="col-md-4">
                                                        <spring:bind path="title">
                                                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                                                <form:input type="text" name="title" path="title"
                                                                            class="form-control input-md"
                                                                            placeholder="Tu wpisz tytuł aktualności"
                                                                            autofocus="true"
                                                                            required="true"></form:input>
                                                                <form:errors path="title"></form:errors>
                                                            </div>
                                                        </spring:bind>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-4 control-label" for="objectId">Wybierz obiekt</label>
                                                    <div class="col-md-4">
                                                        <c:if test="${objectSelected == null}">
                                                        <form:select type="text" path="objectId" itemValue="f" class="form-control">
                                                            <c:forEach var="listValue" items="${objectList}">
                                                                <option value="${listValue.id}">${listValue.name}</option>
                                                            </c:forEach>
                                                        </form:select>
                                                        </c:if>
                                                        <c:if test="${objectSelected != null}">
                                                            <h4 style="padding-top: 5px; margin: 0px; text-align: left">${objectSelected}</h4>
                                                            <form:hidden path="objectId2" value="${objectId}"/>
                                                        </c:if>

                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-4 control-label">Opis</label>
                                                    <div class="col-md-8">
                                                        <spring:bind path="description">
                                                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                                                <form:textarea path="description" class="form-control" name="description" rows="8" cols="62"
                                                                           placeholder="Tu wpisz opis"
                                                                          required="true"></form:textarea>
                                                                <form:errors path="description"></form:errors>
                                                            </div>
                                                        </spring:bind>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-4 control-label" for="singlebutton"></label>
                                                    <div class="col-md-3 col-md-offset-5">
                                                        <button id="singlebutton" name="singlebutton"
                                                                class="btn"  style="background-color:#428bca; color: white">Dodaj
                                                        </button>
                                                    </div>
                                                </div>
                                                 </fieldset>
                                        </form:form>
                                                    <c:if test="${not empty newsList}" >
                                                        <form method="POST" class="form-horizontal" var="selected" action="/userProfileSettings/edit">
                                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                            <fieldset>
                                                                <legend>Operacje na aktualność</legend>
                                                                <div class="form-group">
                                                                    <label class="col-md-4 control-label"
                                                                           for="selectbasic">Wybierz aktualność</label>
                                                                    <div class="col-md-4">

                                                                        <select id="selectbasic" name="selectId"
                                                                                class="form-control">
                                                                            <c:forEach var="listView"
                                                                                       items="${newsList}">
                                                                                <option path="Id"
                                                                                        value="${selected = listView.id}">${listView.title}</option>
                                                                            </c:forEach>
                                                                        </select>

                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-md-4  control-label" style="padding-top: 10px;">Wybierz operacje</label>
                                                                    <div class="col-md-4 col-md-offset-4" style="padding-right: 29px;">
                                                                        <button name="type" value="delete" class="btn" style="background-color:#428bca; color: white">Usuń</button>
                                                                        <button name="type" value="edit" class="btn" style="background-color:#428bca; color: white">Edytuj</button>
                                                                    </div>
                                                                </div>
                                                            </fieldset>
                                                        </form>
                                                    </c:if>
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
                    <li><a href="/" style="color: black;">© 2016 kennyS.</a></li>
                    <li><a href="#" style="color: black;">Warunki korzystania z serwisu</a></li>
                    <li><a href="#" style="color: black;">Polityka prywatności</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>
