<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%
//Read values from the admin.html form
String username=request.getParameter("username");

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ora","scott","nandini");
        
          PreparedStatement ps = con.prepareStatement("delete from s where username=?");
          ps.setString(1,username);
		  int i=ps.executeUpdate();
		  if(i>0)
		  {
%>
<p style="text-align:center;color:blue;text-indent:70px;">
<%out.println("user "+username+" deleted");%>
</p>
<%
		  }
		  else{
%>
		<p style="text-align:center;color:blue;text-indent:70px;">
		<%out.println("user not found");%>
		</p>
<%
		  }
%>
<p style="text-align:center;color:blue;text-indent:70px;">			  
<a href="admin1.html"><%out.println("goto admin page");%></a>
</p>
<%          
}
catch(Exception e)
{
		out.println(e);
}
%>