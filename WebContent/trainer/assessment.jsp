<%@page import="com.istarindia.service.TrainerService"%>
<%@page import="com.istarindia.service.MasterTrainerService"%>
<%@page import="com.istarindia.apps.dao.DBUTILS"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	String url = request.getRequestURL().toString();
	String baseURL = url.substring(0, url.length() - request.getRequestURI().length())
			+ request.getContextPath() + "/";
%>
<%
	int assessment_id = 0;
    int trainer_id =0;
	TrainerService trainerservice = new TrainerService();

	if (request.getParameter("assessment_id") != null) {

		assessment_id = Integer.parseInt(request.getParameter("assessment_id"));

	}
	if (request.getParameter("trainer_id") != null) {

		trainer_id = Integer.parseInt(request.getParameter("trainer_id"));

	}
	
	
	
%>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon"
	href="<%=baseURL %>img/user_images/recruiter_portal_trans_logo.png" />
<title>Talentify</title>

<link href="<%=baseURL %>css/bootstrap.min.css" rel="stylesheet">
<link href="<%=baseURL %>font-awesome/css/font-awesome.css" rel="stylesheet">
<link href="<%=baseURL %>css/animate.css" rel="stylesheet">
<link href="<%=baseURL %>css/style.css" rel="stylesheet">



</head>
<body class="top-navigation" id="">
	<div id="wrapper">
		<%-- <jsp:include page="/navbar.jsp"><jsp:param name="logout_btn" value="add" /> </jsp:include> --%>
		<div id="page-wrapper" class="gray-bg">

			<div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-lg-10">
					<%=trainerservice.getAssessmentForTrainer(assessment_id)%>
				</div>
			</div>

			<div class="wrapper wrapper-content animated fadeInRight">
				<div class="row" style="margin: 5px">
					<div class="row">



						<div style="user-select: none !important;"class="col-lg-12 question_holder">


							<%=trainerservice.getAllQuestionForTrainer(assessment_id)%>
							
						</div>

                </div>
				</div>
			</div>
			<div style="display:none" class="row wrapper border-bottom white-bg page-heading submit_button_div">
				<div class="col-lg-12 text-center">
				<h2>Submit The Assessment</h2>
					<a class="btn btn-primary btn-rounded assessment_status" href="/master_trainer/trainer/trainer_dashboard.jsp?trainer_id=<%=trainer_id%>">Submit</a>
				</div>
			</div>
			<div class="row wrapper border-bottom white-bg page-heading nex_button_div">
				<div class="col-lg-12">
					<button style="    margin: 10px;"class='btn btn-primary pull-right' id='move_fwrd' type='button'>Next</button>
				</div>
			</div>
		</div>
	</div>


	<!-- Mainly scripts -->
	<script src="<%=baseURL %>js/jquery-2.1.1.js"></script>
	<script src="<%=baseURL %>js/bootstrap.min.js"></script>
	<script src="<%=baseURL %>js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="<%=baseURL %>js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

	<!-- Peity -->
	<script src="<%=baseURL %>js/plugins/peity/jquery.peity.min.js"></script>

	<!-- Custom and plugin javascript -->
	<script src="<%=baseURL %>js/inspinia.js"></script>
	<script src="<%=baseURL %>js/plugins/pace/pace.min.js"></script>

	<!-- Rickshaw -->
	<script src="<%=baseURL %>js/plugins/rickshaw/vendor/d3.v3.js"></script>
	<script src="<%=baseURL %>js/plugins/rickshaw/rickshaw.min.js"></script>

