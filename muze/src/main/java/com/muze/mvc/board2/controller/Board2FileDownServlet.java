package com.muze.mvc.board2.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/support/filedown")
public class Board2FileDownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Board2FileDownServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oname = request.getParameter("oname");
		String rname = request.getParameter("rname");

		System.out.println(oname + ", " + rname);
		
		// 1. 클라이언트로 전송할 파일의 경로와 파일명을 가져옴 슬래시 하나(+"/")면 / 둘(+"//")이면 역슬래시(\)로 출력됨
		String filePath = getServletContext().getRealPath("/resources/upload/board/permanant") + "//" + rname;
		
		System.out.println(filePath);

		// 2. 물리적인 경로에 저장되어 있는 파일을 메모리가 가져옴
		File downFile = new File(filePath);
		
		// 3. 메모리로 가져온 파일에 입력 스트림을 연결 + 성능 향상 보조스트림(BufferedInputStream) 추가
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(downFile));
		
		// 4. 클라이언트로 내보낼 출력 스트림 연결
		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
		
		// 5. 브라우러별 인코딩 처리
		String downFileName = null;
		String userAgent = request.getHeader("user-agent");
		boolean isMSIE = userAgent.indexOf("MSIE") != -1 || userAgent.indexOf("Trident") != -1;
		
		if(isMSIE) {
			downFileName = URLEncoder.encode(oname, "UTF-8").replaceAll("\\+", "%20");
		} else {
			downFileName = new String(oname.getBytes("UTF-8"), "ISO-8859-1");
		}
		
		// 6. 응답 메시지 작성(html X, file 0)
		// application/octet-stream 모든 종류의 2진 데이터를 뜻함
		response.setContentType("application/octet-stream");
		// 파일 링크를 클릭했을 때 다운로드 화면이 출력되게 처리하는 부분
		response.setHeader("Content-Disposition", "attachment;filename=" + downFileName);
	
		// 7. 파일 클라이언트로 출력(전송)하기
		int read = -1;
		
		while((read = bis.read()) != -1) {
			bos.write(read);
		}
		
		bos.close();
		bis.close();
	}

}
