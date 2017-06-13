package com.istarindia.auth;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.istarindia.apps.dao.DBUTILS;
import com.istarindia.apps.dao.IstarCoordinator;
import com.istarindia.apps.dao.IstarUser;
import com.istarindia.apps.dao.IstarUserDAO;
import com.istarindia.apps.dao.OrgAdmin;
import com.istarindia.apps.dao.PlacementOfficer;
import com.istarindia.apps.dao.Recruiter;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long time = System.currentTimeMillis();
		DBUTILS db = new DBUTILS();
		request.getSession().removeAttribute("user");
		if (request.getParameterMap().containsKey("email") && request.getParameterMap().containsKey("password")) {
			System.out.println("Email -> " + request.getParameter("email"));
			System.out.println("Password -> " + request.getParameter("password"));
			try {
				IstarUserDAO dao = new IstarUserDAO();
				IstarUser user = dao.findByEmail(request.getParameter("email")).get(0);
				if (user.getPassword().equalsIgnoreCase(request.getParameter("password"))) {
					 request.getSession().setMaxInactiveInterval(7200000);
					//request.getSession().setAttribute("user", user);

					System.out.println("User logged in. ID -> " + user.getId());
					System.out.println("User logged in. Type -> " + user.getUserType());
					String url = "";
					Boolean is_master = false;
				

					 if (user.getUserType().equalsIgnoreCase("TRAINER")) {
						 
						 request.getSession().setAttribute("trainerID", user.getId());
						 String trainer_sql = "SELECT is_master FROM student WHERE id ="+user.getId();
							
							System.out.println(trainer_sql);
							List<HashMap<String, Object>> data = db.executeQuery(trainer_sql);

							if (data.size() > 0) {
								for (HashMap<String, Object> row : data) {
								is_master = (Boolean)row.get("is_master");
									
								}
								if(is_master !=null && is_master == true){
									System.err.println(is_master);
									url="/master_trainer/master_tariner_dashboard.jsp";
								}else{
									
									url="/trainer/trainer_dashboard.jsp";
								}
								
							}

						
					}else if(user.getUserType().equalsIgnoreCase("STUDENT")){
						
                         request.getSession().setAttribute("trainerID", user.getId());
						 
						System.err.println(is_master);
						url="/trainer/trainer_dashboard.jsp";
					}

					 else if (user.getUserType().equalsIgnoreCase("ISTAR_COORDINATOR")) {

						 request.getSession().setAttribute("coordinatorID", user.getId());
						url="/coordinator/coordinator_dashboard.jsp";

					} 
					System.out.println(url);
					request.getRequestDispatcher(url).forward(request, response);
					

				} else {
					request.setAttribute("msg", "Wrong Username or password");
					request.getRequestDispatcher("/index.jsp").forward(request, response);
				}
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("msg", "Missing Username or password");
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			}
		} else {

			System.err.println("9111");
			request.setAttribute("msg", "Missing Username or password");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
