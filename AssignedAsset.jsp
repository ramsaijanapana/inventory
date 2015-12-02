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

<%
	String action = request.getParameter("action");
	System.out.println("action = "+action);
	if(action == null)
	{
		List<Asset> assets = AssetsDao.getAssets("faculty", null, null);
		StringBuilder faculty = new StringBuilder();
		StringBuilder models = new StringBuilder();
		List<String> faulty = new ArrayList<String>();
		List<String> modelList = new ArrayList<String>();
		for(Asset aReq : assets)
		{
			if(!(faulty.contains(aReq.getUserName())))
			{
				faculty.append("<option>"+aReq.getUserName()+"</option>");
				faulty.add(aReq.getUserName());
			}
			
			if(!(modelList.contains(aReq.getSerialNo())))
			{
				models.append("<option>"+aReq.getSerialNo()+"</option>");
				modelList.add(aReq.getSerialNo());
			}
		}
%>
		<div class="row" style="height: 100%"> <!-- style="height: 100%" -->
		    <div class="cell auto-size padding20 bg-white" id="cell-content">
		        <h3 class="text-light"> Assigned Assets Report </h3>
		        <hr class="thin bg-grayLighter">
		        <form method="post" action="./AssignedAssetsReport" data-role="validator">
		        <input type="hidden" name="action" id="action" value="save" />
		        <table class="dataTable border bordered" data-auto-width="false" style="width:60%;">
		            <tbody>
		            <tr>
		                <td><input type="radio" name="reportby" value="faculty" checked> Faculty Id </td>
		                <td>
		                	<div class="input-control text" style="height: 30px;">
								<select id="faculty_id" name="faculty_id">
									<%=faculty.toString() %>
								</select>
		    				</div>
		 				</td>
			 		</tr>
			 		<tr>
		                <td><input type="radio" name="reportby" value="model"> Serial Number </td>
		                <td>
		                	<div class="input-control text" style="height: 30px;">
								<select id="model_number" name="model_number">
									<%=models.toString() %>
								</select>
		    				</div>
		 				</td>
			 		</tr>
		            </tbody>
		         </table>
		         <div style="padding-left: 35%;">
		        	<button class="button primary" > Submit </button>
		        </div>
		        </form>
		    </div>
		</div>
<%
	}
	else
	{

	}
%>
        </div>
    </div>
    </div>
</body>
</html>
