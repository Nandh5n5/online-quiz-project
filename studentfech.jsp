<%@page import="java.sql.*"%>
<%
try{
 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ora","scott","nandini");
 
String sql="select * from stude";
PreparedStatement stmt=con.prepareStatement(sql);  
ResultSet rs=stmt.executeQuery();  
%>
<html>
<body bgcolor="pink">
<center>
<h1>Welcome to Signup Details</h1>
<table border="5" bgcolor="white">
<tr>


<th colspan="5" align="center">Student Details</th></tr>

<tr>
<td>email</td>
<td>username</td>
<td>password</td>

</tr>
<%
while(rs.next())
{
%>
<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>

</tr>
<%
}
%>
</table>
<br>
<br>
<% }
catch(Exception e)
{
 out.println(e.toString());
}
%>