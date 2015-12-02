<!DOCTYPE html>
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
        <div class="flex-grid no-responsive-future">
            <div class="row" style="height: 100%">
                <div class="cell auto-size padding20 bg-white" id="cell-content">
                    <h1 class="text-light"> Track Assets By Faculty </h1>
                    <hr class="thin bg-grayLighter">
                    
                    <table class="dataTable border bordered" data-role="datatable" data-auto-width="false">
                        <thead>
                        <tr>
                            <td>Asset No</td>
                            <td>CP Model No</td>
                            <td>Serial No</td>
                            <td>Own Tag</td>
                            <td>Acq Date</td>
                            <th>Total Cost</th>
                            <td>Purpose</td>
                            <td>Description</td>
                            <td>Dept-Sub</td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                        	<td>123890723211</td>
                            <td>123890723211</td>
                            <td>Machine number 1</td>
                            <td>Machine number 1</td>
                            <td>Machine number 1</td>
                            <td>123890723211</td>
                            <td>123890723211</td>
                            <td>123890723211</td>
                            <td>123890723211</td>
                        </tr>
                        <tr>
                        	<td>123890723212</td>
                            <td>123890723212</td>
                            <td>Machine number 2</td>
                            <td>Machine number 2</td>
                            <td>Machine number 2</td>
                            <td>123890723212</td>
                            <td>123890723212</td>
                            <td>123890723212</td>
                            <td>123890723212</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    </div>
</body>
</html>
