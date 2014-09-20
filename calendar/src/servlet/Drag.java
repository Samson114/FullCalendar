package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BaseConnection;

/**
 * Servlet implementation class Drag
 */
public class Drag extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Drag() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.print("Ö´ÐÐµ½Drag");
		
		String id = request.getParameter("id");		
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		
		BaseConnection bc=new BaseConnection();
		
		String []param ={start,end,id};
		String sql="update events set start=?,end=? where id=?";
		bc.operate(param, sql);
	}

}
