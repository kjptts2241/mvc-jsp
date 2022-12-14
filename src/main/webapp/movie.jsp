<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-08-10
  Time: 오전 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


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

      <div id="galleryModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-body">
              <img src="//placehold.it/1200x700/222?text=..." id="galleryImage" class="img-responsive" />
              <p>
                <br/>
                <button class="btn btn-primary btn-lg center-block" data-dismiss="modal" aria-hidden="true">Close <i class="ion-android-close"></i></button>
              </p>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>
</div>

<script src="js/main.js"></script>

<script>
  $(document).ready(function(){
    $.getJSON("/movieList.gg", function(result){
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