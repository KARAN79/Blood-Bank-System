<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="5.jpg">
<%
		java.sql.Connection con=model.DBConnection.getConnection();
		java.sql.ResultSet rs=model.DBConnection.getCourse(con);
		System.out.println("con "+con);
		System.out.println("rs "+rs);
%>
<form action="addDonar">
	<table border="1" bgcolor="darkred" align="center">
		<tr>
			<th><font color="white"> Doner Name</font></th>
			<td> <input type="text" placeholder="Enter Doner bank name" name="dname"></td>
		</tr>
		<tr>
			<th><font color="white"> Hospital</font> </th>
			<td> <input type="text" placeholder="Enter hospital name" name="hosp"></td>
		</tr>
		<tr>
			<th><font color="white"> Address</font></th>
			<td> <input type="text" placeholder="Enter Address" name="addr"></td>
		</tr>
		<tr>
			<th><font color="white"> Email</font></th>
			<td> <input type="text" placeholder="Enter Email address" name="email"></td>
		</tr>
		<tr>
			<th> <font color="white">Blood Group</font></th>
			<td> <input type="text" placeholder="Enter Blood Group" name="bgroup"></td>
		</tr>
		<tr>
			<th> </td>
			<td> <input type="submit" value="Add" name="add"></td>
		</tr>
	</table>
</form>
<br>
<center>
<font color="white">
<%
	if(request.getAttribute("adddonar")!=null){
		out.println(request.getAttribute("adddonar"));
	}
if(request.getAttribute("errordonar")!=null){
	out.println(request.getAttribute("errordonar"));
}

%>
</font>
</center>
<br>
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