package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import bean.calendar_select;

import com.google.gson.Gson;

import dao.BaseConnection;

/**
 * Servlet implementation class Json1
 */
public class Json1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Json1() {
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
		System.out.println("name="+name);
		BaseConnection bc=new BaseConnection();
		String sql="select * from events";
		ArrayList<calendar_select> result = new ArrayList<calendar_select>();
		try {
			result=bc.select(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		/*Gson gson = new Gson();
		String a = gson.toJson(result);
		System.out.println("a="+a);
		a=a.replace("[",""); 
		a=a.replace("]",""); 
		System.out.println("a1="+a);*/
		
		String str1="{'id':'111','title':'All Day Event','y0': '2013','m0':'5','d0': '9','y1': '2013','m1':'5','d1': '10'}";
		String str2="{'id':'111','title':'All Day Event','start':'new Date(y, m, d, 12, 0)','end':'new Date(y, m, d, 14, 0)'}";	
		String str3="{'id':'111','title':'All Day Event','start':'new Date(2013, 5, 9, 12, 0)','end':'new Date(2013, 5, 13, 14, 0)'}";	
		String str4="{'id':'111','title':'All Day Event','start':'2013-05-09','end':'2013-05-10'}";
		String str5="{'id':'222','title':'BBBB','start':'2013-05-01','end':'2013-05-02'}";
		Gson gson = new Gson();
		String a = gson.toJson(str4);
		System.out.println("a="+a);	
	
		
		response.getWriter().write(str4);
	}
}
