<%@ page import="java.sql.*" %>

<%
String email=request.getParameter("email");
String username=request.getParameter("username");
String password=request.getParameter("password");
try
{
      Connection con= null;
      Class.forName("oracle.jdbc.driver.OracleDriver");
      con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ora","scott","nandini");
String qry =("insert into stude values(?,?,?)");
PreparedStatement pstmt = con.prepareStatement(qry);
pstmt.setString(1,email);
pstmt.setString(2,username);
pstmt.setString(3,password);
int sts = pstmt.executeUpdate();
if(sts>0){
out.println(sts+" row inserted successfully");
response.sendRedirect("mcqprojectquiz.html");
}

}
catch(Exception e)
{
out.print(e);
e.printStackTrace();
}
%>
