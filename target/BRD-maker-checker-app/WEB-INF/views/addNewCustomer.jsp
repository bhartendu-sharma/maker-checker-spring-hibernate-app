
  <div class="container register" id="addNewCustomerDiv" style=" margin-top:150px;display:none">
    <div class="row">
      <div class="col-md-3 register-left">
        <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt="" />
        <h3>Welcome</h3>
        <p>You are few seconds away from Registration!</p>
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
            <h3 class="register-heading">Customer Entry Details</h3>
            <div class="row register-form">
              <form action="addCustomer" method="post" class="col-md-12 row">
                <div class="col-md-6">
                  <div class="form-group">
                    <input name="customerID" type="text" class="form-control" placeholder="customerID *" value="" >
                  </div>

                  <div class="form-group">
                    <input name="customerName" required type="text" class="form-control" placeholder="customerName *" value="" >
                  </div>
                  <div class="form-group">
                    <input name="customerPinCode" required type="text" class="form-control" placeholder="customerPinCode *" value="" >
                  </div>
                  <div class="form-group">
                                     createdBy: ${currUser.username}
                                           <input name="createdBy" hidden type="text" class="form-control" placeholder="createdBy *" value="${currUser.username}" >

                                    </div>

                  <div class="form-group">
                    <input name="emailAddress" required type="email" class="form-control" placeholder="emailAddress *" value="" >
                  </div>

                  <div class="form-group">
                    <textarea name="customerAddress1" required placeholder="customerAddress1 " id="" cols="30" rows="2" style="background-color: #fff;"></textarea>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <input name="customerCode" required type="text" class="form-control" placeholder="customerCode *" value="" >
                  </div>
                  <div class="form-group">
                    <input name="contactNumber" required type="text" minlength="10" maxlength="10"  class="form-control"
                      placeholder="Your Phone *" value="" >
                  </div>
                  <div class="form-group">
                    <input name="primaryContactPerson" required type="text" class="form-control" placeholder="primaryContactPerson *" value="" >
                  </div>
                  <div class="form-group">
                    <select name="flagStatus" required class="form-control">
                      <option class="hidden" selected disabled>Flag Status</option>
                      <option value="1">Active</option>
                      <option value="0">InActive</option>
                    </select>
                  </div>
                  <div class="form-group">
                    <textarea name="customerAddress2" required placeholder="customerAddress1" id="" cols="30" rows="2" style="background-color: #fff; border: 1px solid #2f2f2f;"></textarea>
                  </div>
                  <input type="submit" class="btnRegister" value="Register" >
                </div>

              </form>

            </div>
          </div>

        </div>
      </div>
    </div>
  </div>



