<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.sql.*, java.util.*, library.models.data.User, storage.ORM"%>
<!DOCTYPE html>
<html>
<head>
<style>
<%@ include file="Styles/Styles.css"%>
</style>
<title>Master Main Menu</title>
</head>

<body>
	<p align="center">
		<font size="+2"> <b>Hello, <%
 	if (session.getAttribute("name") != null) {
 %><%=session.getAttribute("name")%>
				<%
					} else {
						response.sendRedirect("pageIndex.jsp");
					}
				%>
		</b>
		</font>
	</p>

	<p align="center">
		<font size="+2" color="green"><b><br> <%
 	out.println("Welcome back!");
 %> </b> </font>
	</p>
	<div align="center">
		<table>

			<tr>
				<td><form action="createUser.jsp">
						<input class="myButton menuButton" type="submit"
							value="Create User">
					</form></td>
			</tr>
			<tr>
				<td><form action="deleteUser.jsp">
						<input class="myButton menuButton" type="submit"
							value="Delete User">
					</form></td>
			</tr>
			<tr>
				<td><form action="listUsers.jsp">
						<input class="myButton menuButton" type="submit"
							value="List Users">
					</form></td>
			</tr>
			<tr>
				<td><form action="pageIndex.jsp">
						<input class="myButton menuButton" type="submit"
							value="Logout">
							<%
								session.setAttribute("name", null);
							 %>
					</form></td>
			</tr>
			<tr>
				<td><form action="exit.jsp">
						<input class="myButton menuButton" type="submit" value="Exit">
					</form></td>
			</tr>
		</table>
	</div>

</body>
</html>