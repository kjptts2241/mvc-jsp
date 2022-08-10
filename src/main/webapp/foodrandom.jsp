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

<jsp:include page="header.jsp" />
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