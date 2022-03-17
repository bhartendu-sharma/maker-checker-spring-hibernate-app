<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Home Page</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />

        <link type="text/css"rel="stylesheet"href="${pageContext.request.contextPath}/resources/css/homePage.css">
<link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>

</style>
</head>
<body>
 <div>
    <!-- nav bar-->
<nav class="container-fluid sticky fixed-top c-nav">
          <ul>
            <li class="logo">
              <a href="#">
                <h2 class="text">
                  <span class="my-nav-text">BRD Portal</span>
                </h2>
              </a>
            </li>

            <li class="c-items"><a href="#">Home</a></li>

            <li class="nav-btn">
              <a href="#"><i class="fa fa-bars"></i></a>
            </li>
          </ul>
        </nav>
      </div>    <!-- login section-->

<c:if test="${not empty loginErr}">
<div class="container"  style="margin-top: 180px;">
<div class="alert alert-danger w-50" role="alert">
   You Entered invalid Credentials!
</div>
<div class="container-fluid">
   <a id="loginFormLinkId" href="loginForm" class="btn btn-danger mt-2 mx-auto">Try Again</a>
</div>
</div>
 </c:if>


<c:if test="${empty loginErr}">
  <!-- Main Content -->
  <div id="loginDivId" class="container-fluid" style="margin-top: 200px;">
    <div class="row main-content bg-success text-center">
      <div class="col-md-4 text-center company__info">
        <span class="company__logo">
          <h2><span class="fa fa-android"></span></h2>
        </span>
        <h4 class="company_title">BRDApp</h4>
      </div>
      <div class="col-md-8 col-xs-12 col-sm-12 login_form ">
        <div class="container-fluid">
          <div class="row">
            <h2>Log In</h2>
          </div>




          <div class="row">
            <form:form method="post" modelAttribute="user" action="login" class="form-group c_login_form">
              <div class="row">
                <form:input type="text" path="username" id="username" class="form__input" required="true" placeholder="Username" />
              </div>
              <div class="row">
                <!-- <span class="fa fa-lock"></span> -->
                <form:input type="password" path="password" id="password" class="form__input" required="true" placeholder="Password" />
              </div>
              <div class="row">
                            <form:select path="roleType" items="${roleTypeItems}" class="input-box" style="background-color: lightblue;"/>
              </div>
              <div class="row">
                              <button type="submit" class="login_btn">Login</button>
              </div>
            </form:form>
          </div>
          <div class="row">
            <p>Don't have an account? <a href="#">Register Here</a></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</c:if>
      <!-- end of login section -->

   <!-- scripts -->
          <script src="https://code.jquery.com/jquery-3.5.1.min.js"
                   integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
                 <script src="https://kit.fontawesome.com/a076d05399.js"></script>
                 <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                   integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
                   </script>
                 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
                   integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous">
                   </script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>



<script>

$(".nav-btn").click(function () {
  $(".c-items").toggleClass("show");
  $("ul li").toggleClass("hide");
});
$(".text").addClass("three-d-1");
$(".my-nav-text").addClass("three-d-2");
document.querySelector(".text").setAttribute("style", "display:contents");

// ----------scrolling -------------------------
$(window).on("scroll", function () {
  var scroll = $(window).scrollTop();
  console.log(scroll);
  if (scroll >= 50) {
    // document.querySelector(".text").setAttribute("style", "display:contents");
    $(".sticky").addClass("addSticky");
    // $(".text").addClass("three-d-1");
    // $(".my-nav-text").addClass("three-d-2");
  } else {
    // document.querySelector(".text").setAttribute("style", "display:none");
    $(".sticky").removeClass("addSticky");
    // $(".text").removeClass("three-d-1");
    // $(".my-nav-text").removeClass("three-d-2");
  }
});
 $("#loginFormLinkId").click(function () {
     location = "loginForm";
  });
$(document).ready(function(){
 $("a").on("click", function (e) {
    e.preventDefault();
  });
$("#loginBtnId").click(function () {
    $("#loginDivId").toggle();

  });
  //
});



</script>

</body>
</html>