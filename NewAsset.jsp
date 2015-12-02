<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, org.inventory.dao.*, org.inventory.jdo.*, org.inventory.util.*" %>

<html>
<jsp:include page="Header.jsp">
   	<jsp:param value="test" name="test"/>
</jsp:include>
<body class="bg-steel">
	<div style="width:100%; margin:0 auto;">
    <jsp:include page="Menus.jsp">
    	<jsp:param value="test" name="test"/>
	</jsp:include>
    <div class="page-content">
        <div class="flex-grid no-responsive-future" style="height: 100%;">
            <div class="row">
                <div class="cell auto-size padding20 bg-white" id="cell-content">
<%
	String action = request.getParameter("action");
	System.out.println("action = "+action);
	if(action == null)
	{
%>
        <h3 class="text-light"> New Asset </h3>
        <hr class="thin bg-grayLighter">
        <form method="post" action="./NewAsset.jsp" data-role="validator">
        <input type="hidden" name="action" id="action" value="save" />
        <table class="dataTable border bordered" data-auto-width="false" style="width:80%;">
            <tbody>
            <tr>
                <td>Serial No</td>
                <td>
                	<div class="input-control text" style="height: 30px;">
				   		<input type="text" name="serial_no" id="serial_no" 
				   			style="width:150px; height: 30px;" 
			   				title="This field must contains min 4 characters."
			   				data-validate-func="minlength" data-validate-arg="4"
			          		data-validate-hint="This field must contains min 4 characters.">
       				</div>
 				</td>
 				<td>Asset No</td>
                <td>
                	<div class="input-control text" style="height: 30px;">
				   		<input type="text" name="asset_no" id="asset_no" 
				   			style="width:150px; height: 30px;"  
			   				title="This field must contains min 4 characters."
			   				data-validate-func="minlength" data-validate-arg="4"
			          		data-validate-hint="This field must contains min 4 characters.">
       				</div>
  				</td>
  		</tr>
  		<tr>
  			<td>Asset Name</td>
                <td>
                	<div class="input-control text" style="height: 30px;">
				   		<input type="text" name="asset_name" id="asset_name" 
				   			style="width:150px; height: 30px;"  
			   				title="This field must contains min 4 characters."
			   				data-validate-func="minlength" data-validate-arg="4"
			          		data-validate-hint="This field must contains min 4 characters.">
    				</div>
 				</td>
 				<td>CP Model No</td>
                <td style="height: 30px; width:150px;">
                	<div class="input-control text" style="height: 30px;">
				   		<input type="text" name="model_no" id="model_no"  
				   			style="width:150px; height: 30px;" value=""
				   			title="This field must contains min 4 characters."
			   				data-validate-func="minlength" data-validate-arg="4"
			          		data-validate-hint="This field must contains min 4 characters.">
       				</div>
 				</td>
 				
            </tr>
            <tr>
                <td>Owner Tag</td>
                <td style="height: 30px; width:150px;">
                	<div class="input-control text" style="height: 30px;">
				   		<input type="text" name="own_tag" id="own_tag"  
				   			style="width:150px; height: 30px;" value=""
				   			title="This field must contains min 4 characters."
			   				data-validate-func="minlength" data-validate-arg="4"
			          		data-validate-hint="This field must contains min 4 characters.">
       				</div>
 				</td>
 				<td>Total Cost</td>
                <td style="height: 30px; width:150px;">
                	<div class="input-control text" style="height: 30px;">
				   		<input type="text" name="total_cost" id="total_cost"  
				   			style="width:150px; height: 30px;" value=""
				   			title="This field must contains min 2 characters."
			   				data-validate-func="minlength" data-validate-arg="2"
			          		data-validate-hint="This field must contains min 2 characters.">
    				</div>
 				</td>
            </tr>
            
            <tr>
                <td>Purchase Accounts</td>
                <td>
                	<div class="input-control text">
				   		<input type="text" name="purchase_accounts" id="purchase_accounts" 
				   			style="width:150px; height: 30px;"
				   			title="This field must contains min 4 characters."
			   				data-validate-func="minlength" data-validate-arg="4"
			          		data-validate-hint="This field must contains min 4 characters.">
    				</div>
 				</td>
 				<td>Description </td>
                <td>
			   		<textarea rows="5" cols="30" id="description" name="description"></textarea>
 				</td>
            </tr>
            </tbody>
        </table>
        <div style="padding-left: 35%;">
        	<button class="button primary" > Submit </button>
        </div>
        </form>
<%
	}
	else
	{
		//System.out.println("action = "+action);
		String serial_no = request.getParameter("serial_no");
		String asset_no = request.getParameter("asset_no");
		String asset_name = request.getParameter("asset_name");
		String model_no = request.getParameter("model_no");
		String own_tag = request.getParameter("own_tag");
		String total_cost = request.getParameter("total_cost");
		String purchase_accounts = request.getParameter("purchase_accounts");
		String description = request.getParameter("description");
		
		boolean recordStatus = AssetsDao.saveAsset(serial_no, asset_no, asset_name, 
			model_no, own_tag, total_cost, purchase_accounts, description);
		String message = "";
		if(recordStatus)
		{
			message = "Asset Created successfully.";
		}
		else
		{
			message = "Error:: Creating new Asset, Please contact System Admin or try again later.";
		}
%>
		<h3 class="text-light"> <%=message %> </h3>
        <hr class="thin bg-grayLighter">
<%
	}
%>
                </div>
            </div>
        </div>
    </div>
    </div>
</body>
</html>
