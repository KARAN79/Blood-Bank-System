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
	%>
	<%
		String loc=(String)request.getAttribute("loc");
		String Blood=(String)request.getAttribute("Blood");
		
		System.out.println("IN BB SEARCH loc= "+loc);
		System.out.println("blood= "+Blood);
		
		java.sql.ResultSet rs=model.DBConnection.getHos(con,loc,Blood);
		System.out.println("con="+con);
		System.out.println("rs="+rs);
	%>

<font color="white">
	<table border="2">
	<tr>
		<th>DONAR</th>
		<th>Blood Bank</th>
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
<br>
<br>
<a href="bb.jsp" target="karan1"> <font color="white">Check for other place </font></a>

</body>
</html>