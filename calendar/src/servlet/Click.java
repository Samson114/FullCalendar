package servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BaseConnection;

/**
 * Servlet implementation class Click
 */
public class Click extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Click() {
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
		System.out.print("start_click");
		String title = request.getParameter("title");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		
		BaseConnection bc=new BaseConnection();
		ResultSet rs=null;
		//从数据库里取到最大的id start
		String sql_max_id="select * from events where id = (select max(id) from events)";
		rs=bc.queryForObject(null, sql_max_id);
		int int_id=0;
		try {
			while(rs.next()){
				int_id=rs.getInt("id");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//从数据库里取到最大的id start		
		int_id=int_id+1;//在最大的id＋1 成为下一条记录的id
		String id = Integer.toString(int_id);//将int 转化成string
		//插入信息
		String []param ={id,title,start,end};
		String sql_insert="insert into events(id,title,start,end) value(?,?,?,?) ";
		bc.operate(param, sql_insert);
		
		response.getWriter().write(id);
		
	}

}
