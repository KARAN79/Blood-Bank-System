<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="5.jpg">
<%
		java.sql.Connection con=model.DBConnection.getConnection();
		
		System.out.println("con "+con);
%>
	<center>
	<font color="white">
	<form action="SearchHos">
	<table border="1">
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
		<br>
	<%-- <a href="BloodBankSearch.jsp" target="karan1" align="left">See All or Blood Bank</a>--%>
	<%
	if(request.getAttribute("errordonar")!=null){
		out.println(request.getAttribute("errordonar"));
	}

%>
	</font>
	</center>
	<center>

</body>
</html>