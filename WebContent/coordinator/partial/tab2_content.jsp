<%@page import="com.istarindia.apps.dao.DBUTILS"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="com.istarindia.service.CoordinatorService"%>

<%

CoordinatorService coordinatorservice = new CoordinatorService();
List<HashMap<String, Object>> trainerData = coordinatorservice.getAllTrainerBycourseDetails();


DBUTILS db = new DBUTILS();




%>
<div class="col-lg-12">
	<div class="ibox float-e-margins">
		<div class="ibox-title">
			<h5>Trainer Details</h5>
			<button type="button" class="btn btn-outline btn-info pull-right"
				data-toggle="modal" data-target="#myModal2">Add</button>

		</div>
		<div class="ibox-content">

			<div class="table-responsive">
				<table
					class="table table-striped table-bordered table-hover dataTables-example">
					<thead>
						<tr>
							<th>#</th>
							<th>Course</th>
							<th>location</th>
							<th>Pre-L1</th>
							<th>L-1</th>
							<th>L-2</th>
							<th>L-3</th>
							<th>L-4</th>

						</tr>
					</thead>
					<tbody>
						<%
									if(trainerData.size() > 0){
										int i=0;
										for (HashMap<String, Object> row : trainerData) {
											
											/* List<HashMap<String, Object>> preL1trainerData = coordinatorservice.getAllTrainerPreL1Details((int)row.get("id"),(String)row.get("city"));
											
											String preL1 = "";
											 if(preL1trainerData!=null && preL1trainerData.size() > 0){
												
												 preL1 = (String)preL1trainerData.get(0).get("pre_l1_data");
											} */ 
									%>

						<tr>
							<td><%=row.get("session_id") %></td>
							<td><%=row.get("title") %></td>
							<td><%=row.get("city") %></td>
							<td><div class="input-group m-b">
									<span class="input-group-btn">
										<button type="button" id="pre_l1_btn_<%=i%>"
											data-session_id="<%=row.get("session_id") %>"
											data-city="<%=row.get("city") %>"
											class="btn btn-primary pre_l1_btn">Add</button>
									</span> <input type="text" id="pre_l1_input_<%=i++%>"
										value="<%=row.get("pre_l1_data") %>" class="form-control">
								</div></td>

							<td><%=row.get("signed_up") %></td>
							<td><%=row.get("assessment_completed") %></td>
							<td><%=row.get("interview_completed") %></td>
							<td><%=row.get("demo_completed") %></td>
						</tr>
						<% }
                                        
									}
                                        %>


					</tbody>
				</table>
			</div>


		</div>
		<div class="modal inmodal" id="myModal2" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content animated flipInY">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">Modal title</h4>

					</div>
					<div class="modal-body" style="">
						<div class="form-group">
							<label class="col control-label">Place</label>

							<div class="col">
								<input type="text" id="place_holder" required class="form-control" value="">
							</div>
						</div>

						<div class="form-group">
							<label class="col control-label">Number of calls made</label>

							<div class="col">
								<input type="text" id="calls_made" required class="form-control" value="">
							</div>
						</div>


						<div class="form-group">
							<label class="col control-label">Course</label>
							<%
											String course_sql = "SELECT cmsession.id,cmsession.title FROM module,cmsession WHERE module.id = cmsession.module_id and course_id = 67;";

											List<HashMap<String, Object>> data = db.executeQuery(course_sql);
										%>
							<div class="col">
								<select class="select2_demo_1 form-control" required
									id = "session_id" name="session_id">
									<%
												if (data.size() > 0) {
													for (HashMap<String, Object> row : data) {
											%>

									<option value="<%=row.get("id")%>"><%=row.get("title")%></option>


									<%
												}
												}
											%>
								</select>
							</div>
						</div>

					</div>


					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
						<button type="button" id="save_data" data-dismiss="modal" class="btn btn-primary">Save
							changes</button>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>