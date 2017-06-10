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
	DBUTILS db = new DBUTILS();

	int trainer_id = 0;
	if (request.getSession().getAttribute("trainerID") != null) {
		trainer_id = Integer.parseInt(request.getSession().getAttribute("trainerID").toString());

	}
	if (request.getParameter("trainer_id") != null) {

		trainer_id = Integer.parseInt(request.getParameter("trainer_id"));
	}
	System.out.print(trainer_id);

	TrainerService trainerservice = new TrainerService();

	List<HashMap<String, Object>> userData = trainerservice.getAllTrainerDetails(trainer_id);
	List<HashMap<String, Object>> intrestedCourses = trainerservice.getAllTrainerSessions(trainer_id);
	List<HashMap<String, Object>> trainerAvaliabledata = trainerservice.getAllTrainerAvaTime(trainer_id);
	List<HashMap<String, Object>> trainerLocationData = trainerservice.getAllTrainerPrefredLocation(trainer_id);

	String f_name = "", l_name = "", gender = "", dob = "", email = "", password = "", mobile = "",
			address_line1 = "", address_line2 = "",ug_name="",pg_name="";
	int pincode=0;
	if (userData.size() != 0) {
			for (HashMap<String, Object> row : userData) {
				f_name = (String) row.get("firstname");
				l_name = (String) row.get("lastname");
				email = (String) row.get("email");
				dob = (String) row.get("dob")!=null?(String) row.get("dob"):"";
				mobile = (String) row.get("mobileno");
				ug_name = (String) row.get("under_graduate_degree_name")!=null?(String) row.get("under_graduate_degree_name"):"";
				pg_name = (String) row.get("pg_degree_name")!=null?(String) row.get("pg_degree_name"):"";
				gender = (String) row.get("gender");
				address_line1 = (String) row.get("addressline1")!=null?(String) row.get("addressline1"):"";
				address_line2 = (String) row.get("addressline2")!=null?(String) row.get("addressline1"):"";
				pincode = (int) row.get("pincode_id");

			}
	}
	
	ArrayList<Integer> intrestedList=new ArrayList();
	if(intrestedCourses.size()!=0){
		for (HashMap<String, Object> row : intrestedCourses) {
			intrestedList.add((int) row.get("id"));
		}
	}
	
	String mark_write="<i class='fa fa-check-circle' style='color: green !important;'></i>";
	
	
	ArrayList<String> markerList=new ArrayList();
	
	if(trainerLocationData.size()!=0){
		for (HashMap<String, Object> row : trainerLocationData) {
			markerList.add((String)row.get("marker_id"));
		}
	}
%>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon"
	href="<%=baseURL%>img/user_images/recruiter_portal_trans_logo.png" />
<title>Talentify</title>



<link href="<%=baseURL%>css/bootstrap.min.css" rel="stylesheet">
<link href="<%=baseURL%>font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link href="<%=baseURL%>css/plugins/dataTables/datatables.min.css"
	rel="stylesheet">
<link href="<%=baseURL%>css/plugins/jasny/jasny-bootstrap.min.css"
	rel="stylesheet">

<link href="<%=baseURL%>css/plugins/chosen/bootstrap-chosen.css"
	rel="stylesheet">
<link href="<%=baseURL%>css/plugins/select2/select2.min.css"
	rel="stylesheet">

<link href="<%=baseURL%>css/animate.css" rel="stylesheet">
<link href="<%=baseURL%>css/style.css" rel="stylesheet">
<link href="<%=baseURL%>css/custom.css" rel="stylesheet">


