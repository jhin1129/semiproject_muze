package muze.mvc.controller.commmunity.board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/community/board/list")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardListServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		String path = null;
		
		if(type.equals("리뷰")) {
			path = "/views/community/board/review_board_list.jsp";
		} else if(type.equals("자유")) {
			path = "/views/community/board/free_board_list.jsp";
		}
		
		request.setAttribute("type", type);
		request.getRequestDispatcher(path).forward(request, response);			
		
	}


}
