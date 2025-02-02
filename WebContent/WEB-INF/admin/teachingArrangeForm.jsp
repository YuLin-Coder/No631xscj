<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>学生成绩管理分析系统</title>
<link href="css/ui-lightness/jquery-ui-1.10.4.custom.css"
	rel="stylesheet">
<script src="js/jquery-1.10.2.js"></script>
<script src="js/jquery-ui-1.10.4.custom.js"></script>
<script type="text/javascript">
	$(function() {
		$("#accordion").accordion();
	});
</script>
<style type="text/css">
body {
	font: 72.5% "Trebuchet MS", sans-serif;
	margin: 50px;
	background-color:#7ecef4;
}
 
.datalist{
	border:1px solid #0058a3;	/* 表格边框 */
	font-family:Arial;
	border-collapse:collapse;	/* 边框重叠 */
	background-color:#eaf5ff;	/* 表格背景色 */
	font-size:14px;
}
.datalist caption{
	padding-bottom:5px;
	font:bold 1.4em;
	text-align:left;
}
.datalist th{
	border:1px solid #0058a3;	/* 行名称边框 */
	background-color:#4bacff;	/* 行名称背景色 */
	color:#FFFFFF;				/* 行名称颜色 */
	font-weight:bold;
	padding-top:4px; padding-bottom:4px;
	padding-left:12px; padding-right:12px;
	text-align:center;
}
.datalist td{
	border:1px solid #0058a3;	/* 单元格边框 */
	text-align:center;
	padding-top:4px; padding-bottom:4px;
	padding-left:10px; padding-right:10px;
}
.datalist tr.altrow{
	background-color:#c7e5ff;	/* 隔行变色 */
}
/* .frame{
	height:435px;
} */
</style>
</head>

<body>
<div>
  	<jsp:include page="gradeServiceNavigation.jsp"></jsp:include>
  </div>
	<s:fielderror></s:fielderror>
	<div id="accordion">
		<h3><s:property value="grade.year"/>届（<s:property value="grade.classID" />）班级第<s:property value="xueqiChose" />学期授课安排</h3>
		<div class="frame">
			<form action="teachingArrangeFormRegister.action" method="post">
				<table class="datalist">
					<tr>
						<th align="center"><strong>班级</strong></th>
						<th align="center"><strong>学期</strong></th>
						<th align="center"><strong>选择科目</strong></th>
						<th align="center"><strong>授课教师</strong></th>


					</tr>
					<s:iterator value="superCourses">
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td><input type="checkbox" name="courseChose"
								value='<s:property value="courseBianHao"/>' />
							<s:property value="courseName" /></td>
							<td><select name="teacherChose">
								<option>--请选择--</option>
									<s:iterator value="subTeachers">
										<option value='<s:property value="courseBianHao"/><s:property value="bianHao"/>'>
											<s:property value="name" />
										</option>
									</s:iterator>
							</select></td>
						</tr>
					</s:iterator>
					<tr>
						<td>
							 <s:property value="grade.year"/>届（<s:property value="grade.classID" />）班级
							 <input type="hidden" value='<s:property value="grade.bianHao"/>' name="gradeChose" />
						</td>
						<td align="center">
							 <s:property value="xueqiChose" />
							  <input type="hidden" value='<s:property value="xueqiChose" />' name="xueqiChose" />
						</td>
						<td colspan="2" align="center"><input type="submit" value="注册"  /> <input type="reset" value="取消" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>
