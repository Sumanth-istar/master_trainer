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
int s_id = 0;
int mastertrainer_id = 0;
MasterTrainerService mastertrainerservice = new MasterTrainerService();
if(request.getParameter("s_id")!=null){
	
	s_id = Integer.parseInt(request.getParameter("s_id"));
	mastertrainer_id = Integer.parseInt(request.getParameter("mastertrainer_id"));
	
	
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
		<div id="page-wrapper" class="gray-bg">

			<div class="wrapper wrapper-content animated fadeInRight">
				<div class="row" style="margin: 5px">
					<div class="row">
                
                
                <div class="col-lg-12">
                <label style="margin-right: 100px;color: red;" class=""> Check if the L4 interview is over <input
									type="checkbox" value=" id="is_checked_l4_interview_status" required></label>
									
									<button class="btn btn-sm btn-primary pull-right m-t-n-xs"
									id="submit_details" type="button">
									<strong>Submit</strong>
								</button>
								
                    <div class="tabs-container">
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#tab-3"> Accounting, Tally and DT</a></li>
                            <li class=""><a data-toggle="tab" href="#tab-4">Retail Banking</a></li>
                            <li class=""><a data-toggle="tab" href="#tab-5">Sales & Marketing</a></li>
                            <li class=""><a data-toggle="tab" href="#tab-6">IT</a></li>
                            <li class=""><a data-toggle="tab" href="#tab-7">UI</a></li>
                            <li class=""><a data-toggle="tab" href="#tab-8">Market Research</a></li> 
                            <li class=""><a data-toggle="tab" href="#tab-9">Digital Marketing</a></li>
                            <li class=""><a data-toggle="tab" href="#tab-10">Finance</a></li>
                        </ul>
                        <div class="tab-content">
                            <div id="tab-3" class="tab-pane active">
                                <div class="panel-body">
                                  
                                     <jsp:include page="/master_trainer/partials/accounting_tally_dt.jsp" />  
                                </div>
                            </div>
                            <div id="tab-4" class="tab-pane">
                                <div class="panel-body">
                               <jsp:include page="/master_trainer/partials/banking.jsp" />  
                                </div>
                            </div>
                             <div id="tab-5" class="tab-pane ">
                                <div class="panel-body">
                                  
                                    <jsp:include page="/master_trainer/partials/sales_marketing.jsp" />  
                                </div>
                            </div>
                             <div id="tab-6" class="tab-pane ">
                                <div class="panel-body">
                                  
                                    <jsp:include page="/master_trainer/partials/it.jsp" />  
                                </div>
                            </div>
                             <div id="tab-7" class="tab-pane ">
                                <div class="panel-body">
                                  
                                    <jsp:include page="/master_trainer/partials/ui.jsp" />  
                                </div>
                            </div>
                             <div id="tab-8" class="tab-pane ">
                                <div class="panel-body">
                                  
                                    <jsp:include page="/master_trainer/partials/market_research.jsp" />  
                                </div>
                            </div>
                             <div id="tab-9" class="tab-pane ">
                                <div class="panel-body">
                                  
                                     <jsp:include page="/master_trainer/partials/digital_marketing .jsp" />  
                                </div>
                            </div>
                             <div id="tab-10" class="tab-pane ">
                                <div class="panel-body">
                                  
                                    <jsp:include page="/master_trainer/partials/finance.jsp" />  
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