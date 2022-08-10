<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-08-10
  Time: 오전 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<jsp:include page="header.jsp" />
  <div id="what-the-hell-is-this">
    <div class="page-title">
      <h2>네이버 영화 랭킹</h2>

      <section id="three" class="no-padding">
        <div class="container-fluid">
          <div class="row no-gutter">

            <div id="movielist"></div>

          </div>
        </div>
      </section>

    </div>
  </div>
</div>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="js/index.js"></script>
<script src="js/main.js"></script>

<script>
  $(document).ready(function(){
    $.getJSON("/movie.gg", function(result){
      var html
      $.each(result, function(i, field){
        console.log(field);
        html += `<div class="col-lg-4 col-sm-6">
                            <a href="#galleryModal" class="gallery-box" data-toggle="modal" data-src="\${field}">
                            <img src="\${field}" class="img-responsive" alt="Image 1">
                            <div class="gallery-box-caption">
                                <div class="gallery-box-content">
                                    <div>
                                        <i class="icon-lg ion-ios-search"></i>
                                    </div>
                                </div>
                            </div>
                            </a>
                         </div>`;
        // var html = "<a href='" + field.link + "'>" + field.title + "<br>"
      });
      $("#movielist").html(html);
    });
  });
</script>

</body>
</html>