</head>
<body class="top-navigation" id="">
	<div id="wrapper">
		<jsp:include page="/navbar.jsp"><jsp:param
				name="logout_btn" value="add" />
		</jsp:include>
		<div id="page-wrapper" class="gray-bg">

			<div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-lg-12">
					<h2 style="margin-left: 31px;">User Details</h2>
					<%-- <ol style="margin-left: 31px;" class="breadcrumb">
						<li><a
							href="<%=baseURL%>trainer/trainer_dashboard.jsp?trainer_id=<%=trainer_id%>">Home</a>
						</li>

						<li class="active"><strong>user profile</strong></li>
					</ol> --%>
				</div>
			</div>

			<div class="wrapper wrapper-content animated fadeInRight">
				<div class="row" style="margin: 5px">
					<div class="row">


						<div class="col-lg-7">
							<div class="ibox float-e-margins">

								<div class="ibox-content">
									<form class="form-horizontal" action=""
										method="post">
										<input type="hidden" id="teaching_address"
											name="teaching_address" value="">
										<div class="col-lg-12">
											<div class="form-group">
												<label class="col-sm-2 control-label">First Name:</label>

												<div class="col-sm-5">
													<input type="text" placeholder="First Name" name="f_name" value="<%=f_name %>"
														required class="form-control">
												</div>
											</div>

										</div>

										<div class="col-lg-12">
											<div class="form-group">
												<label class="col-sm-2 control-label">Last Name:</label>

												<div class="col-sm-5">
													<input type="text" required placeholder="Last Name" value="<%=l_name %>"
														name="l_name" class="form-control">
												</div>
											</div>
										</div>
										<div class="col-lg-12">
											<div class="form-group">
												<label class="col-sm-2 control-label">Gender:</label>

												<div class="col-sm-5">
													<select class="form-control m-b" required name="gender">
														<option value="FEMALE" <%=(gender.equalsIgnoreCase("FEMALE"))?"selected":"" %>>FEMALE</option>
														<option value="MALE" <%=(gender.equalsIgnoreCase("MALE"))?"selected":"" %>>MALE</option>
													</select>
												</div>
											</div>

										</div>
										<div class="col-lg-12">
											<div class="form-group">
												<label class="col-sm-2 control-label">DOB:</label>

												<div class="col-sm-5">
													<input type="text" class="form-control" required
														placeholder="DOB" name="dob" data-mask="99/99/9999" value="<%=dob %>"
														placeholder="">
												</div>
											</div>

										</div>
										<div class="col-lg-12">
											<div class="form-group">
												<label class="col-lg-2 control-label">Email:</label>

												<div class="col-lg-5">
													<input type="email" required placeholder="Email" value="<%=email %>"
														name="email" class="form-control">
												</div>
											</div>
										</div>
										<%-- <div class="col-lg-12">
											<div class="form-group">
												<label class="col-lg-2 control-label">Password:</label>

												<div class="col-lg-5">
													<input type="password" required name="password" value="<%=password %>"
														placeholder="Password" class="form-control">
												</div>
											</div>
										</div> --%>

										<div class="col-lg-12">
											<div class="form-group">
												<label class="col-sm-2 control-label">Mobile Number:</label>

												<div class="col-sm-5">
													<input type="number" required placeholder="Mobile Number" value="<%=mobile %>"
														name="mobile" class="form-control">
												</div>
											</div>

										</div>
										<div class="col-lg-12">
											<div class="form-group">
												<label class="col-sm-2 control-label">Address Line
													1:</label>

												<div class="col-sm-7">
													<input type="text" required placeholder="Address Line 1" value="<%=address_line1 %>"
														name="address_line1" class="form-control">
												</div>
											</div>

										</div>
										<div class="col-lg-12">
											<div class="form-group">
												<label class="col-sm-2 control-label">Address Line
													2:</label>

												<div class="col-sm-7">
													<input type="text" required placeholder="Address Line 2" value="<%=address_line2 %>"
														name="address_line2" class="form-control">
												</div>
											</div>

										</div>
										<div class="col-lg-12">
											<div class="form-group">
												<label class="col-sm-2 control-label">PinCode:</label>

												<%
													String pin_sql = "SELECT id,pin FROM pincode;";

													List<HashMap<String, Object>> pincode_data = db.executeQuery(pin_sql);
												%>

												<div class="col-sm-5">
													<select class="form-control m-b" required name="pincode">
														<option value="">Select Pincode</option>
														<%
															if (pincode_data.size() > 0) {
																for (HashMap<String, Object> row : pincode_data) {
														%>
														<option value="<%=row.get("id")%>"><%=row.get("pin")%></option>
														<%
															}
															}
														%>

													</select>
												</div>
											</div>




										</div>
										<div class="col-lg-12">
											<div class="form-group">
												<label class="col-sm-2 control-label">UG Degree
													Name:</label>

												<div class="col-sm-5">
													<select class="form-control m-b" name="ug_degree">
														<option value="">Select UG Degree</option>
														<option value="BTECH" <%=(ug_name.equalsIgnoreCase("BTECH"))?"selected":"" %>>BTECH</option>
														<option value="BA" <%=(ug_name.equalsIgnoreCase("BA"))?"selected":"" %>>BA</option>
														<option value="BCOM" <%=(ug_name.equalsIgnoreCase("BCOM"))?"selected":"" %>>BCOM</option>
														<option value="BBM" <%=(ug_name.equalsIgnoreCase("BBM"))?"selected":"" %>>BBM</option>
														<option value="BSC" <%=(ug_name.equalsIgnoreCase("BSC"))?"selected":"" %>>BSC</option>
														<option value="BE" <%=(ug_name.equalsIgnoreCase("BE"))?"selected":"" %>>BE</option>
														<option value="BBA" <%=(ug_name.equalsIgnoreCase("BBA"))?"selected":"" %>>BBA</option>
														<option value="BED" <%=(ug_name.equalsIgnoreCase("BED"))?"selected":"" %>>BED</option>
														<option value="BSW" <%=(ug_name.equalsIgnoreCase("BSW"))?"selected":"" %>>BSW</option>
														<option value="BCA" <%=(ug_name.equalsIgnoreCase("BCA"))?"selected":"" %>>BCA</option>
														<option value="OTHERS" <%=(ug_name.equalsIgnoreCase("OTHERS"))?"selected":"" %>>OTHERS</option>
													</select>
												</div>
											</div>

										</div>
										<div class="col-lg-12">
											<div class="form-group">
												<label class="col-sm-2 control-label">PG Degree
													Name:</label>

												<div class="col-sm-5">
													<select class="form-control m-b" name="pg_degree">
														<option value="">Select PG Degree</option>
														<option value="MTECH" <%=(pg_name.equalsIgnoreCase("MTECH"))?"selected":"" %>>MTECH</option>
														<option value="MA" <%=(pg_name.equalsIgnoreCase("MA"))?"selected":"" %>>MA</option>
														<option value="MCOM" <%=(pg_name.equalsIgnoreCase("MCOM"))?"selected":"" %>>MCOM</option>
														<option value="MTECH" <%=(pg_name.equalsIgnoreCase("MTECH"))?"selected":"" %>>MTECH</option>
														<option value="MCOM" <%=(pg_name.equalsIgnoreCase("MCOM"))?"selected":"" %>>MCOM</option>
														<option value="MBA" <%=(pg_name.equalsIgnoreCase("MBA"))?"selected":"" %>>MBA</option>
														<option value="ME" <%=(pg_name.equalsIgnoreCase("ME"))?"selected":"" %>>ME</option>
														<option value="MCA" <%=(pg_name.equalsIgnoreCase("MCA"))?"selected":"" %>>MCA</option>
														<option value="MSW" <%=(pg_name.equalsIgnoreCase("MSW"))?"selected":"" %>>MSW</option>
														<option value="OTHERS" <%=(pg_name.equalsIgnoreCase("OTHERS"))?"selected":"" %>>OTHERS</option>

													</select>
												</div>
											</div>

										</div>


										<div class="col-lg-12">
											<div class="form-group form-inline">
												<label class="col-sm-2 control-label">Experience:</label>

												<div class="col-sm-3 ">
													<input type="number" required placeholder="year"
														name="experince_years" class="form-control">
												</div>
												<div class="col-sm-3 ">
													<input type="number" required placeholder="month"
														name="experince_months" class="form-control">
												</div>
											</div>

										</div>

										<div class="col-lg-12">
											<div class="form-group">
												<label class="col-sm-2 control-label">Intrested
													Course:</label> <input type="hidden" id="session_id"
													name="session_id" value="">
												<div class="col-lg-offset-2 col-lg-10"
													style="margin-left: 0px">

													<%
														String course_sql = "SELECT cmsession.id,cmsession.title FROM module,cmsession WHERE module.id = cmsession.module_id and course_id = 67 AND cmsession.id !=1797;";

														List<HashMap<String, Object>> courseData = db.executeQuery(course_sql);
													%>
													<select data-placeholder="Choose a Course..."
														class="chosen-select course_holder" multiple
														style="width: 350px;" tabindex="4">
														<option value="">Select</option>
														<%
															if (courseData.size() > 0) {
																for (HashMap<String, Object> row1 : courseData) {
														%>

														<option value="<%=row1.get("id")%>" <%=(intrestedList.contains(row1.get("id")))?"selected":"" %>><%=row1.get("title")%></option>


														<%
															}
															}
														%>
													</select>
													<button class="btn btn-sm btn-primary m-t-n-xs pull-right add_course"
													type="button">Add-Course</button>
												</div>
												
											</div>
											
										</div>

										<div class="col-lg-12">
											<label class="col-sm-3 control-label">Available Time
												Sloat:</label> <input type="hidden" id="avaiable_time"
												name="avaiable_time" value="">
											<table class="table table-bordered" id='mytable'>
												<thead>
													<tr>
														<th>Days</th>
														<th>8:00 AM-9:00 AM</th>
														<th>9:00 AM-10:00 AM</th>
														<th>10:00 AM-11:00 AM</th>
														<th>11:00 AM-12:00 PM</th>
														<th>12:00 PM-1:00 PM</th>
														<th>1:00 PM-2:00 PM</th>
														<th>2:00 PM-3:00 PM</th>
														<th>3:00 PM-4:00 PM</th>
														<th>4:00 PM-5:00 PM</th>
														<th>5:00 PM-6:00 PM</th>

													</tr>
												</thead>
												<tbody>
												
												<%
												if(trainerAvaliabledata !=null && trainerAvaliabledata.size()>0){
												for (HashMap<String, Object> row : trainerAvaliabledata) {
													
													
													if(row.get("day").toString().equalsIgnoreCase("Monday")){
													%>
													<tr>
														<td>Monday</td>
														
														<td style="text-align: center;"><%=(boolean)row.get("t8am_9pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t9am_10am")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t10am_11am")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t11am_12pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t12pm_1pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t1pm_2pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t2pm_3pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t3pm_4pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t4pm_5pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t5pm_6pm")?mark_write:""%></td>
														
													</tr>
													
													<%} if(row.get("day").toString().equalsIgnoreCase("Tuesday")){
													%>
													<tr>
														<td>Tuesday</td>
														<td style="text-align: center;"><%=(boolean)row.get("t8am_9pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t9am_10am")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t10am_11am")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t11am_12pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t12pm_1pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t1pm_2pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t2pm_3pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t3pm_4pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t4pm_5pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t5pm_6pm")?mark_write:""%></td>
													</tr>
													<%} if(row.get("day").toString().equalsIgnoreCase("Wednesday")){
													%>
													<tr>
														<td>Wednesday</td>
														<td style="text-align: center;"><%=(boolean)row.get("t8am_9pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t9am_10am")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t10am_11am")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t11am_12pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t12pm_1pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t1pm_2pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t2pm_3pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t3pm_4pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t4pm_5pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t5pm_6pm")?mark_write:""%></td>
													</tr>
													<%} if(row.get("day").toString().equalsIgnoreCase("Thrusday")){
													%>
													<tr>
														<td>Thrusday</td>
														<td style="text-align: center;"><%=(boolean)row.get("t8am_9pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t9am_10am")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t10am_11am")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t11am_12pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t12pm_1pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t1pm_2pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t2pm_3pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t3pm_4pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t4pm_5pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t5pm_6pm")?mark_write:""%></td>

													</tr>
													<%} if(row.get("day").toString().equalsIgnoreCase("Friday")){
													%>
													<tr>
														<td>Friday</td>
														<td style="text-align: center;"><%=(boolean)row.get("t8am_9pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t9am_10am")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t10am_11am")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t11am_12pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t12pm_1pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t1pm_2pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t2pm_3pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t3pm_4pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t4pm_5pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t5pm_6pm")?mark_write:""%></td>
													</tr>
													<%} if(row.get("day").toString().equalsIgnoreCase("Saturday")){
													%>
													<tr>
														<td>Saturday</td>
														<td style="text-align: center;"><%=(boolean)row.get("t8am_9pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t9am_10am")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t10am_11am")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t11am_12pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t12pm_1pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t1pm_2pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t2pm_3pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t3pm_4pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t4pm_5pm")?mark_write:""%></td>
														<td style="text-align: center;"><%=(boolean)row.get("t5pm_6pm")?mark_write:""%></td>
													</tr>
													<%} }
												} else{
														
														%>
														
														<tr>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														
														</tr>
														
														
														<%
												
														
													}%>
												</tbody>
											</table>
										</div>

										<div class="form-group">
											<div class="col-lg-offset-2 col-lg-10">
												<!-- <button class="btn btn-sm btn-primary m-t-n-xs pull-right"
													type="submit">Sign in</button> -->
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<div class="col-lg-5">
							</br> <label class="col-sm-6 control-label">Mark the preferred
								College or Center locations:</label>
							<div id="googleMap" style="width: 100%; height: 82vh;"></div>

						</div>












					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Mainly scripts -->
