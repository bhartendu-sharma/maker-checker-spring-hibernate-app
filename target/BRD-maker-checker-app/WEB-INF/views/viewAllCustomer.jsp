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
      <td>${customerDto.isActive}</td>

      <td>
        <a href="../modifycustomerform/${customerDto.customerCode}" class="edit edit_confirmation">modify</a>
        <a href="deleteCustomer/${customerDto.customerCode}/${customerDto.recordStatus}" class="delete delete_confirmation">Delete</a>

      </td>
    </tr>
  </c:forEach>
        </tbody>
      </table>


   </div>