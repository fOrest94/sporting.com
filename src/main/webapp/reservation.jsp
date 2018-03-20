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

<div id="content-home" style="padding-top: 250px;">
    <div class="container">
        <div id="signupbox" class="col-md-10 col-md-offset-1"
             data-scrollreveal="enter left and move 300px over 1.33s">
            <div class="panel" style="border-color: #428bca;">
                <div class="panel-heading" style="background-color: #428bca;">
                    <div class="panel-title">Rezerwacja</div>

                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <form:form method="POST" name="reservationForm" modelAttribute="reservationForm"
                                   class="form-signin">
                        <table class="table table-condensed">
                            <thead>
                            <tr class="active">
                                <th>Obiekt sportowy</th>
                                <th>Dzień rezerwacji</th>
                                <th>Godzina rozpoczęcia</th>
                                <th>Godzina zakończenia</th>
                            </tr>
                            </thead>
                            <tbody style="background-color: white; ">
                            <tr style="padding-top: 25px;">
                                <th>${object.name}</th>
                                <th>
                                    <form:input type="text" path="dayOfReservation" id="datetimepicker"
                                                onchange="evaluatePrice()"/>
                                    </br>
                                    <form:errors path="dayOfReservation"/>

                                </th>
                                <th>
                                    <spring:bind path="hourOfReservation">
                                        <form:select path="hourOfReservation" id="hourOfReservation"
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
                                        </form:select>
                                    </spring:bind>
                                </th>
                                <th>
                                    <spring:bind path="hourOfEndReservation">
                                        <form:select path="hourOfEndReservation" id="hourOfEndReservation"
                                                     onchange="evaluatePrice()"
                                                     style="border-radius: 3px; border-width: 1px; font-size: 16px;">
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
                                        </br>
                                        <form:errors path="hourOfEndReservation"/>
                                    </spring:bind>
                                </th>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-12 " style="padding-top: 30px; padding-bottom: 30px; text-align: left;">
                            <h4><strong>Podsumowanie:</strong></h4>
                        </div>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <spring:bind path="userId">
                        <form:hidden path="userId" value="${user.id}"/>
                    </spring:bind>


                    <div class="form-group">
                        <div class="col-lg-2">
                            <a href="/priceList"><img src="../resources/img/left-arrow.png"></a>
                        </div>
                        <div class="col-lg-offset-7 col-lg-2">
                            <div style="margin-top: 5px" class="form-group">
                                <input type="submit" value="Zarezerwuj" class="btn btn-primary"
                                       style="width: 150px;">
                            </div>
                        </div>
                    </div>
                    </form:form>
                </div>
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
