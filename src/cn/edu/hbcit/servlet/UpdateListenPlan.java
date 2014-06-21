package cn.edu.hbcit.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import cn.edu.hbcit.dao.ListenPlanDao;
import cn.edu.hbcit.utils.CalenderUtil;
import cn.edu.hbcit.utils.UtilTools;

public class UpdateListenPlan extends HttpServlet {
	protected final Logger log = Logger.getLogger(UpdateListenPlan.class.getName());
	/**
	 * Constructor of the object.
	 */
	public UpdateListenPlan() {
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

		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		UtilTools ut = new UtilTools();
		boolean flag = false;
		
		String FK_course_listen=request.getParameter("courseName");	//课程名
		String listen_date=request.getParameter("date");	 //时间
		String classroom=request.getParameter("classroom");	 //教室
		String grade=request.getParameter("grade");			//班级
		String section=request.getParameter("jieci");		//节次
		String PK_listen_plan=request.getParameter("pk"); 	//编号
		
		log.debug("FK_course_listen:"+FK_course_listen);
	
		log.debug("listen_date:"+listen_date);
		log.debug("classroom:"+classroom);
		log.debug("grade:"+grade);
		log.debug("section:"+section);
		log.debug("PK_listen_plan:"+PK_listen_plan);
		ListenPlanDao lpd=new ListenPlanDao();
		
		if(ut.isNumeric(PK_listen_plan)){
		flag=lpd.UpdateListenPlanById(FK_course_listen, section, classroom, grade, listen_date,Integer.parseInt(PK_listen_plan));
		}
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
