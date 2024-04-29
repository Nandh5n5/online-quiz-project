<%@page import="java.sql.*"%>


<%
String username=request.getParameter("username");
String email=request.getParameter("email");
String password=request.getParameter("password");
String mobilenumber=request.getParameter("mobilenumber");
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ora","scott","nandini");
		PreparedStatement ps=conn.prepareStatement("insert into s values(?,?,?,?)");
		ps.setString(1,username);
		ps.setString(2,email);
		ps.setString(3,password);
		ps.setString(4,mobilenumber);
		int i=ps.executeUpdate();
		if(i!=0){
			out.println("login is completed");
			
		}
		else{
			out.println("once again please check the information");
		}
	}
	catch(Exception e){
		out.print(e);
	}
%>