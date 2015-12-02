<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, org.inventory.dao.*, org.inventory.jdo.*" %>
<html>
<jsp:include page="Header.jsp">
   	<jsp:param value="test" name="test"/>
</jsp:include>
<body class="bg-steel">
	<div>
    <jsp:include page="Menus.jsp">
    	<jsp:param value="test" name="test"/>
	</jsp:include>

    <div class="page-content">
        <div class="flex-grid no-responsive-future">
            <div class="row" style="height: 100%">
                <div class="cell auto-size padding20 bg-white" id="cell-content">
                
 <%
	String action = request.getParameter("action");
	String facultyName = (String)session.getAttribute("username");
	System.out.println("facultyName = "+facultyName);
	List<Inventory> invList = InventoryDao.getInventoryListByFaculty(facultyName);
%>
<table class="dataTable border bordered" data-role="datatable" data-auto-width="false">
    <thead>
    <tr>
    	<td>Product Name</td>
        <td>Asset No</td>
        <td>CP Model No</td>
        <td>Serial No</td>
        <td>Acq Date</td>
        <td>Action</td>
    </tr>
    </thead>
    <tbody>
<%
		for(Inventory inv : invList)
		{
			out.println("<tr>");
			out.println("<td>"+((inv.getProductName() != null)?inv.getProductName():"")+"</td>");
			out.println("<td>"+((inv.getAssetNumber() != null)?inv.getAssetNumber():"")+"</td>");
			out.println("<td>"+((inv.getCpModelNo() != null)?inv.getCpModelNo():"")+"</td>");
			out.println("<td>"+((inv.getSerialNo() != null)?inv.getSerialNo():"")+"</td>");
			out.println("<td>"+((inv.getAcquiredDate() != null)?inv.getAcquiredDate():"")+"</td>");
			out.println("<td><a href=\"./ReturnAsset.jsp?invid="+inv.getId()+"\">Return Asset</a></td>");
			out.println("</tr>");
		}
%>
     </tbody>
</table>
                </div>
            </div>
        </div>
    </div>
    </div>
</body>
</html>
