<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="storage.ORM, library.util.Sha1Hash, library.models.data.User, managers.UserManager"%>
<!DOCTYPE html>
<html>
<head>
<style>
<%@ include file="Styles/Styles.css"%>
<%@ include file="Styles/InputStyles.css"%>
</style>
<meta charset="ISO-8859-1">
<title>Create User</title>
</head>
<body>
	<div class="inputDiv">
		<form method="post" action="createUser.jsp">
			<table style="width: %" align="center">
				<tr>
					<th>Username:</th>
					<td><input type="text" name="accountName" size="50"></td>
				</tr>
				<tr>
					<th>Password:</th>
					<td><input type="text" name="accountPass" size="50"></td>
				</tr>
				<tr>
					<th>Email:</th>
					<td><input type="text" name="accountEmail" size="50"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input class="myButton"
						type="submit" value="submit" /></td>
				</tr>
			</table>
			<div align="center">
				<%
					String name = request.getParameter("accountName");
					String password = request.getParameter("accountPass");
					String email = request.getParameter("accountEmail");
					if (name != null || password != null || email != null) {
						out.println("Response: ");
						if (!name.equals("") && !password.equals("") && !email.equals("")) {
							String passwordHash = Sha1Hash.generateHash(password);
							User user = new User(name, passwordHash, email);
							long userId = ORM.insertUser(user);
							if (userId > UserManager.NO_USER) {
								out.println("User " + userId + " created. Do you want to go back? ");
				%>
				<input class="myButton" type="submit" formaction="masterIndex.jsp"
					value="Yes">
				<%
					} else {
								out.println("Username or email already exists.");
							}
						} else {
							out.println("Wrong info!");
						}
					}
				%>
			</div>
		</form>

	</div>
</body>
</html>