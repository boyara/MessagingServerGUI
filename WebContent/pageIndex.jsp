<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="org.eclipse.jdt.internal.compiler.batch.Main"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.sql.*, managers.DatabaseManager, storage.WCB, storage.ORM, models.data.*, library.models.data.User, managers.NetworkManager"%>
<%@ page import="java.io.*, javax.servlet.jsp.tagext.TryCatchFinally"%>
<!DOCTYPE html>
<html>
<head>
<style>
<%@ include file="Styles/Styles.css"%>
<%@ include file="Styles/InputStyles.css"%>
</style>
<meta charset="ISO-8859-1">
<title>Master login page</title>
</head>
<body>
	<div align="center">
		<form method="post" action="pageIndex.jsp">
			<table style="width: %">
				<tr>
					<th>MasterAccount:</th>
					<td><input type="text" name="account" size="50"></td>
					<td rowspan="2"><input class="myButton" type="submit"
						value="Login" />
				</tr>
				<tr>
					<th>MasterPassword:</th>
					<td><input type="text" name="pass" size="50"></td>
				</tr>
			</table>
		</form>

	</div>
		<%
			Object pass = request.getParameter("pass");
			MasterUser masterUser = null;
			if (pass != null) {
				try {
					/* Create string of connection url within specified format with machine name, 
					port number and database name. Here machine name id localhost and 
					database name is usermaster. */
					String connectionURL = "jdbc:mysql://localhost:3306/piraty_chat_client";

					// declare a connection by using Connection interface 
					Connection connection = null;

					//�Load JBBC driver "com.mysql.jdbc.Driver" 
					Class.forName("com.mysql.jdbc.Driver").newInstance();

					/* Create a connection by using getConnection() method that takes parameters of 
					string type connection url, user name and password to connect to database. */
					connection = DriverManager.getConnection(connectionURL, "root", "");
					out.println("Successfully connected to " + "MySQL server using TCP/IP...");
					connection.close();
				} catch (Exception ex) {
					out.println("Unable to connect to database.");
				}
				masterUser = ORM.selectMasterUser(request.getParameter("account"));
				if (masterUser != null) {
					if (request.getParameter("pass").equals(masterUser.getPasswordHash())) {
						session.setAttribute("name", masterUser.getName());
						String redirectURL = "http://localhost:8080/goshoweb/masterIndex.jsp";
						response.sendRedirect(redirectURL);
					} else {
		%><font size="+2" color="red"><b><br> <%
 	out.println("Wrong password!");
 %> </b></font>
		<%
			}
				} else {
		%><font size="+2" color="red"><b><br> <%
 	out.println("Wrong login");

 		}
 	}
 %> </b> </font>
</body>
</html>