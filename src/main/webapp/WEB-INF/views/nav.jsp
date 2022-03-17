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
            <li class="c-items"><a href="" class="addNewCustomerLinkClass">Add new Customer</a>   </li>
            <li class="c-items nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">customer Details</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
                  <a class="dropdown-item page-scroll" id="viewAllCustomerLinkId">view All customer</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item page-scroll" id="hideAllCustomerLinkId">hide</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item page-scroll addNewCustomerLinkClass" >Add new Customer</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item page-scroll" id="refreshAllCustomerLinkId">refresh Details</a>

              </div>
          </li>

            <li class="c-items"><a href="#">${currUser.username}</a></li>
            <li class="c-items"><a href="#">Logout</a></li>
                  <c:if test="${not empty maker}">
              <li class="c-items"><a href="#">Login</a></li>
            	</c:if>


            <li class="nav-btn">
              <a href="#"><i class="fa fa-bars"></i></a>
            </li>
          </ul>
        </nav>
      </div>