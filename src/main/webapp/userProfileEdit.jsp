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
            <li><a style="color:#428bca;" href="/offer">Kontakt</a></li>
        </ul>
    </div>
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
                    <div class="panel-body">
                        <h3 class="panel-title"><a href="/userProfileReservation">Rezerwacje</a></h3>
                    </div>
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
                                            <h4 style="color:#428bca;">${user.username} </h4></span>
                                            <span>${user.role} </p></span>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="reservationsContent">
                                                <form method="POST" action="/userProfileEditEmail" class="form-signin">

                                                    <div class="form-group">
                                                        <div class="col-lg-12">
                                                            <label class="col-md-3 control-label"
                                                                   style="text-align: left; padding-top: 5px;">Zmień
                                                                email</label>
                                                            <div class="col-md-4">
                                                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                                                    <input type="text" name="userName"
                                                                           class="form-control"
                                                                           placeholder="Nowy Email"></input>
                                                                </div>
                                                            </div>
                                                            <input type="hidden" name="${_csrf.parameterName}"
                                                                   value="${_csrf.token}"/>
                                                            <div class="col-lg-5 controls"
                                                                 style="margin-bottom: 10px; padding-left: 0px;">
                                                                <input type="hidden" name="id" value="${user.id}">
                                                                <input type="submit" name="submit" value="Zmień"
                                                                       class="btn btn-primary"
                                                                       style="background-color: #428bca; width: 100px;">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                                <form method="POST" action="/userProfileEditPassword" class="form-signin">
                                                    <h4 style="text-align: left; padding-left: 30px;">Zmień hasło</h4>
                                                    <div class="form-group">
                                                        <div class="col-lg-12">
                                                            <label class="col-md-3 control-label"
                                                                   style="text-align: left; padding-top: 5px;">Obecne
                                                                hasło</label>
                                                            <div class="col-md-4">
                                                                <input type="hidden" name="id" value="${user.id}">
                                                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                                                    <input type="password" name="password1"
                                                                           class="form-control"
                                                                           placeholder="Obecne hasło"></input>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-12">
                                                            <label class="col-md-3 control-label"
                                                                   style="text-align: left; padding-top: 5px;">Nowe
                                                                hasło</label>
                                                            <div class="col-md-4">
                                                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                                                    <input type="password" name="password2"
                                                                           class="form-control"
                                                                           placeholder="Nowe hasło"></input>
                                                                </div>
                                                            </div>
                                                            <input type="hidden" name="${_csrf.parameterName}"
                                                                   value="${_csrf.token}"/>
                                                            <div class="col-lg-5 controls"
                                                                 style="margin-bottom: 10px; padding-left: 0px;">
                                                                <input type="submit" name="submit" value="Zmień"
                                                                       class="btn btn-primary"
                                                                       style="background-color: #428bca; width: 100px;">
                                                            </div>
                                                        </div>

                                                    </div>
                                                </form>
                                                <form method="POST" action="/userProfileEditStreet" class="form-signin">

                                                    <div class="form-group">
                                                        <div class="col-lg-12">
                                                            <label class="col-md-3 control-label"
                                                                   style="text-align: left; padding-top: 5px;">Zmień
                                                                ulice</label>
                                                            <div class="col-md-4">
                                                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                                                    <input type="text" name="street"
                                                                           class="form-control"
                                                                           placeholder="Ulica"></input>
                                                                </div>
                                                            </div>
                                                            <input type="hidden" name="${_csrf.parameterName}"
                                                                   value="${_csrf.token}"/>
                                                            <div class="col-lg-5 controls"
                                                                 style="margin-bottom: 10px; padding-left: 0px;">
                                                                <input type="hidden" name="id" value="${user.id}">
                                                                <input type="submit" name="submit" value="Zmień"
                                                                       class="btn btn-primary"
                                                                       style="background-color: #428bca; width: 100px;">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                                <form method="POST" action="/userProfileEditPhone" class="form-signin">

                                                    <div class="form-group">
                                                        <div class="col-lg-12">
                                                            <label class="col-md-3 control-label"
                                                                   style="text-align: left; padding-top: 5px;">Zmień nr. telefonu</label>
                                                            <div class="col-md-4">
                                                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                                                    <input type="text" name="phone"
                                                                           class="form-control"
                                                                           placeholder="Telefon"></input>
                                                                </div>
                                                            </div>
                                                            <input type="hidden" name="${_csrf.parameterName}"
                                                                   value="${_csrf.token}"/>
                                                            <div class="col-lg-5 controls"
                                                                 style="margin-bottom: 10px; padding-left: 0px;">
                                                                <input type="hidden" name="id" value="${user.id}">
                                                                <input type="submit" name="submit" value="Zmień"
                                                                       class="btn btn-primary"
                                                                       style="background-color: #428bcall; width: 100px;">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
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

</body>
</html>
