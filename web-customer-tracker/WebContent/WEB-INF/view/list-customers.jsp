<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Customer Details</title>


<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/styleSheetFolder/css/style.css" />

</head>

<body>

	<div id="wrapper">
		<div id="header">
			<h2>CRM - Customer Relationship Manager</h2>
		</div>
	</div>

	<div id="container">
		<div id="content">
		<!-- put new button: Add Customer -->
		<input type="button" valaue="Add Customer" onclick="window.location.href='showFormForAdd'; return false;" 
			class="add-button"
		/>
		
			<!-- add out html table here -->
			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>

				<!-- loop over and print our customers -->
				<c:forEach var="tempCustomer" items="${customers}">
					
					<!-- Construct an Update link with Customer ID -->
					<c:url var="updateLink" value="/customer/showFormForUpdate">
						<c:param name="customerId" value="${tempCustomer.id}"></c:param>
					</c:url>
					
					<!-- Construct an Delete link with Customer ID -->
					<c:url var="deleteLink" value="/customer/delete">
						<c:param name="customerId" value="${tempCustomer.id}"></c:param>
					</c:url>
					
						<tr>
							<td>${tempCustomer.firstName}</td>
							<td>${tempCustomer.lastName}</td>
							<td>${tempCustomer.email}</td>
							<td>
								<a href="${updateLink}">Update</a>
								|
								<a href="${deleteLink}"
									onclick="if(!(confirm('Are you sure want to delete this Ccustomer?'))) return false">Delete</a>
							</td>
						</tr>
				</c:forEach>
			</table>
		</div>
	</div>

</body>
</html>