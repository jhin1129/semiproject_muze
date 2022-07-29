package com.muze.mvc.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.muze.mvc.common.util.FileRename;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/board/imageupload")
public class BoardImgUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardImgUploadServlet() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> map = new HashMap<>();
		String path = getServletContext().getRealPath("/resources/upload/board/temporary");
		int maxSize = 10485760;
		String encoding = "UTF-8";
		String fileName = "";
		
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());
		Enumeration files = mr.getFileNames();
		String file = (String)files.nextElement();
		fileName = mr.getFilesystemName(file);
		
		path = request.getContextPath() + "/resources/upload/board/temporary/" + fileName;
		
		map.put("url", path);
		
		response.setContentType("application/json;charset=UTF-8");
		
		new Gson().toJson(map,response.getWriter());
		
	}

}