</body>
<!-- Mainly scripts -->
<script src="<%=baseURL%>js/jquery-2.1.1.js"></script>
<script src="<%=baseURL%>js/bootstrap.min.js"></script>
<!-- Chosen -->
<script src="<%=baseURL%>js/plugins/chosen/chosen.jquery.js"></script>
<!-- Input Mask-->
<script src="<%=baseURL%>js/plugins/jasny/jasny-bootstrap.min.js"></script>


<script type="text/javascript">
	var map = {};

	$(document)
			.ready(
					function() {
						
						
						
						
						$( ".add_course" ).click(function() {
							
							var session_id = $('#session_id').val();
						
							var jsp="<%=baseURL%>trainer";
					    	$.post(jsp, 
									{add_assessment:'add_assessment',trainer_id:<%= trainer_id%>,session_id:session_id}, 
									function(data) {
										
										alert('Submit')
							});
							
							
                        });

						$('.chosen-select').chosen({
							width : "70%"
						});

						$('.course_holder').change(function() {

							$('#session_id').val($(this).val());
						});
						var sThisVal = {};

						$('.chechbox')
								.change(
										function() {
											var row = $(this).parent().parent()
													.children().index(
															$(this).parent());
											var th = $("#mytable thead tr th")
													.eq(row);
											var time = th.text();
											var day = $(this).parent().closest(
													'tr').children('td:first')
													.text();
											if (this.checked) {

												if (sThisVal
														.hasOwnProperty(day))
													sThisVal[day] = sThisVal[day]
															+ '##' + time;
												else
													sThisVal[day] = time;
												console.log(th.text());
												console.log($(this).parent()
														.closest('tr')
														.children('td:first')
														.text());
											} else {
												if (sThisVal
														.hasOwnProperty(day)) {
													var list_of_values = sThisVal[day]
															.split('##');
													var index = list_of_values
															.indexOf(time);
													list_of_values.splice(
															index, 1);
													if (list_of_values.length > 0)
														sThisVal[day] = list_of_values
																.join('##');
													else
														delete sThisVal[day];
												}

											}
											//console.log('kahatm');

											//	sThisVal.push($($('.chechbox:checkbox:checked')[i]).val());
											var sThisVal1 = JSON
													.stringify(sThisVal);
											$('#avaiable_time').val(sThisVal1);
										});

					});

	function trainerPlace(markerId, formatted_address) {

		if (formatted_address === undefined) {
			delete map[markerId];
		} else {
			map[markerId] = formatted_address;
		}

		var map1 = JSON.stringify(map);
		$('#teaching_address').val(map1);
	}
	var markers = {};

	function addmarkerIDToMap(map){
		
		var cc = '<%=markerList%>'
			console.log('cc '+cc);
		var array = cc.replace("[","").replace("]","").split(',');
		for(i in array){
			var lat = array[i].split('_')[0];
			var lng = array[i].split('_')[1];
		    var pos = new google.maps.LatLng(lat, lng);
		    markers[i] = new google.maps.Marker({
		        position: pos,
		        map: map,
		        id: i
		    });
		    
		 /*    var infowindow = new google.maps.InfoWindow({
		        content: 'lododododo'
		    });

		    infowindow.open(map, markers[i]);
		    google.maps.event.addListener(markers[i], 'click', function () {
		        alert('sss')
		    })*/
			} 
		
	}
	function myMap() {
		var map;
		
		
		var myOptions = {
			zoom : 7,
			center : new google.maps.LatLng(12.97, 77.59),
			mapTypeId : 'roadmap'
		};
		map = new google.maps.Map($('#googleMap')[0], myOptions);
		addmarkerIDToMap(map);
		var getMarkerUniqueId = function(lat, lng) {
			return lat + '_' + lng;
		}

		/**
		 * Creates an instance of google.maps.LatLng by given lat and lng values and returns it.
		 * This function can be useful for getting new coordinates quickly.
		 * @param {!number} lat Latitude.
		 * @param {!number} lng Longitude.
		 * @return {google.maps.LatLng} An instance of google.maps.LatLng object
		 */
		var geocoder = new google.maps.Geocoder();

		function coordinates_to_address(lat, lng) {
			var latlng = new google.maps.LatLng(lat, lng);

			geocoder.geocode({
				'latLng' : latlng
			}, function(results, status) {
				if (status == google.maps.GeocoderStatus.OK) {
					// alert('result '+results[0].formatted_address);

					var markerId = getMarkerUniqueId(lat, lng);
					var formatted_address = results[0].formatted_address;

					trainerPlace(markerId, formatted_address);

					//  $('#teaching_address').val(markerId+':'+formatted_address);

				} else {
					alert('error --> ');

				}
			});
		}
		var getLatLng = function(lat, lng) {
			//alert('lat --> '+lat +' long --> '+lng);
			coordinates_to_address(lat, lng);
			return new google.maps.LatLng(lat, lng);
		};

		var addMarker = google.maps.event.addListener(map, 'click',
				function(e) {
					var lat = e.latLng.lat(); // lat of clicked point
					var lng = e.latLng.lng(); // lng of clicked point
					var markerId = getMarkerUniqueId(lat, lng); // an that will be used to cache this marker in markers object.
					var marker = new google.maps.Marker({
						position : getLatLng(lat, lng),
						map : map,
						id : 'marker_' + markerId
					});
					markers[markerId] = marker; // cache marker in markers object
					bindMarkerEvents(marker); // bind right click event to marker
				});
		var bindMarkerEvents = function(marker) {
			google.maps.event.addListener(marker, "rightclick",
					function(point) {
						var markerId = getMarkerUniqueId(point.latLng.lat(),
								point.latLng.lng()); // get marker id by using clicked point's coordinate
						var marker = markers[markerId]; // find marker
						removeMarker(marker, markerId); // remove it
					});
		};

		/**
		 * Removes given marker from map.
		 * @param {!google.maps.Marker} marker A google.maps.Marker instance that will be removed.
		 * @param {!string} markerId Id of marker.
		 */
		var removeMarker = function(marker, markerId) {

			trainerPlace(markerId);
			marker.setMap(null); // set markers setMap to null to remove it from map
			delete markers[markerId]; // delete marker instance from markers object

		};

	}
</script>

<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA1hUAMpiCKN2dUDuTVWMm-Aj42XVIWQH0&callback=myMap"
	type="text/javascript"></script>
</html>