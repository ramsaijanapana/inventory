<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, org.inventory.dao.*, org.inventory.jdo.*" %>

<html>
<jsp:include page="Header.jsp">
   	<jsp:param value="test" name="test"/>
</jsp:include>
<body class="bg-steel">
	<div style="margin:0 auto;">
    <jsp:include page="Menus.jsp">
    	<jsp:param value="test" name="test"/>
	</jsp:include>

    <div class="page-content">
        <div class="flex-grid no-responsive-future" style="height: 100%;">
            <div class="row" style="height: 100%">
                <div class="cell auto-size padding20 bg-white" id="cell-content">
<%
	String action = request.getParameter("action");
	if(action == null)
	{
%>
		<h1 class="text-light"> Track Assets By Id </h1>
		<hr class="thin bg-grayLighter">
		<br>
		<form method="post" action="./TrackAssetBySerialId.jsp" data-role="validator">
		<input type="hidden" name="action" id="action" value="TrackAsset" />
		<table style="width:70%;">
			<tr>
				<td width="25%">Select Serial No</td>
				<td width="50%">
					<select style="width:250px;" id="asset_id" name="asset_id">
<%
					List<String> fList = InventoryDao.getAssetSerialNoList();
					for(String faculty : fList)
					{
						out.println("<option>"+faculty+"</option>");
					}
%>
					</select>
				</td>
				<td><button class="button primary" > GO </button></td>
			<tr>
		</table>
		</form>
<%
	}
	else
	{
		String assetId = request.getParameter("asset_id");
		System.out.println("assetId = "+assetId);
		Inventory inv = InventoryDao.getInventoryByAssetSerialNo(assetId);
%>
		<h1 class="text-light"> Track Assets By Id </h1>
		<hr class="thin bg-grayLighter">
		
		<table class="dataTable border bordered" data-role="datatable" data-auto-width="false">
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
				out.println("<tr>");
				out.println("<td>"+inv.getAssignedTo()+"</td>");
				out.println("<td>"+inv.getProductName()+"</td>");
				out.println("<td>"+inv.getAssetNumber()+"</td>");
				out.println("<td>"+inv.getSerialNo()+"</td>");
				out.println("<td>"+inv.getCpModelNo()+"</td>");
				out.println("<td>"+inv.getAssignedDate()+"</td>");
				out.println("</tr>");
%>
		    </tbody>
		</table>

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
