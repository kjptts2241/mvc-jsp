<%@ page import="com.google.mvc.dto.TbFoodDto" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-08-09
  Time: 오후 4:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  TbFoodDto dto = (TbFoodDto)request.getAttribute("food");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>음식 랜덤 추천</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="container-fluid">
  <nav class="navbar navbar-inverse">
    <div class="container-fluid">
      <ul class="nav navbar-nav">
        <li><a id="len1" class="hoverable" href="/main.gg">메인</a></li>
        <li><a id="len2" class="hoverable" href="/movie.gg">영화</a></li>
        <li><a id="len3" class="hoverable" href="/search.gg">검색</a></li>
        <li><a id="len4" class="hoverable" href="/foodrandom.gg">음식 추천</a></li>
      </ul>
    </div>
  </nav>
  <div id="what-the-hell-is-this">
    <div class="page-title">
      <h2>음식 추천</h2>
      <p>
        <%=dto.getName() %> 드세요~
      </p>
      <img src="<%=dto.getImg() %>" class="rounded" alt="<%=dto.getName() %>" width="640" height="480">
    </div>
  </div>
</div>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="js/index.js"></script>

</body>
</html>