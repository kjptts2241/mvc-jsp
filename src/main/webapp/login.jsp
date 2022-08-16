<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>My Site</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/login.css">
    <script src="js/login.js"></script>
</head>
<body>

<div class="container-fluid">
    <div id="what-the-hell-is-this">
        <div class="page-title">
            <div class="card card-container">
                <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
                <img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
                <p id="profile-name" class="profile-name-card"></p>
                <form class="form-signin" action="loginok.gg" method="post">
                    <span id="reauth-email" class="reauth-email"></span>
                    <input type="email" id="inputEmail" name="email" class="form-control" placeholder="Email address" required autofocus>
                    <input type="password" id="inputPassword" name="userpw" class="form-control" placeholder="Password" required>
                    <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Sign in</button>
                </form><!-- /form -->
            </div><!-- /card-container -->
        </div>
    </div>
</div>


</body>
</html>