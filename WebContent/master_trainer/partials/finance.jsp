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
<div class="col-lg-6">
								<div class="table-responsive">
									<div class="table-responsive">
									<table
										class="table table-striped table-bordered table-hover dataTables-example">
										<thead>
											<tr>
											    <th>Soft Skills</th>
												<th>Rating (1- 5)</th>
												
											</tr>
										</thead>
										<tbody>
									

											<tr>
												<td>Grooming</td>
												<td>
												<select class="form-control m-b" required name="f_skill_1">
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
												<select class="form-control m-b" required name="f_skill_2">
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
												<select class="form-control m-b" required name="f_skill_3">
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
												<select class="form-control m-b" required name="f_skill_4">
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
												<select class="form-control m-b" required name="f_skill_5">
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
												<select class="form-control m-b" required name="f_skill_6">
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
												<select class="form-control m-b" required name="f_skill_7">
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
												<select class="form-control m-b" required name="f_skill_8">
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
												<select class="form-control m-b" required name="f_skill_9">
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
												<select class="form-control m-b" required name="f_skill_10">
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
												<select class="form-control m-b" required name="f_skill_11">
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
												<select class="form-control m-b" required name="f_skill_12">
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
												<select class="form-control m-b" required name="f_skill_13">
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
												<select class="form-control m-b" required name="f_skill_14">
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
								</div></div>
								<div class="col-lg-6">
								<div class="table-responsive">
									<div class="table-responsive">
									<table
										class="table table-striped table-bordered table-hover dataTables-example">
										<thead>
											<tr>
											    
												<th>Quiz the candidate on these topics:</th>
												<th>Rating (1- 5)</th>
												
												
											</tr>
										</thead>
										<tbody>
									

											<tr>
												
												<td>Risk & volatility</td>
												<td>
												<select class="form-control m-b" required name="f_quize_1">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												
											</tr>
										<tr>
												
												<td>Risk = standard deviation</td>
												<td>
												<select class="form-control m-b" required name="f_quize_2">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												
											</tr>
											<tr>
												
												<td>Equity concept</td>
												<td>
												<select class="form-control m-b" required name="f_quize_3">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												
											</tr>
											<tr>
												
												<td>Debt concept</td>
												<td>
												<select class="form-control m-b" required name="f_quize_4">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												
											</tr>
											<tr>
												
												<td>Appropriate use of debt vs equity</td>
												<td>
												<select class="form-control m-b" required name="f_quize_5">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												
											</tr>
											<tr>
												
												<td>Types of equity</td>
												<td>
												<select class="form-control m-b" required name="f_quize_6">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												
											</tr>
											<tr>
												
												<td>Types of debt</td>
												<td>
												<select class="form-control m-b" required name="f_quize_7">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												
											</tr>
											<tr>
												
												<td>Risk rating agencies and rating awareness</td>
												<td>
												<select class="form-control m-b" required name="f_quize_8">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												
											</tr>
											<tr>
												
												<td>Types of risk and relationship to valuation</td>
												<td>
												<select class="form-control m-b" required name="f_quize_10">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												
											</tr>
											<tr>
												
												<td>Understands DCF concept, WACC concept</td>
												<td>
												<select class="form-control m-b" required name="f_quize_10">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												
											</tr>
											<tr>
												
												<td>Cash flow concepts</td>
												<td>
												<select class="form-control m-b" required name="f_quize_11">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												
											</tr>
											<tr>
												
												<td>Knows some relative valuation metrics (PE / PEG etc)</td>
												<td>
												<select class="form-control m-b" required name="f_quize_12">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												
											</tr>
											<tr>
												
												<td>Can read a financial newspaper markets page</td>
												<td>
												<select class="form-control m-b" required name="f_quize_13">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												
											</tr>
											<tr>
												
												<td>Futures/forward concept</td>
												<td>
												<select class="form-control m-b" required name="f_quize_14">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												
											</tr>
											<tr>
												
												<td>Futures/forward concept</td>
												<td>
												<select class="form-control m-b" required name="f_quize_14">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												
											</tr>
											<tr>
												
												<td>Call option</td>
												<td>
												<select class="form-control m-b" required name="f_quize_15">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												
											</tr>
											<tr>
												
												<td>Put Option</td>
												<td>
												<select class="form-control m-b" required name="f_quize_16">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												
											</tr>
											<tr>
												
												<td>Payoff Diagrams and derivative structuring for defined payoff </td>
												<td>
												<select class="form-control m-b" required name="f_quize_17">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												
											</tr>
											<tr>
												
												<td>Options and volatility</td>
												<td>
												<select class="form-control m-b" required name="f_quize_18">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												
											</tr>
											<tr>
												
												<td>Value at Risk</td>
												<td>
												<select class="form-control m-b" required name="f_quize_19">
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
								</div></div>
								<div>
								
								<p>Q: What is the difference between risk and uncertainty?</p>
<p>A : the financial aspect involved in risk</p>

<p>Q: How do you distinguish between equity and debt? Which is riskier?</p>
<p>A :equity - riskier</p>

<p>Q: How is risk measured?</p>
<p>A: Beta / Std deviation</p>

<p>Q: When should a company decide to restructure?</p>
<p>A: Net worth erosion point</p>

<p>Q: What factors would you consider before choosing a MF?</p>
<p>Past performance, NAV, size of fund, timing (market) age of the fund, fund mngr </p>

<p>Q: What is PE ratio? WHy is it used?</p>
<p>Price equity ratio- risk levels of the business</p>

<p>Q: What is a forward contract?</p>
<p>FC is an instrument for hedging - agreement to buy / sell asset at a pre set rate - future date</p>

<p>Q: What is the difference between operating revenue and other income of a Company? Can you state an example for a real estate company?</p>
<p>Operating revenue is the revenue from the direct business and any other revenue is other revenue. For a real estate company - Sale of flats is operating revenue, sale of fixed assets - other income</p>

<p>Q: With regard to depreciation, what should a company disclose in its notes to accounts?</p>
<p>Accounting policy, useful life of assets</p>

<p>Q: In a cash flow statement, how are the following items adjusted?</p>
<p>Increase in current assets - reduced</p>
<p>Increase in current liabilities - added</p>

<p>Q: How is the cost of materials consumed ratio computed?</p>
<p>Cost of materials consumed/sales X 100</p>
								
								</div>


							</div>
						</div>
					</div>