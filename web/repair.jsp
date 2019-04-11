
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.Info" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.UserDao" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<title>维修表单</title>
</head>
<body>
	<table border="1px" cellspacing="0" cellpadding="2">
			<tr>
				<th>地点</th>
				<th>教室</th>
				<th>机器号</th>
				<th>故障类型</th>
				<th>故障原因</th>
				<th>简单描述</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
			<% 
				List<Info> list = new ArrayList<Info>();
				list= UserDao.getMachines();

				for(int i=0;i<list.size();i++){
					Info info=list.get(i);
			%>
			<tr>

				<td><%=info.getLocation() %></td>
				<td><%=info.getClassRoom() %></td>
				<td><%=info.getMachNumb() %></td>
				<td><%=info.getErrorType() %></td>
				<td><%=info.getErrorCause() %></td>
				<td><%=info.getDescribe() %></td>
				<td><%=info.getRepairState() %></td>
				<td><a href="docheck.jsp?action=delete&location=<%=info.getLocation() %>&classroom=<%=info.getClassRoom()%>&machnumb=<%=info.getMachNumb()%>&errortype=<%=info.getErrorType()%>&describe=<%=info.getDescribe() %>&errorcause=<%=info.getErrorCause()%>">
				<button>删除</button>
				
				</a></td>
			</tr>
			<% 
				}
			%>
		</table>
	123<%= list%>
</body>
</html>