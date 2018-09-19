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
		java.sql.ResultSet rs1=model.DBConnection.getQuery(con);
		System.out.println("con "+con);
		System.out.println("rs "+rs1);
%>
	<center>
	<font color="white">
	<form action="addquery">
		<table border="2">
			<tr>
				<th>Enter name:</th>
				<td><input type="text" name="name" id="name" placeholder="Enter name"></td>
			</tr>
			<tr>
				<th>Enter Query</th>
				<td><input type="textarea" name="query" id="query" placeholder="Enter query"></td>
			</tr>
			<tr>
				<th>Enter rating</th>
				<td><input type="text" name="rating" id="rating" placeholder="Enter rating in numeric values"></td>
			</tr>
			<tr>
				<th> </th>
				<td><input type="submit" value="Enter"></td>
			</tr>
			
		</table>
	</form>
	</font>
	</center>
	<center>
	<br>
	<font color="white">
<%
	if(request.getAttribute("query")!=null){
		out.println(request.getAttribute("query"));
	}
%>
</font>

</center>
<br>
<center>
<font color="white">
	<table border="0.5">
	<tr>
		<th>NAME</th>
		<th>QUERY</th>
		<th>RATING</th>
	</tr>
	<tr>
	<%
	while(rs1.next()) {
		%><td><%
		out.println(rs1.getString("NAME"));
		%></td>
		<td><%
		out.println(rs1.getString("QUERY"));
		%></td>
		<td><% 
		out.println(rs1.getString("RATING"));
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