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
	
	<%
		String userName = (String)session.getAttribute("username");
		List<History> hisList = HistoryDao.getHistory(userName);
	%>

    <div class="page-content">
        <div class="flex-grid no-responsive-future">
            <div class="row" >
                <div class="cell auto-size padding20 bg-white" id="cell-content">
                    <h3 class="text-light"> History </h3>
                    <hr class="thin bg-grayLighter">
                    <table class="dataTable border bordered" data-role="datatable" data-auto-width="true">
                        <thead>
                        <tr>
                            <td>Asset Number</td>
                            <td>Asset Name</td>
                            <td>Model No</td>
                            <td>Serial No</td>
                            <td>Owner Tag</td>
                            <th>Total Cost</th>
                            <td>Purchase Accounts</td>
                            <td>Assigned Date</td>
                            <td>Returned Date</td>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                        	for(History hist : hisList)
                        	{
                        		out.println("<tr>");
                        		out.println("<td>"+hist.getAssetNumber()+"</td>");
                        		out.println("<td>"+hist.getAssetName()+"</td>");
                        		out.println("<td>"+hist.getModelNo()+"</td>");
                        		out.println("<td>"+hist.getSerialNo()+"</td>");
                        		out.println("<td>"+hist.getOwnerTag()+"</td>");
                        		out.println("<td>"+hist.getTotalCost()+"</td>");
                        		out.println("<td>"+hist.getPurchAccounts()+"</td>");
                        		out.println("<td>"+hist.getAssignedDate()+"</td>");
                        		out.println("<td>"+hist.getReturnedDate()+"</td>");
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
