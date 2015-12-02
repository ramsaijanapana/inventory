<html>
<jsp:include page="Header.jsp">
	<jsp:param value="test" name="test" />
</jsp:include>
<script type="text/javascript">
	var freq = 15 * 1000;
	//var timeout = setTimeout(refreshDashboard, freq);
	//setInterval(refreshDashboard(), freq);

	$(document).ready(function() {
		refreshDashboard();
	});
<%
	String userName = (String) session.getAttribute("username");
	String userType = (String) session.getAttribute("usertype");
			if ("ADMIN".equalsIgnoreCase(userType)) {%>
	function refreshDashboard() {
		//alert("refreshDashboard()");
		$
				.ajax({
					url : './NewAssetRequestsJSON.jsp?type=2',
					type : 'GET',
					async : false,
					contentType : "application/json",
					dataType : "json",
					success : function(json) {
						var req = json["requests"];
						if ("0" == req) {
							$("#assetReuestsDiv").html("");
						} else {
							showMessage('warning', 'Info', req
									+ " Asset request(s) pending.");
							$("#assetReuestsDiv")
									.html(
											req
													+ " Asset request(s) pending.."
													+ '&nbsp;&nbsp; <a href="./NewAssetRequests.jsp" >Click here </a> to view records.');
						}
						setTimeout(refreshDashboard, freq);
					},
					beforeSend : function() {
						//showDialog('preloader');
					},
					complete : function() {

					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log('error');
						//alert("ERROR :: Loading Data...!!!");
						showMessage('alert', 'Info',
								'ERROR :: Loading Data...!!!');
						console.log(jqXHR, textStatus, errorThrown);
					}
				});
		//setTimeout(refreshDashboard, freq);
	}
<%} else if ("HOD".equalsIgnoreCase(userType)) {%>
	function refreshDashboard() {
		//alert("refreshDashboard()");
		$
				.ajax({

					url : './NewAssetRequestsJSON.jsp?type=1',
					type : 'GET',
					async : false,
					contentType : "application/json",
					dataType : "json",
					success : function(json) {
						var req = json["requests"];
						if ("0" == req) {
							$("#assetReuestsDiv").html("");
						} else {
							showMessage('warning', 'Info', req
									+ " Asset request(s) pending.");
							$("#assetReuestsDiv")
									.html(
											req
													+ " Asset request(s) pending.."
													+ '&nbsp;&nbsp; <a href="./AssetConfirmation.jsp" >Click here </a> to view records.');
						}
						setTimeout(refreshDashboard, freq);
					},
					beforeSend : function() {
						//showDialog('preloader');
					},
					complete : function() {

					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log('error');
						//alert("ERROR :: Loading Data...!!!");
						showMessage('alert', 'Info',
								'ERROR :: Loading Data...!!!');
						console.log(jqXHR, textStatus, errorThrown);
					}
				});
		//setTimeout(refreshDashboard, freq);
	}
<%} else if ("FACULTY".equalsIgnoreCase(userType)) {%>
	function refreshDashboard() {
		//alert("refreshDashboard()");
		$.ajax({
					url : './NewAssetRequestsJSON.jsp?type=0&username=<%=userName%>',
					type : 'GET',
					async : false,
					contentType : "application/json",
					dataType : "json",
					success : function(json) {
						var req = json["requests"];
						if ("0" == req) {
							$("#assetReuestsDiv").html("");
						} else {
							showMessage(
									'warning',
									'Info',
									req
											+ " Asset request(s) pending for confirmation.");
							$("#assetReuestsDiv")
									.html(
											req
													+ " Asset request(s) pending for confirmation."
													+ '&nbsp;&nbsp; <a href="./AssetConfirmation.jsp" >Click here </a> to view records.');
						}
						setTimeout(refreshDashboard, freq);
					},
					beforeSend : function() {
						//showDialog('preloader');
					},
					complete : function() {

					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log('error');
						//alert("ERROR :: Loading Data...!!!");
						showMessage('alert', 'Info',
								'ERROR :: Loading Data...!!!');
						console.log(jqXHR, textStatus, errorThrown);
					}
				});
	}
<%}%>
	
</script>
<body class="bg-steel" style="overflow: scroll;">
	<div>
		<jsp:include page="Menus.jsp">
			<jsp:param value="test" name="test" />
		</jsp:include>

		<div class="page-content">
			<div class="flex-grid no-responsive-future" style="height: 100%;">
				<div class="row" style="height: 100%">
					<div class="cell auto-size padding20 bg-white" id="cell-content">
						<h3 class="text-light">Inventory</h3>
						<hr class="thin bg-grayLighter">
						<br> <br>
						<div id="assetReuestsDiv" style="background-color: yellow;">
						</div>
						<br> <br> <br> <br> <br>
						<h3>Welcome to Inventory System.</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
