<%@ page import="java.sql.*" %>
<%
String email=request.getParameter("email");
String password=request.getParameter("password");
try
{
      Connection con= null;
      Class.forName("oracle.jdbc.driver.OracleDriver");
      con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ora","scott","nandini");
String qry =("insert into teacher values(?,?)");
PreparedStatement pstmt = con.prepareStatement(qry);
pstmt.setString(1,email);
pstmt.setString(2,password);
int sts = pstmt.executeUpdate();
if(sts>0){

response.sendRedirect("mcqprojectquiz.html");
}
out.println(sts+" row inserted successfully");
}
catch(Exception e)
{
out.print(e);
e.printStackTrace();
}
%>
