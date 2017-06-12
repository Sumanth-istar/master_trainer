<%@page import="com.istarindia.apps.dao.DBUTILS"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String url = request.getRequestURL().toString();
	String baseURL = url.substring(0, url.length() - request.getRequestURI().length())
			+ request.getContextPath() + "/";
%>
<%
	DBUTILS db = new DBUTILS();
%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon"
	href="img/user_images/recruiter_portal_trans_logo.png" />
<title>Talentify</title>

<link href="<%=baseURL %>css/bootstrap.min.css" rel="stylesheet">
<link href="<%=baseURL %>font-awesome/css/font-awesome.css" rel="stylesheet">
<link href="<%=baseURL %>css/plugins/dataTables/datatables.min.css" rel="stylesheet">
<link href="<%=baseURL %>css/plugins/jasny/jasny-bootstrap.min.css" rel="stylesheet">

<link href="<%=baseURL %>css/plugins/chosen/bootstrap-chosen.css" rel="stylesheet">
<link href="<%=baseURL %>css/plugins/select2/select2.min.css" rel="stylesheet">

<link href="<%=baseURL %>css/animate.css" rel="stylesheet">
<link href="<%=baseURL %>css/style.css" rel="stylesheet">
<link href="<%=baseURL %>css/custom.css" rel="stylesheet">
</head>
<body class="top-navigation" id="">
	<div id="wrapper">
		<jsp:include page="/navbar.jsp">
			<jsp:param name="logout_btn" value="remove" />
		</jsp:include>

		<div id="page-wrapper" class="white-bg">

			<div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-lg-10">
					<h2 style="margin-left: 31px;">Trainer Sign Up Form</h2>
				</div>
			</div>
			<div class="col-lg-1"></div>
			<div class="col-lg-6">
				<div class="ibox float-e-margins">

					<div class="ibox-content">
						<form class="form-horizontal" action="<%=baseURL%>signup_form"
							method="post">
							<input type="hidden" id="teaching_address"
								name="teaching_address" value="">
							<div class="col-lg-12">
								<div class="form-group">
									<label class="col-sm-2 control-label">First Name:</label>

									<div class="col-sm-5">
										<input type="text" placeholder="First Name" name="f_name"
											required class="form-control">
									</div>
								</div>

							</div>

							<div class="col-lg-12">
								<div class="form-group">
									<label class="col-sm-2 control-label">Last Name:</label>

									<div class="col-sm-5">
										<input type="text" required placeholder="Last Name"
											name="l_name" class="form-control">
									</div>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<label class="col-sm-2 control-label">Gender:</label>

									<div class="col-sm-5">
										<select class="form-control m-b" required name="gender">
											<option value="FEMALE">FEMALE</option>
											<option value="MALE">MALE</option>

										</select>
									</div>
								</div>

							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<label class="col-sm-2 control-label">DOB:</label>

									<div class="col-sm-5">
										<input type="text" class="form-control" required
											placeholder="DOB" name="dob" data-mask="99/99/9999"
											placeholder="">
									</div>
								</div>

							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<label class="col-lg-2 control-label">Email:</label>

									<div class="col-lg-5">
										<input type="email" required placeholder="Email" name="email"
											class="form-control">
									</div>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<label class="col-lg-2 control-label">Password:</label>

									<div class="col-lg-5">
										<input type="password" required name="password"
											placeholder="Password" class="form-control">
									</div>
								</div>
							</div>

							<div class="col-lg-12">
								<div class="form-group">
									<label class="col-sm-2 control-label">Mobile Number:</label>

									<div class="col-sm-5">
										<input type="number" required placeholder="Mobile Number"
											name="mobile" class="form-control">
									</div>
								</div>

							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<label class="col-sm-2 control-label">Address Line 1:</label>

									<div class="col-sm-7">
										<input type="text" required placeholder="Address Line 1"
											name="address_line1" class="form-control">
									</div>
								</div>

							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<label class="col-sm-2 control-label">Address Line 2:</label>

									<div class="col-sm-7">
										<input type="text" required placeholder="Address Line 2"
											name="address_line2" class="form-control">
									</div>
								</div>

							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<label class="col-sm-2 control-label">PinCode:</label>

									<%
										String pin_sql = "SELECT id,pin FROM pincode;";

										List<HashMap<String, Object>> data = db.executeQuery(pin_sql);
									%>

									<div class="col-sm-5">
										<select class="form-control m-b" required name="pincode">
											<option value="">Select Pincode</option>

											<%
												if (data.size() > 0) {
													for (HashMap<String, Object> row : data) {
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
									<label class="col-sm-2 control-label">UG Degree Name:</label>

									<div class="col-sm-5">
										<select class="form-control m-b" required name="ug_degree">
											<option value="">Select UG Degree</option>
											<option value="BTECH">BTECH</option>
											<option value="BA">BA</option>
											<option value="BCOM">BCOM</option>
											<option value="BBM">BBM</option>
											<option value="BSC">BSC</option>
											<option value="BE">BE</option>
											<option value="BBA">BBA</option>
											<option value="BED">BED</option>
											<option value="BSW">BSW</option>
											<option value="BCA">BCA</option>
											<option value="OTHERS">OTHERS</option>
										</select>
									</div>
								</div>

							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<label class="col-sm-2 control-label">PG Degree Name:</label>

									<div class="col-sm-5">
										<select class="form-control m-b" name="pg_degree">
											<option value="">Select PG Degree</option>
											<option value="MTECH">MTECH</option>
											<option value="MA">MA</option>
											<option value="MCOM">MCOM</option>
											<option value="MTECH">MTECH</option>
											<option value="MCOM">MCOM</option>
											<option value="MBA">MBA</option>
											<option value="ME">ME</option>
											<option value="MCA">MCA</option>
											<option value="MSW">MSW</option>
											<option value="OTHERS">OTHERS</option>

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
									<label class="col-sm-2 control-label">Intrested Course:</label>
									<input type="hidden" id="session_id" name="session_id" value="">
									<div class="col-lg-offset-2 col-lg-10" style="margin-left: 0px">

										<%
											String course_sql = "SELECT cmsession.id,cmsession.title FROM module,cmsession WHERE module.id = cmsession.module_id and course_id = 67 AND cmsession.id !=1797;";

											List<HashMap<String, Object>> data1 = db.executeQuery(course_sql);
										%>
										<select data-placeholder="Choose a Course..." required
											class="chosen-select course_holder" multiple
											style="width: 350px;" tabindex="4">
											<!-- <option value="">Select</option> -->
											<%
												if (data.size() > 0) {
													for (HashMap<String, Object> row1 : data1) {
											%>

											<option value="<%=row1.get("id")%>"><%=row1.get("title")%></option>


											<%
												}
												}
											%>
										</select>
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
										<tr>
											<td>Monday</td>
											<td style="text-align: center;"><input class="chechbox"
												id="monday1" type="checkbox"
												value="monday#&8:00 AM-9:00 AM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="monday2" type="checkbox"
												value="monday#&9:00 AM-10:00 AM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="monday3" type="checkbox"
												value="monday#&10:00 AM-11:00 AM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="monday4" type="checkbox"
												value="monday#&11:00 AM-12:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="monday5" type="checkbox"
												value="monday#&12:00 PM-1:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="monday6" type="checkbox"
												value="monday#&1:00 PM-2:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="monday7" type="checkbox"
												value="monday#&2:00 PM-3:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="monday8" type="checkbox"
												value="monday#&3:00 PM-4:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="monday9" type="checkbox"
												value="monday#&4:00 PM-5:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="monday10" type="checkbox"
												value="monday#&5:00 PM-6:00 PM!&"></td>
										</tr>
										<tr>
											<td>Tuesday</td>
											<td style="text-align: center;"><input class="chechbox"
												id="tuesday1" type="checkbox"
												value="tuesday#&8:00 AM-9:00 AM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="tuesday2" type="checkbox"
												value="tuesday#&9:00 AM-10:00 AM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="tuesday3" type="checkbox"
												value="tuesday#&10:00 AM-11:00 AM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="tuesday4" type="checkbox"
												value="tuesday#&11:00 AM-12:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="tuesday5" type="checkbox"
												value="tuesday#&12:00 PM-1:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="tuesday6" type="checkbox"
												value="tuesday#&1:00 PM-2:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="tuesday7" type="checkbox"
												value="tuesday#&2:00 PM-3:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="tuesday8" type="checkbox"
												value="tuesday#&3:00 PM-4:00 PM"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="tuesday9" type="checkbox"
												value="tuesday#&4:00 PM-5:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="tuesday10" type="checkbox"
												value="tuesday#&5:00 PM-6:00 PM!&"></td>
										</tr>
										<tr>
											<td>Wednesday</td>
											<td style="text-align: center;"><input class="chechbox"
												id="wednesday1" type="checkbox"
												value="wednesday#&8:00 AM-9:00 AM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="wednesday2" type="checkbox"
												value="wednesday#&9:00 AM-10:00 AM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="wednesday3" type="checkbox"
												value="wednesday#&10:00 AM-11:00 AM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="wednesday4" type="checkbox"
												value="wednesday#&11:00 AM-12:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="wednesday5" type="checkbox"
												value="wednesday#&12:00 PM-1:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="wednesday6" type="checkbox"
												value="wednesday#&1:00 PM-2:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="wednesday7" type="checkbox"
												value="wednesday#&2:00 PM-3:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="wednesday8" type="checkbox"
												value="wednesday#&3:00 PM-4:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="wednesday9" type="checkbox"
												value="wednesday#&4:00 PM-5:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="wednesday10" type="checkbox"
												value="wednesday#&5:00 PM-6:00 PM!&"></td>
										</tr>
										<tr>
											<td>Thrusday</td>
											<td style="text-align: center;"><input class="chechbox"
												id="thrusday1" type="checkbox"
												value="thrusday#&8:00 AM-9:00 AM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="thrusday2" type="checkbox"
												value="thrusday#&9:00 AM-10:00 AM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="thrusday3" type="checkbox"
												value="thrusday#&10:00 AM-11:00 AM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="thrusday4" type="checkbox"
												value="thrusday#&11:00 AM-12:00 PM!&"></td>

											<td style="text-align: center;"><input class="chechbox"
												id="thrusday5" type="checkbox"
												value="thrusday#&12:00 PM-1:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="thrusday6" type="checkbox"
												value="thrusday#&1:00 PM-2:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="thrusday7" type="checkbox"
												value="thrusday#&2:00 PM-3:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="thrusday8" type="checkbox"
												value="thrusday#&3:00 PM-4:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="thrusday9" type="checkbox"
												value="thrusday#&4:00 PM-5:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="thrusday10" type="checkbox"
												value="thrusday#&5:00 PM-6:00 PM!&"></td>

										</tr>
										<tr>
											<td>Friday</td>
											<td style="text-align: center;"><input class="chechbox"
												id="friday1" type="checkbox"
												value="thrusday#&8:00 AM-9:00 AM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="friday2" type="checkbox"
												value="friday#&9:00 AM-10:00 AM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="friday3" type="checkbox"
												value="friday#&10:00 AM-11:00 AM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="friday4" type="checkbox"
												value="friday#&11:00 AM-12:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="friday5" type="checkbox"
												value="friday#&12:00 PM-1:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="friday6" type="checkbox"
												value="friday#&1:00 PM-2:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="friday7" type="checkbox"
												value="friday#&2:00 PM-3:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="friday8" type="checkbox"
												value="friday#&3:00 PM-4:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="friday9" type="checkbox"
												value="friday#&4:00 PM-5:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="friday10" type="checkbox"
												value="friday#&5:00 PM-6:00 PM!&"></td>
										</tr>
										<tr>
											<td>Saturday</td>
											<td style="text-align: center;"><input class="chechbox"
												id="saturday1" type="checkbox"
												value="saturday#&8:00 AM-9:00 AM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="saturday2" type="checkbox"
												value="saturday#&9:00 AM-10:00 AM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="saturday3" type="checkbox"
												value="saturday#&10:00 AM-11:00 AM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="saturday4" type="checkbox"
												value="saturday#&11:00 AM-12:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="saturday5" type="checkbox"
												value="saturday#&12:00 PM-1:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="saturday6" type="checkbox"
												value="saturday#&1:00 PM-2:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="saturday7" type="checkbox"
												value="saturday#&2:00 PM-3:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="saturday8" type="checkbox"
												value="saturday#&3:00 PM-4:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="saturday9" type="checkbox"
												value="saturday#&4:00 PM-5:00 PM!&"></td>
											<td style="text-align: center;"><input class="chechbox"
												id="saturday10" type="checkbox"
												value="saturday#&5:00 PM-6:00 PM!&"></td>
										</tr>
									</tbody>
								</table>
							</div>

							<div class="form-group">
								<div class="col-lg-offset-2 col-lg-10">
									<button class="btn btn-sm btn-primary m-t-n-xs pull-right"
										type="submit">Sign in</button>
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


	<!-- Mainly scripts -->
</body>
<!-- Mainly scripts -->
<script src="<%=baseURL %>js/jquery-2.1.1.js"></script>
<script src="<%=baseURL %>js/bootstrap.min.js"></script>
<!-- Chosen -->
<script src="<%=baseURL %>js/plugins/chosen/chosen.jquery.js"></script>
<!-- Input Mask-->
<script src="<%=baseURL %>js/plugins/jasny/jasny-bootstrap.min.js"></script>


<script type="text/javascript">
	var map = {};

	$(document)
			.ready(
					function() {

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
											console.log('kahatm');

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
	function myMap() {
		var map;

		var myOptions = {
			zoom : 7,
			center : new google.maps.LatLng(12.97, 77.59),
			mapTypeId : 'roadmap'
		};
		map = new google.maps.Map($('#googleMap')[0], myOptions);

		var markers = {};
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
					//alert('error --> ');

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