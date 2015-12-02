<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String username = (String) session.getAttribute("username");
	String usertype = (String) session.getAttribute("usertype");
	long lastaccessed = session.getLastAccessedTime();
	long current = new java.util.Date().getTime();

	long diff = (current - lastaccessed) / 1000 / 60;
	//System.out.println("Accessed "+diff+" mins back.");
%>
<div class="app-bar fixed-top" data-role="appbar">
	<table style="width: 100%; color: white;">
		<tr>
			<td width="50%"><a class="app-bar-element branding" href="./">Inventory</a>
				<span class="app-bar-divider"></span>
				<ul class="app-bar-menu small-dropdown" style="height: 30px;">
					<%
						if (usertype != null && "faculty".equalsIgnoreCase(usertype))
						{
					%>
					<li><a href="" class="dropdown-toggle">Assets</a>
						<ul class="d-menu" data-role="dropdown">
							<li><a href="./NewAssetRequest.jsp">Asset Requests</a></li>
							<li class="divider"></li>
							<li><a href="./CurrentAssets.jsp">Current Assets</a></li>
							<li class="divider"></li>
							<li><a href="./History.jsp">History</a></li>
						</ul>
					</li>
					<li><a href="" class="dropdown-toggle">Reports</a>
						<ul class="d-menu" data-role="dropdown">
							<li><a href="./FacultyAssignedAssetsReport">Assigned
									Assets</a></li>
							<li class="divider"></li>
						</ul>
					</li>
					<%
						}
						else if (usertype != null && "admin".equalsIgnoreCase(usertype))
						{
					%>
					<li><a href="" class="dropdown-toggle">Assets</a>
						<ul class="d-menu" data-role="dropdown">
							<li><a href="./NewAssetRequests.jsp">Asset Requests</a></li>
							<li class="divider"></li>
							<li><a href="./NewAsset.jsp">New Asset</a></li>
							<li class="divider"></li>
							<li><a href="./UpdateAsset.jsp">Update Asset</a></li>
							<li class="divider"></li>
							<li><a href="./AssetDetails.jsp">Assigned / Un Assigned
									Assets</a></li>
							<li class="divider"></li>
							<li><a href="./TrackAssetsByFaculty.jsp">Track
									Assets By Faculty</a></li>
							<li class="divider"></li>
							<li><a href="./TrackAssetBySerialId.jsp">Track Asset By
									Serial Id</a></li>
							<li class="divider"></li>
						</ul>
					</li>
					<li><a href="" class="dropdown-toggle">Reports</a>
						<ul class="d-menu" data-role="dropdown">
							<li><a href="./AssignedAssetsReport.jsp">Assigned Assets</a></li>
							<li class="divider"></li>
							<li><a href="./UnAssignedAssetsReport">Un-Assigned
									Assets</a></li>
							<li class="divider"></li>
						</ul>
					</li>
					<%
						}
						else if (usertype != null && "hod".equalsIgnoreCase(usertype))
						{
					%>
					<li><a href="" class="dropdown-toggle">Assets</a>
						<ul class="d-menu" data-role="dropdown">
							<li><a href="./NewAssetRequests.jsp">Asset Requests</a></li>
							<li><a href="./AssetDetails.jsp">Asset Details</a></li>
							<li class="divider"></li>
							<li><a href="./TrackAssetsByFaculty.jsp">Track
									Assets By Faculty</a></li>
							<li class="divider"></li>
							<li><a href="./TrackAssetBySerialId.jsp">Track Asset By
									Serial Id</a></li>
							<li class="divider"></li>
						</ul>
					</li>
					<li><a href="" class="dropdown-toggle">Reports</a>
						<ul class="d-menu" data-role="dropdown">
							<li><a href="./AssignedAssetsReport.jsp">Assigned Assets</a></li>
							<li class="divider"></li>
							<li><a href="./UnAssignedAssetsReport">Un-Assigned
									Assets</a></li>
							<li class="divider"></li>
						</ul>
					</li>
					<%
						}
					%>
					<li><a href="" class="dropdown-toggle">Help</a>
						<ul class="d-menu" data-role="dropdown">
							<li><a href="./About.jsp">About</a></li>
						</ul></li>
				</ul> <span class="app-bar-divider"></span> <%
 	if (usertype == null)
 	{
 %>
				<div class="app-bar-element place-right">
					<span class="dropdown-toggle"> Login </span>
					<div
						class="app-bar-drop-container padding10 place-right no-margin-top block-shadow fg-dark"
						data-role="dropdown" data-no-close="true" style="width: 350px">

						<h3 class="text-light">Login</h3>
						<form method="post" action="./Login.jsp" data-role="validator">
							<table style="width: 100%;">
								<tr>
									<td width="30%">User Name</td>
									<td width="10%">:</td>
									<td width="60%">
										<div class="input-control text">
											<input type="text" name="user_name" id="user_name"
												style="width: 150px; height: 30px;"
												data-validate-func="minlength" data-validate-arg="4"
												data-validate-hint="This field must contains min 4 characters.">
										</div>
									</td>
								</tr>
								<tr>
									<td>Password</td>
									<td>:</td>
									<td>
										<div class="input-control text">
											<input type="password" name="user_password"
												id="user_password" style="width: 150px; height: 30px;"
												data-validate-func="minlength" data-validate-arg="4"
												data-validate-hint="This field must contains min 4 characters.">
										</div>
									</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td>
										<button class="button primary">Login</button>
									</td>
								</tr>
							</table>
						</form>
						<table style="width: 100%;">
							<tr>
								<td><a href="./Register.jsp">Register Here</a></td>
								<td><a href="./ForgotPassword.jsp">Forgot Password</a></td>
							</tr>
						</table>
					</div>
				</div></td>
		</tr>
	</table>
	<%
		}
		else
		{
	%>
	</td>
	<td width="30%">
		<div style="display: table-cell; width: 100%; ">
			<div class="app-bar-element" style="color:yellow;">
				<c:if test="${username ne null}">
			Welcome <c:out value="${username}"></c:out>
				</c:if>
			</div>
		</div>
	</td>
	<td width="20%" align="right">
		<span class="app-bar-divider"></span>
		<div class="app-bar-element">
			<ul class="app-bar-menu small-dropdown" style="height: 30px;">
				<li><a class="dropdown-toggle" href="">Settings</a>
					<ul class="d-menu" data-role="dropdown">
						<li><a href="./ProfileEdit.jsp">Update Profile</a></li>
						<li class="divider"></li>
						<li><a href="./ChangePassword.jsp">Change Password</a></li>
						<li class="divider"></li>
					</ul></li>
			</ul>
		</div>
		<span class="app-bar-divider"></span>
		<div class="app-bar-element">
			<a class="app-bar-element" href="./Logout.jsp">Logout</a>
		</div>
		<span class="app-bar-divider"></span>
	</td>
	</tr>
	</table>
	<%
		}
	%>
</div>
