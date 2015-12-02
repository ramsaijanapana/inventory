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
            <div class="row" >
                <div class="cell auto-size padding20 bg-white" id="cell-content">
                    <h3 class="text-light"> Register </h3>
                    <hr class="thin bg-grayLighter">
                    <div style="padding-left: 200px;">
                    <form method="post" action="./Register.jsp" data-role="validator">
                    <input type="hidden" name="action" id="action" value="save" />
                    <table style="width:60%;">
                        <tbody>
                        <tr>
                            <td>User Name</td>
                            <td>
                            	<div class="input-control text" style="height: 30px;">
							   		<input type="text" name="user_name" id="user_name" 
							   			style="width:150px; height: 30px;"
							   			title="This field must contains min 4 characters."
							   			data-validate-func="minlength" data-validate-arg="4"
					            		data-validate-hint="This field must contains min 4 characters.">
				            	</div>
	            			</td>
	            		</tr>
	            		<tr>
	            			<td>Password</td>
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
	            		<tr>
	            			<td>User Type</td>
                            <td style="height: 30px; width:150px;">
                            	<div class="input-control text" style="height: 20px; width: 150px;">
                            		<select name="user_type" id="user_type">
                            			<option>Faculty</option>
                            			<option>HOD</option>
                            			<option>Admin</option>
                            		</select>
				            	</div>
	            			</td>
                        </tr>
                        <tr>
                            <td>First Name</td>
                            <td>
                            	<div class="input-control text" style="height: 30px;">
							   		<input type="text" name="first_name" id="first_name" 
							   			style="width:150px; height: 30px;"
							   			title="This field must contains min 4 characters."
							   			data-validate-func="minlength" data-validate-arg="4"
					            		data-validate-hint="This field must contains min 4 characters.">
				            	</div>
	            			</td>
	            		</tr>
	            		<tr>
	            			<td>Middle Name</td>
                            <td style="height: 30px; width:150px;">
                            	<div class="input-control text" style="height: 30px;">
							   		<input type="text" name="middle_name" id="middle_name" 
							   			style="width:150px; height: 30px;"
							   			>
							   			<!-- 
							   			title="This field must contains min 4 characters."
							   			data-validate-func="minlength" data-validate-arg="4"
					            		data-validate-hint="This field must contains min 4 characters.">
					            		-->
				            	</div>
	            			</td>
                        </tr>
                        <tr>
                            <td>Last Name</td>
                            <td>
                            	<div class="input-control text" style="height: 30px;">
							   		<input type="text" name="last_name" id="last_name" 
							   			style="width:150px; height: 30px;"
							   			title="This field must contains min 4 characters."
							   			data-validate-func="minlength" data-validate-arg="4"
					            		data-validate-hint="This field must contains min 4 characters.">
				            	</div>
	            			</td>
	            		</tr>
	            		<tr>
                            <td>EMail Id</td>
                            <td>
                            	<div class="input-control text" style="height: 30px;">
							   		<input type="text" name="email_id" id="email_id" 
							   			style="width:150px; height: 30px;"
							   			title="This field must contains min 8 characters."
							   			data-validate-func="minlength" data-validate-arg="8"
					            		data-validate-hint="This field must contains min 8 characters.">
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
		String statusMessage = "User Registered successfully.";
		String userName = request.getParameter("user_name");
		String userPassword = request.getParameter("user_password");
		String userType = request.getParameter("user_type");
		String firstName = request.getParameter("first_name");
		String middleName = request.getParameter("middle_name");
		String lastName = request.getParameter("last_name");
		String emailId = request.getParameter("email_id");
		
		boolean status = UserDao.saveUser(userName, userPassword, 
			userType, firstName, middleName, lastName, emailId);
		if(status == false)
		{
			statusMessage = "Error creating user; ";
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
