<%
	//String username = request.getParameter("user_name");
	//String password = request.getParameter("user_password");
	//System.out.println(username+"-"+password);
	session.invalidate();
	System.out.println("Logout user; session = "+session);
	
    response.sendRedirect("./");
%>
