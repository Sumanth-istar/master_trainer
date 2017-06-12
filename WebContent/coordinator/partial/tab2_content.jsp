<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="com.istarindia.service.CoordinatorService"%>

<%

CoordinatorService coordinatorservice = new CoordinatorService();
List<HashMap<String, Object>> trainerData = coordinatorservice.getAllTrainerBycourseDetails();





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
											
											List<HashMap<String, Object>> preL1trainerData = coordinatorservice.getAllTrainerPreL1Details((int)row.get("id"),(String)row.get("city"));
											
											String preL1 = "";
											if(preL1trainerData!=null && preL1trainerData.size() > 0){
												
												 preL1 = (String)preL1trainerData.get(0).get("pre_l1_data");
											}
									%>

											<tr>
												<td><%=row.get("id") %></td>
												<td><%=row.get("title") %></td>
												<td><%=row.get("city") %></td>
												<td><div class="input-group m-b"><span class="input-group-btn">
                                            <button type="button" id="pre_l1_btn_<%=i%>" data-session_id="<%=row.get("id") %>" data-city="<%=row.get("city") %>"  class="btn btn-primary pre_l1_btn">Add</button> </span> <input type="text" id="pre_l1_input_<%=i++%>" value="<%=preL1!=""?preL1:"" %>" class="form-control">
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
						</div>
					</div>