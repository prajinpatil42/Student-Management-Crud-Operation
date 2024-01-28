<%@page import="com.coder.entity.Student"%>
<%@page import="com.coder.dao.StudentDAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@page import="com.coder.connection.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Management System</title>

<%@include file="all_css.jsp"%>
</head>
<body
	style="background-image: linear-gradient(to right top, #ae563c, #ab434a, #9f355b, #8a2f6b, #6b3179, #50387d, #323c7c, #003e77, #00406a, #003e57, #003b44, #0d3634); width: 100%; height: 100vh; background-size: cover; background-repeat: no-repeat;">
	<%@include file="navbar.jsp"%>

	<%-- 	<%	Connection conn= DBConnect.getConn();
	
	out.println(conn); 
	 %> --%>








	<div class="container p-3">

		<div class="card">
			<div class="card-body">


				<p class="text-center fs-1">All Student Details</p>


				<c:if test="${not empty succMsg }">
					<p class="text-center  text-success ">${succMsg}</p>
					<c:remove var="succMsg" />
				</c:if>

				<c:if test="${not empty errorMsg }">
					<p class="text-center  text-success ">${errorMsg}</p>
					<c:remove var="errorMsg" />
				</c:if>


				<table class="table">
					<thead>
						<tr>
							<th scope="col">Full Name</th>
							<th scope="col">DOB</th>
							<th scope="col">Address</th>
							<th scope="col">Qualification</th>
							<th scope="col">Email</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>



						<%
						StudentDAO dao = new StudentDAO(DBConnect.getConn());
						List<Student> list = dao.getAllStudent();
						for (Student s : list) {
						%>

						<tr>
							<th scope="row"><%=s.getFullname()%></th>
							<td><%=s.getDob()%></td>
							<td><%=s.getAddress()%></td>
							<td><%=s.getQualification()%></td>
							<td><%=s.getEmail()%></td>
							<td><a href="edit_student.jsp?id=<%=s.getId()%>"
								class="btn btn-sm btn-primary">Edit</a>
								 <a href="delete?id=<%=s.getId() %>"
								class="btn btn-sm btn-danger ms-1">Delete</a></td>

						</tr>
						<%
						}
						%>



					</tbody>
				</table>
			</div>
		</div>
	</div>



</body>
</html>