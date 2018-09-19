<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="red-wallpaper-16.jpg">
<%
		java.sql.Connection con=model.DBConnection.getConnection();
		java.sql.ResultSet rs1=model.DBConnection.getCourse(con);
%>

<center>
<font color="white">
	<table border="2">
	<tr>
		<th>DONAR</th>
		<th>HOSPITAL</th>
		<th>ADDRESS</th>
		<th>EMAIL</th>
		<th>BLOOD GROUP</th>
	</tr>
	<tr>
	<%
	while(rs1.next()) {
		%>
		<td>
		<%
		out.println(rs1.getString("DONAR"));
		%>
		</td>
		<td>
		<%
		out.println(rs1.getString("HOSPITAL"));
		%></td>
		<td><% 
		out.println(rs1.getString("ADDRESS"));
		%></td>
		<td><%
		out.println(rs1.getString("EMAIL"));
		%></td>
		<td><%
		out.println(rs1.getString("BLOODGROUP"));
		%></td>
		</tr>
	<%
	}
	%>
	
	</table>
	</font>
</center>
</body>
</html>