<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*, org.inventory.dao.*, org.inventory.jdo.*, org.inventory.util.*"%>

<html>
<jsp:include page="Header.jsp">
	<jsp:param value="test" name="test" />
</jsp:include>

<script type="text/javascript">
	var assMap;
	$(document)
			.ready(
					function() {
						//alert("ready() called.");
<%List<Asset> astList = AssetsDao.getAssets("unassigned", null, null);
	StringBuilder sbJson = new StringBuilder();
	sbJson.append("{");
	StringBuilder sb = new StringBuilder();
	for(Asset ast : astList)
	{
		sb.append("<option>"+ast.getAssetName()+"</option>");
		sbJson.append("\""+ast.getAssetName()+"_assetno\" : \""+ast.getAssetNumber()+"\",");
		sbJson.append("\""+ast.getAssetName()+"_serialno\" : \""+ast.getSerialNo()+"\",");
		sbJson.append("\""+ast.getAssetName()+"_modelno\" : \""+ast.getCpModleNo()+"\",");
		sbJson.append("\""+ast.getAssetName()+"_owner_tag\" : \""+ast.getOwnTag()+"\",");
		sbJson.append("\""+ast.getAssetName()+"_totalcost\" : \""+ast.getTotalCost()+"\",");
		sbJson.append("\""+ast.getAssetName()+"_purchase_accounts\" : \""+ast.getPurchaseAccounts()+"\",");
		
	}
	String json = sbJson.toString().substring(0, sbJson.length()-1);
	json += "}";
	System.out.println("json = "+json);%>
	assMap = jQuery.parseJSON( '<%=json%>');
						assetChanged();
						//alert(assMap);
					});

	function assetChanged() {
		//alert("assetChanged()");
		var request_for = document.getElementById("request_for").value;
		//alert(request_for+" -- "+assMap[request_for]);
		document.getElementById("requested_serialno").value = assMap[request_for
				+ "_serialno"];
		document.getElementById("asset_no").innerHTML = assMap[request_for
				+ "_assetno"];
		document.getElementById("serial_no").innerHTML = assMap[request_for
				+ "_serialno"];
		document.getElementById("model_no").innerHTML = assMap[request_for
				+ "_modelno"];
		document.getElementById("owner_tag").innerHTML = assMap[request_for
				+ "_owner_tag"];
		document.getElementById("total_cost").innerHTML = assMap[request_for
				+ "_totalcost"];
		document.getElementById("purchase_accounts").innerHTML = assMap[request_for
				+ "_purchase_accounts"];
		//alert(document.getElementById("requested_serialno").value);
	}

	function tab_click(tab) {
		console.log(tab);
		return true;
	}

	function tab_change(tab) {
		console.log(tab);
	}
</script>

