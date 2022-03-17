<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>All Customer Details</title>
<meta name="description" content="Bootstrap.">
<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
<script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>
<body style="margin:20px auto">
<div class="container">
<div class="row header" style="text-align:center;color:green">
<h3>Temp Table</h3>
</div>

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
    <th>Create Date</th>
    <th>Created By</th>
    <th>Modified Date</th>
    <th>Modified By</th>
    <th>Authorized Date</th>
    <th>Authorized By</th>
    <th style="min-width: 200px;">Actions</th>

  </tr>
  </thead>
  <tbody>
  <c:forEach var="customer" items="${customerTempLst}">
    <tr>
      <td>${customer.customerID}</td>
      <td>${customer.customerCode}</td>
      <td>${customer.customerName}</td>
      <td>${customer.customerAddress1}</td>
      <td>${customer.customerAddress2}</td>
      <td>${customer.customerPinCode}</td>
      <td>${customer.emailAddress}</td>
      <td>${customer.contactNumber}</td>
      <td>${customer.primaryContactPerson}</td>
      <td>${customer.recordStatus}</td>
      <td>${customer.isActive}</td>
      <td>${customer.createdDate}</td>
      <td>${customer.createdBy}</td>
      <td>${customer.modifiedDate}</td>
      <td>${customer.modifiedBy}</td>
      <td>${customer.authorizedDate}</td>
      <td>${customer.authorizedBy}</td>

      <td>
        <a href="../modifycustomerform/${customer.customerCode}/${username}" class="edit edit_confirmation"><i class="material-icons" title="Edit">&#xE254;</i></a>
        <a href="../deletecustomer/${customer.customerCode}/${customer.recordStatus}/${username}" class="delete delete_confirmation"><i class="material-icons" title="Delete">&#xE872;</i></a>
      </td>
    </tr>
  </c:forEach>
        </tbody>
      </table>
	  </div>

<!--master table start-->

<div class="container">
  <div class="row header" style="text-align:center;color:green">
    <h3>Master Table</h3>
  </div>

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
      <th>Create Date</th>
      <th>Created By</th>
      <th>Modified Date</th>
      <th>Modified By</th>
      <th>Authorized Date</th>
      <th>Authorized By</th>
      <th style="min-width: 200px;">Actions</th>

    </tr>
    </thead>
    <tbody>
    <c:forEach var="customer" items="${customerMasterLst}">
      <tr>
        <td>${customer.customerID}</td>
        <td>${customer.customerCode}</td>
        <td>${customer.customerName}</td>
        <td>${customer.customerAddress1}</td>
        <td>${customer.customerAddress2}</td>
        <td>${customer.customerPinCode}</td>
        <td>${customer.emailAddress}</td>
        <td>${customer.contactNumber}</td>
        <td>${customer.primaryContactPerson}</td>
        <td>${customer.recordStatus}</td>
        <td>${customer.isActive}</td>
        <td>${customer.createdDate}</td>
        <td>${customer.createdBy}</td>
        <td>${customer.modifiedDate}</td>
        <td>${customer.modifiedBy}</td>
        <td>${customer.authorizedDate}</td>
        <td>${customer.authorizedBy}</td>

        <td>
          <a href="../modifycustomerform/${customer.customerCode}/${username}" class="edit edit_confirmation">modify</a>
          <a href="../deletecustomer/${customer.customerCode}/${customer.recordStatus}/${username}" class="delete delete_confirmation">Delete</i></a>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
</body>

<script>
$(document).ready(function(){
    $('#myTable').dataTable();
});
</script>
</html>
```