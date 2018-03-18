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

<c:if test="${not empty offerList}">

    <div class="container" style="padding-top: 180px;">
        <div class="row">
            <div class="col-lg-12" style="min-height: 370px;">
                <div class="col-lg-5">
                    <img src="/${offerList[0].picture}" width="400px;" height="300px;">

                </div>
                <div class="col-lg-7">
                    <h1 style="font-family: 'Audiowide', cursive; font-size: 50px; color: #101010; text-shadow: 4px 4px white;">
                            ${offerList[0].name}</h1>
                    <br>
                    <h4>${offerList[0].description}</h4>
                </div>
            </div>
            <div class="col-lg-12" style="min-height: 370px;">
                <div class="col-lg-5">

                    <img src="/${offerList[1].picture}" width="400px;" height="300px;">

                </div>
                <div class="col-lg-7">
                    <h1 style="font-family: 'Audiowide', cursive; font-size: 50px; color: #101010; text-shadow: 4px 4px white;">
                            ${offerList[1].name}</h1>
                    <br>
                    <h4>${offerList[1].description}</h4>
                </div>
            </div>
            <div class="col-lg-12" style="min-height: 370px;">
                <div class="col-lg-5">
                    <img src="/${offerList[2].picture}" width="400px;" height="300px;">

                </div>
                <div class="col-lg-7">
                    <h1 style="font-family: 'Audiowide', cursive; font-size: 50px; color: #101010; text-shadow: 4px 4px white;">
                            ${offerList[2].name}</h1>
                    <br>
                    <h4>${offerList[2].description}</h4>
                </div>
            </div>
            <div class="col-lg-12" style="min-height: 370px;">
                <div class="col-lg-5">
                    <img src="/${offerList[3].picture}" width="400px;" height="300px;">

                </div>
                <div class="col-lg-7">
                    <h1 style="font-family: 'Audiowide', cursive; font-size: 50px; color: #101010; text-shadow: 4px 4px white;">
                            ${offerList[3].name}</h1>
                    <br>
                    <h4>${offerList[3].description}</h4>
                </div>
            </div>
            <div class="col-lg-12" style="min-height: 370px;">
                <div class="col-lg-5">
                    <img src="/${offerList[4].picture}" width="400px;" height="300px;">

                </div>
                <div class="col-lg-7">
                    <h1 style="font-family: 'Audiowide', cursive; font-size: 50px; color: #101010; text-shadow: 4px 4px white;">
                            ${offerList[4].name}</h1>
                    <br>
                    <h4>${offerList[4].description}</h4>
                </div>
            </div>
            <div class="col-lg-12" style="min-height: 370px;">
                <div class="col-lg-5">
                    <img src="/${offerList[5].picture}" width="400px;" height="300px;">

                </div>
                <div class="col-lg-7">
                    <h1 style="font-family: 'Audiowide', cursive; font-size: 50px; color: #101010; text-shadow: 4px 4px white;">
                            ${offerList[5].name}</h1>
                    <br>
                    <h4>${offerList[5].description}</h4>
                </div>
            </div>
            <div class="col-lg-12" style="min-height: 370px;">
                <div class="col-lg-5">
                    <img src="/${offerList[6].picture}" width="400px;" height="300px;">

                </div>
                <div class="col-lg-7">
                    <h1 style="font-family: 'Audiowide', cursive; font-size: 50px; color: #101010; text-shadow: 4px 4px white;">
                            ${offerList[6].name}</h1>
                    <br>
                    <h4>${offerList[6].description}</h4>
                </div>
            </div>
            <div class="col-lg-12" style="min-height: 370px;">
                <div class="col-lg-5">
                    <img src="/${offerList[7].picture}" width="400px;" height="300px;">

                </div>
                <div class="col-lg-7">
                    <h1 style="font-family: 'Audiowide', cursive; font-size: 50px; color: #101010; text-shadow: 4px 4px white;">
                            ${offerList[7].name}</h1>
                    <br>
                    <h4>${offerList[7].description}</h4>
                </div>
            </div>
        </div>
    </div>

</c:if>

</body>

</html>