<%@ page import="com.google.mvc.dto.TbSearchDto" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  List<TbSearchDto> searchList = (List<TbSearchDto>) request.getAttribute("searchList");
  String search = request.getAttribute("search").toString();
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>검색</title>
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
      <h2>뉴스 검색</h2>

      <p>검색을 하세요</p>
      <form class="form-inline" action="/search.gg">
        <label for="search">검색어:</label>
        <input type="text" class="form-control" placeholder="검색어입력" name="search">
        <button type="submit" class="btn btn-primary">검색</button>
      </form>

      <br><br><br>

      현재 검색: <span id="search"><%=search %></span><br><br>

      <%for (TbSearchDto d : searchList) { %>
      검색어 : <%=d.getSearch() %>(<%=d.getCnt()%>)<br>
      <% } %>
      <br>

      <div></div>



    </div>
  </div>
</div>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="js/index.js"></script>

<script>
  $(document).ready(function(){
    alert(<%=search %>);
    $.getJSON("search.gg?search=" + <%=search %>, function(result){
      $.each(result.items, function(i, field){
        var html = "<a href='" + field.link + "'>" + field.title + "<br>"
        $("div").append(html);
      });
    });
  });
</script>

</body>
</html>