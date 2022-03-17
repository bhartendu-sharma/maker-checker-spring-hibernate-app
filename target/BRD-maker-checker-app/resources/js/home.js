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







             $(document).ready(function() {
       $('a').on("click", function(e) {
           e.preventDefault();
       });
       $('#tmpLink').unbind('click');
       //
       $("#addNewCustomerLinkId").click(function () {
         $("#addNewCustomerDiv").toggle();
         $("#viewAllCustomerDiv").hide();

               // $("#addNewCustomerDiv").css({'display':'block'});


           });
           $("#viewAllCustomerLinkId").click(function () {
                 location.href = "viewAllCustomer";

         $("#viewAllCustomerDiv").toggle();

         $("#addNewCustomerDiv").hide();



           });
           //
   });



             // function addnewCustomerFun() {
             //   document.getElementById("addNewCustomerDiv").style.display = "block";
             //   document.getElementById("viewAllCustomerDiv").style.display = "none";

             // }

             // function viewAllCustomerFun(){
             //   document.getElementById("viewAllCustomerDiv").style.display = "block";
             //   document.getElementById("addNewCustomerDiv").style.display = "none";

             // }