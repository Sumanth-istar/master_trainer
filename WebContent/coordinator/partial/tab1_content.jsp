<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="com.istarindia.service.CoordinatorService"%>
<%

CoordinatorService coordinatorservice = new CoordinatorService();
List<HashMap<String, Object>> trainerData = coordinatorservice.getAllTrainerStatusDetails();





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
											
											String signed_up="";
											String assessment_completed="";
											String interview_completed="";
											String demo_completed="";
											
											if((int)row.get("signed_up") == 1){
												
												signed_up="<i class='fa fa-check-circle' style='color: green !important;'></i>";
											}
                                           if((int)row.get("assessment_completed") == 1){
												
                                        	   signed_up="<i class='fa fa-check-circle' style='color: green !important;'></i>";
                                        	   assessment_completed="<i class='fa fa-check-circle' style='color: green !important;'></i>";
											}
                                           if((int)row.get("interview_completed") == 1){
	
                                        	   signed_up="<i class='fa fa-check-circle' style='color: green !important;'></i>";
                                        	   assessment_completed="<i class='fa fa-check-circle' style='color: green !important;'></i>";
                                        	   interview_completed="<i class='fa fa-check-circle' style='color: green !important;'></i>";
                                            }
											if((int)row.get("demo_completed") == 1){
	
												    signed_up="<i class='fa fa-check-circle' style='color: green !important;'></i>";
	                                        	   assessment_completed="<i class='fa fa-check-circle' style='color: green !important;'></i>";
	                                        	   interview_completed="<i class='fa fa-check-circle' style='color: green !important;'></i>";
	                                        	   demo_completed="<i class='fa fa-check-circle' style='color: green !important;'></i>";
											}
									%>

											<tr>
												<td><a
													href="/master_trainer/master_trainer/trainer_profile.jsp?trainer_id=<%=row.get("s_id") %>"
													target="_blank"><%=row.get("s_id") %></a></td>
												<td><%=row.get("s_email") %></td>
												<td><%=row.get("s_name") %></td>
												<td><%=row.get("s_comment") %></td>	
																						
												<td><%=signed_up %></td>
												<td><%=assessment_completed %></td>
												<td><%=interview_completed %></td>
												<td><%=demo_completed%></td> 
												

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