<body class="bg-steel">
	<div>
		<jsp:include page="Menus.jsp">
			<jsp:param value="test" name="test" />
		</jsp:include>
		<div class="page-content">
			<div class="flex-grid no-responsive-future">

				<div class="tabcontrol2" data-role="tabControl"
					data-on-tab-click="tab_click" data-on-tab-change="tab_change">
					<ul class="tabs">
						<li><a href="#frame1">New Request</a></li>
						<li><a href="#frame2">Submitted Requests</a></li>
					</ul>
					<div class="frames">
						<div class="frame" id="frame1">

							<%
								String action = request.getParameter("action");
								System.out.println("action = " + action);
								if (action == null)
								{
							%>
							<div class="row" style="height: 82%">
								<!-- style="height: 100%" -->
								<div class="cell auto-size padding20 bg-white" id="cell-content">
									<h3 class="text-light">New Asset Request</h3>
									<hr class="thin bg-grayLighter">
									<form method="post" action="./NewAssetRequest.jsp"
										data-role="validator">
										<input type="hidden" name="action" id="action" value="save" />
										<input type="hidden" name="requested_serialno"
											id="requested_serialno" value="" />
										<table class="dataTable border bordered"
											data-auto-width="false" style="width: 80%;">
											<tbody>
												<tr>
													<td width="15%">Request For</td>
													<td width="35%">
														<div class="input-control text" style="height: 30px;">
															<select id="request_for" name="request_for"
																onChange="assetChanged();">
																<%=sb.toString()%>
															</select>
														</div>
													</td>
													<td width="15%">Asset No</td>
													<td>
														<div id="asset_no"></div>
													</td>
													
												</tr>
												<tr>
													<td width="15%">Serial No</td>
													<td>
														<div id="serial_no"></div>
													</td>
													<td width="15%">Model No</td>
													<td>
														<div id="model_no"></div>
													</td>
													
												</tr>
												<tr>
													<td>Owner Tag</td>
													<td>
														<div id="owner_tag"></div>
													</td>
													<td>Total Cost</td>
													<td>
														<div id="total_cost"></div>
													</td>
												</tr>
												<tr>
													<td>Purchase Accounts</td>
													<td>
														<div id="purchase_accounts"></div>
													</td>
													<td>Description</td>
													<td>
														<div id="description"></div>
													</td>
												</tr>
											</tbody>
										</table>
										<div style="padding-left: 35%;">
											<button class="button primary">Submit</button>
										</div>
									</form>
								</div>
							</div>
							<%
								}
								else
								{
							%>
							<div class="row">
								<!-- style="height: 100%" -->
								<div class="cell auto-size padding20 bg-white" id="cell-content">
									<h3 class="text-light">
										<%
											//System.out.println("action = "+action);
												String request_for = request.getParameter("requested_serialno");
												String userName = (String) session.getAttribute("username");
												System.out.println("request_for = " + request_for
														+ " -- userName = " + userName);

												Asset ast = AssetsDao.getAssetBySerialNo(request_for);

												//record status - 0 when user selects an asset.

												boolean status = AssetRequestDao.saveAssetRequest(request_for,
														userName, 0, 0);
												if (status)
												{
													//Send an email to user for confirmation
													Email.sendEmail(
															userName,
															"Asset Request Confirmation.",
															"You are requested for Asset <b>"
																	+ ast.getAssetName()
																	+ "</b><br><br> Please confirm "
																	+ "<a href=\"http://localhost:8080/Inven/\" target=\"_blank\">Yes</a>"
																	//+ "<input type=\"button\" value=\"Yes\" onClick=\" window.open('http://localhost:7080/Inventory','_blank','resizable=yes') \" >"
																	+ " &nbsp; &nbsp; "
																	+ "<a href=\"http://localhost:8080/Inven/\" target=\"_blank\">No</a>"
													//+ "<input type=\"button\" value=\"No\" onClick=\" window.open('http://localhost:7080/Inventory','_blank','resizable=yes') \" >"
													);
													/*
													Email.sendEmail("admin", "Asset Request Submitted.", 
															"Asset Request submitted for "+request_for+" by user "+userName);
													 */
													out.println("Request submitted successfully.");
												}
												else
												{
													out.println("Error submitting Request;");
													out.println("Please contact System Admin or try again later.");
												}
										%>
									</h3>
									<hr class="thin bg-grayLighter">
								</div>
							</div>
							<%
								}
							%>
						</div>
						<div class="frame" id="frame2">
							<div style="width: 80%;">
								<table class="dataTable border bordered" data-role="datatable"
									data-auto-width="false" style="width: 100%;">
									<thead>
										<tr>
											<th style="width: 25%;">Serial Number</th>
											<th style="width: 25%;">Requested For</th>
											<th>Status</th>
										</tr>
									</thead>
									<tbody>
										<%
											String userName = (String) session.getAttribute("username");
											List<AssetRequest> assetReqs = AssetRequestDao
													.getAssetRequests(userName);

											for (AssetRequest aReq : assetReqs)
											{
												Asset ast = AssetsDao.getAssetBySerialNo(aReq.getRequestFor());
												if (aReq.getStatus() == -1)
												{
													out.println("<tr style=\"background-color: red;\">");
													out.println("<td>"+ aReq.getRequestFor() +"</td>");
													out.println("<td>"+ ast.getAssetName() +"</td>");
													out.println("<td>Assign Asset Request Rejected.</td></tr>");
												}
												else if (aReq.getStatus() == 0)
												{
													out.println("<tr style=\"background-color: orange;\">");
													out.println("<td>"+ aReq.getRequestFor() +"</td>");
													out.println("<td>"+ ast.getAssetName() +"</td>");
													out.println("<td>Assign Asset Request Submitted.</td></tr>");
												}
												else if (aReq.getStatus() == 1)
												{
													out.println("<tr style=\"background-color: yellow;\">");
													out.println("<td>"+ aReq.getRequestFor() +"</td>");
													out.println("<td>"+ ast.getAssetName() +"</td>");
													out.println("<td>Assign Asset Request Confirmed.</td></tr>");
												}
												else if (aReq.getStatus() == 2)
												{
													out.println("<tr style=\"background-color: lightblue;\">");
													out.println("<td>"+ aReq.getRequestFor() +"</td>");
													out.println("<td>"+ ast.getAssetName() +"</td>");
													out.println("<td>Assign Asset Request Approved.</td></tr>");
												}
												else if (aReq.getStatus() == 3)
												{
													out.println("<tr style=\"background-color: lightgreen;\">");
													out.println("<td>"+ aReq.getRequestFor() +"</td>");
													out.println("<td>"+ ast.getAssetName() +"</td>");
													out.println("<td>Assign Asset Request Processed.</td></tr>");
												}
												else
												{
													out.println("<tr style=\"background-color: lightgreen;\">");
													out.println("<td>"+ aReq.getRequestFor() +"</td>");
													out.println("<td>"+ ast.getAssetName() +"</td>");
													out.println("<td>Return Asset Request Processed.</td></tr>");
												}
											}
										%>
									</tbody>
								</table>
								<br>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
