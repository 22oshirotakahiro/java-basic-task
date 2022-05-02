<%@page import="util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	// 残数の更新処理(残数の取得、更新、保存など) 
	if (session.getAttribute("totalNum") == null) {
		session.setAttribute("totalNum", 25);
	}
	int totalNum = (int)session.getAttribute("totalNum");
	
	String pickNumStr = request.getParameter("num");
	int pickNum;
	if (Utility.isNullOrEmpty(pickNumStr)) {
		pickNum = 0;
	} else {
		pickNum = Integer.parseInt(pickNumStr);
		totalNum -= pickNum;
		session.setAttribute("totalNum", totalNum);
	}
	

	
	// プレイヤーの切替処理(プレイヤーの取得、切替、保存など)
	if (session.getAttribute("player") == null) {
		session.setAttribute("player", "A");
	} else if (session.getAttribute("player").equals("A")) {
		session.setAttribute("player", "B");
	} else {
		session.setAttribute("player", "A");
	}
	// 残数が0以下の場合、結果ページへ遷移
	// (responseオブジェクトのsendRedirectメソッドを使用する)
	if (totalNum <= 0) {
		response.sendRedirect("http://localhost:8080/java-basic-task/finish.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Java基礎課題</title>
<link href="css/styles.css" rel="stylesheet">
</head>
<body>
	<h1>石取りゲーム</h1>

	<div class="info">
		<h2>
			残り：<%=totalNum%>個
		</h2>
		<p class="stone">
			<%=Utility.getStoneDisplayHtml(totalNum)%>
		</p>
	</div>
	<div class="info">
		<h2>
			プレイヤー<%=session.getAttribute("player")%>の番
		</h2>

		<form action="play.jsp">
			<p>
				石を <input type="number" name="num" min="1" max="3"> 個取る<br>
				※1度に3個取れます。
			</p>
			<button class="btn" type="submit">決定</button>
		</form>
	</div>
</body>
</html>