<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="com.istarindia.service.CoordinatorService"%>
<%

CoordinatorService coordinatorservice = new CoordinatorService();
List<HashMap<String, Object>> trainerData = coordinatorservice.getAllTrainerStatusDetails();


if(trainerData.size() > 0){
	
	
}


%>


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
												<th>Comments</th>
												
												<th>L-1</th>
												<th>L-2</th>
												<th>L-3</th>
												<th>L-4</th>
												
											</tr>
										</thead>
										<tbody>
									<%
									if(trainerData.size() > 0){
										
										for (HashMap<String, Object> row : trainerData) {
									%>

											<tr>
												<td><%=row.get("s_id") %></td>
												<td><%=row.get("s_email") %></td>
												<td><%=row.get("s_name") %></td>
												<td><%=row.get("s_comment") %></td>											
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
						</div>
					</div>