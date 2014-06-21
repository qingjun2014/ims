<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>在线教学管理系统_听课计划</title>
<!-- We need to emulate IE7 only when we are to use excanvas -->
<!--[if IE]>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<![endif]-->
<!-- Favicons --> 
<link rel="shortcut icon" type="image/png" HREF="${pageContext.request.contextPath }/img/favicons/favicon.png"/>
<link rel="icon" type="image/png" HREF="${pageContext.request.contextPath }/img/favicons/favicon.png"/>
<link rel="apple-touch-icon" HREF="${pageContext.request.contextPath }/img/favicons/apple.png" />
<!-- Main Stylesheet --> 
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" type="text/css" />
<!-- Colour Schemes
Default colour scheme is blue. Uncomment prefered stylesheet to use it.
<link rel="stylesheet" href="css/brown.css" type="text/css" media="screen" />  
<link rel="stylesheet" href="css/gray.css" type="text/css" media="screen" />  
<link rel="stylesheet" href="css/green.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/pink.css" type="text/css" media="screen" />  
<link rel="stylesheet" href="css/red.css" type="text/css" media="screen" />
-->
<!-- Your Custom Stylesheet --> 
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/custom.css" type="text/css" />
<!--swfobject - needed only if you require <video> tag support for older browsers -->
<script type="text/javascript" SRC="${pageContext.request.contextPath }/js/swfobject.js"></script>
<!-- jQuery with plugins -->
<script type="text/javascript" SRC="${pageContext.request.contextPath }/js/jquery-1.4.2.min.js"></script>
<!-- Could be loaded remotely from Google CDN : <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script> -->
<script type="text/javascript" SRC="${pageContext.request.contextPath }/js/jquery.ui.core.min.js"></script>
<script type="text/javascript" SRC="${pageContext.request.contextPath }/js/jquery.ui.widget.min.js"></script>
<script type="text/javascript" SRC="${pageContext.request.contextPath }/js/jquery.ui.tabs.min.js"></script>
<!-- jQuery tooltips -->
<script type="text/javascript" SRC="${pageContext.request.contextPath }/js/jquery.tipTip.min.js"></script>
<!-- Superfish navigation -->
<script type="text/javascript" SRC="${pageContext.request.contextPath }/js/jquery.superfish.min.js"></script>
<script type="text/javascript" SRC="${pageContext.request.contextPath }/js/jquery.supersubs.min.js"></script>
<!-- jQuery form validation -->
<script type="text/javascript" SRC="${pageContext.request.contextPath }/js/jquery.validate_pack.js"></script>
<!-- jQuery popup box -->
<script type="text/javascript" SRC="${pageContext.request.contextPath }/js/jquery.nyroModal.pack.js"></script>
<!--<script type="text/javascript" SRC="${pageContext.request.contextPath }/js/jquery.nyroModal.custom.min.js">-->
<!-- jQuery graph plugins -->
<!--[if IE]><script type="text/javascript" src="js/flot/excanvas.min.js"></script><![endif]-->
<script type="text/javascript" SRC="${pageContext.request.contextPath }/js/flot/jquery.flot.min.js"></script>
<!-- jQuery data tables -->
<script type="text/javascript" SRC="${pageContext.request.contextPath }/js/jquery.dataTables.min.js"></script>
<!-- Internet Explorer Fixes --> 
<!--[if IE]>
<link rel="stylesheet" type="text/css" media="all" href="css/ie.css"/>
<script src="js/html5.js"></script>
<![endif]-->
<!--Upgrade MSIE5.5-7 to be compatible with MSIE8: http://ie7-js.googlecode.com/svn/version/2.1(beta3)/IE8.js -->
<!--[if lt IE 8]>
<script src="js/IE8.js"></script>
<![endif]-->
<script type="text/javascript">
//动态表格设置
		$(document).ready(function(){
			/* setup navigation, content boxes, etc... */
			Administry.setup();
			/* datatable */
			$('#example').dataTable();
			/* expandable rows */
			Administry.expandableRows();
		});
//弹出框样式设置
		$(function(){  
			   $.nyroModalSettings({  
				   width: 680, // width  
				   minHeight: 130 // height  
			   });  
		   }); 
   
 //新增听课计划ajax函数
		function add(){		
			$.ajax({
				url :"${pageContext.request.contextPath}/servlet/AddListenPlanServlet",
				type :'post',
				data :'courseName='+$("#courseName").val()+
					'&teacher='+$("#teacher").attr("value")+
					'&classroom='+$("#classroom").attr("value")+
					'&date='+$("#date").attr("value")+
					'&jieci='+$("#jieci").val()+
					'&grade='+$("#grade").attr("value"),
					
				success:function(mm){
				var revalue=mm.replace(/\r\n/g,'');
				if(revalue=="success")
					{
					
								location.replace("${pageContext.request.contextPath}/servlet/SelectListenPlan");
					}else{
								window.location.reload();
								
					}
				
				
				}

});
			
		}
