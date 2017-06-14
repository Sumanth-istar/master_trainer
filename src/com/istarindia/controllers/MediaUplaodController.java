package com.istarindia.controllers;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.istarindia.apps.dao.DBUTILS;

@WebServlet("/media_uplaod")
public class MediaUplaodController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static File uploadFolder;
	String fileUploadPath;
	String fileUrl;

	public MediaUplaodController() {
		super();

	}

	@Override
	public void init(ServletConfig config) {

		try {
			Properties properties = new Properties();
			String propertyFileName = "app.properties";
			InputStream inputStream = getClass().getClassLoader().getResourceAsStream(propertyFileName);
			if (inputStream != null) {
				properties.load(inputStream);
			} else {
				throw new FileNotFoundException("property file '" + propertyFileName + "' not found in the classpath");
			}
			fileUploadPath = properties.getProperty("mediaPath");
			//fileUrl = "resume_url/";
		} catch (Exception e) {
			//fileUploadPath = "/var/www/html/";
			e.printStackTrace();
		}

		 System.out.println("Creating fileUploadPath: " + fileUploadPath);
		 System.out.println(" fileUrl: " + fileUrl);
		uploadFolder = new File(fileUploadPath);
		// System.out.println("Folder Created for image upload");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		DBUTILS db = new DBUTILS();
		String image_canvas1 = "";
		String triner_id = "";
		if (!ServletFileUpload.isMultipartContent(request)) {
			throw new IllegalArgumentException(
					"Request is not multipart, please 'multipart/form-data' enctype for your form.");
		}

		ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());

		List<FileItem> items = null;
		try {
			items = uploadHandler.parseRequest(request);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}

		for (FileItem item : items) {
			
			if (!item.isFormField()) {
				
				System.out.println("item name --" + item.getFieldName());
				// System.out.println(item.getString());
				String fileExtension = "";
				boolean is_image = false;
				if (item.getName().toString().toLowerCase().endsWith(".png")) {
					fileExtension = ".png";
					is_image = true;
				} else if (item.getName().toString().toLowerCase().endsWith(".jpg")) {
					fileExtension = ".jpg";
					is_image = true;
				} else if (item.getName().toString().toLowerCase().endsWith(".jpeg")) {
					fileExtension = ".jpeg";
					is_image = true;
				} else if (item.getName().toString().toLowerCase().endsWith(".pdf")) {
					fileExtension = ".pdf";
					is_image = true;
				} else if (item.getName().toString().toLowerCase().endsWith(".doc")) {
					fileExtension = ".doc";
					is_image = true;
				} else if (item.getName().toString().toLowerCase().endsWith(".docs")) {
					fileExtension = ".docs";
					is_image = true;
				} else if (item.getName().toString().toLowerCase().endsWith(".docx")) {
					fileExtension = ".docx";
					is_image = true;
				}
				
				
				if (!fileExtension.trim().isEmpty()) {
					System.out.println("The file is an Image or pfd");
					// System.out.println(item.getFieldName());
					if (is_image) {
						image_canvas1 = uploadPersonalImage(item, fileExtension);
						System.out.println(image_canvas1);
						
						
					}
				}
			}else if (item.getFieldName().equalsIgnoreCase("triner_id")) {
				triner_id = item.getString();
				System.out.println(triner_id);
			}
			
			
		}
		if(!triner_id.equalsIgnoreCase("") && !image_canvas1.equalsIgnoreCase("")){
		String sql = "UPDATE student_profile_data SET  resume_url = '"+image_canvas1+"' WHERE student_id = '"+triner_id+"';";
		System.out.println(sql);
		 db.executeUpdate(sql);
		}
		
		
	}

	private String uploadPersonalImage(FileItem item, String fileExtension) {
		String innerDirectory = "";
		
			innerDirectory = "resume_url/";
		

		if (!uploadFolder.exists()) {
			uploadFolder.mkdir();
		}

		File innerDir = new File(uploadFolder, innerDirectory);

		if (!innerDir.exists()) {
			innerDir.mkdir();
		}

		UUID uuidName = UUID.randomUUID();
		File imageFile = new File(innerDir, uuidName.toString() + fileExtension);
		String imageURL = "";
		try {
			item.write(imageFile);
			imageURL = "video/" + innerDirectory + uuidName + fileExtension;
			System.out.println("Absolute Path id: " + imageFile.getAbsoluteFile());
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(imageURL);

		return imageURL;
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
