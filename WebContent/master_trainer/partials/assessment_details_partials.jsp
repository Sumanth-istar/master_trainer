<%@page import="com.istarindia.apps.dao.DBUTILS"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<style>
/*tree related  */
.custom_bg {
	background-color: #eef2f4 !important;
	border-color: #eef2f4 !important;
}
</style>

<%
String question_text = null;
int question_id =0;
String total_question= null;
String user_name =null;
String total_correctquestion =null;
String options_text = null;
int marking_scheme =0;
int mastertrainer_id =0 ;
DBUTILS db = new DBUTILS();
if(request.getParameter("assessment_id")!=null && request.getParameter("s_id")!=null){
	
	mastertrainer_id = Integer.parseInt(request.getParameter("mastertrainer_id"));
	
	String totalans_sql="SELECT 	student.NAME, 	CAST ( 		COUNT (*) FILTER (  			WHERE 				student_assessment.correct = 't' 		) AS VARCHAR 	) AS totalcorrectquestion, 	CAST (COUNT(*) AS VARCHAR) AS totalquestion FROM 	student_assessment, 	student WHERE 	student_assessment.student_id = student. ID AND student_assessment.assessment_id = "+Integer.parseInt(request.getParameter("assessment_id"))+" AND student. ID = "+Integer.parseInt(request.getParameter("s_id"))+" GROUP BY student.NAME";
	
List<HashMap<String, Object>> data4 = db.executeQuery(totalans_sql); 
	
	if (data4.size() > 0) {
		
		for (HashMap<String, Object> row4 : data4) {
			user_name = (String)row4.get("name");
			total_question = (String)row4.get("totalquestion");
		    total_correctquestion = (String)row4.get("totalcorrectquestion");
		
		}
		}
	%>
<a class="list-group-item active">
	<h3 class="list-group-item-heading"><%=user_name %>
		Has Scored
		<%=total_correctquestion%>
		Out Of
		<%=total_question %>
		Question
	</h3>
</a>
<div class="ibox-content">

	<div class="row">
		<% 
	String question_sql = "SELECT question.id, question.question_text FROM assessment_question,question WHERE assessment_question.questionid = question.id AND assessment_question.assessmentid ="+Integer.parseInt(request.getParameter("assessment_id"));
	List<HashMap<String, Object>> data = db.executeQuery(question_sql);
	 if (data.size() > 0) {
		 int i=1;
	
	for (HashMap<String, Object> row : data) {
		
		question_text = (String)row.get("question_text");
		question_id = (int)row.get("id");
		
		
		
		%>
		<div class="col-lg-12 row p-lg product-box ibox-content"
			style="margin-bottom: 10px;">
			<div class="m-t-sm m-l-sm">
				<span class="badge badge-info"><%=i++ %></span>

			</div>
			<h3 style="margin: 10px;">
				<strong class="m-l-sm" id="<%=question_id%>"><p><%=question_text.replaceAll("style=\"width:100%\"", "style=\"width:30%\"") %></p>
				</strong>
			</h3>

			<%
	int userselectedoption = 0;
	String student_sql ="SELECT correct,option1,option2,option3,option4,option5 FROM student_assessment WHERE student_assessment.assessment_id = "+Integer.parseInt(request.getParameter("assessment_id"))+" AND student_assessment.question_id = "+question_id+" AND student_assessment.student_id="+Integer.parseInt(request.getParameter("s_id"));
	
	List<HashMap<String, Object>> data2 = db.executeQuery(student_sql); 
	
	if (data2.size() > 0) {
		
		
		
		if (!data2.get(0).get("correct").toString().equalsIgnoreCase("true")){
			
			userselectedoption = -1;
			
			for (HashMap<String, Object> row2 : data2) {
				
if (row2.get("option1").toString().equalsIgnoreCase("true")){
	userselectedoption = 1;		
}
if (row2.get("option2").toString().equalsIgnoreCase("true")){
	userselectedoption = 2;	
}
if (row2.get("option3").toString().equalsIgnoreCase("true")){
	userselectedoption = 3;	
}
if (row2.get("option4").toString().equalsIgnoreCase("true")){
	userselectedoption = 4;	
}

			
			}
			
		}
		
	}
	
		String options_sql = "SELECT assessment_option.id,assessment_option.text,assessment_option.marking_scheme FROM assessment_option WHERE assessment_option.question_id ="+question_id+"ORDER BY assessment_option.id";
		
		List<HashMap<String, Object>> data1 = db.executeQuery(options_sql);
		 if (data1.size() > 0) {
			 int j=0;
			 %>
			<div class="m-t-sm m-l-sm">
				<%
				for (HashMap<String, Object> row1 : data1) {
					
					options_text = (String)row1.get("text");
					marking_scheme = (int)row1.get("marking_scheme");
					
					%>

				<div
					class="<%=marking_scheme==0?"alert custom_bg":"alert alert-success"%>">
					<b><p><%=options_text %></p></b>
				</div>

				<%
				
				}if(userselectedoption != 0){
					
					if(userselectedoption != -1){
						
						%>
				<div class="alert alert-danger">
					<b>Answered By User: <%=(data1.get(userselectedoption-1).get("text")).toString().replaceAll("<p>", "").replaceAll("</p>", "") %></b>
				</div>


				<%
						
					}else{
						
						%>

				<div class="alert alert-warning">
					<b><p>User Skipped This Question</p></b>
				</div>


				<%
					}
					
				}
				%>

			</div>
			<%
		 }
		 %>
		</div>
		<%
	}
	
}
		
 
	 
	 
	 
	
}


%>
	</div>
</div>