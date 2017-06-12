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

 String master_trainer_id = request.getSession().getAttribute("trainerID").toString();
MasterTrainerService mastertrainerservice = new MasterTrainerService();

List<HashMap<String, Object>> data = mastertrainerservice.getAllTrainerDetails();

if(request.getParameter("trainerID")!=null){
	master_trainer_id = request.getParameter("trainerID");
	
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
<link href="<%=baseURL %>css/plugins/dataTables/datatables.min.css" rel="stylesheet">
<link href="<%=baseURL %>css/animate.css" rel="stylesheet">
<link href="<%=baseURL %>css/style.css" rel="stylesheet">
<link href="<%=baseURL %>css/custom.css" rel="stylesheet">

</head>
<body class="top-navigation" id="">
	<div id="wrapper">
		<jsp:include page="/navbar.jsp">
		<jsp:param name="logout_btn" value="add" /> 
		</jsp:include>

		<div id="page-wrapper" class="gray-bg">

			<div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-lg-10">
					<h2 style="margin-left: 31px;">Trainer Assessment Details</h2>
				</div>
			</div>

			<div class="wrapper wrapper-content animated fadeInRight">
				<div class="row" style="margin: 5px">
					<div class="col-lg-12">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<h5>Trainer Details</h5>

							</div> 
							<div class="ibox-content">

								<div class="table-responsive">
									<table
										class="table table-striped table-bordered table-hover dataTables-example">
										<thead>
											<tr>
												<th>#</th>
												<th>Email</th>
												<th>Name</th>
												<th>Assessment Details</th>
											</tr>
										</thead>
										<tbody>
										<%
										if (data.size() > 0) {
											for (HashMap<String, Object> row : data) {
										%>

											<tr>
												<td><a
													href="/master_trainer/trainer/trainer_profile.jsp?trainer_id=<%=row.get("sid") %>"
													target="_blank"><%=row.get("sid") %></a></td>
												<td><%=row.get("semail") %></td>
												<td><%=row.get("sname") %></td>

												<td><a
													href="/master_trainer/master_trainer/main_trainer_assessment_details.jsp?s_id=<%=row.get("sid") %>&mastertrainer_id=<%=master_trainer_id%>"
													target="_blank"><%=row.get("assessment_list") %></a></td>

											</tr>
											<%
											
											}
											}
											
											%>


										</tbody>
									</table>
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
<script type="text/javascript">

$(document).ready(function(){
    $('.dataTables-example').DataTable({
        pageLength: 10,
        responsive: true,
        dom: '<"html5buttons"B>lTfgitp',
        buttons: [
            {
             customize: function (win){
                    $(win.document.body).addClass('white-bg');
                    $(win.document.body).css('font-size', '10px');

                    $(win.document.body).find('table')
                            .addClass('compact')
                            .css('font-size', 'inherit');
            }
            }
        ]

    });

});





</script>
</html>