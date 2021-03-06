<%@ page import="com.example.eco_mobility.DTO.UtentiDTO" %>
<%--
  Created by IntelliJ IDEA.
  User: benedettosimone
  Date: 13/06/21
  Time: 17:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    UtentiDTO utente = (UtentiDTO) request.getSession().getAttribute("utente");


%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/navbar.css">
</head>
<body>

    <span class="background_white"></span>
<span class="hamburger" id="HamburgerBTN" onclick="openNav()">
            <i class='bx bx-menu-alt-left'>
            </i>
    <span id="menu">Menù</span>
</span>

    <div class="logo_resp_visible">
        <a href="./SpostamentiControl"><img id="logo-resp" src="img/logo.png"></a>
    </div>


<div id="mySidenav" class="sidenav">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    <div id="links_resp">
        <a href="./SpostamentiControl">Home</a>
        <a href="spostamenti.jsp">Spostamenti</a>
        <a href="obiettivi.jsp">Obiettivi</a>
        <a href="speseCarb.jsp">Spesa Carburante</a>
        <a href="premi.jsp">Premi</a>
        <label class="switch">
            <input type="checkbox" name="switch" id="darkswitchD" onclick="darkMode()">
            <span class="switch-svg"></span>
        </label>

    </div>

    <div id="user_resp">
        <a class="user-name"> <i class='bx bxs-user'></i>
            <span class="links_name"><%=utente.getNome()%> <%=utente.getCognome()%></span>
        </a>

        <a class="logout-bottom" href="${pageContext.servletContext.contextPath}/LogoutControl"> <i class='bx bx-log-out'></i>
            <span class="links_name">Logout</span>
        </a>
    </div>
</div>

<script src="js/cookie.js"></script>
</body>
</html>
