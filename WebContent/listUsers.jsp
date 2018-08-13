<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.List, library.models.data.User, storage.ORM, java.sql.*, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<style>
<%@ include file="Styles/Styles.css"%>
<%@ include file="Styles/InputStyles.css"%>
</style>
<meta charset="ISO-8859-1">
<title>List Users</title>
</head>
<body>
	<table align="center">
		<thead>
			<tr>
				<th>Name</th>
				<th>Email</th>
			</tr>
		</thead>
		<%
			List<User> users = ORM.selectAllUsers();
			List<String> names = new ArrayList<>();
			List<String> emails = new ArrayList<>();
			for (User user : users) {
				names.add(user.getName());
				emails.add(user.getEmail());
			}
			for (int i = 0; i < users.size(); i++) {
		%>
		<tr>
			<td>
				<%
					out.println(names.get(i));
				%>
			</td>
			<td>
				<%
					out.println(emails.get(i));
				%>
			</td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>