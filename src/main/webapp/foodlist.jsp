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
    <div align="left">
      <button type="button" class="btn btn-danger" id="myBtn">메뉴추가</button>
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

  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">

        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">메뉴 입력</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>

        <!-- Modal body -->
        <div class="modal-body">
          <div action="/action_page.php">
            <div id="form">
              <div class="form-group">
                <label for="menuname">메뉴이름:</label>
                <input type="menuname" class="form-control" id="menuname" placeholder="메뉴이름" name="menuname">
              </div>
              <div class="form-group">
                <label for="imgsrc">이미지:</label>
                <input type="imgsrc" class="form-control" id="imgsrc" placeholder="이미지주소" name="imgsrc">
              </div>
            </div>
          </form>
        </div>

        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary">추가</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        </div>

      </div>
    </div>
  </div>

</div>
</div>

<script>
  $(document).ready(function(){
    $("#myBtn").click(function(){
      $("#myModal").modal();
    });
    $("#menuname").click(function(){
      var menuname = $("#menuname").val();
      var imgsrc = $("#imgsrc").val();
      // alert(menuname + imgsrc + "메뉴 추가");
      $.post("savefood.gg",
              {
                menuname: menuname,
                imgsrc: imgsrc
              },
      function (data, status) {
        if (data == 1) {
          alert("메뉴를 추가 했습니다");
        } else {
          alert("메뉴를 추가 실패\n관리자에게 문의");
        }
        location.reload();
      })
    });
  });
</script>

</html>