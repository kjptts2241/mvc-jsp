<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-08-10
  Time: 오전 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">
<head>
  <title>음식 랜덤 추천</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <link href="//cdnjs.cloudflare.com/ajax/libs/animate.css/3.1.1/animate.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/main.css">
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