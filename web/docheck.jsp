<%@page import="dao.RepairDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.UserDao,bean.Info"%>
<%@ page import="java.net.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<%
		//修改请求字符编码utf8
		request.setCharacterEncoding("utf-8");

		//获取?后面的参数
		String location = request.getParameter("location");
		String classRoom = request.getParameter("classroom");
		String machNumb = request.getParameter("machnumb");
		String resultShowType = request.getParameter("errortype");
		String resultShowCause = request.getParameter("errorcause");
		String resultShowDesc = request.getParameter("describe");
		
		String action = request.getParameter("action");
		//显示到console命令下显示
		System.out.println(location+" "+classRoom + " " + machNumb + " " + resultShowType + " " + resultShowCause + " " + action+" "+resultShowDesc);
		//创建数组list
		ArrayList<String> list = new ArrayList<String>();
		list.add(0, location);
		list.add(1, classRoom);
		list.add(2, machNumb);
		list.add(3, resultShowType);
		list.add(4,resultShowCause);
		list.add(5,resultShowDesc);

//		//查看是否重复插入
//		UserDao.insertInfo(list);
//		Info result = UserDao.checkInfo(machNumb);
//		if ("add".equals(action)) {
//			if (result == null) {
//
//				if (UserDao.insertInfo(list)) {
//					request.getRequestDispatcher("submit_sucess.jsp").forward(request, response);
//				} else {
//					//未插入成功
//					response.sendRedirect("submit_failtrue.jsp");
//				}
//
//			} else {
//				//已存在
//
//				response.sendRedirect("submit_failtrue.jsp");
//			}
//		}

		if ("delete".equals(action)) {

			// 从数据库1删除，添加到数据库2
			Info info = new Info();
			info.setLocation(location);
			info.setClassRoom(classRoom);
			info.setMachNumb(machNumb);
			info.setErrorType(resultShowType);
			info.setErrorCause(resultShowCause);
			if (UserDao.deleteMachines(classRoom, machNumb)) {
				RepairDao.insertInfo(info);
				request.getRequestDispatcher("repair.jsp").forward(request, response);
			} else {
				// 删除失败
				System.out.println("删除失败");
			}
		}
	%>

<h1>123<%= list%></h1>
</body>
</html>