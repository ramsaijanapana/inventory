<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, org.inventory.dao.*, org.inventory.jdo.*, org.inventory.util.*" %>

<html>
<jsp:include page="Header.jsp">
   	<jsp:param value="test" name="test"/>
</jsp:include>
<body class="bg-steel">
	<div style="width:85%; margin:0 auto;">
    <jsp:include page="Menus.jsp">
    	<jsp:param value="test" name="test"/>
	</jsp:include>
    <div class="page-content">
        <div class="flex-grid no-responsive-future" style="height: 100%;">
            <div class="row"> <!-- style="height: 100%" -->
                <div class="cell auto-size padding20 bg-white" id="cell-content">
<%
	String action = request.getParameter("action");
	System.out.println("action = "+action);
	if(action == null)
	{
		String assetReqId = request.getParameter("assetreqid");
		AssetRequest assReq = AssetRequestDao.getAssetRequest(assetReqId);
		String requestFor = assReq.getRequestFor();
		System.out.println("requestFor = "+requestFor);
		List<Asset> astList = AssetsDao.getUnAssignedAssets(requestFor);
		StringBuilder sb = new StringBuilder();
		for(Asset ast : astList)
		{
%>
             <h3 class="text-light"> Assign Asset </h3>
             <hr class="thin bg-grayLighter">
             <form method="post" action="./AssignAsset.jsp" data-role="validator">
             <input type="hidden" name="action" id="action" value="save" />
             <input type="hidden" name="assetRequestId" id="assetRequestId" value="<%=assReq.getRequestId() %>" />
             <input type="hidden" name="userName" id="userName" value="<%=assReq.getUserName() %>" />
             <table class="dataTable border bordered" data-auto-width="false" style="width:80%;">
                 <tbody>
                 <tr>
                     <td>Asset Request Id</td>
                     <td><%=assReq.getRequestId() %></td>
      			<td>User Name</td>
                     <td><%=assReq.getUserName() %></td>
                 </tr>
                 <tr>
                     <td>Serial No</td>
                     <td>
                     	<div class="input-control text" style="height: 30px;">

                     		<select name="serial_no" id="serial_no">
                     			<option><%= ast.getSerialNo()%> </option>
                     		</select>
         			</div>
      			</td>
      				<td>Own Tag</td>
                     <td style="height: 30px; width:150px;">
                     	<div class="input-control text" style="height: 30px;">
					   		<input type="text" name="own_tag" id="own_tag" readonly 
					   			style="width:150px; height: 30px;" value="<%=ast.getOwnTag() %>"
					   			>
			         	</div>
      				</td>
                 </tr>
                 <tr>
                     <td>CP Model No</td>
                     <td style="height: 30px; width:150px;">
                     	<div class="input-control text" style="height: 30px;">
					   		<input type="text" name="model_no" id="model_no" readonly 
					   			style="width:150px; height: 30px;" value="<%=ast.getCpModleNo() %>"
					   			>
			         	</div>
      				</td>
      				<td>Total Cost</td>
                     <td style="height: 30px; width:150px;">
                     	<div class="input-control text" style="height: 30px;">
					   		<input type="text" name="total_cost" id="total_cost" readonly 
					   			style="width:150px; height: 30px;" value="<%=ast.getTotalCost() %>"
					   			>
         	</div>
      			</td>
                 </tr>
                 <tr>
      			<td>Asset No</td>
                     <td>
                     	<div class="input-control text" style="height: 30px;">
   		<input type="text" name="asset_no" id="asset_no" 
   			style="width:150px; height: 30px;" readonly >
   			<!-- 
   			title="This field must contains min 4 characters."
   			data-validate-func="minlength" data-validate-arg="4"
          		data-validate-hint="This field must contains min 4 characters.">
          		-->
         	</div>
      			</td>
      			<td>CC Building</td>
                     <td style="height: 30px; width:150px;">
                     	<div class="input-control text" style="height: 30px;">
   		<input type="text" name="cc_building" id="cc_building" 
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
                     <td>Acq Date</td>
                     <td>
                     	<div class="input-control text" style="height: 30px;">
   		<input type="text" name="acq_date" id="acq_date" 
   			style="width:150px; height: 30px;"
   			>
   			<!-- 
   			title="This field must contains min 4 characters."
   			data-validate-func="minlength" data-validate-arg="4"
          		data-validate-hint="This field must contains min 4 characters.">
          		-->
         	</div>
      			</td>
      			<td>Avi</td>
                     <td>
                     	<div class="input-control text" style="height: 30px;">
   		<input type="text" name="avi" id="avi" 
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
                     <td>Purpose</td>
                     <td>
                     	<div class="input-control text" style="height: 30px;">
   		<input type="text" name="purpose" id="purpose" 
   			style="width:150px; height: 30px;"
   			>
   			<!-- 
   			title="This field must contains min 4 characters."
   			data-validate-func="minlength" data-validate-arg="4"
          		data-validate-hint="This field must contains min 4 characters.">
          		-->
         	</div>
      			</td>
      			<td>Src</td>
                     <td>
                     	<div class="input-control text" style="height: 30px;">
   		<input type="text" name="src" id="src" 
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
                     <td>Description</td>
                     <td>
                     	<div class="input-control text" style="height: 30px;">
   		<input type="text" name="description" id="description" 
   			style="width:150px; height: 30px;"
   			>
   			<!-- 
   			title="This field must contains min 4 characters."
   			data-validate-func="minlength" data-validate-arg="4"
          		data-validate-hint="This field must contains min 4 characters.">
          		-->
         	</div>
      			</td>
      			<td>Purchase Accounts</td>
                     <td>
                     	<div class="input-control text" style="height: 30px;">
   		<input type="text" name="purchase_accounts" id="purchase_accounts" 
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
                     <td>Dept-Sub</td>
                     <td>
                     	<div class="input-control text" style="height: 30px;">
   		<input type="text" name="dept_sub" id="dept_sub" 
   			style="width:150px; height: 30px;"
   			>
   			<!-- 
   			title="This field must contains min 4 characters."
   			data-validate-func="minlength" data-validate-arg="4"
          		data-validate-hint="This field must contains min 4 characters.">
          		-->
         	</div>
      			</td>
      			<td>Rest Group</td>
                     <td>
                     	<div class="input-control text" style="height: 30px;">
   		<input type="text" name="rest_group" id="rest_group" 
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
                     <td>Voucher</td>
                     <td>
                     	<div class="input-control text" style="height: 30px;">
   		<input type="text" name="voucher" id="voucher" 
   			style="width:150px; height: 30px;"
   			>
   			<!-- 
   			title="This field must contains min 4 characters."
   			data-validate-func="minlength" data-validate-arg="4"
          		data-validate-hint="This field must contains min 4 characters.">
          		-->
         	</div>
      			</td>
      			<td>Other Location</td>
                     <td>
                     	<div class="input-control text" style="height: 30px;">
   		<input type="text" name="other_location" id="other_location" 
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
                 </tbody>
             </table>
             <div style="padding-left: 35%;">
             	<button class="button primary" > Submit </button>
             </div>
             </form>
<%
		}
	}
	else
	{
		//System.out.println("action = "+action);
		String assetReqId = request.getParameter("assetRequestId");
		String userName = request.getParameter("userName");
		String asset_no = request.getParameter("asset_no");
		String own_tag = request.getParameter("own_tag");
		String model_no = request.getParameter("model_no");
		String serial_no = request.getParameter("serial_no");
		
		Inventory inv = new Inventory();
		inv.setAssetRequestId(Integer.parseInt(assetReqId));
		inv.setRequestedUserName(userName);
		inv.setAssetNumber(asset_no);
		inv.setOwnTag(own_tag);
		inv.setCpModelNo(model_no);
		inv.setSerialNo(serial_no);
		
		boolean recordStatus = InventoryDao.saveInventory(inv);
		String message = "";
		if(recordStatus)
		{
			message = "Asset Assigned successfully.";
			Email.sendEmail(userName, "Asset Request Processed.", 
					"Asset Request processed by admin, Asset with serial no "+serial_no+" allocated.");
			AssetRequestDao.updateAssetRequest(Integer.parseInt(assetReqId), 1);
			AssetsDao.updateAsset(serial_no, "faculty", userName);
		}
		else
		{
			message = "Error:: Assigning Asset, Please contact System Admin or try again later.";
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
