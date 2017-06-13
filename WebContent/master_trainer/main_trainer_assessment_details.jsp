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
int master_trainer_id = 0;
int s_id = 0;

if(request.getParameter("s_id")!=null){
	
	s_id = Integer.parseInt(request.getParameter("s_id"));
	master_trainer_id = Integer.parseInt(request.getParameter("mastertrainer_id"));
	
	
}
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
					<h2 style="margin-left: 31px;">Assessment Details</h2>
					
				</div>
			</div>

			<div class="wrapper wrapper-content animated fadeInRight" style="padding: 0px;">
				<div class="row" style="margin: 5px">
					<div class="row">
                
                
                <div class="col-lg-12">
                    <div class="tabs-container">
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#tab-1">Trainer Assessment Details</a></li>
                            <li class=""><a data-toggle="tab" href="#tab-2">L4-Trainer Question</a></li>
                        </ul>
                        <div class="tab-content">
                            <div id="tab-1" class="tab-pane active">
                                <div class="panel-body">
                                  
                                    <jsp:include page="/master_trainer/trainer_assessment_details.jsp" >
                                 
                                   <jsp:param name="mastertrainer_id" value="<%=master_trainer_id%>" />
                                   <jsp:param name="s_id" value="<%=s_id%>" />
                                 
                                            </jsp:include>  
                                </div>
                            </div>
                            <div id="tab-2" class="tab-pane">
                                <div class="panel-body">
                                  <jsp:include page="/master_trainer/tab2_content.jsp" >  
                                   <jsp:param name="mastertrainer_id" value="<%=master_trainer_id%>" />
                                   <jsp:param name="s_id" value="<%=s_id%>" />
                                 
                                            </jsp:include>  
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
<script src="<%=baseURL %>js/plugins/dataTables/datatables.min.js"></script>

<script src="<%=baseURL %>js/bootstrap.min.js"></script>
<!-- Chosen -->
<script src="<%=baseURL %>js/plugins/chosen/chosen.jquery.js"></script>


<script type="text/javascript">

$(document).ready(function(){


});





</script>
</html>