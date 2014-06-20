package cn.edu.hbcit.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import cn.edu.hbcit.dao.CourseDao;
import cn.edu.hbcit.dao.ListenPlanDao;
import cn.edu.hbcit.utils.CalenderUtil;

public class SelectListenPlan extends HttpServlet {
	protected final Logger log = Logger.getLogger(SelectListenPlan.class.getName());
	/**
	 * Constructor of the object.
	 */
	public SelectListenPlan() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
		
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		
		ArrayList listenList=null;
		ArrayList courseList=null;
		
		HttpSession session=request.getSession();//创建session
		
		
		ListenPlanDao lpd=new ListenPlanDao();//实例化类
		CourseDao cd=new CourseDao();
		CalenderUtil cu=new CalenderUtil();
		
		String PK_listen_plan=(String)cu.getSemester();//获取学期
		courseList=cd.SelectCourseByTerms(PK_listen_plan);
		listenList=lpd.selectListenPlan();
		
		log.debug("学期："+PK_listen_plan);
		//HttpSession session=request.getSession();
		//session.setAttribute("ListenPlanlist", list);
		request.setAttribute("ListenPlanList", listenList);
		request.setAttribute("courseList", courseList);
		request.getRequestDispatcher("/2_1_5.jsp").forward(request,response);
		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
