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
												<select class="form-control m-b" required name="sm_skill_1">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
											          </td>
												<td>Strategic Planning</td>
												<td>
												<select class="form-control m-b" required name="sm_quiz_1">
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
												<select class="form-control m-b" required name="sm_skill_2">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												<td>-Porter's 5 forces</td>
												<td>
												<select class="form-control m-b" required name="sm_quiz_2">
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
												<select class="form-control m-b" required name="sm_skill_3">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												<td>-GE nine cell matrix</td>
												<td>
												<select class="form-control m-b" required name="sm_quiz_3">
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
												<select class="form-control m-b" required name="sm_skill_4">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												<td>-BCG matrix</td>
												<td>
												<select class="form-control m-b" required name="sm_quiz_4">
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
												<select class="form-control m-b" required name="sm_skill_5">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												<td>-SWOT analysis</td>
												<td>
												<select class="form-control m-b" required name="sm_quiz_5">
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
												<select class="form-control m-b" required name="sm_skill_6">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												<td>Marketing strategies</td>
												<td>
												<select class="form-control m-b" required name="sm_quiz_6">
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
												<select class="form-control m-b" required name="sm_skill_7">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												<td>-PLC</td>
												<td>
												<select class="form-control m-b" required name="sm_quiz_7">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												
											</tr>
											<tr>
												<td>Mother Tongue Influence (MTI)</td>
												<td>
												<select class="form-control m-b" required name="sm_skill_8">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												<td>Pricing strategies</td>
												<td>
												<select class="form-control m-b" required name="sm_quiz_8">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												
											</tr>
											<tr>
												<td>Circulates in a class / F2F interaction</td>
												<td>
												<select class="form-control m-b" required name="sm_skill_9">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												<td>Bases for market segmentation</td>
												<td>
												<select class="form-control m-b" required name="sm_quiz_9">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												
											</tr>
											<tr>
												<td>Directly engages the listener by name while asking questions/addressing doubts</td>
												<td>
												<select class="form-control m-b" required name="sm_skill_10">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												<td>Buyer Behavior</td>
												<td>
												<select class="form-control m-b" required name="sm_quiz_10">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												
												</td>
												
											</tr>
											<tr>
												<td>Is not defensive on being challenged / welcomes questions</td>
												<td>
												<select class="form-control m-b" required name="sm_skill_11">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												<td>- Decision making process</td>
												<td>
												<select class="form-control m-b" required name="sm_quiz_11">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												
											</tr>
											<tr>
												<td>Seeks student feedback on understanding and comfort</td>
												<td>
												<select class="form-control m-b" required name="sm_skill_12">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											         <option value="5">5</option></select>
												</td>
												<td>Marketing concepts</td>
												<td>
												<select class="form-control m-b" required name="sm_quiz_12">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												
												</td>
												
											</tr>
											<tr>
												<td>Work experience (company quality)</td>
												<td>
												<select class="form-control m-b" required name="sm_skill_13">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												<td>-Customer lifetime value</td>
												<td>
												<select class="form-control m-b" required name="sm_quiz_13">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												
											</tr>
											<tr>
												<td>Work Ex (experience quality)</td>
												<td>
												<select class="form-control m-b" required name="sm_skill_14">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												<td>Marketing communication mix</td>
												<td>
												<select class="form-control m-b" required name="sm_quiz_14">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												
											</tr>


										</tbody>
									</table>
								</div>
<div>

<b>Porter's 5 forces	</b>
<p>What are the 5 forces of Porter's model?	</p>
<p>What conditions increase the threat of substitutes?	</p>
<p>Explain how bargaining power of suppliers will have an impact on the organization?	</p>
<b>GE nine cell matrix	</b>
<p>What decisions does the GE model help an organization to take?</p>	
	
	
<b>Strategic Planning	</b>
<p>Q: What is the Porter’s five force analysis used for?</p>	
<p>A: Is a framework that attempts to analyse the level of competition within an industry and business strategy development.</p>	
	
<p>Q: What are the five forces in the model?</p>	
<p>A: Threat of new entrants, Threat of substitute products or services, Bargaining power of customers (buyers), Bargaining power of suppliers and Threat of established rivals (competitors)	</p>
	
