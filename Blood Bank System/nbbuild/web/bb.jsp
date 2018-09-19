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
		
		System.out.println("con "+con);
%>
	<center>
	<form action="SearchHos">
	<table>
		<tr>
			<th>Enter location</th>
			<td><input type="text" name="loc" size="30" placeholder="Enter location"></td>
		</tr>
		<tr>
			<th>Enter Blood Group:</th>
			<td><input type="text" name="Blood" size="30" placeholder="Enter Blood Group"></td>
		</tr>
		<tr>
		<td></td>
		<td><input type ="submit" value="Search"></td>
		</tr>
	</table>
	</form>
	</center>
	<center>
	<br>
	<%
		String loc=(String)request.getAttribute("loc");
		String Blood=(String)request.getAttribute("Blood");
		java.sql.ResultSet rs=model.DBConnection.getHos(con,loc,Blood);
	%>
<%
	if(request.getAttribute("adddonar")!=null){
		out.println(request.getAttribute("adddonar"));
	}
	if(request.getAttribute("errordonar")!=null){
		out.println(request.getAttribute("errordonar"));
	}

%>
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
	while(rs.next()) {
		%>
		<td>
		<%
		out.println(rs.getString("DONAR"));
		%>
		</td>
		<td>
		<%
		out.println(rs.getString("HOSPITAL"));
		%></td>
		<td><% 
		out.println(rs.getString("ADDRESS"));
		%></td>
		<td><%
		out.println(rs.getString("EMAIL"));
		%></td>
		<td><%
		out.println(rs.getString("BLOODGROUP"));
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