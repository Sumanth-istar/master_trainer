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
												<select class="form-control m-b" required name="a_t_dt_skill_1">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
											          </td>
												<td>Risk & volatility</td>
												<td>
												<select class="form-control m-b" required name="a_t_dt_quiz_1">
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
												<select class="form-control m-b" required name="a_t_dt_skill_2">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												<td>Passing journal entries</td>
												<td>
												<select class="form-control m-b" required name="a_t_dt_quiz_2">
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
												<select class="form-control m-b" required name="a_t_dt_skill_3">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												<td>asset vs expense concept</td>
												<td>
												<select class="form-control m-b" required name="a_t_dt_quiz_3">
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
												<select class="form-control m-b" required name="a_t_dt_skill_4">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												<td>voucher Classfication</td>
												<td>
												<select class="form-control m-b" required name="a_t_dt_quiz_4">
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
												<select class="form-control m-b" required name="a_t_dt_skill_5">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												<td>Service Tax fundas</td>
												<td>
												<select class="form-control m-b" required name="a_t_dt_quiz_5">
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
												<select class="form-control m-b" required name="a_t_dt_skill_6">
											         <option value="1">1</option>
											         <option value="2">2</option>
											         <option value="3">3</option>
											         <option value="4">4</option>
											          <option value="5">5</option></select>
												</td>
												<td>DT fundas</td>
												<td>
												<select class="form-control m-b" required name="a_t_dt_quiz_6">
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
												<td>Tally fundas</td>
												<td>
												<select class="form-control m-b" required name="quiz_7">
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
								
								<div>
								<p>
								
								<p>What are the golden rules ?	</p>			
<p>Ans: Real A/c - Debit what comes in , Credit what goes out</p>
 <p>   Nominal A/c- Debit all expenses/losses, Credit all incomes/gains</p>
 <p>   Personal A/c - debit the receiver , credit the giver</p>			
				
<p>What is the journal entry for purchase of asset?				
<p>Ans: Asset 
          To Bank / Cash</p>				
				
<p>What if the asset is purchased by issue of shares?	</p>			
<p>Ans: Asset 
          To Share capital</p>			
				
<p>If the asset has to be shown at original cost in the balance sheet, what is the depreciation entry to be passed?	</p>			
<p>Ans: Depreciation 
           To Accumulated depreciation 
This accumulated depreciation to be deducted from the original cost of the asset</p>			
				
<p>What is a PO? How important is it?				
<p>Ans: PO is a purchase order. It's an agreement between the buyer and the seller stating the quantity and price of goods 	</p>			
				
<p>Accounting	Service Tax	Direct Taxes	Tally	</p>
<p>Q. If insurance is paid for a period 18 months (Feb 2014-July 2015), paid for in April 2014, how will this be accounted?	Q. What is the service tax? What is negative list?	Q. Can loss from trading be set off against loss from house property?	What is the command for creating a journal voucher?	
<p>A : 12 months of the current period would be an expense. 2 months expense from the previous year would be classified as prior period expense. 4 months paid in advance would be an asset to be expensed next year	"Service tax is tax on services. 
<p>Negative list is a list of services which are not taxable"	

<p>A: No. Trading loss or speculation loss can be set off only against speculation income 	A.Gateway of Tally>Press 'V' (Accounting Vouchers) > Press 'F7' for Journal Voucher	
				
<p>Q: What happens in situtations where VAT &ST are applicable?		Name a few allowances in computation of salary that are taxable	

<p>Q. What are the requisites to account for inventory in Tally?	</p>

<p>Abatement scheme is applied where both VAT & ST are levied on the bill at specific percentages
For instance, restaurants levy VAT on 40% of the food</p>
<p>		Ans: Medical allowance, HRA(Partly exempt), Food allowance (Partly exempt)	"A: 1) Enable accounts with inventory feature (Gateway of Tally >F11)</p>
<p>2) Update units of measure in Inventory Info</p>
<p>3) Update Stock Groups and Stock Items in Inventory Info</p>
<p>4) Enable inventory accounting during ledger creation</p>	
				
		<p>At what rate is LTCG with indexation taxed?	</p>	
		<p>Ans: 20%		</p>
				
	<p>	What is the exemption for conveyance allowance	</p>	
		<p>Ans: INR 1,600 per month	</p>	
				
				
								
								</p>
								
								
								</div>


							</div>
						</div>
					</div>