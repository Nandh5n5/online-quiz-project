<%@page import="java.sql.*"%>
<%
String fullname=request.getParameter("fullname");
String email=request.getParameter("email");
String message=request.getParameter("message");
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ora","scott","nandini");
		PreparedStatement ps=conn.prepareStatement("insert into contactus values(?,?,?)");
		ps.setString(1,fullname);
		ps.setString(2,email);
		ps.setString(3,message);
		int i=ps.executeUpdate();
		if(i!=0){
			out.println("your message is under consideration");
			
		}
		else{
			out.println("please fill all the details");
		}
	}
	catch(Exception e){
		out.print(e);
	}
%>