<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored = "false" %>

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
      	<%--******************************* maker nav menu ****************************************--%>

                              <c:if test="${not empty maker}">

            <li class="c-items"><a href="" class="addNewCustomerLinkClass preventDefaultLink">Add new Customer</a>   </li>
            <li class="c-items nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">customer Details</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
                  <a class="dropdown-item page-scroll preventDefaultLink" id="viewAllCustomerLinkId">view All customer</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item page-scroll preventDefaultLink" id="hideAllCustomerLinkId">hide</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item page-scroll addNewCustomerLinkClass preventDefaultLink" >Add new Customer</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item page-scroll preventDefaultLink" id="refreshAllCustomerLinkId">refresh Details</a>

              </div>
          </li>
      	</c:if>
      	      	<%--******************************* end of maker nav menu ****************************************--%>


      	<%--*******************************  checker nav menu ****************************************--%>

                              <c:if test="${not empty checker}">

            <li class="c-items">   <a  href="#" class="dropdown-item page-scroll preventDefaultLink" id="viewAllCustomerLinkId" style="color:#fff;">view All customer</a>   </li>
            <li class="c-items">    <a href="#" class="dropdown-item page-scroll preventDefaultLink" id="hideAllCustomerLinkId" style="color:#fff;">hide details</a>  </li>
        <li class="c-items">  <a href="#" class="dropdown-item page-scroll preventDefaultLink" id="refreshAllCustomerLinkId" style="color:#fff;">refresh Details</a></li>

      	</c:if>
      	<%--******************************* end of checker nav menu ****************************************--%>

 <li class="c-items"><a href="#">${currUser.username}</a></li>
            <li class="c-items"><a href="logout">Logout</a></li>



        <li class="nav-btn">
          <a href="#"><i class="fa fa-bars"></i></a>
        </li>
          </ul>

        </nav>
      </div>
       <!-- end of nav bar  -->
                                     <c:if test="${not empty maker}">

   <!-- Add new Customer Detatil  start-->
      <c:import url="addNewCustomer.jsp"></c:import>
   <!-- end of  Add new Customer Detatil -->
   <!-- view all customer-->
 <div id="viewAllCustomerDiv" class="container-fluid" style="margin-top: 200px; display:none;">
