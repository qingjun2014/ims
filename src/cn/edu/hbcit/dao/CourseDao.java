package cn.edu.hbcit.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.log4j.Logger;

import cn.edu.hbcit.pojo.Course;
import cn.edu.hbcit.pojo.Majors;
import cn.edu.hbcit.pojo.Users;
import cn.edu.hbcit.servlet.SelectTeacherByCourse;
	/**
	 * 课程
	 * @author 青君	
	 * @version 1.0  
	 * 创建时间：2014/6/19 22:35
	 * 最后一次修改时间 ：2014/6/21  14:54
	 * */
public class CourseDao {
	protected final Logger log = Logger.getLogger(CourseDao.class.getName());
	/**
	 * 查询课程列表By 学期
	 * */
	public ArrayList SelectCourseByTerms(String PK_listen_plan){
		
		ArrayList<Course> list=null;
		try {
			Connection conn = Base.Connect();
			Course course=new Course();
			QueryRunner qr = new QueryRunner();
			String sql = "SELECT course_name FROM tb_course  WHERE  FK_terms_course =(SELECT PK_term FROM tb_terms WHERE term =?) "; 
			
			list = (ArrayList<Course>)qr.query(conn, sql, new BeanListHandler(Course.class),PK_listen_plan);
			
			log.debug("SelectCourseByTerms___成功！");
			DbUtils.closeQuietly(conn);//关闭连接
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			return list; 
		
		
	}
	/**
	 * 根据课程查询，返回任课教师
	 * 参数Course为课程名
	 * 
	 * */
	public String SelectTeacherByCourse(String Course){
		ArrayList<Users> list=null;
		String usersCourse=null;
		try {
			Connection conn = Base.Connect();
			Users user=new Users();
			QueryRunner qr = new QueryRunner();
			String sql = "SELECT true_name FROM tb_course  join tb_users  on tb_users.PK_users=tb_course.FK_users_course where tb_course.course_name=? "; 
			
			list = (ArrayList<Users>)qr.query(conn, sql, new BeanListHandler(Users.class),Course);
			for(Users a : list){
				usersCourse=a.getTrue_name();
				
			}
			log.debug("获取教师姓名成功！");
			DbUtils.closeQuietly(conn);//关闭连接
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			return usersCourse;
		
		
	}
	public List<Majors> getMajorList(String FK_users_majors) {
		List<Majors> list = null;
		try {
		Connection	conn = Base.Connect();
			QueryRunner qr = new QueryRunner();
			String sql="SELECT * FROM tb_majors WHERE FK_users_majors =?" ;
			list = (List<Majors>) qr.query(conn,sql,new BeanListHandler(Majors.class), FK_users_majors);

		} catch (Exception e) {
			throw new RuntimeException("专业查询错误!");
		}
		return list;
	}
	
}
