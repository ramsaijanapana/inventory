<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*, org.inventory.dao.*, org.inventory.jdo.*, org.inventory.util.*"%>
<html>
<jsp:include page="Header.jsp">
	<jsp:param value="test" name="test" />
</jsp:include>
<body class="bg-steel">
	<div>
		<jsp:include page="Menus.jsp">
			<jsp:param value="test" name="test" />
		</jsp:include>

		<div class="page-content">
			<div class="flex-grid no-responsive-future">
				<div class="row" style="height: 100%;">
					<div class="cell auto-size padding20 bg-white" id="cell-content">

						<%
							String invid = request.getParameter("invid");
							String facultyName = (String) session.getAttribute("username");
							System.out.println("facultyName = " + facultyName + " -- invid = "
									+ invid);
							Inventory inv = InventoryDao.getInventory(Integer.parseInt(invid));
							Asset ast = AssetsDao.getAsset(inv.getSerialNo());
							System.out.println("assetId = " + inv.getSerialNo()
									+ " -- asset name = " + ast.getAssetName());
							
							boolean status = AssetRequestDao.saveAssetRequest(
									inv.getSerialNo(), facultyName, 2, Integer.parseInt(invid));
							/*
							HistoryDao.saveHistoryRequest(inv.getSerialNo(),
									inv.getRequestedUserName(), "faculty", inv.getAssignedDate());
							*/
							if (status)
							{
								Email.sendEmail("admin", "Asset Return Request Submitted.",
										"Asset Return Request (" + ast.getAssetName()
												+ ") submitted by user " + facultyName);
								out.println("Return Request Submitted successfully.");
							}
							else
							{
								out.println("Error submitting the record please try later or contact system admin.");
							}
						%>


					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
