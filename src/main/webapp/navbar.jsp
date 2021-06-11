<%--
  Created by IntelliJ IDEA.
  User: benedettosimone
  Date: 01/06/21
  Time: 22:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/navbar.css">
</head>
<body>





<div class="sidebar active">
    <div class="logo_content">
        <a href=""><img src="img/logo.png"></a>
    </div>
    <ul class="nav_list">
        <li>
            <a id="home" class="top" href="#">
                <i class='bx bxs-home'></i>
                <span class="links_name">Home</span>
            </a>
        </li>
        <li>
            <a id="spostamenti" class="top" href="#">
                <i class='bx bxs-car'></i>
                <span class="links_name">Spostamenti</span>
            </a>
        </li>
        <li>
            <a id="spesa" class="top" href="#">
                <i class='bx bxs-wallet'></i>
                <span class="links_name">Spesa carburante</span>
            </a>
        </li>
        <li>
            <a id="obiettivi" class="top" href="#">
                <i class='bx bxs-trophy'></i>
                <span class="links_name">Obiettivi</span>
            </a>
        </li>
        <li>
            <a id="premi" class="top" href="#">
                <i class='bx bxs-medal'></i>
                <span class="links_name">Premi</span>
            </a>
        </li>
    </ul>

    <div id="user">
        <ul>
            <li>
                <a class="user-name"> <i class='bx bxs-user'></i>
                    <span class="links_name">Benedetto Simone</span>
                </a>
            </li>

            <li>
                <a class="logout-bottom"> <i class='bx bx-log-out'></i>
                    <span class="links_name">Logout</span>
                </a>
            </li>
        </ul>
    </div>
</div>



</body>





<script src="js/navbar.js">
</script>
</html>