//根据课程查询讲师ajax
		function selectTeacher(){	
		
			$.ajax({
			url :"${pageContext.request.contextPath}/servlet/SelectTeacherByCourse",
			type :'post',
			data :'courseName='+$("#courseName").val(),
			success :function(a){
				var revalue=a.replace(/\r\n/g,'');
					if(revalue=="success")
						{
						
						var teacher=document.getElementById("teacher");
						teacher.value="星星";
						
						}
				
			}
		});
		}
//删除记录by id
		function del(id){
	if(confirm("您真的想要删除吗?")){
	$.ajax({
			url :"${pageContext.request.contextPath}/servlet/DeleteListenPlanById",
			type :'post',
			data :'id='+id,
			success :function(a){
				var revalue=a.replace(/\r\n/g,'');
					if(revalue=="success")
						{
							location.replace("${pageContext.request.contextPath}/servlet/SelectListenPlan");
						}else{
							alert("删除失败！")
							window.location.reload();
								
					}
				
			}
		});
	
	}
		
		}
//验证听课表单元素的正确性。

	
</script>

<% session.setAttribute("PK_listen_plan","${sessionScope.Semester}");%>
</head>

<body>
<!-- Header -->
	<header id="top">
		<div class="wrapper">
			<!-- Title/Logo - can use text instead of image -->
			<div id="title"><img SRC="${pageContext.request.contextPath }/img/logo_new.png" alt="Administry" /><!--<span>Administry</span> demo--></div>
			<!-- Top navigation -->
			<jsp:include page="topnav.jsp"></jsp:include>
			<!-- End of Top navigation -->
			<!-- Main navigation -->
			<jsp:include page="menu.jsp">
            	<jsp:param name="menu" value="0" />
            </jsp:include>
			<!-- End of Main navigation -->
			<!-- Aside links -->
			<aside><b>常用链接</b> &middot; <a href="http://www.hbcit.edu.cn">学院网站</a> &middot; <a href="http://jsjx.hbcit.edu.cn">系部网站</a></aside>
			<!-- End of Aside links -->
		</div>
	</header>
	<!-- End of Header -->
		
	
	<!-- Page title -->
	<div id="pagetitle">
		<div class="wrapper">
			<h1>课程管理 &rarr; <span>听课计划</span></h1>
			<!-- Quick search box -->
			<form action="" method="get">
				<input class="" type="text" id="q" name="q" />
			</form>
		</div>
	</div>
	<!-- End of Page title -->
	
	<!-- Page content -->
<div id="page">
		<!-- Wrapper -->
	<div class="wrapper">
		 
		<section class="column width8 first">  
		  								  <!--<h3>新增听课计划</h3>-->
		    	     
 <fieldset>
   <legend>听课计划</legend>
		    <form id="sampleform" method="post" action="#">
		        <table class="no-style" width="100%">
		      
		          <tr>
		            <td><span class="label label-gray">专业名称</span> &nbsp;&nbsp;软件技术</td>
		            <td><span class="label label-gray">专业代码</span> &nbsp;&nbsp; 590108</td>
		            <td><span class="label label-gray">学制</span> &nbsp;&nbsp; 三年</td>
		            <td><span class="label label-gray" >当前学期</span> &nbsp;&nbsp; ${sessionScope.Semester}</td>
	              </tr>
	            
	            </table>    
	        </form>
        </fieldset>   
  <div class="box">
      	 <div style="width:900px; height:20px; font:Arial, Helvetica, sans-serif; font-weight:bold; font-size:16px;">
         	  <span style="float:left;">听课信息：</span>
      	 </div> 
	  <div style="width:850px; height:130px;margin-left:80px; margin-right:auto;" >
           <form action="" method="post" >
               <table class="no-style" width="100%" >
		          <tr>
		            <td><span>课程名称：</span><select onchange="selectTeacher();" name="class" style="width:150px;" id="courseName" >
		          <c:forEach items="${requestScope.courseList}" var="temp">
		              <option name="${temp.course_name}" value="${temp.course_name}" selected>${temp.course_name}</option>
		           </c:forEach>  
		              </select></td>
		           <!--   <OPTION  name="java" value="java">java</OPTION>
		              <OPTION  name="jsp" value="jsp">jsp</OPTION>
		              <OPTION  name="c" value="c">c</OPTION>-->
		              &nbsp;&nbsp;
                       <td><span>讲课人：</span> &nbsp;&nbsp;<input type="text" name="teacher"  id="teacher" readonly value="李伟"> </td>
		              <td><span>班级：</span> &nbsp;&nbsp;<input type="text" name="grade"  id="grade"> </td>
		        
	              </tr>           
                  <tr>
                   <td><span>日期：</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="date" id="date" ></td>
		            <td><span>节次：</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select  name="class" style="width:160px;" id="jieci">
		              <option name="frist" value="1-2节">1-2节</option>
		              <option name="second" value="3-4节">3-4节</option>
                      <option name="third" value="5-6节">5-6节</option>
                      <option name="forth" value="7-8节">7-8节</option>
                         <option name="fifth" value="9-10节">9-10节</option>
                      <option name="sixth" value="11-12节">11-12节</option>
		              </select></td>
		            <td><span>教室：</span> &nbsp;&nbsp; <input type="text" name="classroom" id="classroom" ></td>  
	              </tr>
                  <tr>
                   	 <td> </td>   
                  	 <td>  </td>
                     <td> <input style="left:200px;" type="button" onclick="add();" class="btn btn-green big" value="提交"/>   </td>
                  </tr>
	            </table>
	      </form>
     </div>
	
