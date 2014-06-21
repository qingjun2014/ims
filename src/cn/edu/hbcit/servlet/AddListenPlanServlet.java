package cn.edu.hbcit.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import cn.edu.hbcit.dao.ListenPlanDao;

public class AddListenPlanServlet extends HttpServlet {
	protected final Logger log = Logger.getLogger(AddListenPlanServlet.class.getName());
	/**
	 * Constructor of the object.
	 */
	public AddListenPlanServlet() {
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
		PrintWriter out = response.getWriter();
		boolean flag = false;
		String FK_course_listen=request.getParameter("courseName");//课程名
		
		String FK_users_listener=request.getParameter("userListen");//听课人
	
		String listen_date=request.getParameter("date"); //时间
		String classroom=request.getParameter("classroom"); //教室
		String jieci=request.getParameter("jieci");//节次
		String grade=request.getParameter("grade");//班级
		int FK_terms_listen=1; //学期
		
		log.debug("FK_course_listen:"+FK_course_listen);
		log.debug("FK_users_listener :"+FK_users_listener);
		
		log.debug("listen_date:"+listen_date);
		log.debug("classroom:"+classroom);
		log.debug("jieci:"+jieci);
		log.debug("grade:"+grade);
		
		ListenPlanDao lpd=new ListenPlanDao();
	   flag=lpd.addListenPlan(FK_users_listener, jieci, FK_course_listen, listen_date, classroom, grade, FK_terms_listen);
		if(flag){
			out.print("success");
		}else{;
			out.print("fail");
		}
		out.flush();
		out.close();
		
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
