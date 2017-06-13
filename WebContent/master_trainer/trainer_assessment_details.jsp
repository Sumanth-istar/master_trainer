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
Boolean is_selected = false;
Boolean interview_status = false;
String comments = "";
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
	href="<%=baseURL %>img/user_images/recruiter_portal_trans_logo.png" />
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
		<%-- <jsp:include page="/navbar.jsp"><jsp:param name="logout_btn" value="add" /> </jsp:include> --%>
		<div id="page-wrapper" class="gray-bg">

			

			<div class="wrapper wrapper-content animated fadeInRight" style="padding: 0px;">
				<div class="row" style="margin: 5px">
					<div class="col-lg-12">
					<a class="list-group-item active">
	              <%=mastertrainerservice.getTrainerNotAttendedDetails(s_id) %>
               </a><br/><br/>
						<div class="form-group">

							<label>Comments</label>
							<%
							
							 List<HashMap<String, Object>> data = mastertrainerservice.getCommentsAndOtherDetailsPerTrainer(s_id);
							
							
							
							 for (HashMap<String, Object> row : data) {
								 
								 comments = (String)row.get("comment");
                         		is_selected = (Boolean)row.get("is_selected");
                         		interview_status = (Boolean)row.get("interview_status");
                         		
								 
							 }
							
							
							%>
							<textarea class="form-control" id="comment" required placeholder="Write comment..."><%=comments!=""?comments:"" %></textarea>
						</div>
						<div class="form-group">
							<div class="col-lg-12">
								<div class="col-lg-6">



									<label>Trainer Skill</label>
									<div>
										<select data-placeholder="Choose a Courses..." required
											class="course_list chosen-select" multiple
											style="width: 350px;" tabindex="4">
											<%= mastertrainerservice.getAllCourse(s_id) %>
										</select>
									</div>
								</div>

								<button class="btn btn-sm btn-primary pull-right m-t-n-xs"
									id="submit_comment" type="button">
									<strong>Submit</strong>
								</button>
								<label style="margin-right: 100px;"> Check if you want to Select Trainer <input
									type="checkbox" <%=is_selected!=false?"checked":"" %> value="<%=is_selected!=false?"true":"false" %>" id="is_checked_trainer"></label>
									
									<label style="margin-right: 100px;color: red;" class=""> Check if the L3 interview is over <input
									type="checkbox" <%=interview_status!=false?"checked":"" %> value="<%=interview_status!=false?"true":"false" %>" id="is_checked_interview_status" required></label>
							</div>
						</div>
						
						<br/><br/>
						<div class="tabs-container">
							<ul class="nav nav-tabs">
							       
							       <%
							       
							        data = mastertrainerservice.getAllAssessmentPerTrainer(s_id);
							       int i= 0;  
							       for (HashMap<String, Object> row : data) {
							    	   
							    	   String assessmenttitle = (String)row.get("assessmenttitle");
		                    			int assessment_id = (int)row.get("assessment_id");
							       
							       %>

								<li  class="<%=i==0?"active":""%>"><a data-toggle="tab" href="#tab-<%=assessment_id%>"><%=assessmenttitle%>(<%=assessment_id%>)</a></li>
								
								<%
								i++;
								}
							       %>

							</ul>
							<div class="tab-content">
							<%
							i= 0;
							 for (HashMap<String, Object> row : data) {
						    	   
						    	   String assessmenttitle = (String)row.get("assessmenttitle");
	                    			int assessment_id = (int)row.get("assessment_id");
							
							%>

							 <div id="tab-<%=assessment_id%>" class="tab-pane <%=i==0?"active":""%>">
									<div class="panel-body">
                                  <jsp:include page="/master_trainer/partials/assessment_details_partials.jsp" >
                                  <jsp:param name="assessment_id" value="<%=assessment_id%>" /> 
                                   <jsp:param name="mastertrainer_id" value="<%=mastertrainer_id%>" />
                                  <jsp:param name="s_id" value="<%=s_id%>" />  
                                            </jsp:include>    
                                </div>
								</div>
								<%
								i++;
							 }
								
								%>

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
	 $('.chosen-select').chosen({width: "100%"});
	
	 $('#is_checked_trainer').change(function(){ 
		 
		 if($('#is_checked_trainer').prop('checked')) {
			 $('#is_checked_trainer').val('true');
			} else {
				$('#is_checked_trainer').val('false');
			} 
	 });
	 
	 $('#is_checked_interview_status').change(function(){ 
		 
		 if($('#is_checked_interview_status').prop('checked')) {
			 $('#is_checked_interview_status').val('true');
			} else {
				$('#is_checked_interview_status').val('false');
			} 
	 });
	
    
    $( "#submit_comment" ).click(function() {
		 console.log("");
		 
		 var comment = $('#comment').val();
		 var courseid =$("option:selected").map(function(){ return this.value }).get().join(", ");
		 var is_tariner_selected = $('#is_checked_trainer').val();
		 var interview_status = $('#is_checked_interview_status').val();
		 
		if(interview_status == 'true'){
			
			 var jsp="<%=baseURL%>master_trainer_comments";
		    	$.post(jsp, 
						{comment:comment,courseid:courseid,is_tariner_selected:is_tariner_selected,mastertrainer_id:<%=mastertrainer_id%>,trainer_id:<%=s_id%>,interview_status:interview_status}, 
						function(data) {
							
							alert('Submit')
				});
			 
		
    }else{
    	alert('please check interview is over or not')
    }
		
		});

});





</script>
</html>