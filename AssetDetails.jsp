<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
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
    <div class="page-content">
        <div class="flex-grid no-responsive-future" style="height: 100%;">

<%
	String action = request.getParameter("action");
	System.out.println("action = "+action);
	if(action == null)
	{
%>
		<div class="row"> <!-- style="height: 100%" -->
	    <div class="cell auto-size padding20 bg-white" id="cell-content">
	        <h3 class="text-light"> Asset Details </h3>
	        <hr class="thin bg-grayLighter">
	        <form action="./AssetDetails.jsp" method="post">
	        	<input type="hidden" name="action" id="action" value="fetch" />
		        <table class="dataTable border bordered" data-auto-width="false" style="width:80%;">
		        	<tr><td>List Assets</td>
		        		<td><select id="assettype" name="assettype">
		        				<option value="faculty">Assigned to Faculty</option>
		        				<option value="lab">Assigned to Labs</option>
		        				<option value="unassigned">Un-Assigned</option>
		        			</select>
		        		</td>
		        	</tr>
		        	<tr><td colspan="2" align="center"><input type="submit" value="Submit" /></td></tr>
		        </table>
	        </form>
	    </div>
	</div>
<%
	}
	else
	{
		String assettype = request.getParameter("assettype");
		System.out.println("assettype = "+assettype);
%>
		<div class="row"> <!-- style="height: 100%" -->
		    <div class="cell auto-size padding20 bg-white" id="cell-content">
		        <h3 class="text-light"> Asset Details </h3>
		        <hr class="thin bg-grayLighter">
	        <table class="dataTable border bordered" data-auto-width="false" style="width:90%;">
	        	<thead>
	        		<tr>
		        		<th style="width: 20%;"> User Name </th>
		        		<th style="width: 20%;"> Asset Name </th>
		        		<th style="width: 15%;"> Asset Number </th>
		        		<th style="width: 15%;"> Serial Number </th>
		        		<th style="width: 15%;"> Model No </th>
		        		<th style="width: 15%;"> Acquired Date </th>
	        		</tr>
	        	</thead>
	            <tbody>
<%
		List<Asset> assets = AssetsDao.getAssets(assettype, null, null);
		
		for(Asset aReq : assets)
		{
			Inventory inv = InventoryDao.getInventoryByAssetSerialNo(aReq.getSerialNo());
%>
            <tr>
            	<td>
                	<%=aReq.getUserName() %>
 				</td>
 				<td style="height: 20px;">
                 	<%=aReq.getAssetName() %>
	  			</td>
	  			<td>
                	<%=aReq.getAssetNumber() %>
 				</td>
 				<td>
                	<%=aReq.getSerialNo() %>
 				</td>
	  			<td style="height: 20px;">
                 	<%=aReq.getCpModleNo() %>
	  			</td>
 				<td>
                	<%=inv.getAssignedDate() %>
 				</td>
             </tr>
<%
		}
%>
				</tbody>
		         </table>
		    </div>
		</div>
<%
	}
%>
        </div>
    </div>
    </div>
</body>
</html>
