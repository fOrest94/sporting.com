<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/style.css">
    <link href="https://fonts.googleapis.com/css?family=Bungee|Russo+One" rel="stylesheet">
</head>
<body>

<div class="container" style="margin-top: 180px;">
    <img src="resources/img/404.jpg" style=" display: block; margin: 0 auto; ">
    <h2 style="color: black; font-family: 'Russo One', sans-serif; padding-top: 0px; text-align: center;">Wygląda na to,
        że odkryłeś koniec internetów.</br> Gratulujemy!!!</br>Jeśli jednak zechciałbyś wrócić do naszej strony kliknij
        <a href="/" style="color: #6666FF;">STRONA GŁÓWNA</a></h2>
    <h3>Error message</h3>
    <h4 class="error">
        <%= request.getAttribute("errorMessage")%>
    </h4>

</div>


</body>
</html>