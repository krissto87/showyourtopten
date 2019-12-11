<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Nagłówek</title>
</head>
<body>
<header>
    <nav class="navbar is-fixed-top" role="navigation" aria-label="main navigation">
        <div class="container">
            <div class="navbar-menu">
                <div class="navbar-start">
                    <a class="navbar-item" href="/">
                        Home
                    </a>
                    <%-- Tutaj pozostałe linki, które chcemy mieć widoczne --%>
                    <div class="navbar-item has-dropdown is-hoverable">
                        <a class="navbar-link">
                            Film base:
                        </a>

                        <div class="navbar-dropdown">
                            <a href="/admin/movies/add" class="navbar-item">
                                Add movie to base
                            </a>
                            <a href="/admin/movies/all" class="navbar-item">
                                Show details
                            </a>
                        </div>
                    </div>
                    <div class="navbar-item has-dropdown is-hoverable">
                        <a class="navbar-link">
                            Serial base:
                        </a>

                        <div class="navbar-dropdown">
                            <a href="" class="navbar-item">
                                Add serial to base
                            </a>
                            <a href="" class="navbar-item">
                                Show details
                            </a>
                        </div>
                    </div>
                </div>

                <div class="navbar=end">
                    <div class="navbar-item">
                            <span class="navbar-item">
                                <c:if test="${pageContext.request.userPrincipal.authenticated}">
                                    <p><strong>Welcome ${pageContext.request.userPrincipal.name}!</strong></p>
                                </c:if>
                            </span>
                        <div class="buttons">
                            <sec:authorize access="isAuthenticated()">
                                <a class="button is-primary" href="/admin">
                                    <strong>Admin account</strong>
                                </a>
                                <form method="post" action="/logout">
                                    <button class="button is-link" type="submit">Logout</button>
                                    <sec:csrfInput/>
                                </form>
                            </sec:authorize>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</header>
</body>
</html>