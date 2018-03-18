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
</div>

<div class="container" style="min-height: 800px; background-color: white; padding-top: 30px;">
    <div class="row">
        <div class="col-lg-8">
            <c:if test="${not empty newsList}">
                <h1 style="text-align: left">${newsList[0].title}</h1>
                <hr>
                <p style="text-align: left"><span class="glyphicon glyphicon-time"></span>
                    Opublikowany: ${newsList[0].data}
                </p>
                <hr>
                <img class="img-responsive" src="${objectList[0].picture}" width="900" height="300">
                <hr>

                <p>${mainNews.description}</p>
                <hr>
                <%--<div class="well">--%>
                    <%--<h4>Dodaj komentarz:</h4>--%>
                    <%--<form:form method="post" modelAttribute="commentForm">--%>
                        <%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
                        <%--<form:input type="hidden" path="userId" value="${user.id}"/>--%>
                        <%--<form:input type="hidden" path="newsId" value="${mainNews.id}"/>--%>
                        <%--<form:input type="hidden" path="firstName" value="${user.firstName}"/>--%>
                        <%--<form:input type="hidden" path="lastName" value="${user.lastName}"/>--%>
                        <%--<div class="form-group">--%>
                            <%--<form:textarea path="comment_description" class="form-control" rows="3"></form:textarea>--%>
                        <%--</div>--%>
                        <%--<button type="submit" class="btn btn-danger">Potwierdź</button>--%>
                    <%--</form:form>--%>
                <%--</div>--%>
            </c:if>
            <hr>
            <%--<c:if test="${not empty commentList}">--%>
                <%--<c:forEach var="commentView" items="${commentList}">--%>
                    <%--<div class="media">--%>
                        <%--<a class="pull-left" href="#">--%>
                            <%--<img class="media-object" src="/resources/pictures/profileImages/${commentView.userId}.jpg"--%>
                                 <%--height="64"--%>
                                 <%--width="64">--%>
                        <%--</a>--%>
                        <%--<div class="media-body">--%>
                            <%--<h4 class="media-heading">${commentView.firstName} ${commentView.lastName}--%>
                                <%--<small>${commentView.data}</small>--%>
                            <%--</h4>--%>
                                <%--${commentView.comment_description}--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</c:forEach>--%>
            <%--</c:if>--%>
        </div>
        <div class="col-md-4">
            <div class="well">
                <h4>Szukaj</h4>
                <div class="input-group">

                    <input type="text" class="form-control">
                    <span class="input-group-btn">
                            <button class="btn btn-default" type="button">
                                <span class="glyphicon glyphicon-search"></span>
                        </button>
                        </span>
                </div>
            </div>

            <div class="well">
                <h4>Inne aktualności</h4>
                <div class="row">
                    <div class="col-lg-12">
                        <ul class="list-unstyled">
                            <c:if test="${not empty newsList}">
                                <c:forEach var="listView" items="${newsList}">
                                    <li><a href="/news/${listView.id}" style="font-size: 18px; color: #101010">${listView.title}</a></li>
                                </c:forEach>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--
<div class="container">
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">
    <div id="myCarousel" class="carousel slide" data-ride="carousel" >

          <!-- Wrapper for slides -->


          <c:if test="${not empty newsList}">
          <div class="carousel-inner">
          <c:forEach var="listValue" items="${newsList}">
          <c:set var="count" value="${count + 1}" scope="page"/>
          <c:choose>
              <c:when test="${count == 1}">
                <div class="item active">
              </c:when>
              <c:otherwise>
                   <div class="item">
              </c:otherwise>
          </c:choose>

              <c:forEach var="object" items="${objectList}">
                  <c:if test="${object.id == listValue.objectId}">
                       <img src="${object.picture}">
                  </c:if>
              </c:forEach>
               <div class="carousel-caption">
                <h4><a href="/priceList">${listValue.title}</a></h4>
                <p>${listValue.description}<a class="label label-primary" href="/" target="_blank">przeczytaj wiecej</a></p>
                <p><small>${listValue.data}</small></p>
              </div>
            </div><!-- End Item -->
            </c:forEach>

        </div>
            <ul class="list-group col-sm-4">
           <c:forEach var="listValue" items="${newsList}">
                     <c:set var="count1" value="${count1 + 1}" scope="page"/>
              <li data-target="#myCarousel" data-slide-to="${count1 - 1}" class="list-group-item">
              <h4>${listValue.title}</h4>
              </li>
           </c:forEach>
            </ul>
              <!-- Controls -->
              <div class="carousel-controls">
                  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                  </a>
                  <a class="right carousel-control" href="#myCarousel" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                  </a>
              </div>
        </div><!-- End Carousel -->
      </c:if>
    </div>
</div>
--%>

<div class="footer">
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