<script>
(function (global) {

	if(typeof (global) === "undefined")
	{
		throw new Error("window is undefined");
	}

    var _hash = "!";
    var noBackPlease = function () {
        global.location.href += "#";

		// making sure we have the fruit available for juice....
		// 50 milliseconds for just once do not cost much (^__^)
        global.setTimeout(function () {
            global.location.href += "!";
        }, 50);
    };
	
	// Earlier we had setInerval here....
    global.onhashchange = function () {
        if (global.location.hash !== _hash) {
            global.location.hash = _hash;
        }
    };

    global.onload = function () {
        
		noBackPlease();

		// disables backspace on page except on input fields and textarea..
		document.body.onkeydown = function (e) {
            var elm = e.target.nodeName.toLowerCase();
            if (e.which === 8 && (elm !== 'input' && elm  !== 'textarea')) {
                e.preventDefault();
            }
            // stopping event bubbling up the DOM tree..
            e.stopPropagation();
        };
		
    };

})(window);
</script>

	<script>
		var AssessmentTimer;
		var questionTimer;	
		var nextId;
		$(document).ready(function() {
			
			
		       
		       
			$('.animation_select').click(function() {
				$('#animation_box').removeAttr('class').attr('class', '');
				var animation = $(this).attr("data-animation");
				$('#animation_box').addClass('animated');
				$('#animation_box').addClass(animation);
				return false;
			});

			
			renderQuestions(1, $('.question_timer_1').data('time'));
			
			$( "#move_fwrd" ).click(function() {
				updateData(nextId-1);
				renderQuestions(nextId, $('.question_timer_' + nextId).data('time'));
				
				
			    	
				console.log('on click called');
				});
			
			$( ".assessment_status" ).click(function() {
				
			
				
				var jsp="<%=baseURL%>trainer";
			    	$.post(jsp, 
							{assessment_status:'assessment_status',assessment_id:<%=assessment_id%>,trainer_id:<%=trainer_id%>}, 
							function(data) {
								
							
					});
				
				});
			
			
			
			

		});

		function renderQuestions(question, timeInSec) {
			
			clearTimeout(AssessmentTimer);
			
			var timeInmilliSec = timeInSec * 1000;
			 nextId = question + 1;

			$('.question_' + (question - 1)).css("cssText", "display:none");
			$('.question_' + (question - 1)).removeClass("slideInRight");
			$('.question_' + question).css("cssText", "display:block");
			$('.question_' + question).addClass('slideInRight');
			
			

			updateQuestionTimer(question, timeInmilliSec);
			
			

			AssessmentTimer = setTimeout(function() {
				if ($('.question_' + nextId).html() == undefined) {
					$('.question_holder').css("cssText", "display:none");
					$('.nex_button_div').css("cssText", "display:none");
					$('.submit_button_div').css("cssText", "display:block");
					clearTimeout(AssessmentTimer);
					console.log('stopped chnaged to submit');
					
				} else {
					
					

					var time = $('.question_timer_' + nextId).data('time');
					
					updateData(question);
					
					renderQuestions(nextId, time);
					console.log('called');
					
				}

			}, timeInmilliSec);
			
			
		}

		function updateQuestionTimer(question, timeInmilliSec) {
			
			if(questionTimer!=undefined){
				
				clearInterval(questionTimer);
			}
			questionTimer=setInterval(function() {
				var time = timeInmilliSec - 1000;
				$('.question_timer_' + question).html(
						'Question Time in sec: ' + time / 1000);
				
				if(time!=0){
				updateQuestionTimer(question, time);
				}else{
					$('.nex_button_div').css("cssText", "display:none");
					$('.submit_button_div').css("cssText", "display:block");
				}

			}, 1000);
		}
		
		function updateData(question){
			
			var question_id =$('.question_'+question).attr('id').split('_')[0];
			var selected_ans = $('.question_'+question).find('input:radio[name=optionsRadios]:checked').val();
			var option_num = $('.question_'+question).find('input:radio[name=optionsRadios]:checked').data('option');
			if(selected_ans === undefined && option_num === undefined){
				selected_ans ="skipped";
				option_num ="skipped";
			}
			
			var jsp="<%=baseURL%>trainer";
		    	$.post(jsp, 
						{selected_ans:selected_ans,option_num:option_num,assessment_id:<%=assessment_id%>,question_id:question_id,trainer_id:<%=trainer_id%>}, 
						function(data) {
							
							//alert('Submit')
				});
		}
		
		
		
		
		
		
		
	</script>
</html>