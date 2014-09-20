package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BaseConnection;

/**
 * Servlet implementation class Resize
 */
public class Resize extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Resize() {
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
		System.out.print("执行到Resize");
		
		String id = request.getParameter("id");	
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		System.out.println("end="+end);
	
		//yyyy-MM-dd HH:mm:ss  只改变 年月日  不改变 时分秒    未完成
		if(end==null&&end.equals("")){
			end=start;
		}
		
		BaseConnection bc=new BaseConnection();
		String []param ={start,end,id};
		String sql="update events set start=?,end=? where id=?";
		bc.operate(param, sql);
	}

}
