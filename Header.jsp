<head>
    <meta charset="UTF-8">

    <title>Inventory</title>

    <link href="./static/css/metro.css" rel="stylesheet">
    <link href="./static/css/metro-icons.css" rel="stylesheet">
    <link href="./static/css/metro-responsive.css" rel="stylesheet">

    <script src="./static/js/jquery-2.1.3.min.js"></script>
    <script src="./static/js/jquery.dataTables.min.js"></script>
    <script src="./static/js/metro.js"></script>
    <script src="./static/js/docs.js"></script>
    
    <style>
        html, body {
            height: 100%;
        }
        body {
        }
        .page-content {
            padding-top: 3.125rem;
            min-height: 100%;
            height: 100%;
        }
        .table .input-control.checkbox {
            line-height: 1;
            min-height: 0;
            height: auto;
        }

        @media screen and (max-width: 800px){
            #cell-sidebar {
                flex-basis: 52px;
            }
            #cell-content {
                flex-basis: calc(100% - 52px);
            }
        }
    </style>

    <script>
        function showMessage(t, mestype, mes) 
        {
            $.Notify(
            {
                caption: mestype,
                content: mes,
                type: t
            });
        }

        $(function() 
   		{
            <%
            	String action = (String)session.getAttribute("action");
            	if("error".equals(action))
            	{
            		String message = (String)session.getAttribute("message");
            		if(message != null)
            		{
            			out.println("showMessage('alert', 'Error', '"+message+"');");
            			session.removeAttribute("action");
            			session.removeAttribute("message");
            		}
            	}
            %>
        });
    </script>
</head>
