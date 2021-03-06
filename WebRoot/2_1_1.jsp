<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>在线教学管理系统</title>
<meta name="description" content="Administry - Admin Template by www.865171.cn" />
<meta name="keywords" content="Admin,Template" />
<!-- We need to emulate IE7 only when we are to use excanvas -->
<!--[if IE]>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<![endif]-->
<!-- Favicons --> 
<link rel="shortcut icon" type="image/png" HREF="img/favicons/favicon.png"/>
<link rel="icon" type="image/png" HREF="img/favicons/favicon.png"/>
<link rel="apple-touch-icon" HREF="img/favicons/apple.png" />
<!-- Main Stylesheet --> 
<link rel="stylesheet" href="css/style.css" type="text/css" />
<!-- Colour Schemes
Default colour scheme is blue. Uncomment prefered stylesheet to use it.
<link rel="stylesheet" href="css/brown.css" type="text/css" media="screen" />  
<link rel="stylesheet" href="css/gray.css" type="text/css" media="screen" />  
<link rel="stylesheet" href="css/green.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/pink.css" type="text/css" media="screen" />  
<link rel="stylesheet" href="css/red.css" type="text/css" media="screen" />
-->
<!-- Your Custom Stylesheet --> 
<link rel="stylesheet" href="css/custom.css" type="text/css" />
<!--swfobject - needed only if you require <video> tag support for older browsers -->
<script type="text/javascript" SRC="js/swfobject.js"></script>
<!-- jQuery with plugins -->
<script type="text/javascript" SRC="js/jquery-1.4.2.min.js"></script>
<!-- Could be loaded remotely from Google CDN : <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script> -->
<script type="text/javascript" SRC="js/jquery.ui.core.min.js"></script>
<script type="text/javascript" SRC="js/jquery.ui.widget.min.js"></script>
<script type="text/javascript" SRC="js/jquery.ui.tabs.min.js"></script>
<!-- jQuery tooltips -->
<script type="text/javascript" SRC="js/jquery.tipTip.min.js"></script>
<!-- Superfish navigation -->
<script type="text/javascript" SRC="js/jquery.superfish.min.js"></script>
<script type="text/javascript" SRC="js/jquery.supersubs.min.js"></script>
<!-- jQuery form validation -->
<script type="text/javascript" SRC="js/jquery.validate_pack.js"></script>
<!-- jQuery popup box -->
<script type="text/javascript" SRC="js/jquery.nyroModal.pack.js"></script>
<!-- jQuery graph plugins -->
<!--[if IE]><script type="text/javascript" src="js/flot/excanvas.min.js"></script><![endif]-->
<script type="text/javascript" SRC="js/flot/jquery.flot.min.js"></script>
<!-- jQuery data tables -->
<script type="text/javascript" SRC="js/jquery.dataTables.min.js"></script>
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
$(document).ready(function(){
	
	/* setup navigation, content boxes, etc... */
	Administry.setup();
	
	/* datatable */
	$('#example').dataTable();
	
	/* expandable rows */
	Administry.expandableRows();
});

