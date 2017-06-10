<%@page import="com.istarindia.service.TrainerService"%>
<%@page import="com.istarindia.service.MasterTrainerService"%>
<%@page import="com.istarindia.apps.dao.DBUTILS"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	String url = request.getRequestURL().toString();
	String baseURL = url.substring(0, url.length() - request.getRequestURI().length())
			+ request.getContextPath() + "/"; 
%>
<%
int coordinator_id =0;
if(request.getSession().getAttribute("coordinatorID")!=null){
	coordinator_id = Integer.parseInt(request.getSession().getAttribute("coordinatorID").toString());

}
/* if(request.getParameter("coordinator_id")!=null){
	
	coordinator_id = request.getParameter("trainer_id");
} */
System.out.print(coordinator_id); 

%>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon"
	href="img/user_images/recruiter_portal_trans_logo.png" />
<title>Talentify</title>

<link href="<%=baseURL %>css/bootstrap.min.css" rel="stylesheet">
<link href="<%=baseURL %>font-awesome/css/font-awesome.css" rel="stylesheet">
<link href="<%=baseURL %>css/plugins/dataTables/datatables.min.css"
	rel="stylesheet">
<link href="<%=baseURL %>css/animate.css" rel="stylesheet">
<link href="<%=baseURL %>css/style.css" rel="stylesheet">
<link href="<%=baseURL %>css/custom.css" rel="stylesheet">
<link href="<%=baseURL %>css/plugins/chosen/bootstrap-chosen.css" rel="stylesheet">


</head>
<body class="top-navigation" id="">
	<div id="wrapper">
		<jsp:include page="/navbar.jsp"><jsp:param name="logout_btn" value="add" /> </jsp:include>
		<div id="page-wrapper" class="gray-bg">

			<div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-lg-12">
					<h2 style="margin-left: 31px;">Trainer Details</h2>
					
				</div>
			</div>

			<div class="wrapper wrapper-content animated fadeInRight">
				<div class="row" style="margin: 5px">
					<div class="row">
                
                
                <div class="col-lg-12">
                    <div class="tabs-container">
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#tab-1"> This is tab</a></li>
                            <li class=""><a data-toggle="tab" href="#tab-2">This is second tab</a></li>
                        </ul>
                        <div class="tab-content">
                            <div id="tab-1" class="tab-pane active">
                                <div class="panel-body">
                                  
                                    <jsp:include page="/coordinator/partial/tab1_content.jsp" />  
                                </div>
                            </div>
                            <div id="tab-2" class="tab-pane">
                                <div class="panel-body">
                                 <jsp:include page="/coordinator/partial/tab2_content.jsp" /> 
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
                
                 
                 
                
                
                





            </div>
				</div>
			</div>
		</div>
	</div>


	<!-- Mainly scripts -->
</body>
<!-- Mainly scripts -->
<script src="<%=baseURL %>js/jquery-2.1.1.js"></script>


<script src="<%=baseURL %>js/bootstrap.min.js"></script>
<!-- Chosen -->
<script src="<%=baseURL %>js/plugins/chosen/chosen.jquery.js"></script>


<script type="text/javascript">

$(document).ready(function(){
	
    
   

});





</script>
</html>