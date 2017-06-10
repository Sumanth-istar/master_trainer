<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%><div class="row border-bottom white-bg">
	<%
		try {
		String url = request.getRequestURL().toString();
		String baseURL = url.substring(0, url.length() - request.getRequestURI().length())
				+ request.getContextPath() + "/";
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
				+ path + "/";
	%>
	<%
	String logout_diaplay = "display: none;";
	String login_diaplay = "display: block;";
	if(request.getParameter("logout_btn")!=null){
		
		String	logout_btn =request.getParameter("logout_btn");
		if(logout_btn.equalsIgnoreCase("add")){
			logout_diaplay = "display: block;";
			login_diaplay = "display: none;";
		}
		
	}
	
	
	%>
	
	<nav class="navbar navbar-static-top" role="navigation">
		<div class="navbar-header">
			<button aria-controls="navbar" aria-expanded="false"
				data-target="#navbar" data-toggle="collapse"
				class="navbar-toggle collapsed" type="button">
				<i class="fa fa-reorder"></i>
			</button>
			<a href="" class="navbar-brand">Talentify</a>
		</div>
		<div class="navbar-collapse collapse" id="navbar">
			<ul class="nav navbar-nav" style="float: right;">
				<ul class="nav navbar-top-links navbar-right" >
				<li><a style="<%=logout_diaplay %>" id="logoutLink" href="<%=baseURL%>index.jsp">
						<i class="fa fa-sign-out"></i> Log out
				</a><a style="<%=login_diaplay %>" id="logoutLink" href="<%=baseURL%>index.jsp">
						<i class="fa fa-sign-out"></i> Login
				</a></li>
			</ul></ul>
		</div>
	</nav></div>
	<% 
		} catch (Exception e) {
			System.out.println("User is not logged in! Redirecting to Index");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	 %>