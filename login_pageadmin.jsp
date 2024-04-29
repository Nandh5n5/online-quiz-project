
        <%@page import="java.sql.*"%>
        <%
	        String username=request.getParameter("username");
            	String password=request.getParameter("password");
            try {
	       
            Connection con=null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ora","scott","nandini");
            PreparedStatement ps=con.prepareStatement("select * from admin where username=? and password=?");
	    ps.setString(1,username);
	    ps.setString(2,password);
            ResultSet rs=ps.executeQuery();
           if(rs.next()){
         %>
         <%@ include file="admin.html"%>
	 <%
				
            }
            else{
	
	  %>
	 <%@ include file="admin1.html"%>
         <% 
         }  
         }
         catch(Exception e) 
	 {
            out.print(e);
         }
         %>