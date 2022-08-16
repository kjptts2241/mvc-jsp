<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-08-16
  Time: 오후 4:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
  session.invalidate(); // 세션정보 전체 삭제
%>

<script>
  alert("로그아웃 되었습니다.");
  location.href="main.gg"
</script>

</body>
</html>
