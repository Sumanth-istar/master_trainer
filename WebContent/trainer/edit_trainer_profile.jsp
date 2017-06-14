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
	List<HashMap<String, Object>> trainerAvaliabledata = trainerservice.getAllTrainerAvaTimeforedit(trainer_id);
	List<HashMap<String, Object>> trainerLocationData = trainerservice.getAllTrainerPrefredLocation(trainer_id);

	String f_name = "", l_name = "", gender = "", dob = "", email = "", password = "", mobile = "",
			address_line1 = "", address_line2 = "",ug_name="",pg_name="";
	int pincode=0;
	int work_exp_year=0;
	int work_exp_month=0;
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
				work_exp_year =  row.get("work_exp_year")!=null?(int) row.get("work_exp_year"):0;
				work_exp_month = row.get("work_exp_month")!=null?(int) row.get("work_exp_month"):0;
				System.out.print("<<<<<<"+pincode);

			}
	}
	
	ArrayList<Integer> intrestedList=new ArrayList();
	if(intrestedCourses.size()!=0){
		for (HashMap<String, Object> row : intrestedCourses) {
			intrestedList.add((int) row.get("id"));
		}
	}
	
	String mt8am_9am = "" ,mt9am_10am = "" ,mt10am_11am = "" ,mt11am_12pm ="" ,mt12pm_1pm = "" ,mt1pm_2pm = "" ,mt2pm_3pm = "" ,mt3pm_4pm = "" ,mt4pm_5pm = "" ,mt5pm_6pm = "" ,tt8am_9am = "" ,tt9am_10am = "" ,tt10am_11am = "" ,tt11am_12pm ="" ,tt12pm_1pm = "" ,tt1pm_2pm = "" ,tt2pm_3pm = "" ,tt3pm_4pm = "" ,tt4pm_5pm = "" ,tt5pm_6pm = "" ,wt8am_9am = "" ,wt9am_10am = "" ,wt10am_11am = "" ,wt11am_12pm ="" ,wt12pm_1pm = "" ,wt1pm_2pm = "" ,wt2pm_3pm = "" ,wt3pm_4pm = "" ,wt4pm_5pm = "" ,wt5pm_6pm = "" ,tht8am_9am = "" ,tht9am_10am = "" ,tht10am_11am = "" ,tht11am_12pm ="" ,tht12pm_1pm = "" ,tht1pm_2pm = "" ,tht2pm_3pm = "" ,tht3pm_4pm = "" ,tht4pm_5pm = "" ,tht5pm_6pm = "" ,ft8am_9am = "" ,ft9am_10am = "" ,ft10am_11am = "" ,ft11am_12pm ="" ,ft12pm_1pm = "" ,ft1pm_2pm = "" ,ft2pm_3pm = "" ,ft3pm_4pm = "" ,ft4pm_5pm = "" ,ft5pm_6pm = "" ,st8am_9am = "" ,st9am_10am = "" ,st10am_11am = "" ,st11am_12pm ="" ,st12pm_1pm = "" ,st1pm_2pm = "" ,st2pm_3pm = "" ,st3pm_4pm = "" ,st4pm_5pm = "" ,st5pm_6pm = "";
	 String checked = "checked";
	
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
					 <ol style="margin-left: 31px;" class="breadcrumb">
						<li><a
							href="<%=baseURL%>trainer/trainer_dashboard.jsp?trainer_id=<%=trainer_id%>">Home</a>
						</li>

						<li class="active"><strong>user profile</strong></li>
					</ol> 
				</div>
			</div>

			<div class="wrapper wrapper-content animated fadeInRight">
				<div class="row" style="margin: 5px">
					<div class="row">


						<div class="col-lg-7">
							<div class="ibox float-e-margins">

								<div class="ibox-content">
								<form method="POST" enctype="multipart/form-data" id="fileUploadForm">
								
								<div class="col-lg-12">
								<div class="col-lg-6">
											<div class="form-group">
												<label class="col-sm-4 control-label">Upload Resume:</label>
                                                <input type="hidden" name="triner_id" value="<%=trainer_id%>">
												<div class="col-sm-5">
													<input type="file" name="files"/>
                                                 
												</div>
											</div></div><div class="col-lg-6">
											 <input type="submit" value="Upload" id="btnSubmit"/>
											</div>
										</div>
                            
								</form><br/><br/><br/>
									<form class="form-horizontal" action="" method="post">
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
												<label class="col-lg-2 control-label ">Email:</label>

												<div class="col-lg-5">
													<input type="email" disabled required placeholder="Email" value="<%=email %>"
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
														<option <%= (pincode == (int)(row.get("id")))?"selected":"" %>  value="<%=row.get("id")%>"><%=row.get("pin")%></option>
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
													<input type="number" required placeholder="year" value="<%=work_exp_year %>"
														name="experince_years" class="form-control">
												</div>
												<div class="col-sm-3 ">
													<input type="number" required placeholder="month" value="<%=work_exp_month %>"
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
														
														<%
															if (courseData.size() > 0) {
																for (HashMap<String, Object> row1 : courseData) {
																	
																	System.out.println("---->"+pincode);
														%>

														<option value="<%=row1.get("id")%>" <%=(intrestedList.contains(row1.get("id")))?"selected":"" %> ><%=row1.get("title")%></option>


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
										<!-- <div class="col-lg-12">
										 
										 <label class="col-sm-2 control-label">Intrested
													 Would you like to attach you CV?:</label>
										 <a href="" id="resume_link">Click here</a>
                                          <input type="file" id="resume" style="visibility: hidden"></div> -->

										<div class="col-lg-12">
											<label class="col control-label">Available Time
												Sloat:</label> <input type="hidden" id="avaiable_time"
												name="avaiable_time" value=""><br/><br/>
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
												
												<tr>
												<%
												if(trainerAvaliabledata !=null && trainerAvaliabledata.size()>0){
													
													
												for (HashMap<String, Object> row : trainerAvaliabledata) {
													
													
													
													if(row.get("day").toString().equalsIgnoreCase("Monday")){
														
													
														 mt8am_9am = ((String)row.get("t8am_9am")).equalsIgnoreCase("true")?checked:"";
														 mt9am_10am = ((String)row.get("t9am_10am")).equalsIgnoreCase("true")?checked:"";
														 mt10am_11am = ((String)row.get("t10am_11am")).equalsIgnoreCase("true")?checked:"";
														 mt11am_12pm = ((String)row.get("t11am_12pm")).equalsIgnoreCase("true")?checked:"";
														 mt12pm_1pm = ((String)row.get("t12pm_1pm")).equalsIgnoreCase("true")?checked:"";
														 mt1pm_2pm = ((String)row.get("t1pm_2pm")).equalsIgnoreCase("true")?checked:"";
														 mt2pm_3pm = ((String)row.get("t2pm_3pm")).equalsIgnoreCase("true")?checked:"";
														 mt3pm_4pm = ((String)row.get("t3pm_4pm")).equalsIgnoreCase("true")?checked:"";
														 mt4pm_5pm = ((String)row.get("t4pm_5pm")).equalsIgnoreCase("true")?checked:"";
														 mt5pm_6pm = ((String)row.get("t5pm_6pm")).equalsIgnoreCase("true")?checked:"";
													
													}
													if(row.get("day").toString().equalsIgnoreCase("Tuesday")){
														
														 tt8am_9am = ((String)row.get("t8am_9am")).equalsIgnoreCase("true")?checked:"";
														 tt9am_10am = ((String)row.get("t9am_10am")).equalsIgnoreCase("true")?checked:"";
														 tt10am_11am = ((String)row.get("t10am_11am")).equalsIgnoreCase("true")?checked:"";
														 tt11am_12pm = ((String)row.get("t11am_12pm")).equalsIgnoreCase("true")?checked:"";
														 tt12pm_1pm = ((String)row.get("t12pm_1pm")).equalsIgnoreCase("true")?checked:"";
														 tt1pm_2pm = ((String)row.get("t1pm_2pm")).equalsIgnoreCase("true")?checked:"";
														 tt2pm_3pm = ((String)row.get("t2pm_3pm")).equalsIgnoreCase("true")?checked:"";
														 tt3pm_4pm = ((String)row.get("t3pm_4pm")).equalsIgnoreCase("true")?checked:"";
														 tt4pm_5pm = ((String)row.get("t4pm_5pm")).equalsIgnoreCase("true")?checked:"";
														 tt5pm_6pm = ((String)row.get("t5pm_6pm")).equalsIgnoreCase("true")?checked:"";
													}
													if(row.get("day").toString().equalsIgnoreCase("Wednesday")){
														
														 wt8am_9am = ((String)row.get("t8am_9am")).equalsIgnoreCase("true")?checked:"";
														 wt9am_10am = ((String)row.get("t9am_10am")).equalsIgnoreCase("true")?checked:"";
														 wt10am_11am = ((String)row.get("t10am_11am")).equalsIgnoreCase("true")?checked:"";
														 wt11am_12pm = ((String)row.get("t11am_12pm")).equalsIgnoreCase("true")?checked:"";
														 wt12pm_1pm = ((String)row.get("t12pm_1pm")).equalsIgnoreCase("true")?checked:"";
														 wt1pm_2pm = ((String)row.get("t1pm_2pm")).equalsIgnoreCase("true")?checked:"";
														 wt2pm_3pm = ((String)row.get("t2pm_3pm")).equalsIgnoreCase("true")?checked:"";
														 wt3pm_4pm = ((String)row.get("t3pm_4pm")).equalsIgnoreCase("true")?checked:"";
														 wt4pm_5pm = ((String)row.get("t4pm_5pm")).equalsIgnoreCase("true")?checked:"";
														 wt5pm_6pm = ((String)row.get("t5pm_6pm")).equalsIgnoreCase("true")?checked:"";
													}
													if(row.get("day").toString().equalsIgnoreCase("Thrusday")){
														
														 tht8am_9am = ((String)row.get("t8am_9am")).equalsIgnoreCase("true")?checked:"";
														 tht9am_10am = ((String)row.get("t9am_10am")).equalsIgnoreCase("true")?checked:"";
														 tht10am_11am = ((String)row.get("t10am_11am")).equalsIgnoreCase("true")?checked:"";
														 tht11am_12pm = ((String)row.get("t11am_12pm")).equalsIgnoreCase("true")?checked:"";
														 tht12pm_1pm = ((String)row.get("t12pm_1pm")).equalsIgnoreCase("true")?checked:"";
														 tht1pm_2pm = ((String)row.get("t1pm_2pm")).equalsIgnoreCase("true")?checked:"";
														 tht2pm_3pm = ((String)row.get("t2pm_3pm")).equalsIgnoreCase("true")?checked:"";
														 tht3pm_4pm = ((String)row.get("t3pm_4pm")).equalsIgnoreCase("true")?checked:"";
														 tht4pm_5pm = ((String)row.get("t4pm_5pm")).equalsIgnoreCase("true")?checked:"";
														 tht5pm_6pm = ((String)row.get("t5pm_6pm")).equalsIgnoreCase("true")?checked:"";
														
													}
													if(row.get("day").toString().equalsIgnoreCase("Friday")){
														
														 ft8am_9am = ((String)row.get("t8am_9am")).equalsIgnoreCase("true")?checked:"";
														 ft9am_10am = ((String)row.get("t9am_10am")).equalsIgnoreCase("true")?checked:"";
														 ft10am_11am = ((String)row.get("t10am_11am")).equalsIgnoreCase("true")?checked:"";
														 ft11am_12pm = ((String)row.get("t11am_12pm")).equalsIgnoreCase("true")?checked:"";
														 ft12pm_1pm = ((String)row.get("t12pm_1pm")).equalsIgnoreCase("true")?checked:"";
														 ft1pm_2pm = ((String)row.get("t1pm_2pm")).equalsIgnoreCase("true")?checked:"";
														 ft2pm_3pm = ((String)row.get("t2pm_3pm")).equalsIgnoreCase("true")?checked:"";
														 ft3pm_4pm = ((String)row.get("t3pm_4pm")).equalsIgnoreCase("true")?checked:"";
														 ft4pm_5pm = ((String)row.get("t4pm_5pm")).equalsIgnoreCase("true")?checked:"";
														 ft5pm_6pm = ((String)row.get("t5pm_6pm")).equalsIgnoreCase("true")?checked:"";
													}
                                                    if(row.get("day").toString().equalsIgnoreCase("Saturday")){
														
                                                    	 st8am_9am = ((String)row.get("t8am_9am")).equalsIgnoreCase("true")?checked:"";
														 st9am_10am = ((String)row.get("t9am_10am")).equalsIgnoreCase("true")?checked:"";
														 st10am_11am = ((String)row.get("t10am_11am")).equalsIgnoreCase("true")?checked:"";
														 st11am_12pm = ((String)row.get("t11am_12pm")).equalsIgnoreCase("true")?checked:"";
														 st12pm_1pm = ((String)row.get("t12pm_1pm")).equalsIgnoreCase("true")?checked:"";
														 st1pm_2pm = ((String)row.get("t1pm_2pm")).equalsIgnoreCase("true")?checked:"";
														 st2pm_3pm = ((String)row.get("t2pm_3pm")).equalsIgnoreCase("true")?checked:"";
														 st3pm_4pm = ((String)row.get("t3pm_4pm")).equalsIgnoreCase("true")?checked:"";
														 st4pm_5pm = ((String)row.get("t4pm_5pm")).equalsIgnoreCase("true")?checked:"";
														 st5pm_6pm = ((String)row.get("t5pm_6pm")).equalsIgnoreCase("true")?checked:"";
                                                    	
                                                    	
													}
													
												}
														
														
												}		
													%>
											<td>Monday</td>
											<td style="text-align: center;"><input <%=mt8am_9am %> class="chechbox"
												id="monday1" type="checkbox"
												value="monday#&8:00 AM-9:00 AM!&"></td>
											<td style="text-align: center;"><input <%=mt9am_10am %> class="chechbox"
												id="monday2" type="checkbox"
												value="monday#&9:00 AM-10:00 AM!&"></td>
											<td style="text-align: center;"><input <%=mt10am_11am %> class="chechbox"
												id="monday3" type="checkbox"
												value="monday#&10:00 AM-11:00 AM!&"></td>
											<td style="text-align: center;"><input <%=mt11am_12pm %> class="chechbox"
												id="monday4" type="checkbox"
												value="monday#&11:00 AM-12:00 PM!&"></td>
											<td style="text-align: center;"><input <%=mt12pm_1pm %> class="chechbox"
												id="monday5" type="checkbox"
												value="monday#&12:00 PM-1:00 PM!&"></td>
											<td style="text-align: center;"><input <%=mt1pm_2pm %> class="chechbox"
												id="monday6" type="checkbox"
												value="monday#&1:00 PM-2:00 PM!&"></td>
											<td style="text-align: center;"><input <%=mt2pm_3pm %> class="chechbox"
												id="monday7" type="checkbox"
												value="monday#&2:00 PM-3:00 PM!&"></td>
											<td style="text-align: center;"><input <%=mt3pm_4pm %> class="chechbox"
												id="monday8" type="checkbox"
												value="monday#&3:00 PM-4:00 PM!&"></td>
											<td style="text-align: center;"><input <%=mt4pm_5pm %>class="chechbox"
												id="monday9" type="checkbox"
												value="monday#&4:00 PM-5:00 PM!&"></td>
											<td style="text-align: center;"><input <%=mt5pm_6pm %> class="chechbox"
												id="monday10" type="checkbox"
												value="monday#&5:00 PM-6:00 PM!&"></td>
										</tr>
										<tr>
											<td>Tuesday</td>
											<td style="text-align: center;"><input <%=tt8am_9am %> class="chechbox"
												id="tuesday1" type="checkbox"
												value="tuesday#&8:00 AM-9:00 AM!&"></td>
											<td style="text-align: center;"><input <%=tt9am_10am %> class="chechbox"
												id="tuesday2" type="checkbox"
												value="tuesday#&9:00 AM-10:00 AM!&"></td>
											<td style="text-align: center;"><input  <%=tt10am_11am %>  class="chechbox"
												id="tuesday3" type="checkbox"
												value="tuesday#&10:00 AM-11:00 AM!&"></td>
											<td style="text-align: center;"><input <%=tt11am_12pm %> class="chechbox"
												id="tuesday4" type="checkbox"
												value="tuesday#&11:00 AM-12:00 PM!&"></td>
											<td style="text-align: center;"><input <%=tt12pm_1pm %> class="chechbox"
												id="tuesday5" type="checkbox"
												value="tuesday#&12:00 PM-1:00 PM!&"></td>
											<td style="text-align: center;"><input <%=tt1pm_2pm %> class="chechbox"
												id="tuesday6" type="checkbox"
												value="tuesday#&1:00 PM-2:00 PM!&"></td>
											<td style="text-align: center;"><input <%=tt2pm_3pm %> class="chechbox"
												id="tuesday7" type="checkbox"
												value="tuesday#&2:00 PM-3:00 PM!&"></td>
											<td style="text-align: center;"><input <%=tt3pm_4pm %> class="chechbox"
												id="tuesday8" type="checkbox"
												value="tuesday#&3:00 PM-4:00 PM"></td>
											<td style="text-align: center;"><input <%=tt4pm_5pm %> class="chechbox"
												id="tuesday9" type="checkbox"
												value="tuesday#&4:00 PM-5:00 PM!&"></td>
											<td style="text-align: center;"><input <%=tt5pm_6pm %> class="chechbox"
												id="tuesday10" type="checkbox"
												value="tuesday#&5:00 PM-6:00 PM!&"></td>
										</tr>
										<tr>
											<td>Wednesday</td>
											<td style="text-align: center;"><input <%=wt8am_9am %> class="chechbox"
												id="wednesday1" type="checkbox"
												value="wednesday#&8:00 AM-9:00 AM!&"></td>
											<td style="text-align: center;"><input <%=wt9am_10am %> class="chechbox"
												id="wednesday2" type="checkbox"
												value="wednesday#&9:00 AM-10:00 AM!&"></td>
											<td style="text-align: center;"><input <%=wt10am_11am %> class="chechbox"
												id="wednesday3" type="checkbox"
												value="wednesday#&10:00 AM-11:00 AM!&"></td>
											<td style="text-align: center;"><input <%=wt11am_12pm %> class="chechbox"
												id="wednesday4" type="checkbox"
												value="wednesday#&11:00 AM-12:00 PM!&"></td>
											<td style="text-align: center;"><input <%=wt12pm_1pm %> class="chechbox"
												id="wednesday5" type="checkbox"
												value="wednesday#&12:00 PM-1:00 PM!&"></td>
											<td style="text-align: center;"><input <%=wt1pm_2pm %> class="chechbox"
												id="wednesday6" type="checkbox"
												value="wednesday#&1:00 PM-2:00 PM!&"></td>
											<td style="text-align: center;"><input <%=wt2pm_3pm %> class="chechbox"
												id="wednesday7" type="checkbox"
												value="wednesday#&2:00 PM-3:00 PM!&"></td>
											<td style="text-align: center;"><input <%=wt3pm_4pm %> class="chechbox"
												id="wednesday8" type="checkbox"
												value="wednesday#&3:00 PM-4:00 PM!&"></td>
											<td style="text-align: center;"><input <%=wt4pm_5pm %> class="chechbox"
												id="wednesday9" type="checkbox"
												value="wednesday#&4:00 PM-5:00 PM!&"></td>
											<td style="text-align: center;"><input <%=wt5pm_6pm %> class="chechbox"
												id="wednesday10" type="checkbox"
												value="wednesday#&5:00 PM-6:00 PM!&"></td>
										</tr>
										<tr>
											<td>Thrusday</td>
											<td style="text-align: center;"><input <%=tht8am_9am %> class="chechbox"
												id="thrusday1" type="checkbox"
												value="thrusday#&8:00 AM-9:00 AM!&"></td>
											<td style="text-align: center;"><input <%=tht9am_10am %> class="chechbox"
												id="thrusday2" type="checkbox"
												value="thrusday#&9:00 AM-10:00 AM!&"></td>
											<td style="text-align: center;"><input <%=tht10am_11am %> class="chechbox"
												id="thrusday3" type="checkbox"
												value="thrusday#&10:00 AM-11:00 AM!&"></td>
											<td style="text-align: center;"><input <%=tht11am_12pm %> class="chechbox"
												id="thrusday4" type="checkbox"
												value="thrusday#&11:00 AM-12:00 PM!&"></td>

											<td style="text-align: center;"><input <%=tht12pm_1pm %> class="chechbox"
												id="thrusday5" type="checkbox"
												value="thrusday#&12:00 PM-1:00 PM!&"></td>
											<td style="text-align: center;"><input <%=tht1pm_2pm %> class="chechbox"
												id="thrusday6" type="checkbox"
												value="thrusday#&1:00 PM-2:00 PM!&"></td>
											<td style="text-align: center;"><input <%=tht2pm_3pm %> class="chechbox"
												id="thrusday7" type="checkbox"
												value="thrusday#&2:00 PM-3:00 PM!&"></td>
											<td style="text-align: center;"><input <%=tht3pm_4pm %> class="chechbox"
												id="thrusday8" type="checkbox"
												value="thrusday#&3:00 PM-4:00 PM!&"></td>
											<td style="text-align: center;"><input <%=tht4pm_5pm %> class="chechbox"
												id="thrusday9" type="checkbox"
												value="thrusday#&4:00 PM-5:00 PM!&"></td>
											<td style="text-align: center;"><input <%=tht5pm_6pm %> class="chechbox"
												id="thrusday10" type="checkbox"
												value="thrusday#&5:00 PM-6:00 PM!&"></td>

										</tr>
										<tr>
											<td>Friday</td>
											<td style="text-align: center;"><input <%=ft8am_9am %> class="chechbox"
												id="friday1" type="checkbox"
												value="thrusday#&8:00 AM-9:00 AM!&"></td>
											<td style="text-align: center;"><input <%=ft9am_10am %> class="chechbox"
												id="friday2" type="checkbox"
												value="friday#&9:00 AM-10:00 AM!&"></td>
											<td style="text-align: center;"><input <%=ft10am_11am %> class="chechbox"
												id="friday3" type="checkbox"
												value="friday#&10:00 AM-11:00 AM!&"></td>
											<td style="text-align: center;"><input <%=ft11am_12pm %> class="chechbox"
												id="friday4" type="checkbox"
												value="friday#&11:00 AM-12:00 PM!&"></td>
											<td style="text-align: center;"><input <%=ft12pm_1pm %> class="chechbox"
												id="friday5" type="checkbox"
												value="friday#&12:00 PM-1:00 PM!&"></td>
											<td style="text-align: center;"><input <%=ft1pm_2pm %> class="chechbox"
												id="friday6" type="checkbox"
												value="friday#&1:00 PM-2:00 PM!&"></td>
											<td style="text-align: center;"><input <%=ft2pm_3pm %> class="chechbox"
												id="friday7" type="checkbox"
												value="friday#&2:00 PM-3:00 PM!&"></td>
											<td style="text-align: center;"><input <%=ft3pm_4pm %> class="chechbox"
												id="friday8" type="checkbox"
												value="friday#&3:00 PM-4:00 PM!&"></td>
											<td style="text-align: center;"><input <%=ft4pm_5pm %> class="chechbox"
												id="friday9" type="checkbox"
												value="friday#&4:00 PM-5:00 PM!&"></td>
											<td style="text-align: center;"><input <%=ft5pm_6pm %> class="chechbox"
												id="friday10" type="checkbox"
												value="friday#&5:00 PM-6:00 PM!&"></td>
										</tr>
										<tr>
											<td>Saturday</td>
											<td style="text-align: center;"><input <%=st8am_9am %> class="chechbox"
												id="saturday1" type="checkbox"
												value="saturday#&8:00 AM-9:00 AM!&"></td>
											<td style="text-align: center;"><input <%=st9am_10am %> class="chechbox"
												id="saturday2" type="checkbox"
												value="saturday#&9:00 AM-10:00 AM!&"></td>
											<td style="text-align: center;"><input <%=st10am_11am %> class="chechbox"
												id="saturday3" type="checkbox"
												value="saturday#&10:00 AM-11:00 AM!&"></td>
											<td style="text-align: center;"><input <%=st11am_12pm %> class="chechbox"
												id="saturday4" type="checkbox"
												value="saturday#&11:00 AM-12:00 PM!&"></td>
											<td style="text-align: center;"><input <%=st12pm_1pm %> class="chechbox"
												id="saturday5" type="checkbox"
												value="saturday#&12:00 PM-1:00 PM!&"></td>
											<td style="text-align: center;"><input <%=st1pm_2pm %> class="chechbox"
												id="saturday6" type="checkbox"
												value="saturday#&1:00 PM-2:00 PM!&"></td>
											<td style="text-align: center;"><input <%=st2pm_3pm %> class="chechbox"
												id="saturday7" type="checkbox"
												value="saturday#&2:00 PM-3:00 PM!&"></td>
											<td style="text-align: center;"><input <%=st3pm_4pm %> class="chechbox"
												id="saturday8" type="checkbox"
												value="saturday#&3:00 PM-4:00 PM!&"></td>
											<td style="text-align: center;"><input <%=st4pm_5pm %> class="chechbox"
												id="saturday9" type="checkbox"
												value="saturday#&4:00 PM-5:00 PM!&"></td>
											<td style="text-align: center;"><input <%=st5pm_6pm %> class="chechbox"
												id="saturday10" type="checkbox"
												value="saturday#&5:00 PM-6:00 PM!&"></td>
										</tr>
												
												
													
												</tbody>
											</table>
										</div>

										<div class="form-group">
											<div class="col-lg-offset-2 col-lg-10">
												<!--  <button class="btn btn-sm btn-primary m-t-n-xs pull-right"
													type="submit">Save Changes</button>  -->
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
							
							<div style="margin: 28px;" id="address_view">
								<%
								
								if(trainerLocationData.size()!=0){
									for (HashMap<String, Object> row : trainerLocationData) {
										
									
								%>
								<p><b>Address:</b> <%=(String)row.get("prefred_location") %></p>
								
								<%
								
									}
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
<script src="<%=baseURL%>js/jquery-2.1.1.js"></script>
<script src="<%=baseURL%>js/bootstrap.min.js"></script>
<!-- Chosen -->
<script src="<%=baseURL%>js/plugins/chosen/chosen.jquery.js"></script>
<!-- Input Mask-->
<script src="<%=baseURL%>js/plugins/jasny/jasny-bootstrap.min.js"></script>


<script type="text/javascript">
	var map = {};
	var myfile="";
	$(document)
			.ready(
					function() {
						
						
						$("#btnSubmit").click(function (event) {

					        //stop submit the form, we will post it manually.
					        event.preventDefault();

					        // Get form
					        var form = $('#fileUploadForm')[0];
					        var servlet="<%=baseURL%>media_uplaod";
							// Create an FormData object
					        var data = new FormData(form);

							// If you want to add an extra field for the FormData
					        data.append("CustomField", "This is some extra data, testing");

							// disabled the submit button
					        $("#btnSubmit").prop("disabled", true);

					        $.ajax({
					            type: "POST",
					            enctype: 'multipart/form-data',
					            url: servlet,
					            data: data,
					            processData: false,
					            contentType: false,
					            cache: false,
					            timeout: 600000,
					            success: function (data) {

					                $("#result").text(data);
					                console.log("SUCCESS : ", data);
					                $("#btnSubmit").prop("disabled", false);
					                alert('Upload');

					            },
					            error: function (e) {

					                $("#result").text(e.responseText);
					                console.log("ERROR : ", e);
					                $("#btnSubmit").prop("disabled", false);

					            }
					        });

					    });

					<%--  $('#resume_link').click(function( e ) {
						    e.preventDefault();
						    $('#resume').trigger('click');
						});

						$('#resume').on( 'change', function() {
						   myfile= $( this ).val();
						   var ext = myfile.split('.').pop();
						   var servlet="<%=baseURL%>media_uplaod";
						   if(ext=="pdf" || ext=="docx" || ext=="doc"){
						      
							   
							   $.ajax({
						            type: "POST",
						            url: servlet,
						            enctype: 'multipart/form-data',
						            data: {
						                file: myfile
						            },
						            success: function () {
						                alert("Data Uploaded: ");
						            }
						        });
							   
							   
						   } else{
						       
							 
							   $.ajax({
						            type: "POST",
						            url: servlet,
						            enctype: 'multipart/form-data',
						            data: {
						                file: myfile
						            },
						            success: function () {
						                alert("Data Uploaded: ");
						            }
						        });
							   
						   }
						}); --%> 
						
						/*  $("#uploadbutton").click(function () {
						        var filename = $("#file").val();

						        $.ajax({
						            type: "POST",
						            url: "addFile.do",
						            enctype: 'multipart/form-data',
						            data: {
						                file: filename
						            },
						            success: function () {
						                alert("Data Uploaded: ");
						            }
						        });
						    }); */
						
						
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