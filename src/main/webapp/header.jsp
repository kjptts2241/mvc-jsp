<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  String userName = (String) session.getAttribute("username");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>My Site</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/style.css">
  <script src="js/index.js"></script>
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
        <li><a id="len5" class="hoverable" href="/foodlist.gg">음식 리스트</a></li>
        <% if (userName == null) {%>
          <li><a id="len6" class="hoverable" href="/login.gg">로그인</a></li>
        <% } else { %>
          <li><a id="len6" class="hoverable" href="/logout.gg">로그아웃</a></li>
          <li><a id="len7" class="hoverable" href="#"><%=userName %> 님</a></li>
        <% } %>
      </ul>
    </div>
  </nav>