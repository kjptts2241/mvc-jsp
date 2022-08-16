<%@ page import="com.google.mvc.dto.TbSearchDto" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="header.jsp" />
<%
//  String search = (String) request.getAttribute("search");
//  List<TbSearchDto> searchList = (ArrayList<TbSearchDto>) request.getAttribute("searchList");
%>

  <div id="what-the-hell-is-this">
    <div class="page-title">
      <h2>뉴스 검색</h2>

      <p>검색을 하세요</p>
      <form method="post" action="searchList.gg">
        <div class="form-inline">
          <label for="search">검색어:</label>
          <input type="text" class="form-control" id="search" placeholder="검색어입력" name="search">
          <button id="btn" type="button" class="btn btn-primary">검색</button>
        </div>
      </form>

      <br><br><br>


      검색 결과<br><br>
      <div id="news"></div>

      <br><br><br>

<%--      현재 검색: <%=search %><br><br>--%>

<%--      <div id="searchList"></div>--%>

<%--      <%for (TbSearchDto d : searchList) { %>--%>
<%--      검색어 : <%=d.getSearch() %>(<%=d.getCnt()%>)<br>--%>
<%--      <% } %>--%>
<%--      <br>--%>


    </div>
  </div>
</div>

<script>

  // $(document).ready(function(){
  //   $("#btn").click(function() {
  //     var s = $("#search").val();
  //
  //     $.post("news.gg",
  //             {
  //               search: s
  //             },
  //             function (data, status) {
  //               // alert("Data: " + data + "\nStatus: " + status);
  //               $.each(data.items, function (i, field) {
  //                 var html = "<a href='" + field.link + "'>" + field.title + "<br>"
  //                 $("#news").append(html);
  //               });
  //             });
  //   });
  // });
</script>

</body>
</html>