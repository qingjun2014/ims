<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${requestScope.listenPlanList2}" var="temp1">
<head>
<meta charset="utf-8" />
<script type="text/javascript">
function edit(){		
			$.ajax({
				url :"${pageContext.request.contextPath}/servlet/UpdateListenPlan",
				type :'post',
				data :'coursename='+$("#coursename").val()+
					  '&classroom='+$("#classroom01").attr("value")+
					  '&teacher='+$("#teacher2").attr("value")+
					  '&date='+$("#date01").attr("value")+
					  '&jieci='+$("#jieci01").val()+
					  '&grade='+$("#grade01").attr("value")+
					  '&pk='+$("#pk").attr("value"),
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
		function queryTeacher(){	
		
			$.ajax({
			url :"${pageContext.request.contextPath}/servlet/SelectTeacherByCourse",
			type :'post',
			data :'courseName='+$("#coursename").val(),
			success :function(b){
				var revalue=b.replace(/\r\n/g,'');
					var teacher2=document.getElementById("teacher2");
					teacher2.value=revalue;
				
			}
		});
		}
		function myload(){	
			
		  	$("#jieci01 option[value='${temp1.section}']").attr('selected',true);
		}
		window.onload=myload();
		
</script>
</head>
<body>
<!-- 遮罩层 begin -->
<form action="" method="post">
	<input type="hidden"  value="${temp1.PK_listen_plan}" id="pk" />
	
<div id="xiugai" style="width:650px; height:130px; margin-left:20px;margin-top:20px;" >

  <table class="no-style" width="100%" >
    <tr>
      <td align="center"><span>课程名称：</span>
        <select  name="class" style="width:150px;" id="coursename" onclick="queryTeacher();">
        <c:forEach items="${requestScope.courseList}" var="temp2">
        	<c:if test="${temp1.FK_course_listen == temp2.course_name }">
       			   <option name="${temp1.FK_course_listen}" value="${temp1.FK_course_listen}" selected>${temp1.FK_course_listen}</option>
       	 </c:if>
       	 <c:if test="${temp1.FK_course_listen != temp2.course_name }">
       			   <option name="${temp2.course_name }" value="${temp2.course_name }">${temp2.course_name }</option>
       	 </c:if>
         </c:forEach>
        </select></td>
       
      <td align="center">&nbsp;&nbsp;<span>班级：</span>
        <input type="text" name="grade"  id="grade01" value="${temp1.classes }">
      </td>
       <td>
      <input type="hidden" name="teacher2"  id="teacher2"  value="${temp1.true_name }">
        </td>
    </tr>
    <tr>
      <td align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>时间：</span> 
       			 <input type="text" name="date" id="date01" style="width:140px;" value="${temp1.listen_date}">
      </td>
       <td>&nbsp;&nbsp;&nbsp;<span>节次：</span> <select  name="class" style="width:160px;" id="jieci01">
       			<!-- <option name="${temp1.section}" value="${temp1.section}" selected>${temp1.section} </option> -->	
		              <option name="frist" value="1-2节" >1-2节</option>
		              <option name="second" value="3-4节">3-4节</option>
                      <option name="third" value="5-6节">5-6节</option>
                      <option name="forth" value="7-8节">7-8节</option>
                      <option name="fifth" value="9-10节">9-10节</option>
                      <option name="sixth" value="11-12节">11-12节</option>
		              </select></td>
     <td align="center">&nbsp;<span>教室：</span> 
        		<input type="text" name="classroom" id="classroom01" value="${temp1.classroom }" >
     </td> 
    </tr>
    <tr>
      <td align="center"> 
      </td>
      <td>
        
        </td>
      <td align="right">
      	<input  type="button" onclick="edit();" class="btn btn-green big" value="修改"/>
        <input  id="close_1" type="button" class="nyroModalClose btn btn-red big" value="取消"/>
      </td>
    </tr>
  </table>
</div>

</form>
<script type="text/javascript" SRC="js/administry.js"></script>
</body>
</c:forEach>
</html>