<p>Q: When would you use this model?	</p>
<p>A: While making a qualitative evaluation of a firm's strategic position. It is used at a line of business level. If it effective and useful is another discussion?	</p>
	
<p>Q: Your comments and the effectiveness of the BCG matrix. What kind of a company can use the BCG matrix?	</p>
<p>A: Look at confidence and practical applicability.	</p>
	
<p>Q: What is the use of the BCG matrix?	</p>
<p>A: It helps is managing the cash flow and tracking cash usage of product, services and business units.	</p>
	
<p>Q: Why is a SWOT analysis so important?	</p>
<p>A: This analysis allows multidimensional thinking. It helps play the role of the devil’s advocate where there is non present.</p>	
	
<p>Q: SWOT analysis in industries. Your Comments?	</p>
<p>A: I don't know if it is being used, however I feel that it is very important that it must be used. Look at confidence and level of conviction on the for or against point.	</p>
	
	
<b>Marketing strategies</b>	
<p>Q Product life cycle stages.	</p>
<p>A. Introduction / growth / maturity / decline.	</p>
	
<p>Q. Examples of products in these various stages.	</p>
<p>A. Introduction - 3D TVs / Growth - Blueray discs/DVR / Maturity - DVD / Decline - Video cassette. Any example with a good justification will be fine.</p>	
	
<p>Q. What are business decision that need to be taken in the maturity stage?	</p>
<p>A. If the product must be continued or discontinued when this stage ends. How to prevent a decline. Re think, re brand etc.	</p>
	
<p>Q. Why must we re- think a product in the maturity stage and not in the decline stage.	</p>
<p>A. Because by then its just too late to do anything useful.</p>	
	
	
<p>Q: Name some types of pricing techniques?</p>	
<p>A: Markup pricing, Target- return pricing, Perceived- value pricing, Going- rate pricing, Psychological pricing	</p>
<p>Target return pricing --	You start with a rate of return objective, like 5% of invested capital, or 10% of sales revenue. Then you arrange your price structure so as to achieve these target rates of return.</p>
<p>Perceived- value pricing --	The valuation of good or service according to how much consumers are willing to pay for it, rather than upon its production and delivery costs.</p>
<p>Going- rate pricing	-- The Going-Rate Pricing is a method adopted by the firms wherein the product is priced as per the rates prevailing in the market especially on par with the competitors.</p>
<p>Psychological pricing --	Psychological pricing (also price ending, charm pricing) is a pricing/marketing strategy based on the theory that certain prices have a psychological impact. Retail prices are often expressed as "odd prices": a little less than a round number, e.g. Rs.999 or Rs.699. Consumers tend to perceive "odd prices" as being significantly lower than they actually are, tending to round to the next lowest monetary unit. Thus, prices such as Rs.199 are associated with spending Rs.100 rather than Rs.200</p>
<p>Discriminatory pricing --	Price discrimination is a microeconomic pricing strategy where identical or largely similar goods or services are transacted at different prices by the same provider in different markets. It is also used to describe the practice of charging different prices to different buyers for the same quality and quantity of a product</p>
	
<p>Q: What should be kept in mind while doing discriminatory pricing?	</p>
<p>A: This type of pricing should be done in such a way that customers feel it is fair	</p>
	
<p>Q: What are the bases for market segmentation?	</p>
<p>A: Geographic, Demographic, Psychographic, Behaviouristic, Social, Socio-economic etc.	</p>
	
<p>Q: What is the consumer decision making process	</p>
<p>A: (1) Need Recognition, (2) Information search (3) Evaluation of alternatives (4) Purchase (5) Post- purchase evaluation	</p>
	
<p>Q: What is customer life time value?	</p>
<p>A: CLV (Customer Lifetime Value) is a prediction of all the value a business will derive from their entire relationship with a customer.	</p>
	
<p>Q: What is marketing communication mix?	</p>
<p>A: It is the specific mix of advertising, personal selling, sales promotion, public relations, and direct marketing a company uses to pursue its advertising and marketing objectives.</p>	

</div>

							</div>
						</div>
					</div>