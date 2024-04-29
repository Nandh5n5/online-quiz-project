<%@ page import="java.sql.*"
%>


<%
int cnt=0;
String ans=request.getParameter("ans");

	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ora","scott","nandini");
		PreparedStatement ps=conn.prepareStatement("insert into quiz values(?,?,?,?)");
		ps.setString(1,ans);
		int i=ps.executeUpdate();
		if(i!=0){
			if(ps.equals(ans))
				cnt++;
			
			}
		       out.println("You have scored points out of 6."+cnt);
		
	  }
	catch(Exception e){
		out.print("Sorry try Again ..!!!!...");
	}
%>