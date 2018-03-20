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
<c:if test="${not empty priceLists}">

    <div id="swimPriceSection">
        <div class="container" style="padding-top: 180px;">
            <div class="row">
                <div class="col-lg-8">
                    <h1 style="font-family: 'Audiowide', cursive; font-size: 50px; color: #101010; padding-bottom: 40px; text-shadow: 4px 4px white;">Basen</h1>
                    <div class="panel panel-default" style="box-shadow: 10px 10px 5px #cde6ec;">
                        <table class="table table-bordered">
                            <thead>
                            <tr class="active">
                                <th>Wynajęcie T1</th>
                                <th>Wynajęcie T2</th>
                                <th>Wynajęcie WT1</th>
                                <th>Wynajęcie WT2</th>
                                <c:if test="${not empty priceLists[0].subscriptionTariffOnePrice}">
                                    <th>Karnet T1</th>
                                </c:if>
                                <c:if test="${not empty priceLists[0].subscriptionTariffTwoPrice}">
                                    <th>Karnet T2</th>
                                </c:if>
                                <c:if test="${not empty priceLists[0].oneTimeEntrancePrice}">
                                    <th>Wejście jednorazowe</th>
                                </c:if>
                            </tr>
                            </thead>
                            <tbody style="background-color: white; ">
                            <tr>
                                <th>${priceLists[0].rentWeekdayTariffOnePrice} zł</th>
                                <th>${priceLists[0].rentWeekdayTariffTwoPrice} zł</th>
                                <th>${priceLists[0].rentWeekendTariffOnePrice} zł</th>
                                <th>${priceLists[0].rentWeekendTariffTwoPrice} zł</th>
                                <c:if test="${not empty priceLists[0].subscriptionTariffOnePrice}">
                                    <th>${priceLists[0].subscriptionTariffOnePrice} zł</th>
                                </c:if>
                                <c:if test="${not empty priceLists[0].subscriptionTariffTwoPrice}">
                                    <th>${priceLists[0].subscriptionTariffTwoPrice} zł</th>
                                </c:if>
                                <c:if test="${not empty priceLists[0].oneTimeEntrancePrice}">
                                    <th>${priceLists[0].oneTimeEntrancePrice} zł</th>
                                </c:if>
                            </tr>
                            </tbody>
                        </table>
                </div>

                    <div class="panel panel-default" style="box-shadow: 10px 10px 5px #cde6ec;">
                        <h5 style="color: red"><strong>Zmiana taryfy o godzinie: ${priceLists[0].tariffSwitchHour}</strong></h5>
                    </div>


                </div>
                <div class="col-lg-4" style="padding-top: 260px; ">
                    <form id="reservationForm0" action="/reservation" method="get">
                        <input type="hidden" name="objectId" value="${priceLists[0].objectId}" />
                        <a href="#" onclick="document.getElementById('reservationForm0').submit();" class="btn btn-default"
                           style="font-size: 20px; box-shadow: 10px 10px 5px #cde6ec;">Rezerwacja</a>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div id="gymSection">
        <div class="container" style="padding-top: 80px;">
            <div class="row">
                <div class="col-lg-8">
                    <h1 style="font-family: 'Audiowide', cursive; font-size: 50px; color: #101010; padding-bottom: 40px;  text-shadow: 4px 4px white;">Sala gimnastyczna</h1>
                    <div class="panel panel-default" style="box-shadow: 10px 10px 5px #cde6ec;">
                        <table class="table table-bordered">
                            <thead>
                            <tr class="active">
                                <th>Wynajęcie T1</th>
                                <th>Wynajęcie T2</th>
                                <th>Wynajęcie WT1</th>
                                <th>Wynajęcie WT2</th>
                                <c:if test="${not empty priceLists[1].subscriptionTariffOnePrice}">
                                    <th>Karnet T1</th>
                                </c:if>
                                <c:if test="${not empty priceLists[1].subscriptionTariffTwoPrice}">
                                    <th>Karnet T2</th>
                                </c:if>
                                <c:if test="${not empty priceLists[1].oneTimeEntrancePrice}">
                                    <th>Wejście jednorazowe</th>
                                </c:if>
                            </tr>
                            </thead>
                            <tbody style="background-color: white; ">
                            <tr>
                                <th>${priceLists[1].rentWeekdayTariffOnePrice} zł</th>
                                <th>${priceLists[1].rentWeekdayTariffTwoPrice} zł</th>
                                <th>${priceLists[1].rentWeekendTariffOnePrice} zł</th>
                                <th>${priceLists[1].rentWeekendTariffTwoPrice} zł</th>
                                <c:if test="${not empty priceLists[1].subscriptionTariffOnePrice}">
                                    <th>${priceLists[1].subscriptionTariffOnePrice} zł</th>
                                </c:if>
                                <c:if test="${not empty priceLists[1].subscriptionTariffTwoPrice}">
                                    <th>${priceLists[1].subscriptionTariffTwoPrice} zł</th>
                                </c:if>
                                <c:if test="${not empty priceLists[1].oneTimeEntrancePrice}">
                                    <th>${priceLists[1].oneTimeEntrancePrice} zł</th>
                                </c:if>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="panel panel-default" style="box-shadow: 10px 10px 5px #cde6ec;">
                        <h5 style="color: red"><strong>Zmiana taryfy o godzinie: ${priceLists[1].tariffSwitchHour}</strong></h5>
                    </div>

                </div>
                <div class="col-lg-4" style="padding-top: 245px; ">
                    <form id="reservationForm1" action="/reservation" method="get">
                        <input type="hidden" name="objectId" value="${priceLists[1].objectId}" />
                        <a href="#" onclick="document.getElementById('reservationForm1').submit();" class="btn btn-default"
                           style="font-size: 20px; box-shadow: 10px 10px 5px #cde6ec;">Rezerwacja</a>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div id="gymSection1">
        <div class="container" style="padding-top: 80px;">
            <div class="row">
                <div class="col-lg-8">
                    <h1 style="font-family: 'Audiowide', cursive; font-size: 50px; color: #101010; padding-bottom: 40px;  text-shadow: 4px 4px white;">Hala tenisowa</h1>
                    <div class="panel panel-default" style="box-shadow: 10px 10px 5px #cde6ec;">
                        <table class="table table-bordered">
                            <thead>
                            <tr class="active">
                                <th>Wynajęcie T1</th>
                                <th>Wynajęcie T2</th>
                                <th>Wynajęcie WT1</th>
                                <th>Wynajęcie WT2</th>
                                <c:if test="${not empty priceLists[2].subscriptionTariffOnePrice}">
                                    <th>Karnet T1</th>
                                </c:if>
                                <c:if test="${not empty priceLists[2].subscriptionTariffTwoPrice}">
                                    <th>Karnet T2</th>
                                </c:if>
                                <c:if test="${not empty priceLists[2].oneTimeEntrancePrice}">
                                    <th>Wejście jednorazowe</th>
                                </c:if>
                            </tr>
                            </thead>
                            <tbody style="background-color: white; ">
                            <tr>
                                <th>${priceLists[2].rentWeekdayTariffOnePrice} zł</th>
                                <th>${priceLists[2].rentWeekdayTariffTwoPrice} zł</th>
                                <th>${priceLists[2].rentWeekendTariffOnePrice} zł</th>
                                <th>${priceLists[2].rentWeekendTariffTwoPrice} zł</th>
                                <c:if test="${not empty priceLists[2].subscriptionTariffOnePrice}">
                                    <th>${priceLists[2].subscriptionTariffOnePrice} zł</th>
                                </c:if>
                                <c:if test="${not empty priceLists[2].subscriptionTariffTwoPrice}">
                                    <th>${priceLists[2].subscriptionTariffTwoPrice} zł</th>
                                </c:if>
                                <c:if test="${not empty priceLists[2].oneTimeEntrancePrice}">
                                    <th>${priceLists[2].oneTimeEntrancePrice} zł</th>
                                </c:if>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="panel panel-default" style="box-shadow: 10px 10px 5px #cde6ec;">
                        <h5 style="color: red"><strong>Zmiana taryfy o godzinie: ${priceLists[2].tariffSwitchHour}</strong></h5>
                    </div>

                </div>
                <div class="col-lg-4" style="padding-top: 260px; ">
                    <form id="reservationForm2" action="/reservation" method="get">
                        <input type="hidden" name="objectId" value="${priceLists[2].objectId}" />
                        <a href="#" onclick="document.getElementById('reservationForm2').submit();" class="btn btn-default"
                           style="font-size: 20px; box-shadow: 10px 10px 5px #cde6ec;">Rezerwacja</a>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div id="gymSection2">
        <div class="container" style="padding-top: 80px;">
            <div class="row">
                <div class="col-lg-8">
                    <h1 style="font-family: 'Audiowide', cursive; font-size: 50px; color: #101010; padding-bottom: 40px; text-shadow: 4px 4px white;">Hala sztuk walki</h1>
                    <div class="panel panel-default" style="box-shadow: 10px 10px 5px #cde6ec;">
                        <table class="table table-bordered">
                            <thead>
                            <tr class="active">
                                <th>Wynajęcie T1</th>
                                <th>Wynajęcie T2</th>
                                <th>Wynajęcie WT1</th>
                                <th>Wynajęcie WT2</th>
                                <c:if test="${not empty priceLists[3].subscriptionTariffOnePrice}">
                                    <th>Karnet T1</th>
                                </c:if>
                                <c:if test="${not empty priceLists[3].subscriptionTariffTwoPrice}">
                                    <th>Karnet T2</th>
                                </c:if>
                                <c:if test="${not empty priceLists[3].oneTimeEntrancePrice}">
                                    <th>Wejście jednorazowe</th>
                                </c:if>
                            </tr>
                            </thead>
                            <tbody style="background-color: white; ">
                            <tr>
                                <th>${priceLists[3].rentWeekdayTariffOnePrice} zł</th>
                                <th>${priceLists[3].rentWeekdayTariffTwoPrice} zł</th>
                                <th>${priceLists[3].rentWeekendTariffOnePrice} zł</th>
                                <th>${priceLists[3].rentWeekendTariffTwoPrice} zł</th>
                                <c:if test="${not empty priceLists[3].subscriptionTariffOnePrice}">
                                    <th>${priceLists[3].subscriptionTariffOnePrice} zł</th>
                                </c:if>
                                <c:if test="${not empty priceLists[3].subscriptionTariffTwoPrice}">
                                    <th>${priceLists[3].subscriptionTariffTwoPrice} zł</th>
                                </c:if>
                                <c:if test="${not empty priceLists[3].oneTimeEntrancePrice}">
                                    <th>${priceLists[3].oneTimeEntrancePrice} zł</th>
                                </c:if>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="panel panel-default" style="box-shadow: 10px 10px 5px #cde6ec;">
                        <h5 style="color: red"><strong>Zmiana taryfy o godzinie: ${priceLists[3].tariffSwitchHour}</strong></h5>
                    </div>


                </div>
                <div class="col-lg-4" style="padding-top: 260px; ">
                    <form id="reservationForm3" action="/reservation" method="get">
                        <input type="hidden" name="objectId" value="${priceLists[3].objectId}" />
                        <a href="#" onclick="document.getElementById('reservationForm3').submit();" class="btn btn-default"
                           style="font-size: 20px; box-shadow: 10px 10px 5px #cde6ec;">Rezerwacja</a>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div id="gymSection3">
        <div class="container" style="padding-top: 80px;">
            <div class="row">
                <div class="col-lg-8">
                    <h1 style="font-family: 'Audiowide', cursive; font-size: 50px; color: #101010; padding-bottom: 40px; text-shadow: 4px 4px white;">Sala BJJ</h1>
                    <div class="panel panel-default" style="box-shadow: 10px 10px 5px #cde6ec;">
                        <table class="table table-bordered">
                            <thead>
                            <tr class="active">
                                <th>Wynajęcie T1</th>
                                <th>Wynajęcie T2</th>
                                <th>Wynajęcie WT1</th>
                                <th>Wynajęcie WT2</th>
                                <c:if test="${not empty priceLists[4].subscriptionTariffOnePrice}">
                                    <th>Karnet T1</th>
                                </c:if>
                                <c:if test="${not empty priceLists[4].subscriptionTariffTwoPrice}">
                                    <th>Karnet T2</th>
                                </c:if>
                                <c:if test="${not empty priceLists[4].oneTimeEntrancePrice}">
                                    <th>Wejście jednorazowe</th>
                                </c:if>
                            </tr>
                            </thead>
                            <tbody style="background-color: white; ">
                            <tr>
                                <th>${priceLists[4].rentWeekdayTariffOnePrice} zł</th>
                                <th>${priceLists[4].rentWeekdayTariffTwoPrice} zł</th>
                                <th>${priceLists[4].rentWeekendTariffOnePrice} zł</th>
                                <th>${priceLists[4].rentWeekendTariffTwoPrice} zł</th>
                                <c:if test="${not empty priceLists[4].subscriptionTariffOnePrice}">
                                    <th>${priceLists[4].subscriptionTariffOnePrice} zł</th>
                                </c:if>
                                <c:if test="${not empty priceLists[4].subscriptionTariffTwoPrice}">
                                    <th>${priceLists[4].subscriptionTariffTwoPrice} zł</th>
                                </c:if>
                                <c:if test="${not empty priceLists[4].oneTimeEntrancePrice}">
                                    <th>${priceLists[4].oneTimeEntrancePrice} zł</th>
                                </c:if>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="panel panel-default" style="box-shadow: 10px 10px 5px #cde6ec;">
                        <h5 style="color: red"><strong>Zmiana taryfy o godzinie: ${priceLists[4].tariffSwitchHour}</strong></h5>
                    </div>


                </div>
                <div class="col-lg-4" style="padding-top: 260px; ">
                    <form id="reservationForm4" action="/reservation" method="get">
                        <input type="hidden" name="objectId" value="${priceLists[4].objectId}" />
                        <a href="#" onclick="document.getElementById('reservationForm4').submit();" class="btn btn-default"
                           style="font-size: 20px; box-shadow: 10px 10px 5px #cde6ec;">Rezerwacja</a>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div id="gymSection4">
        <div class="container" style="padding-top: 80px;">
            <div class="row">
                <div class="col-lg-8">
                    <h1 style="font-family: 'Audiowide', cursive; font-size: 50px; color: #101010; padding-bottom: 40px; text-shadow: 4px 4px white;">Sauna</h1>
                    <div class="panel panel-default" style="box-shadow: 10px 10px 5px #cde6ec;">
                        <table class="table table-bordered">
                            <thead>
                            <tr class="active">
                                <th>Wynajęcie T1</th>
                                <th>Wynajęcie T2</th>
                                <th>Wynajęcie WT1</th>
                                <th>Wynajęcie WT2</th>
                                <c:if test="${not empty priceLists[5].subscriptionTariffOnePrice}">
                                    <th>Karnet T1</th>
                                </c:if>
                                <c:if test="${not empty priceLists[5].subscriptionTariffTwoPrice}">
                                    <th>Karnet T2</th>
                                </c:if>
                                <c:if test="${not empty priceLists[5].oneTimeEntrancePrice}">
                                    <th>Wejście jednorazowe</th>
                                </c:if>
                            </tr>
                            </thead>
                            <tbody style="background-color: white; ">
                            <tr>
                                <th>${priceLists[5].rentWeekdayTariffOnePrice} zł</th>
                                <th>${priceLists[5].rentWeekdayTariffTwoPrice} zł</th>
                                <th>${priceLists[5].rentWeekendTariffOnePrice} zł</th>
                                <th>${priceLists[5].rentWeekendTariffTwoPrice} zł</th>
                                <c:if test="${not empty priceLists[5].subscriptionTariffOnePrice}">
                                    <th>${priceLists[5].subscriptionTariffOnePrice} zł</th>
                                </c:if>
                                <c:if test="${not empty priceLists[5].subscriptionTariffTwoPrice}">
                                    <th>${priceLists[5].subscriptionTariffTwoPrice} zł</th>
                                </c:if>
                                <c:if test="${not empty priceLists[5].oneTimeEntrancePrice}">
                                    <th>${priceLists[5].oneTimeEntrancePrice} zł</th>
                                </c:if>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="panel panel-default" style="box-shadow: 10px 10px 5px #cde6ec;">
                        <h5 style="color: red"><strong>Zmiana taryfy o godzinie: ${priceLists[0].tariffSwitchHour}</strong></h5>
                    </div>


                </div>
                <div class="col-lg-4" style="padding-top: 260px; ">
                    <form id="reservationForm5" action="/reservation" method="get">
                        <input type="hidden" name="objectId" value="${priceLists[5].objectId}" />
                        <a href="#" onclick="document.getElementById('reservationForm5').submit();" class="btn btn-default"
                           style="font-size: 20px; box-shadow: 10px 10px 5px #cde6ec;">Rezerwacja</a>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div id="gymSection5">
        <div class="container" style="padding-top: 80px;">
            <div class="row">
                <div class="col-lg-8">
                    <h1 style="font-family: 'Audiowide', cursive; font-size: 50px; color: #101010; padding-bottom: 40px; text-shadow: 4px 4px white;">Boisko piłkarskie</h1>
                    <div class="panel panel-default" style="box-shadow: 10px 10px 5px #cde6ec;">
                        <table class="table table-bordered">
                            <thead>
                            <tr class="active">
                                <th>Wynajęcie T1</th>
                                <th>Wynajęcie T2</th>
                                <th>Wynajęcie WT1</th>
                                <th>Wynajęcie WT2</th>
                                <c:if test="${not empty priceLists[6].subscriptionTariffOnePrice}">
                                    <th>Karnet T1</th>
                                </c:if>
                                <c:if test="${not empty priceLists[6].subscriptionTariffTwoPrice}">
                                    <th>Karnet T2</th>
                                </c:if>
                                <c:if test="${not empty priceLists[6].oneTimeEntrancePrice}">
                                    <th>Wejście jednorazowe</th>
                                </c:if>
                            </tr>
                            </thead>
                            <tbody style="background-color: white; ">
                            <tr>
                                <th>${priceLists[6].rentWeekdayTariffOnePrice} zł</th>
                                <th>${priceLists[6].rentWeekdayTariffTwoPrice} zł</th>
                                <th>${priceLists[6].rentWeekendTariffOnePrice} zł</th>
                                <th>${priceLists[6].rentWeekendTariffTwoPrice} zł</th>
                                <c:if test="${not empty priceLists[6].subscriptionTariffOnePrice}">
                                    <th>${priceLists[6].subscriptionTariffOnePrice} zł</th>
                                </c:if>
                                <c:if test="${not empty priceLists[6].subscriptionTariffTwoPrice}">
                                    <th>${priceLists[6].subscriptionTariffTwoPrice} zł</th>
                                </c:if>
                                <c:if test="${not empty priceLists[6].oneTimeEntrancePrice}">
                                    <th>${priceLists[6].oneTimeEntrancePrice} zł</th>
                                </c:if>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="panel panel-default" style="box-shadow: 10px 10px 5px #cde6ec;">
                        <h5 style="color: red"><strong>Zmiana taryfy o godzinie: ${priceLists[0].tariffSwitchHour}</strong></h5>
                    </div>


                </div>
                <div class="col-lg-4" style="padding-top: 260px; ">
                    <form id="reservationForm6" action="/reservation" method="get">
                        <input type="hidden" name="objectId" value="${priceLists[6].objectId}" />
                        <a href="#" onclick="document.getElementById('reservationForm6').submit();" class="btn btn-default"
                           style="font-size: 20px; box-shadow: 10px 10px 5px #cde6ec;">Rezerwacja</a>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div id="gymSection6">
        <div class="container" style="padding-top: 80px;">
            <div class="row">
                <div class="col-lg-8">
                    <h1 style="font-family: 'Audiowide', cursive; font-size: 50px; color: #101010; padding-bottom: 40px; text-shadow: 4px 4px white;">Boisko siatkarskie</h1>
                    <div class="panel panel-default" style="box-shadow: 10px 10px 5px #cde6ec;">
                        <table class="table table-bordered">
                            <thead>
                            <tr class="active">
                                <th>Wynajęcie T1</th>
                                <th>Wynajęcie T2</th>
                                <th>Wynajęcie WT1</th>
                                <th>Wynajęcie WT2</th>
                                <c:if test="${not empty priceLists[7].subscriptionTariffOnePrice}">
                                    <th>Karnet T1</th>
                                </c:if>
                                <c:if test="${not empty priceLists[7].subscriptionTariffTwoPrice}">
                                    <th>Karnet T2</th>
                                </c:if>
                                <c:if test="${not empty priceLists[7].oneTimeEntrancePrice}">
                                    <th>Wejście jednorazowe</th>
                                </c:if>
                            </tr>
                            </thead>
                            <tbody style="background-color: white; ">
                            <tr>
                                <th>${priceLists[7].rentWeekdayTariffOnePrice} zł</th>
                                <th>${priceLists[7].rentWeekdayTariffTwoPrice} zł</th>
                                <th>${priceLists[7].rentWeekendTariffOnePrice} zł</th>
                                <th>${priceLists[7].rentWeekendTariffTwoPrice} zł</th>
                                <c:if test="${not empty priceLists[7].subscriptionTariffOnePrice}">
                                    <th>${priceLists[7].subscriptionTariffOnePrice} zł</th>
                                </c:if>
                                <c:if test="${not empty priceLists[7].subscriptionTariffTwoPrice}">
                                    <th>${priceLists[7].subscriptionTariffTwoPrice} zł</th>
                                </c:if>
                                <c:if test="${not empty priceLists[7].oneTimeEntrancePrice}">
                                    <th>${priceLists[7].oneTimeEntrancePrice} zł</th>
                                </c:if>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="panel panel-default" style="box-shadow: 10px 10px 5px #cde6ec;">
                        <h5 style="color: red"><strong>Zmiana taryfy o godzinie: ${priceLists[7].tariffSwitchHour}</strong></h5>
                    </div>


                </div>
                <div class="col-lg-4" style="padding-top: 260px; ">
                    <form id="reservationForm7" action="/reservation" method="get">
                        <input type="hidden" name="objectId" value="${priceLists[7].objectId}" />
                        <a href="#" onclick="document.getElementById('reservationForm7').submit();" class="btn btn-default"
                           style="font-size: 20px; box-shadow: 10px 10px 5px #cde6ec;">Rezerwacja</a>
                    </form>
                </div>
            </div>
        </div>
    </div>

</c:if>

</body>

</html>