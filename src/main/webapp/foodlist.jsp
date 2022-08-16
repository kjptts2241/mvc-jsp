<%@ page import="java.util.List" %>
<%@ page import="com.google.mvc.dto.TbFoodDto" %>
<%@ page import="java.util.ArrayList" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  List<TbFoodDto> list = (ArrayList<TbFoodDto>)request.getAttribute("foodlist");
%>
<jsp:include page="header.jsp" />
<div id="what-the-hell-is-this">
  <div class="page-title">
    <h2>입력된 음식 리스트</h2>
    <div class="float-sm-left">
      <button type="button" class="btn btn-light">Light</button>
    </div>
    <table class="table table-dark table-hover">
      <thead>
      <tr>
        <th>음식이름</th>
        <th>이미지링크</th>
      </tr>
      </thead>
      <tbody>
      <% for(TbFoodDto d : list) { %>
      <tr>
        <td><%=d.getName()%></td>
        <td><%=d.getImg()%></td>
      </tr>
      <% } %>

      </tbody>
    </table>
  </div>
</div>
</div>

</body>
</html>