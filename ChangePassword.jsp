<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, org.inventory.dao.*, org.inventory.jdo.*" %>

<html>
<jsp:include page="Header.jsp">
   	<jsp:param value="test" name="test"/>
</jsp:include>
<body class="bg-steel">
	<div style="width:100%; margin:0 auto;">
    <jsp:include page="Menus.jsp">
    	<jsp:param value="test" name="test"/>
	</jsp:include>
<%
	String action = request.getParameter("action");
	if(action == null)
	{
%>
    <div class="page-content">
        <div class="flex-grid no-responsive-future" >
            <div class="row" style="height: 100%" >
                <div class="cell auto-size padding20 bg-white" id="cell-content">
                    <h3 class="text-light"> Change Password </h3>
                    <hr class="thin bg-grayLighter">
                    <div style="padding-left: 200px;">
                    <form method="post" data-role="validator" action="./ChangePassword.jsp">
                    <input type="hidden" name="action" id="action" value="save" />
                    <table style="width:60%;">
                        <tbody>
                        <tr>
	            			<td>Old Password</td>
                            <td style="height: 30px; width:150px;">
                            	<div class="input-control password" style="height: 30px;">
							   		<input type="password" name="user_password" id="user_password" 
							   			style="width:150px; height: 30px;"
							   			title="This field must contains min 4 characters."
							   			data-validate-func="minlength" data-validate-arg="4"
					            		data-validate-hint="This field must contains min 4 characters.">
				            	</div>
	            			</td>
                        </tr>
                        <tr>
	            			<td>New Password</td>
                            <td style="height: 30px; width:150px;">
                            	<div class="input-control password" style="height: 30px;">
							   		<input type="password" name="new_password" id="new_password" 
							   			style="width:150px; height: 30px;"
							   			title="This field must contains min 4 characters."
							   			data-validate-func="minlength" data-validate-arg="4"
					            		data-validate-hint="This field must contains min 4 characters.">
				            	</div>
	            			</td>
                        </tr>
                        <tr>
                            <td>Confirm Password</td>
                            <td style="height: 30px; width:150px;">
                            	<div class="input-control password" style="height: 30px;">
							   		<input type="password" name="confirm_password" id="confirm_password" 
							   			style="width:150px; height: 30px;"
							   			title="This field must contains min 4 characters."
							   			data-validate-func="minlength" data-validate-arg="4"
					            		data-validate-hint="This field must contains min 4 characters.">
				            	</div>
	            			</td>
	            		</tr>
                        </tbody>
                    </table>
                    <div style="padding-left: 25%;">
                    	<button class="button primary" > Submit </button>
                    </div>
                    </form>
                    </div>
                    <br><br>
                </div>
            </div>
        </div>
    </div>
<%
	}
	else
	{
		String statusMessage = "Password updated successfully.";
		String userName = (String) session.getAttribute("username");
		String userPassword = request.getParameter("user_password");
		String newPassword = request.getParameter("new_password");
		String confirmPassword = request.getParameter("confirm_password");
		
		boolean status = UserDao.changePassword(userName, userPassword, newPassword);
		if(status == false)
		{
			statusMessage = "Error updating password; ";
			statusMessage += "Please contact System Admin or try again later.";
		}
%>
	    <div class="page-content">
	        <div class="flex-grid no-responsive-future" style="height: 100%;">
	            <div class="row" style="height: 100%">
	                <div class="cell auto-size padding20 bg-white" id="cell-content">
	                    <h3 class="text-light"> <%=statusMessage %> </h3>
	                    <hr class="thin bg-grayLighter">
	                </div>
	            </div>
	        </div>
	    </div>
<%
	}
%>
    </div>
</body>
</html>