<table id="myTable" class="table table-striped table-bordered table-responsive table-hover" >
  <thead>
  <tr>
    <th>id</th>
    <th>Customer Code</th>
    <th>Name</th>
    <th>Address1</th>
    <th>Address2</th>
    <th>Pin Code</th>
    <th>Email Address</th>
    <th>Contact Number</th>
    <th>Primary Contact Person</th>
    <th>Record Status</th>
    <th>Authorization Status</th>
    <th>Flag Status</th>
    <th style="min-width: 200px;">Actions</th>

  </tr>
  </thead>
  <tbody>
  <c:forEach var="customerDto" items="${customerDtoList}">
    <tr>
      <td>${customerDto.customerID}</td>
      <td>${customerDto.customerCode}</td>
      <td>${customerDto.customerName}</td>
      <td>${customerDto.customerAddress1}</td>
      <td>${customerDto.customerAddress2}</td>
      <td>${customerDto.customerPinCode}</td>
      <td>${customerDto.emailAddress}</td>
      <td>${customerDto.contactNumber}</td>
      <td>${customerDto.primaryContactPerson}</td>
      <td>${customerDto.recordStatus}</td>
      <c:set var = "accept" value="A"/>
            <c:if test = "${customerDto.authorization eq accept}">
            <td>Accept</td>
            </c:if>

            <c:set var = "reject" value="R"/>
                        <c:if test = "${customerDto.authorization eq reject}">
                        <td>Reject</td>
                        </c:if>


      <c:if test="${empty customerDto.authorization}">
                        <td>...</td>
      </c:if>

      <td>${customerDto.isActive}</td>
      <td>
        <a href="modifyCustomerForm/${customerDto.customerCode}"  onclick="if (confirm('Are You Sure To Modify This Data?')){return true;}else{event.stopPropagation(); event.preventDefault();};" id="editConfirm" class="edit edit_confirmation  btn btn-primary" role="button">modify</a>
        <a href="deleteCustomer/${customerDto.customerCode}/${customerDto.recordStatus}" id="deleteConfirm"     onclick="if (confirm('Are You Sure To Delete This Data?')){return true;}else{event.stopPropagation(); event.preventDefault();};"         class="delete delete_confirmation btn btn-danger" role="button">Delete</a>

      </td>
    </tr>
  </c:forEach>
        </tbody>
      </table>


   </div>   <!-- end of view all customers -->

      	</c:if>

      	<%--******************************* checker view section ****************************************--%>
      	<c:if test="${not empty checker}">
      	 <div id="viewAllCustomerDiv" style="margin-top: 200px; display:none;">
        <table id="myTable" class="table table-striped table-bordered table-responsive table-hover" >
          <thead>
          <tr>
            <th>id</th>
            <th>Customer Code</th>
            <th>Name</th>
            <th>Address1</th>
            <th>Address2</th>
            <th>Pin Code</th>
            <th>Email Address</th>
            <th>Contact Number</th>
            <th>Primary Contact Person</th>
            <th>Record Status</th>
            <th>Flag Status</th>
            <th style="min-width: 200px;">Actions</th>

          </tr>
          </thead>
          <tbody>
          <c:forEach var="customerTemp" items="${customerTempLst}">
            <tr>
              <td>${customerTemp.customerID}</td>
              <td>${customerTemp.customerCode}</td>
              <td>${customerTemp.customerName}</td>
              <td>${customerTemp.customerAddress1}</td>
              <td>${customerTemp.customerAddress2}</td>
              <td>${customerTemp.customerPinCode}</td>
              <td>${customerTemp.emailAddress}</td>
              <td>${customerTemp.contactNumber}</td>
              <td>${customerTemp.primaryContactPerson}</td>
              <td>${customerTemp.recordStatus}</td>
              <c:set var = "active" value="1"/>
              <c:if test = "${customerTemp.isActive eq active}">
              <td>Active</td>
              </c:if>
              <c:set var = "inActive" value="0"/>
                            <c:if test = "${customerTemp.isActive eq inActive}">
                            <td>InActive</td>
                            </c:if>

              <td>
                <a href="authorizeCustomer/${customerTemp.customerCode}/${customerTemp.recordStatus}" id="authorizeConfirm"  onclick="if (confirm('Are You Sure To Authorize This Data?')){return true;}else{event.stopPropagation(); event.preventDefault();};" class="edit edit_confirmation btn btn-success" role="button">Authorize</a>
                <a href="rejectCustomer/${customerTemp.customerCode}/${customerTemp.recordStatus}" id="rejectConfirm"  onclick="if (confirm('Are You Sure To Reject This Data?')){return true;}else{event.stopPropagation(); event.preventDefault();};" class="delete delete_confirmation btn btn-danger" role="button">Reject</a>

              </td>
            </tr>
          </c:forEach>
                </tbody>
              </table>


           </div>


      	<%--******************************* end of checker view section ****************************************--%>
         </c:if>



      	<%--******************************* modify customer form  ****************************************--%>

                 <c:if test="${not empty maker}">
                 <c:if test="${not empty modify}">

  <div class="container register" id="modifyCustomerDiv" style=" margin-top:150px;">
    <div class="row">
      <div class="col-md-3 register-left">
        <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt="" />
        <h3>Welcome</h3>
        <p>You are few seconds away from Modification!</p>
      </div>
      <div class="col-md-9 register-right">
        <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
          <li class="nav-item">
            <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home"
              aria-selected="true">Customer</a>
          </li>
        </ul>
        <div class="tab-content" id="myTabContent">
          <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
            <h3 class="register-heading">Modify Customer Details</h3>
            <div class="row register-form">
              <form action="modifyCustomer" method="post" class="col-md-12 row">
                <div class="col-md-6">
                  <div class="form-group">
                        customerID : ${customerToModify.customerID}
                       <input name="customerID" hidden type="text" class="form-control" placeholder="customerID *" value="${customerToModify.customerID}" >

                  </div>

                  <div class="form-group">
                    <input name="customerName" type="text" value="${customerToModify.customerName}" class="form-control" placeholder="customerName *" value="" >
                  </div>
                  <div class="form-group">
                    <input name="customerPinCode" type="text" class="form-control" placeholder="customerPinCode *" value="${customerToModify.customerPinCode}" >
                  </div>
                  <div class="form-group">
                   createdBy: ${customerToModify.createdBy}
                         <input name="createdBy" hidden type="text" class="form-control" placeholder="createdBy *" value="${customerToModify.createdBy}" >

                  </div>
                  <div class="form-group">
                    <input name="emailAddress" type="email" class="form-control" placeholder="emailAddress *" value="${customerToModify.emailAddress}" >
                  </div>

                  <div class="form-group">
                    <textarea name="customerAddress1"placeholder="customerAddress1 " id="" cols="30" rows="2" style="background-color: #fff;">${customerToModify.customerAddress1}</textarea>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                        customerCode : ${customerToModify.customerCode}
                   <input name="customerCode" hidden type="text" class="form-control" placeholder="customerCode *" value="${customerToModify.customerCode}" >

                  </div>
                  <div class="form-group">
                    <input name="contactNumber" type="text" minlength="10" maxlength="10"  class="form-control"
                      placeholder="Your Phone *" value="${customerToModify.contactNumber}" >
                  </div>
                  <div class="form-group">
                    <input name="primaryContactPerson" type="text" class="form-control" placeholder="primaryContactPerson *" value="${customerToModify.primaryContactPerson}" >
                  </div>
                  <div class="form-group">
                    <select name="flagStatus" class="form-control">
                      <option class="hidden" selected disabled>Flag Status </option>
                      <option value="1">Active</option>
                      <option value="0">InActive</option>
                    </select>
                  </div>
                  <div class="form-group">
                    <textarea name="customerAddress2" placeholder="customerAddress2" id="" cols="30" rows="2" style="background-color: #fff; border: 1px solid #2f2f2f;">${customerToModify.customerAddress2}</textarea>
                  </div>
                  <input type="submit" class="btnRegister" value="Modify" >
                </div>

              </form>

            </div>
          </div>

        </div>
      </div>
    </div>
  </div>


