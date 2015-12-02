<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*, org.inventory.dao.*, org.inventory.jdo.*, org.inventory.util.*"%>

<html>
<jsp:include page="Header.jsp">
	<jsp:param value="test" name="test" />
</jsp:include>
<script type="text/javascript">
	var freq = 15 * 1000;
	//var timeout = setTimeout(refreshDashboard, freq);
	//setInterval(refreshDashboard(), freq);

	$(document).ready(function() {
		changeAsset();
	});

	function changeAsset() {
		document.getElementById("updateAssetBtn").disabled = true;
		document.getElementById("updateAssetBtn").className = "button disable";
		var serNo = document.getElementById("serial_no").value;
		//alert(serNo);
		if(serNo.trim().length > 0)
		{
			$
					.ajax({
						url : './GetAssetDetailsJSON.jsp?serialno=' + serNo,
						type : 'GET',
						async : false,
						contentType : "application/json",
						dataType : "json",
						success : function(json) {
							//alert(json);
							document.getElementById("asset_no").value = json["assetNumber"];
							document.getElementById("asset_name").value = json["assetName"];
							document.getElementById("model_no").value = json["cpModleNo"];
							document.getElementById("own_tag").value = json["ownTag"];
							document.getElementById("total_cost").value = json["totalCost"];
							//alert(json["purchaseAccounts"]);
							document.getElementById("purchase_accounts").value = json["purchaseAccounts"];
							document.getElementById("description").value = json["description"];
						},
						beforeSend : function() {
							//showDialog('preloader');
						},
						complete : function() {
	
						},
						error : function(jqXHR, textStatus, errorThrown) {
							console.log('error');
							showMessage('alert', 'Info',
									'ERROR :: Loading Data...!!!');
							console.log(jqXHR, textStatus, errorThrown);
						}
					});
			document.getElementById("updateAssetBtn").disabled = false;
			document.getElementById("updateAssetBtn").className = "button primary";
		}
		//document.getElementById("updateAssetBtn").disabled = false;
	}
</script>

<body class="bg-steel">
	<div style="width: 100%; margin: 0 auto;">
		<jsp:include page="Menus.jsp">
			<jsp:param value="test" name="test" />
		</jsp:include>
		<div class="page-content">
			<div class="flex-grid no-responsive-future">
				<div class="row" style="height: 115%;">
					<div class="cell auto-size padding20 bg-white" id="cell-content">
						<%
							String action = request.getParameter("action");
							//System.out.println("action = " + action);
							if (action == null)
							{
								List<Asset> assets = AssetsDao.getAssets("unassigned", null,
										null);
								StringBuilder sb = new StringBuilder();
								for (Asset aReq : assets)
								{
									sb.append("<option>" + aReq.getSerialNo() + "</option>");
								}
						%>
						<h3 class="text-light">Update Asset</h3>
						<hr class="thin bg-grayLighter">
						<form method="post" action="./UpdateAsset.jsp"
							data-role="validator">
							<input type="hidden" name="action" id="action" value="save" />
							<table class="dataTable border bordered" data-auto-width="false"
								style="width: 80%;">
								<tbody>
									<tr>
										<td width="25%">Serial No</td>
										<td width="25%">
											<div class="input-control text" style="height: 30px;">
												<select name="serial_no" id="serial_no">
													<%=sb.toString()%>
												</select>
											</div>
										</td>
										<td width="25%">Asset No</td>
										<td width="25%">
											<div class="input-control text" style="height: 30px;">
												<input type="text" name="asset_no" id="asset_no"
													style="width: 200px; height: 30px;"
													title="This field must contains min 4 characters."
													data-validate-func="minlength" data-validate-arg="4"
													data-validate-hint="This field must contains min 4 characters.">
											</div>
										</td>
									</tr>
									<tr>
										<td width="25%">Asset Name</td>
										<td width="25%">
											<div class="input-control text" style="height: 30px;">
												<input type="text" name="asset_name" id="asset_name"
													style="width: 200px; height: 30px;"
													title="This field must contains min 4 characters."
													data-validate-func="minlength" data-validate-arg="4"
													data-validate-hint="This field must contains min 4 characters.">
											</div>
										</td>
										<td>CP Model No</td>
										<td style="height: 30px; width: 150px;">
											<div class="input-control text" style="height: 30px;">
												<input type="text" name="model_no" id="model_no"
													style="width: 200px; height: 30px;" value=""
													title="This field must contains min 4 characters."
													data-validate-func="minlength" data-validate-arg="4"
													data-validate-hint="This field must contains min 4 characters.">
											</div>
										</td>
									</tr>
									<tr>

										<td>Owner Tag</td>
										<td style="height: 30px; width: 150px;">
											<div class="input-control text" style="height: 30px;">
												<input type="text" name="own_tag" id="own_tag"
													style="width: 200px; height: 30px;" value=""
													title="This field must contains min 4 characters."
													data-validate-func="minlength" data-validate-arg="4"
													data-validate-hint="This field must contains min 4 characters.">
											</div>
										</td>
										<td>Total Cost</td>
										<td style="height: 30px; width: 150px;">
											<div class="input-control text" style="height: 30px;">
												<input type="text" name="total_cost" id="total_cost"
													style="width: 200px; height: 30px;" value=""
													title="This field must contains min 2 characters."
													data-validate-func="minlength" data-validate-arg="2"
													data-validate-hint="This field must contains min 2 characters.">
											</div>
										</td>
									</tr>
									<tr>
										<td>Purchase Accounts</td>
										<td>
											<div class="input-control text" style="height: 30px;">
												<input type="text" name="purchase_accounts"
													id="purchase_accounts" style="width: 200px; height: 30px;"
													title="This field must contains min 4 characters."
													data-validate-func="minlength" data-validate-arg="4"
													data-validate-hint="This field must contains min 4 characters.">
											</div>
										</td>
										<td>Disable Asset</td>
										<td><label class="input-control checkbox"> <input
												type="checkbox" id="disable" name="disable"> <span class="check"></span>
										</label></td>
									</tr>
									<tr>
										<td>Description</td>
										<td>
											<textarea rows="5" cols="30" id="description" name="description"></textarea>
										</td>
										<td></td>
										<td></td>
									</tr>
								</tbody>
							</table>
							<div style="padding-left: 35%;">
								<input type="submit" class="button primary" id="updateAssetBtn"
									name="updateAssetBtn" value="Submit" />
							</div>
						</form>
						<%
							}
							else
							{
								System.out.println("Update Asset :: Action = " + action);
								String serial_no = request.getParameter("serial_no");
								String asset_no = request.getParameter("asset_no");
								String asset_name = request.getParameter("asset_name");
								String model_no = request.getParameter("model_no");
								String own_tag = request.getParameter("own_tag");
								String total_cost = request.getParameter("total_cost");
								String purchase_accounts = request
										.getParameter("purchase_accounts");
								String disable = request.getParameter("disable");
								System.out.println("disable = "+((disable == null)?"true":"false"));
								String description = request.getParameter("description");
								
								String message = "";
								
								boolean recordStatus = AssetsDao.updateAsset(serial_no, asset_no,
										asset_name, model_no, own_tag, total_cost,
										purchase_accounts, description, disable);
								
								if (recordStatus)
								{
									message = "Asset Updated successfully.";
								}
								else
								{
									message = "Error:: Updating Asset, Please contact System Admin or try again later.";
								}
						%>
						<h3 class="text-light">
							<%=message%>
						</h3>
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
