<%@page import="com.coder.entity.Student"%>
<%@page import="com.coder.connection.DBConnect"%>
<%@page import="com.coder.dao.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_css.jsp"%>
</head>
<body
	style="background-image: linear-gradient(to right top, #ae563c, #ab434a, #9f355b, #8a2f6b, #6b3179, #50387d, #323c7c, #003e77, #00406a, #003e57, #003b44, #0d3634); width: 100%; height: 100vh; background-size: cover; background-repeat: no-repeat;">

	<%@include file="navbar.jsp"%>

	<div class="container p-4">
		<div class="row">
			<div class="col-md-6 offset-md-3">

				<div class="card">

					<div class="card-body">

						<p class="fs-3 text-center">Edit Student</p>


						<%
						int id = Integer.parseInt(request.getParameter("id"));
						StudentDAO dao = new StudentDAO(DBConnect.getConn());
						Student s = dao.getStudentById(id);
						%>

						<form action="update" method="post">

							<div class="mb-3">
								<label class="form-label">Full Name</label> 
								<input type="text"
									value="<%=s.getFullname()%>" name="name" class="form-control">
							</div>


							<div class="mb-3">
								<label class="form-label">Date Of Birth</label> <input
									value="<%=s.getDob()%>" name="dob" type="date"
									class="form-control">
							</div>



							<div class="mb-3">
								<label class="form-label">Address</label> 
								<input value="<%= s.getAddress() %>"  type="text"
									name="address" class="form-control">
							</div>


							<div class="mb-3">
								<label class="form-label">Qualification</label> <input
									value="<%= s.getQualification() %>" name="qualification" type="text" class="form-control">
							</div>



							<div class="mb-3">
								<label class="form-label">Email address</label> <input
									value="<%= s.getEmail() %>" name="email" type="email"
									class="form-control ">
							</div>

						<input type="hidden" name="id" value="<%=s.getId()%>">
							<button type="submit" class="btn btn-success col-md-12">Update</button>
						</form>





					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>