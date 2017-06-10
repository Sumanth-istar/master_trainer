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
String trainer_id ="0";
if(request.getSession().getAttribute("trainerID")!=null){
	 trainer_id = request.getSession().getAttribute("trainerID").toString();

}
if(request.getParameter("trainer_id")!=null){
	
	trainer_id = request.getParameter("trainer_id");
}
System.out.print(trainer_id); 

TrainerService trainerservice =  new TrainerService();
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
				<div class="col-lg-10">
					<h2 style="margin-left: 31px;">Assessment Details</h2>
					
				</div><div class="col-lg-2">
				<div class="feed-element" style="margin-right: 20px; margin-top: 5px;">
                                        <a href="<%=baseURL %>trainer/trainer_profile.jsp?trainer_id=<%=trainer_id %>" class="pull-right">
                                            <img alt="image" class="img-circle" src="<%=baseURL %>assets/images/t_profile.png">
                                        </a>
                                        
                                    </div>
				</div>
			</div>

			<div class="wrapper wrapper-content animated fadeInRight">
				<div class="row" style="margin: 5px">
					<div class="row">
                
                
                
                
                 
                 
                 <%=trainerservice.getAllAssessmentForTrainer(trainer_id) %>
                
                





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