</script>
</head>
<body>
	<!-- Header -->
	<header id="top">
		<div class="wrapper">
			<!-- Title/Logo - can use text instead of image -->
			<div id="title"><img SRC="img/logo_new.png" alt="Administry" /><!--<span>Administry</span> demo--></div>
			<!-- Top navigation -->
			<div id="topnav">
				<a href="#"><img class="avatar" SRC="img/user_32.png" alt="" /></a>
				当前用户 <b>Admin</b>
				<span>|</span> <a href="#">修改密码</a>
				<span>|</span> <a href="#">安全退出</a><br />
				<small>现在是 <a href="#" class="high">2013-2014学年第二学期 第<b>1</b>周</a></small>
			</div>
			<!-- End of Top navigation -->
			<!-- Main navigation -->
			<nav id="menu">
				<ul class="sf-menu">
					<li><a HREF="main.jsp">系统首页</a></li>
					<li  >
						<a HREF="styles.html">专业管理</a>
						<ul>
							<li>
								<a href="#">期初工作</a>
								<ul>
									<li><a HREF="samples-files.html">教研室活动计划</a></li>
								</ul>
							</li>
                            <li>
								<a href="#">期中工作</a>
								<ul>
									<li><a HREF="samples-files.html">教研室活动记录</a></li>
								</ul>
							</li>
                            <li>
								<a href="#">期末工作</a>
								<ul>
									<li><a HREF="samples-files.html">本学期工作总结</a></li>
									<li><a HREF="samples-products.html">下学期工作计划</a></li>
								</ul>
							</li>
                             <li>
								<a href="#">开课设置</a>
								<ul>
									<li><a HREF="samples-files.html">下学期课程设置</a></li>
									<li><a HREF="samples-products.html">下学期开课计划</a></li>
								</ul>
							</li>
                            <li>
								<a href="#">专业统计</a>
								<ul>
									<li><a HREF="samples-files.html">期初统计</a></li>
									<li><a HREF="samples-files.html">期中统计</a></li>
                                    <li><a HREF="samples-files.html">期末统计</a></li>
                                    <li><a HREF="samples-files.html">学期统计</a></li>
								</ul>
							</li>
						</ul>
					</li>
                    <li class="current">
                    <a HREF="graphs.html">课程管理</a>
                    <ul>
							<li>
								<a href="#">期初工作</a>
								<ul>
									<li><a HREF="samples-files.html">期初PPT</a></li>
                                    <li><a HREF="samples-files.html">期初教案</a></li>
                                    <li><a HREF="samples-files.html">期初教案首页</a></li>
                                    <li><a HREF="samples-files.html">授课计划</a></li>
                                    <li><a HREF="samples-files.html">听课计划</a></li>
								</ul>
							</li>
                            <li>
								<a href="#">期中工作</a>
								<ul>
                                    <li><a HREF="samples-files.html">期中教案</a></li>
                                    <li><a HREF="samples-files.html">期中教案首页</a></li>
                                    <li><a HREF="samples-files.html">期中PPT</a></li>
                                    <li><a HREF="samples-files.html">答疑记录</a></li>
                                     <li><a HREF="samples-files.html">听课记录</a></li>
                                    <li><a HREF="samples-files.html">学生作业</a></li>
                                    <li><a HREF="samples-files.html">实践指导书</a></li>
                                    <li><a HREF="samples-files.html">实践任务书</a></li>
                                    <li><a HREF="samples-files.html">实践教学计划</a></li>
								</ul>
							</li>
                            <li>
								<a href="#">期末工作</a>
								<ul>
									<li><a HREF="samples-files.html">期末试卷</a></li>
									<li><a HREF="samples-products.html">期末成绩</a></li>
                                    <li><a HREF="samples-products.html">成绩分析</a></li>
								</ul>
							</li>
                            <li>
								<a href="#">课程统计</a>
								<ul>
									<li><a HREF="samples-files.html">期初统计</a></li>
									<li><a HREF="samples-files.html">期中统计</a></li>
                                    <li><a HREF="samples-files.html">期末统计</a></li>
                                    <li><a HREF="samples-files.html">学期统计</a></li>
								</ul>
							</li>
						</ul>
                    </li>	
                    <li>
                    <a HREF="graphs.html">系统管理</a>
                    <ul>
							<li>
								<a href="#">专业维护</a>
								<ul>
									<li><a HREF="samples-files.html">新增专业</a></li>
                                    <li><a HREF="samples-files.html">专业列表</a></li>
								</ul>
							</li>
                            <li>
								<a href="#">数据维护</a>
								<ul>
                                    <li><a HREF="samples-files.html">数据备份</a></li>
                                    <li><a HREF="samples-files.html">数据恢复</a></li>
								</ul>
							</li>
                            <li>
								<a href="#">全局设置</a>
								<ul>
									<li><a HREF="samples-files.html">新增学期</a></li>
									<li><a HREF="samples-products.html">学期管理</a></li>
								</ul>
							</li>
                            <li>
								<a href="#">用户设置</a>
								<ul>
									<li><a HREF="samples-files.html">新增用户</a></li>
									<li><a HREF="samples-products.html">用户列表</a></li>
								</ul>
							</li>
						</ul>
                    </li>
				</ul>
			</nav>
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
			<h1>课程管理 &rarr;期初PPT</h1>
			<!-- Quick search box -->
			<form action="" method="get"><input class="" type="text" id="q" name="q" /></form>
		</div>
	</div>
	<!-- End of Page title -->
	
	<!-- Page content -->
	<div id="page">
		<!-- Wrapper -->
		<div class="wrapper">
		  <!-- Left column/section -->
		  <section class="column width8">
		    <!--	<h3>新增教研室活动计划</h3>-->
		    <form id="sampleform" method="post" action="#">
		      <fieldset>
		        <legend>期初PPT</legend>
		        <table class="no-style" width="100%">
		          <tr>
		            <td><span class="label label-gray">专业名称</span> &nbsp;&nbsp; 软件技术专业</td>
		            <td><span class="label label-gray">专业代码</span> &nbsp;&nbsp; 590108</td>
		            <td><span class="label label-gray">学制</span> &nbsp;&nbsp; 三年</td>
		            <td><span class="label label-gray">当前学期</span> &nbsp;&nbsp; 2013-2014学年第二学期</td>
	              </tr>
		          <tr>
		            <td colspan="4">
                    <p class="box"> <span>课程名称：</span>
		              <select  name="class" style="width:150px;">
		                <option name="java" value="java">java基本课程</option>
		                <option name="jsp" value="jsp">jsp</option>
	                  </select>
		              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

	              选择文件:&nbsp;&nbsp;
		              <input type="file" style="width:auto;">
		              <input type="submit" class="btn btn-green big" value="上传"/>
		              </p></td>
	              </tr>
	            </table>
	          </fieldset>
	        </form>
		    <fieldset>
		      <legend>历年期初PPT</legend>
		      <table class="display stylized" id="example">
		        <thead>
		          <tr>
		            <th width="25%"><div align="center">所在学期</div></th>
		            <th width="20%"><div align="center">专业名称</div></th>
		            <th width="45%"><div align="center">所在年级</div></th>
                    <th width="45%"><div align="center">PPT附件</div></th>
		            <th width="10%"><div align="center">操作</div></th>
	              </tr>
	            </thead>
		        <tbody>
		          <tr>
		            <td class="center">2013-2014学年第二学期</td>
		            <td class="center">软件技术专业</td>
                    <td class="center">软件二班</td>
		            <td class="center">附件5：2014版人才培养方案（软件普通班）.doc</td>
		             <td class="center"><a href="#" title="下载"><img width="16" height="16" alt="另存文件" src="img/page_save.png"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" title="删除"><img src="img/cross.png" alt="Edit" /></a></td>
	              </tr>
		          <tr>
		           <td class="center">2013-2014学年第二学期</td>
		            <td class="center">软件技术专业</td>
                    <td class="center">软件二班</td>
		            <td class="center">附件5：2014版人才培养方案（软件普通班）.doc</td>
		           <td class="center"><a href="#" title="下载"><img width="16" height="16" alt="另存文件" src="img/page_save.png"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" title="删除"><img src="img/cross.png" alt="Edit" /></a></td>
                              
	              </tr>
		          <tr>
		            <td class="center">2013-2014学年第二学期</td>
		            <td class="center">软件技术专业</td>
                    <td class="center">软件二班</td>
		            <td class="center">附件5：2014版人才培养方案（软件普通班）.doc</td>
		            <td class="center"><a href="#" title="下载"><img width="16" height="16" alt="另存文件" src="img/page_save.png"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" title="删除"><img src="img/cross.png" alt="Edit" /></a></td>
	              </tr>
		          <tr>
		            <td class="center">2013-2014学年第二学期</td>
		            <td class="center">软件技术专业</td>
                    <td class="center">软件二班</td>
		            <td class="center">附件5：2014版人才培养方案（软件普通班）.doc</td>
		            <td class="center"><a href="#" title="下载"><img width="16" height="16" alt="另存文件" src="img/page_save.png"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" title="删除"><img src="img/cross.png" alt="Edit" /></a></td>
	              </tr>
		          <tr>
		            <td class="center">2013-2014学年第二学期</td>
		            <td class="center">软件技术专业</td>
                    <td class="center">软件二班</td>
		            <td class="center">附件5：2014版人才培养方案（软件普通班）.doc</td>
		            <td class="center"><a href="#" title="下载"><img width="16" height="16" alt="另存文件" src="img/page_save.png"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" title="删除"><img src="img/cross.png" alt="Edit" /></a></td>
	              </tr>
		          <tr>
		            <td class="center">2013-2014学年第二学期</td>
		            <td class="center">软件技术专业</td>
                    <td class="center">软件二班</td>
		            <td class="center">附件5：2014版人才培养方案（软件普通班）.doc</td>
		            <td class="center"><a href="#" title="下载"><img width="16" height="16" alt="另存文件" src="img/page_save.png"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" title="删除"><img src="img/cross.png" alt="Edit" /></a></td>
	              </tr>
	            </tbody>
	          </table>
	        </fieldset>
	      </section>
		  <!-- End of Left column/section -->
	  </div>
		<!-- End of Wrapper -->
</div>
	<!-- End of Page content -->
	
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
<script type="text/javascript" SRC="js/administry.js"></script>
</body>
</html>