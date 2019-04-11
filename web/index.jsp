<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>实验室保修</title>

<link rel="stylesheet" href="css/mui.min.css">
<link rel="stylesheet" type="text/css" href="css/mui.picker.css" />
<link rel="stylesheet" type="text/css" href="css/mui.poppicker.css" />
<style>
input, button, .mui-btn {
	margin: 5px 15px 10px 5px;
}

b {
	font-size: 18px;
}

#resultShow {
	margin: 10px;
	color: red;
}

.devicesInfo {
	margin: 15px 25px;
	padding: 0px 10px;
	height: auto;
	border: dashed;
}

h1 {
	text-align: center;
}
</style>
</head>

<body>
<%
		request.setCharacterEncoding("utf-8");
		String location = request.getParameter("location");
%>
	<header class="mui-bar mui-bar-nav"> <a
		class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
	<h1 class="mui-title">确认报修设备</h1>
	</header>

	<div class="mui-content">
		<div class="">
			<form id="form" action="" method="post">
				<div class="devicesInfo">
					<h1>设备信息</h1>
					<b>地点：
						<div id="location" name="location"><%= location %></div>
					</b> <br> <b>教室:
						<div id="classroom" name="classroom"></div>
					</b> <br> <b>机器型号:
						<div id="machnumb" name="machnumb"></div>
					</b> <br> <b>报修类型: <br> <span id="resultShowType"
						name="resultshowtype"></span> <span id="resultShowCause"
						name="resultshowcause"></span>
					</b>

					<div>
						<button type='button' id="showMachineState">选择</button>
					</div>
					<br /> <b> 简单描述: <textarea id="contentinfo" name="contentinfo"></textarea>
					</b>
				</div>
				<button id="submit" type="submit"
					class="mui-btn mui-btn-block mui-btn-primary">提交</button>
			</form>
		</div>
	</div>

</body>
<script src="js/mui.min.js"></script>
<script src="js/mui.picker.min.js"></script>
<script src="js/mui.picker.js"></script>
<script src="js/mui.poppicker.js"></script>
<script src="js/machine.Data.js" type="text/javascript" charset="utf-8"></script>
<script>
	var showMachineState = document.getElementById("showMachineState");
	var showResult1 = document.getElementById("resultShowType");
	var showResult2 = document.getElementById("resultShowCause");
	var describe = document.getElementById("contentinfo");
	var picker = new mui.PopPicker({
		layer : 2
	});
	//选择器显示
	picker.setData(machineData);
	showMachineState.addEventListener('tap', function(event) {
		picker.show(function(items) {
			showResult1.innerText = items[0].text;
			showResult2.innerText = items[1].text;
		});
	}, false);
</script>

<Script language="javascript">
	//获取网址？后面的参数方法
	function getQueryString(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
		var r = window.location.search.substr(1).match(reg);
		if (r != null)
			return unescape(r[2]);
		return null;
	}
	//获取显示的div的位置
	var showLocation = document.getElementById("location");
	var showClassRoom = document.getElementById("classroom");
	var showMachNumb = document.getElementById("machnumb");
	var showAciton = document.getElementById("form");
	//定义两个变量接受网站上的参数		
	var classRoom, machNumb, resultLocation, resultShowType, resultShowCause;
	classRoom = getQueryString("classroom");
	machNumb = getQueryString("machnumb");
	
	
	//	显示到网站上
	showClassRoom.innerText = "" + classRoom;
	showMachNumb.innerText = "" + machNumb;
	//showLocation.innerText = " " + resultLocation;
	//在页面上获取故障的参数
	var btn = document.getElementById("submit");
	btn.addEventListener('click', function(event) {
		resultShowType = showResult1.innerText;
		resultShowCause = showResult2.innerText;
		resultShowDesc = describe.value;
		resultLocation=showLocation.innerText;
		//控制跳转的参数	
		showAciton.action = "docheck.jsp?action=add&location=" + resultLocation
				+ "&classroom=" + classRoom + "&machnumb=" + machNumb
				+ "&errortype=" + resultShowType + "&errorcause="
				+ resultShowCause + "&describe=" + resultShowDesc;
	}, false);
</Script>
</html>