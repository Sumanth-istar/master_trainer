<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="com.istarindia.service.CoordinatorService"%>

<%



%>
<div class="col-lg-12">
						<div class="ibox float-e-margins">
							<!-- <div class="ibox-title">
								<h5>Trainer Details</h5>

							</div> -->
							<div class="ibox-content">

								<div class="table-responsive">
									<table
										class="table table-striped table-bordered table-hover dataTables-example">
										<thead>
											<tr>
											    <th>Soft Skills</th>
												<th>Rating (1- 5)</th>
												<th>Quiz the candidate on these topics:</th>
												<th>Rating (1- 5)</th>
												
												
											</tr>
										</thead>
										<tbody>
									

											<tr>
												<td>Grooming</td>
												<td>
												<select class="form-control m-b" required name="skill_1">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
											          </td>
												<td>What is BIOS (Basic Input and Output Software)?</td>
												<td>
												<select class="form-control m-b" required name="quiz_1">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												
											</tr>
										<tr>
												<td>Professionally appropriate dressing</td>
												<td>
												<select class="form-control m-b" required name="skill_2">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												<td></td>
												<td>
												
												</td>
												
											</tr>
											<tr>
												<td>Voice & Modulation Quality</td>
												<td>
												<select class="form-control m-b" required name="skill_3">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												<td></td>
												<td>
												
												</td>
												
											</tr>
											<tr>
												<td>Diction & Clarity of Speech</td>
												<td>
												<select class="form-control m-b" required name="skill_4">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												<td></td>
												<td>
												
												</td>
												
											</tr>
											<tr>
												<td>Eye Contact</td>
												<td>
												<select class="form-control m-b" required name="skill_5">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												<td></td>
												<td>
												
												</td>
												
											</tr>
											<tr>
												<td>Body Posture</td>
												<td>
												<select class="form-control m-b" required name="skill_6">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												<td></td>
												<td>
												
												
												</td>
												
											</tr>
											<tr>
												<td>Speech Defects (Stutter/ Stammer)</td>
												<td>
												<select class="form-control m-b" required name="skill_7">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												<td></td>
												<td>
												
												</td>
												
											</tr>
											<tr>
												<td>Mother Tongue Influence (MTI)</td>
												<td>
												<select class="form-control m-b" required name="skill_8">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												<td></td>
												<td></td>
												
											</tr>
											<tr>
												<td>Circulates in a class / F2F interaction</td>
												<td>
												<select class="form-control m-b" required name="skill_9">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												<td></td>
												<td></td>
												
											</tr>
											<tr>
												<td>Directly engages the listener by name while asking questions/addressing doubts</td>
												<td>
												<select class="form-control m-b" required name="skill_10">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												<td></td>
												<td></td>
												
											</tr>
											<tr>
												<td>Is not defensive on being challenged / welcomes questions</td>
												<td>
												<select class="form-control m-b" required name="skill_11">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												<td></td>
												<td></td>
												
											</tr>
											<tr>
												<td>Seeks student feedback on understanding and comfort</td>
												<td>
												<select class="form-control m-b" required name="skill_12">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												<td></td>
												<td></td>
												
											</tr>
											<tr>
												<td>Work experience (company quality)</td>
												<td>
												<select class="form-control m-b" required name="skill_13">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												<td></td>
												<td></td>
												
											</tr>
											<tr>
												<td>Work Ex (experience quality)</td>
												<td>
												<select class="form-control m-b" required name="skill_14">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												<td></td>
												<td></td>
												
											</tr>


										</tbody>
									</table>
								</div>


							</div>
						</div>
					</div>