</c:if>
</c:if>


      	<%--******************************* end of modify customer form  ****************************************--%>




















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
<script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>


 <script>

$(document).ready(function(){
  $('#myTable').dataTable();
});



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


$(document).ready(function () {
  $(".preventDefaultLink").on("click", function (e) {
    e.preventDefault();
  });

  //
  $(".addNewCustomerLinkClass").click(function () {
    $("#addNewCustomerDiv").toggle(1000);
    $("#viewAllCustomerDiv").hide(1000);
    $("#loginDivId").hide();
    $("#modifyCustomerDiv").hide();

    // $("#addNewCustomerDiv").css({'display':'block'});
  });
  $("#viewAllCustomerLinkId").click(function () {
    // location = "home";
    $("#viewAllCustomerDiv").fadeToggle(3000);
    $("#loginDivId").hide();
    $("#modifyCustomerDiv").hide();
    $("#modifyCustomerDiv").hide();
    $("#addNewCustomerDiv").hide();
  });

  $("#hideAllCustomerLinkId").click(function () {
    // location = "home";
    $("#viewAllCustomerDiv").fadeOut(3000);
    $("#loginDivId").hide();
    $("#modifyCustomerDiv").hide();
    $("#addNewCustomerDiv").hide();
  });
  $("#refreshAllCustomerLinkId").click(function () {
    location = "home";
    // $("#viewAllCustomerDiv").toggle();

    // $("#addNewCustomerDiv").hide();
  });
  $("#loginBtnId").click(function () {
    $("#loginDivId").toggle();
    $("#modifyCustomerDiv").hide();
    $("#addNewCustomerDiv").hide();
    $("#viewAllCustomerDiv").hide(1000);

  });

});
 $("#saveCustomerBtn").click(function(e){
    e.preventDefault();
    console.log("saveCustomerBtn clicked!");
        let customerID=$("#customerIDId").val();
        let customerCode=$("#customerCodeId").val();
        let customerName=$("#customerNameId").val();
        let customerAddress1=$("#customerAddress1Id").val();
        let customerAddress2=$("#customerAddress2Id").val();
        let customerPinCode=$("#customerPinCodeId").val();
        let emailAddress=$("#emailAddressId").val();
        let contactNumber=$("#contactNumberId").val();
        let primaryContactPerson=$("#primaryContactPersonId").val();
        let flagStatus=$("#flagStatusId").val();
        let createdBy=$("#createdById").val();
        customerData={
        customerID : customerID,
        customerCode : customerCode,
        customerName : customerName,
        customerAddress1 : customerAddress1,
        customerAddress2 : customerAddress2,
        customerPinCode : customerPinCode,
        emailAddress : emailAddress,
        contactNumber : contactNumber,
        primaryContactPerson : primaryContactPerson,
        isActive : flagStatus,
        createdBy : createdBy
        };

        console.log(customerData);

        $.ajax({
          url:"addCustomer",
          method:"POST",
          data:JSON.stringify(customerData),
        });
  });


$(document).ready(function(){
   //confirmation
    $("#editConfirm").confirm();

    $("#deleteConfirm").confirm({
          title:"delete confirmation",
          text:"Are you really really sure to delete this data?",
          confirm: function(a) {
              alert("You just confirmed.");
          },
          cancel: function(a) {
              alert("You aborted the operation.");
          },
          confirmButton: "Yes I am",
          cancelButton: "No"
      });
      $("#authorizeConfirm").confirm({
            title:"authorize confirmation",
            text:"Are you really really sure to authorize this data?",
            confirm: function(button) {
                alert("You just confirmed.");
            },
            cancel: function(button) {
                alert("You aborted the operation.");
            },
            confirmButton: "Yes I am",
            cancelButton: "No"
        });
        $("#rejectConfirm").confirm({
              title:"edit confirmation",
              text:"Are you really really sure to reject this data?",
              confirm: function(button) {
                  alert("You just confirmed.");
              },
              cancel: function(button) {
                  alert("You aborted the operation.");
              },
              confirmButton: "Yes I am",
              cancelButton: "No"
          });
});

</script>

</body>
</html>