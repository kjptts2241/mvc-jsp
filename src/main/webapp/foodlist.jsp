<%@ page import="java.util.List" %>
<%@ page import="com.google.mvc.dto.TbFoodDto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>
<%
  List<TbFoodDto> list = (ArrayList<TbFoodDto>)request.getAttribute("foodlist");

%>

<div id="what-the-hell-is-this">
  <div class="page-title">
    <h2>입력된 음식 리스트</h2>
  </div>
    <% if (userName != null) {%>
      <div align="left">
        <button type="button" class="btn btn-danger" id="myBtn">메뉴추가</button>
      </div>
    <% } %>
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

<!-- The Modal -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title" style="color:black">메뉴추가</h4>

      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <div id="form">
          <div class="form-group">
            <label for="menuname">메뉴:</label>
            <input type="text" class="form-control" id="menuname" placeholder="메뉴 이름" name="menuname">
          </div>
          <div class="form-group">
            <label for="imgsrc">이미지:</label>
            <input type="text" class="form-control" id="imgsrc" placeholder="이미지 주소" name="imgsrc">
          </div>
        </div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-success" id="addBtn">추가</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
      </div>

    </div>
  </div>
</div>

<script>
  $(document).ready(function(){
    $("#myBtn").click(function(){
      $("#myModal").modal();
    });
    $("#addBtn").click(function(){
      var menuname = $("#menuname").val();
      var imgsrc = $("#imgsrc").val();
      // alert(menuname + "\n" + imgsrc + " 넣기 디비로");
      $.post("savefood.gg",
              {
                menuname: menuname,
                imgsrc: imgsrc
              },
              function(data, status){
                // alert("Data: " + data + "\nStatus: " + status);
                if (data == 1) {
                  alert("메뉴를 추가 했습니다");
                } else {
                  alert("메뉴를 추가 실패\n관리자에게 문의");
                }
                location.reload();
              });
    });
  });
</script>

</html>