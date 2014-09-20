package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.calendar_select;

import com.google.gson.Gson;

import dao.BaseConnection;
import dor.DBlink;

/**
 * Servlet implementation class Json_me
 */
public class Json_me extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Json_me() {
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
		String name = request.getParameter("name");
		//System.out.println("name="+name);
		
		DBlink db = new DBlink();
		
		ArrayList<Map> result = new ArrayList<Map>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;       
		String sql="select * from events";
		
		
		
			try {
				conn = db.getConnection();
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
					Map map = new HashMap();
					map.put("id", Integer.parseInt(rs.getString("id")));
					map.put("title", rs.getString("title"));
					map.put("start", rs.getString("start"));
					map.put("end", rs.getString("end"));
					//allDay  Ù–‘
					map.put("allDay", false);
					result.add(map);
				}
				
				int num = result.size();
				Gson gson = new Gson();
				String result1 = gson.toJson(result);
				//System.out.println("result1="+result1);
				response.getWriter().write(result1);
				
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
	}

}
