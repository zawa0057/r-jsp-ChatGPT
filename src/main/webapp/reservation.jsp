<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // セッションからユーザー名を取得
    String username = (String) session.getAttribute("username");

    // 未ログインの場合、ログインページへリダイレクト
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>予約画面</title>
</head>
<body>
    <h2>ようこそ、<%= username %> さん</h2>
    <p>予約を行うには、以下の時間から選択してください。</p>

    <!-- 予約の選択画面 -->
    
    <a href="logout.jsp">ログアウト</a>
</body>
</html>
