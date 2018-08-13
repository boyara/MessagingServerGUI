<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="library.models.data.User, storage.ORM"%>
<!DOCTYPE html>
<html>
<head>
<style>
<%@ include file="Styles/Styles.css"%>
<%@ include file="Styles/InputStyles.css"%>
</style>
<meta charset="ISO-8859-1">
<title>Delete User</title>
</head>
<body>
	<div class="inputDiv">
		<form method="post" action="deleteUser.jsp">
			<table style="width: %" align="center">
				<tr>
					<th>Username or Email:</th>
					<td><input type="text" name="keyword" size="50"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input class="myButton"
						type="submit" value="Submit" /></td>
				</tr>
			</table>

			<div align="center">
				<%
					String keyword = request.getParameter("keyword");

					User user = ORM.selectUser(keyword, keyword);
					if (user != null) {
						if (ORM.deleteUser(user)) {
							out.println("User deleted. Do you want to go back? ");
				%>
				<input class="myButton" type="submit" formaction="masterIndex.jsp" value="Yes">
			
			<%
				}
				} else {

					out.println("No such user!");
				}
			%>
			</div>
		</form>

	</div>
</body>
</html>