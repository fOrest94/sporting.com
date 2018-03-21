<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="pl_PL">
<head>
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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
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

<div class="container" style="background-color: white; min-height: 840px">
    <div class="col-lg-3" style="min-height: 370px;">
        <div class="search" style="padding-top: 80px;">
            <div class="form-section" >
                <div class="row">
                    <form:form method="POST" name="showListOfObjectForm" action="/" modelAttribute="showListOfObjectForm" class="form-signin">
                        <div class="col-md-12">
                            <label for="miasto">Miejscowość</label>
                            <form:input type="text" path="objectPlace" class="form-control" id="miasto"  placeholder="Wpisz miejscowość"/>
                        </div>
                        <div class="col-md-12" style="padding-top: 20px;">
                            <label for="datetimepicker">Termin</label><br>
                            <form:input type="text" path="date" id="datetimepicker"
                                        onchange="evaluatePrice()" placeholder="Wybierz date"/>
                            </br>
                            <form:errors path="date"/>
                        </div>
                        <div class="col-md-12" style="margin-top: 30px; padding: 0px;">
                            <div class="col-md-2"  style="padding-top: 5px;padding-right: 0px;padding-bottom: 0px;">
                                Od:
                            </div>
                            <div class="col-md-4"  style="padding-top: 5px;padding-right: 0px;padding-left: 0px;padding-bottom: 0px;">
                                <spring:bind path="startTime">
                                    <form:select path="startTime" id="hourOfReservation"
                                                 onchange="evaluatePrice()"
                                                 style="border-radius: 3px; border-width: 1px; font-size: 16px;">
                                        <option value="08:00">7:00</option>
                                        <option value="08:00">8:00</option>
                                        <option value="09:00">9:00</option>
                                        <option value="10:00">10:00</option>
                                        <option value="11:00">11:00</option>
                                        <option value="12:00">12:00</option>
                                        <option value="13:00">13:00</option>
                                        <option value="14:00">14:00</option>
                                        <option value="15:00">15:00</option>
                                        <option value="16:00">16:00</option>
                                        <option value="17:00">17:00</option>
                                        <option value="18:00">18:00</option>
                                        <option value="19:00">19:00</option>
                                        <option value="20:00">20:00</option>
                                        <option value="21:00">21:00</option>
                                    </form:select>
                                </spring:bind>
                            </div>
                            <div class="col-md-2"  style="padding-top: 5px;padding-right: 0px;padding-bottom: 0px;">
                                Do:
                            </div>
                            <div class="col-md-4"  style="padding-top: 5px;padding-right: 0px;padding-left: 0px;padding-bottom: 0px;">
                                <spring:bind path="endTime">
                                    <form:select path="endTime" id="hourOfEndReservation"
                                                 onchange="evaluatePrice()"
                                                 style="border-radius: 3px; border-width: 1px; font-size: 16px;">
                                        <option value="08:00">8:00</option>
                                        <option value="09:00">9:00</option>
                                        <option value="10:00">10:00</option>
                                        <option value="11:00">11:00</option>
                                        <option value="12:00">12:00</option>
                                        <option value="13:00">13:00</option>
                                        <option value="14:00">14:00</option>
                                        <option value="15:00">15:00</option>
                                        <option value="16:00">16:00</option>
                                        <option value="17:00">17:00</option>
                                        <option value="18:00">18:00</option>
                                        <option value="19:00">19:00</option>
                                        <option value="20:00">20:00</option>
                                        <option value="21:00">21:00</option>
                                        <option value="22:00">22:00</option>
                                        ";
                                    </form:select>
                                </spring:bind>
                            </div>
                            <div class="col-md-offset-2 col-md-10" style="padding-bottom: 20px; padding-top: 20px;">
                                <button type="submit" style="font-size: 20px;" class="btn btn-default btn-primary">Wyszukaj</button>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-9" style="min-height: 370px; padding-top: 10px; padding-bottom: 15px; margin-top: 10px;">
        <p style="font-size: 150%; font-family: 'Audiowide', cursive;">Znaleziono ${objectList.size()} wyników dla: ${objectPlace}</p>
        <c:if test="${not empty objectList}">
        <c:forEach var="listView" items="${objectList}">
            <div class="col-lg-12" style="margin-bottom: 12px; padding: 15px 10px 0px 0px;border-radius: 10px; border: 1px solid #9d9d9d; min-height: 300px">
                <div class="col-lg-6" style="padding-top: 15px;">
                    <img class="col-lg-12" src="../../resources/img/${listView.id}.1.jpg" >
                </div>
                <div class="col-lg-6">
                    <div class="col-lg-12" style="min-height: 210px;">
                        <p style="font-family: 'Audiowide', cursive; font-size: 150%; color: #101010; text-shadow: 4px 4px white; padding-top: 7px">${listView.name}</p>
                        <p style="cursive; font-size: 120%; color: #101010; text-shadow: 4px 4px white;">${listView.place}, ${listView.street}</p>
                        <p style="width: 350px; height: 100px; white-space: wrap; overflow: hidden; text-overflow: ellipsis; ">${listView.description}</p>
                        <br>
                    </div>
                    <div class="col-lg-12">
                        <div class="col-lg-6">
                            <div align="left" style="padding-top: 5px;">
                                Cena: 40 zł/h
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div align="right">
                                <a class="btn btn-primary" href="/object/${listView.id}">Sprawdź</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
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

<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrollReveal.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

</body>
</html>