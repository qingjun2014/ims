package cn.edu.hbcit.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.log4j.Logger;

import cn.edu.hbcit.pojo.Course;
import cn.edu.hbcit.pojo.Listen_plan;
import cn.edu.hbcit.pojo.Majors;
	/**
	 * 听课表相关
	 * @author 青君
	 * @version 1.0 
	 * 创建时间：   2014/6.19  13:43
	 * 最后一次修改时间   2014/6/21  14:55
	 * */
public class ListenPlanDao {
	
	protected final Logger log = Logger.getLogger(ListenPlanDao.class.getName());
	
	/**
	 * 添加听课计划
	 * @param   FK_users_listener
	 * @param   section
	 * @param	FK_course_listen
	 * @param	listen_date
	 * @param	classroom
	 * @param	grade
	 * @param	FK_terms_listen
	 * @return
	 * */
	public boolean addListenPlan(String FK_users_listener,String section,String FK_course_listen,String listen_date,String classroom,String grade ,int FK_terms_listen){
		int count=0;
		boolean flag=false;
		try{
			Connection conn = Base.Connect();
			QueryRunner qr = new QueryRunner();
			String	sql="INSERT INTO tb_listen_plan(FK_users_listener, section, FK_course_listen, listen_date, classroom, classes, FK_terms_listen)VALUES(?,?,?,?,?,?,?)";
			count = qr.update(conn, sql, FK_users_listener, section, FK_course_listen, listen_date, classroom ,grade, FK_terms_listen);
			
			log.debug("听课表插入行数"+count);
			DbUtils.closeQuietly(conn);//关闭连接
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(count>0){
			flag = true;
		}
		return flag;
	}
	
	/**
	 * 查询听课表中的记录和课程表课程名称、任课老师
	 * @return
	 * */
	public ArrayList selectListenPlan(){
		ArrayList<Listen_plan> list=null;
		try{
		Connection conn = Base.Connect();
		Listen_plan listplan=new Listen_plan();
		QueryRunner qr = new QueryRunner();
		String sql ="SELECT tb_listen_plan.PK_listen_plan,tb_listen_plan.FK_users_listener,tb_listen_plan.section ,tb_listen_plan.FK_course_listen, tb_listen_plan.listen_date,tb_listen_plan.classes, tb_listen_plan.classroom,tb_users.true_name FROM  tb_course  join tb_listen_plan on  tb_listen_plan.FK_course_listen = tb_course.course_name  join tb_users on tb_course.FK_users_course=tb_users.PK_users ORDER BY tb_listen_plan.listen_date DESC  ";
	
		list = (ArrayList<Listen_plan>)qr.query(conn, sql, new BeanListHandler(Listen_plan.class));
		log.debug("听课表记录___查询成功");
		DbUtils.closeQuietly(conn);//关闭连接
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return list;

		
		
		
	}
	/**
	 * 根据id查询听课记录
	 * @param id
	 * @return
	 * */
	public ArrayList selectListenPlanById(int id){
		ArrayList<Listen_plan> list=null;
		try{
		Connection conn = Base.Connect();
		Listen_plan listplan=new Listen_plan();
		QueryRunner qr = new QueryRunner();
		String sql ="SELECT tb_listen_plan.PK_listen_plan,tb_listen_plan.section, tb_listen_plan.FK_course_listen, tb_listen_plan.listen_date,tb_listen_plan.classes, tb_listen_plan.classroom FROM tb_listen_plan WHERE PK_listen_plan=? ";
	
		list = (ArrayList<Listen_plan>)qr.query(conn, sql, new BeanListHandler(Listen_plan.class),id);
		log.debug("查询听课记录 By id="+id);
		DbUtils.closeQuietly(conn);//关闭连接
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return list;
		
	}
	
	/**
	 *修改听课记录    by PK_listen_plan
	 * @param FK_course_listen
	 * @param classroom
	 * @param grade
	 * @param listen_date
	 * @param PK_listen_plan
	 * @return
	 * */
	public boolean UpdateListenPlanById(String FK_course_listen,String section, String classroom, String grade, String listen_date,int PK_listen_plan){
		int count1 = 0;
		
	boolean flag = false;
	try {
		Connection conn = Base.Connect();
		QueryRunner qr = new QueryRunner();
		String sql = "UPDATE tb_listen_plan SET  FK_course_listen=? , section=? , classroom=? , listen_date=? , classes=?  WHERE PK_listen_plan=? ";
	
		count1 = qr.update(conn, sql, FK_course_listen,section,classroom,listen_date,grade,PK_listen_plan);
	
		log.debug( count1+"个听课计划修改成功 ");
		
		if(count1> 0){
			flag = true;
		}
		DbUtils.closeQuietly(conn);//关闭连接
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return flag;
}
	/**
	 * 删除
	 * 根据编号
	 * @param Pk_listen_plan
	 * @return TURE OR FALSE
	 * 
	 * */
	public boolean deleteListenPlanById(int id){
		boolean flag=false;
		int count=0;	
		try {
			Connection conn = Base.Connect();
			QueryRunner qr = new QueryRunner();
			String sql = "DELETE FROM tb_listen_plan WHERE PK_listen_plan=? ";
			count = qr.update(conn, sql,id);
			if(count>0){
				flag=true;
			}
			log.debug(count+"个记录删除成功");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return flag;
		
	}
	
	
	}
