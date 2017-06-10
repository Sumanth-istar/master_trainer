package com.istarindia.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.istarindia.apps.dao.DBUTILS;

@WebServlet("/master_trainer_comments")
public class MasterTrainerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MasterTrainerController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		DBUTILS db = new DBUTILS();
		String comment = "";
		String courseids = "";
		String is_tariner_selected = "";
		String interview_status = "";
		
		int mastertrainer_id = 0;
		int trainer_id = 0;
		if (request.getParameter("comment") != null || request.getParameter("courseid") != null
				|| request.getParameter("is_tariner_selected") != null) {

			mastertrainer_id = Integer.parseInt(request.getParameter("mastertrainer_id"));
			trainer_id = Integer.parseInt(request.getParameter("trainer_id"));

			comment = request.getParameter("comment") != null ? request.getParameter("comment") : "";
			
			courseids = request.getParameter("courseid") != null ? request.getParameter("courseid") : "";
			
			is_tariner_selected = request.getParameter("is_tariner_selected") != null
					? request.getParameter("is_tariner_selected") : "f";
			
					interview_status = request.getParameter("interview_status") != null
							? request.getParameter("interview_status") : "f";


			String check_isexists = "DELETE FROM 	master_trainer_feedback WHERE  master_trainer_feedback.trainer_id ="
					+ trainer_id;
			db.executeUpdate(check_isexists);

			check_isexists = "DELETE FROM trainer_skill WHERE trainer_id =" + trainer_id;
			db.executeUpdate(check_isexists);

			/*String feedback_sql = "INSERT INTO master_trainer_feedback (id, master_trainer_id, comment, is_selected,trainer_id) VALUES ((select COALESCE(max(id),0)+1 from master_trainer_feedback), "
					+ mastertrainer_id + ", '" + comment + "', " + is_tariner_selected + "," + trainer_id + ");";*/

			String feedback_sql = "INSERT INTO master_trainer_feedback ( 	ID, 	master_trainer_id, 	COMMENT, 	is_selected, 	trainer_id, 	interview_status ) VALUES 	( 		(select COALESCE(max(id),0)+1 from master_trainer_feedback), 		"+mastertrainer_id+", 		'"+comment+"', 		"+is_tariner_selected+", 		"+trainer_id+",  "+interview_status+" 	);";
			
			db.executeUpdate(feedback_sql);

			if (!courseids.equalsIgnoreCase("")) {

				String[] words = courseids.split(",");

				for (String courseid : words) {

					String trainerskill_sql = "INSERT INTO trainer_skill (id, trainer_id, course_skill) VALUES ((select COALESCE(max(id),0)+1 from trainer_skill), "
							+ trainer_id + ", " + Integer.parseInt(courseid.trim()) + ");";

					db.executeUpdate(trainerskill_sql);

				}
			}

		}

		response.getWriter().append("");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
