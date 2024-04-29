<%@ page import="java.sql.*"
%>


<%
int cnt=0;
String paramName,paramValue[];
String ans=request.getParameter("ans");

	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ora","scott","nandini");
		PreparedStatement ps=conn.prepareStatement("insert into quiz values(?,?,?,?)");
		ps.setString(1,ans);
		int i=ps.executeUpdate();
		while(ps.next()&& paramNames.hasMoreElements()){
			String un=ps.getString(1);
                        paramName=(String)paramNames.nextElement();
			paramValue=request.getparameterValues(paramName);
			for(int i=0;i<paramValue.length;i++)
			{
				ans=paramValue[i];
			}
			if(un.equals(ans))
				cnt++	
                }
		out.println("<h1> You have scored"+cnt" points out of 6.</h1>");
		
	}
	catch(Exception e){
		out.print("Sorry try Again .6!!!...");
	}
%>