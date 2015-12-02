<%@ page
	import="java.util.*, org.inventory.dao.*, org.inventory.jdo.*, org.inventory.util.*"%>

<html>
<jsp:include page="Header.jsp">
	<jsp:param value="test" name="test" />
</jsp:include>
<script type="text/javascript">
	
<%
	String userType = (String) session.getAttribute("usertype");
	String requestid = (String) request.getParameter("requestid");
	String action = (String) request.getParameter("action");
	System.out.println("CustodyCordForm.jsp :: userType = " + userType
			+ " -- requestid = " + requestid);
%>
	
</script>
<body class="bg-steel">
	<div>
		<jsp:include page="Menus.jsp">
			<jsp:param value="test" name="test" />
		</jsp:include>

		<div class="page-content">
			<div class="flex-grid no-responsive-future">
				<div class="row">
					<div class="cell auto-size padding20 bg-white" id="cell-content">
						<h3 class="text-light">Review Custody Cord Form</h3>
						<hr class="thin bg-grayLighter">
						<br>
						<%
							if (action == null)
							{
								CustodyCordForm ccf = CustodyCordFormDao
										.getCustodyCordForm(Integer.parseInt(requestid));
						%>
						<form method="post" action="./ReviewCustodyCordForm.jsp">
							<input type="hidden" name="requestid" id="requestid"
								value="<%=requestid%>" /> <input type="hidden" name="action"
								id="action" value="saveForm" />
							<table style="width: 80%; padding-left: 10%;">
								<tr>
									<th colspan="5">
										<h3>PRAIRIE VIEW A &amp; M UNIVERSITY</h3>
									</th>
								</tr>
								<tr>
									<td style="padding-top: 10px;"></td>
								</tr>
								<tr>
									<th colspan="5"><h5>Custody Card</h5></th>
								</tr>
								<tr>
									<td style="padding-top: 20px;"></td>
								</tr>
								<tr>
									<td width="25%">Description :</td>
									<td width="20%"><%=ccf.getDescription()%></td>
									<td width="10%"></td>
									<td width="25%">Date Issued :</td>
									<td width="20%"><%=ccf.getIssuedDate()%></td>
								</tr>
								<tr>
									<td style="padding-top: 20px;"></td>
								</tr>
								<tr>
									<td>Serial # :</td>
									<td><%=ccf.getSerialNo()%></td>
									<td width="10%"></td>
									<td>Inventory # :</td>
									<td><%=ccf.getInventory()%></td>
								</tr>
								<tr>
									<td style="padding-top: 10px;"></td>
								</tr>
								<tr>
									<td>Due Date :</td>
									<td><%=ccf.getDueDate()%></td>
									<td width="10%"></td>
									<td>Restrictions <br>(if any) :
									</td>
									<td><%=ccf.getRestrictions()%></td>
								</tr>
								<tr>
									<td style="padding-top: 30px;"></td>
								</tr>
								<tr>
									<td colspan="5">I understand that I am under financial
										liability for loss or damage to the item listed above, if the
										loss or damage results from negligence, intentional act, or
										failure to exercise reasonable care to safeguard, maintain and
										service it.</td>
								</tr>
								<tr>
									<td style="padding-top: 30px;"></td>
								</tr>
								<tr>
									<td colspan="2">Accountable Property Officer<br>Lender
										Signature
									</td>
									<td width="10%"></td>
									<td colspan="2"><img src="./GetImage?file=<%=ccf.getLendarSignFile() %>" width="300" height="200"/>
									</td>
								</tr>
								<tr>
									<td style="padding-top: 20px;"></td>
								</tr>
								<tr>
									<td colspan="2">Accountable Property Officer<br>Recipient
										Signature
									</td>
									<td width="10%"></td>
									<td colspan="2"><img src="./GetImage?file=<%=ccf.getRecepientSignFile() %>" width="300" height="200"/>
									</td>
								</tr>
								<tr>
									<td style="padding-top: 20px;"></td>
								</tr>
								<tr>
									<td colspan="2">Property Manager Signature</td>
									<td width="10%"></td>
									<td colspan="2"><img src="./GetImage?file=<%=ccf.getManagerSignFile() %>" width="300" height="200"/></td>
								</tr>
								<tr>
									<td style="padding-top: 30px;"></td>
								</tr>
								<tr>
									<td colspan="2"></td>
									<td width="10%"><input type="submit" value="Approve" /></td>
									<td colspan="2"></td>
								</tr>
							</table>
						</form>
						<%
							}
							else
							{
								AssetRequest assReq = AssetRequestDao
										.getAssetRequest(requestid);
								AssetRequestDao.updateAssetRequest(Integer.parseInt(requestid),
										2);
								//send email to user
								Email.sendEmail(assReq.getUserName(),
										"Asset Request Approved.",
										"Product " + assReq.getRequestFor()
												+ " has approved successfully.");

								//send email to admin
								Email.sendEmail("admin", "Asset Request Approved.", "Product "
										+ assReq.getRequestFor() + " has approved for "
										+ assReq.getUserName() + " person.");

								out.println("CustodyCordForm Approved.");
												
								//check if any requests with same serial number availabe.
								//if so reject all of them.
								List<AssetRequest> sameReqs = AssetRequestDao.getAssetRequests(assReq.getRequestFor(), 1);
								for(AssetRequest dupReq : sameReqs)
								{
									System.out.println("Asset Request Id : "+dupReq.getRequestId()+
											" rejected.");
									AssetRequestDao.updateAssetRequest(dupReq.getRequestId(),
											-1);
									
									//send email to user
									Email.sendEmail(dupReq.getUserName(),
											"Asset Request Rejected (Due to un-availability).",
											"Product [" + assReq.getRequestFor()
													+ "] assigned to other.");
								}
								
								/*
								String userName = (String) session.getAttribute("username");
								String asstReqId = request.getParameter("requestid");
								AssetRequest assReq = AssetRequestDao.getAssetRequest(asstReqId);
								CustodyCordFormDao.saveAsset(assReq.getRequestFor(), userName, "", "", "");
								AssetRequestDao.updateAssetRequest(Integer.parseInt(asstReqId), 1);
								out.println("Custody Cord Form submitted.");
								 */
							}
						%>
					</div>
					<br> <br> <br> <br>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
