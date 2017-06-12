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
												<td>Types of research</td>
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
												<td>research design</td>
												<td>
												<select class="form-control m-b" required name="quiz_2">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
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
												<td>research process</td>
												<td>
												<select class="form-control m-b" required name="quiz_3">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
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
												<td>sampling techniques</td>
												<td>
												<select class="form-control m-b" required name="quiz_4">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
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
												<td>methods of data collection</td>
												<td>
												<select class="form-control m-b" required name="quiz_5">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
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
												<td>difference between primary and secondary research</td>
												<td>
												<select class="form-control m-b" required name="quiz_6">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												
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
												<td>
												
												</td>
												
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
												<td>
												
												</td>
												
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
												<td>
												
												
												</td>
												
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
												<td>
												
												</td>
												
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
												<td> </td>
												<td>
												
												
												</td>
												
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
												<td>
												
												</td>
												
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
												<td>
												
												</td>
												
											</tr>


										</tbody>
									</table>
								</div>
								<div>
								<p>Q: Differences between qualitative and quantitative market research
<p>A: Qualitative
To gain an understanding of underlying reasons and motivations
To provide insights into the setting of a problem, generating ideas and/or hypotheses for later quantitative research
To uncover prevalent trends in thought and opinion
Unstructured or semi-structured techniques e.g. individual depth interviews or group discussions.
Quantitative
To quantify data and generalize results from a sample to the population of interest
To measure the incidence of various views and opinions in a chosen sample
Sometimes followed by qualitative research which is used to explore some findings further
Structured techniques such as online questionnaires, on-street or telephone interviews.</p>
<p>Q: How do you begin your research? (Research process)</p>
<p>A: Identify the Problem
Review the Literature
Clarify the Problem
Clearly Define Terms and Concepts
Define the Population
Develop the Instrumentation Plan
Collect Data
Analyze the Data</p>
<p>Q: What are focus groups?</p>
<p>A: A focus group could be defined as a group of interacting individuals having some common interest or characteristics, brought together by a moderator, who uses the group and its interaction as a way to gain information about a specific or focused issue.</p>
<p>A focus group is typically 8-12 people who are unfamiliar with each other. These participants are selected because they have certain characteristics in common that relate to the topic of the focus group. The moderator or interviewer creates a permissive and nurturing environment that encourages different perceptions and points of view, without pressuring participants to vote, plan or reach consensus</p>
<p>Q: What are the methods of collecting primary data?</p>
<p>A: Observation method, Interview method (personal, telephonic), Questionnaire method, and Schedule method</p>
<p>Q: What is the difference between Structured and Unstructured observation?
<p>A: Structured observation works according to a plan and involves specific information of the units that are to be observed and also about the information that is to be recorded. The operations that are to be observed and the various features that are to be noted or recorded are decided well in advance. Such observations involve the use of especial instruments for the purpose of data collection that are also structured in nature. 
But in the case of the unstructured observation, its basics are diametrically against the structured observation. In such observation, observer has the freedom to note down what he or she feels is correct and relevant to the point of study and also this approach of observation is very suitable in the case of exploratory research.</p>
<p>Q: What is the difference between primary and secondary research?</p>
<p>A: primary research is original research conducted by you (or someone you hire) to collect data specifically for your current objective.  You might conduct a survey, run an interview or a focus group, observe behavior, or do an experiment. Time consuming and expensive, more reliable
secondary research involves searching for existing data that was originally collected by someone else. You might look in journals, libraries, or census data. Less time consuming and less expensive. Less reliable</p>
<p>Q: What are the types of sampling?
<p>A: I. Probability Sampling- Simple Random, Systematic, Cluster, and Stratified
II. Non-Probability Sampling- Convenience, Judgement sampling, quota sampling, snowball sampling</p>
<p>Q: What is a consumer panel?</p>
<p>A: a group of consumers who report on products they have used so that the manufacturers can improve them or use what the panel says about them in advertising.</p>
<p>Q: What is test marketing?</p>
<p>A: Test marketing is a tool used by companies to provide insight into the probable market success of a new product, or effectiveness of a marketing campaign. Test marketing can be used by a business to evaluate factors </p>
<p>Q: What is a hypothesis? Give an example of a hypothesis.</p>
<p>A: A hypothesis is a tentative statement about the relationship between two or more variables. A hypothesis is a specific, testable prediction about what you expect to happen in your study. 
For example, a study designed to look at the relationship between sleep deprivation and test performance might have a hypothesis that states, ""This study is designed to assess the hypothesis that sleep deprived people will perform worse on a test than individuals who are not sleep deprived.</p>
								
								</div>


							</div>
						</div>
					</div>