</div>		
 </section>

   		  <section class="column width8 first">	
  <fieldset> 
  <legend>历年听课计划</legend>
 
		 <div class="box">    
		      <table class="display stylized" id="example">
		        <thead>
		          <tr>
		            <th width="15%"><div align="center">讲课人</div></th>
		            <th width="25%"><div align="center">课程名称</div></th>
		            <th width="20%"><div align="center">时间</div></th>
		            <th width="15%"><div align="center">听课教室</div></th>
		            <th width="25%"><div align="center">班级</div></th>
                    <th width="15%"><div align="center">操作</div></th>
	              </tr>
	            </thead>
		        <tbody>
		        	 <c:forEach items="${requestScope.listenPlanList1}" var="temp">                        
						<tr>
							<td class="center">${temp.FK_users_listener }</td>
							<td class="center">${temp.FK_course_listen }</td>
							<td class="center">${temp.listen_date }----${temp.section }</td>
							<td class="center">${temp.classroom }</td>
							<td class="center">${temp.classes }</td>
                            <td class="center">
                            
                               <a href="${pageContext.request.contextPath }/servlet/SelectListenPlanById?id=${temp.PK_listen_plan}" class="nyroModal" title="修改"> <img src="${pageContext.request.contextPath }/img/pencil.png" alt="Edit Meta" /></a>&nbsp; &nbsp; &nbsp; 
                               <a href="javascript:void(0);" onclick="del('${temp.PK_listen_plan}');" title="删除"><img src="${pageContext.request.contextPath }/img/cross.png" alt="Delete" /></a> 
                            </td>
						</tr>
					</c:forEach>                        
                 </tbody>
             </table>
             </div>
             </fieldset>
      </section>	
	</div>
	<!-- End of Wrapper -->
	</div>
	

	
	<!-- Page footer -->
	<footer id="bottom">
		<div class="wrapper">
<!--			<nav>
				<a href="#">Dashboard</a> &middot;
				<a href="#">Content</a> &middot;
				<a href="#">Reports</a> &middot;
				<a href="#">Users</a> &middot;
				<a href="#">Media</a> &middot;
				<a href="#">Events</a> &middot;
				<a href="#">Newsletter</a> &middot;
				<a href="#">Settings</a>
			</nav>-->
			<p>Copyright &copy; 2014 HBCIT.EDU</p>
		</div>
	</footer>
	<!-- End of Page footer -->
	
	<!-- Animated footer -->
<!--	<footer id="animated">
		<ul>
			<li><a href="#">Dashboard</a></li>
			<li><a href="#">Content</a></li>
			<li><a href="#">Reports</a></li>
			<li><a href="#">Users</a></li>
			<li><a href="#">Media</a></li>
			<li><a href="#">Events</a></li>
			<li><a href="#">Newsletter</a></li>
			<li><a href="#">Settings</a></li>
		</ul>
	</footer>-->
	<!-- End of Animated footer -->
	
	<!-- Scroll to top link -->
	<a href="#" id="totop">^ scroll to top</a>

<!-- User interface javascript load -->
<script type="text/javascript" SRC="${pageContext.request.contextPath }/js/administry.js"></script>

</body>
</html>