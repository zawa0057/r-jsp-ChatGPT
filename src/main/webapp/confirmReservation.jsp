 <jsp:include page="menu.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>予約確認</title>
</head>
<body>
    <h1>予約確認</h1>
    <%
        // URLパラメータから予約情報を取得
        String date = request.getParameter("date");
        String time = request.getParameter("time");

        if (date == null || time == null) {
            out.println("<p>予約情報が不足しています。</p>");
            return;
        }
    %>
    <p>以下の内容で予約しますか？</p>
    <ul>
        <li>日付: <%= date %></li>
        <li>時刻: <%= time %></li>
    </ul>
    <form action="reservation_result.jsp" method="post">
        <input type="hidden" name="date" value="<%= date %>">
        <input type="hidden" name="time" value="<%= time %>">
        <button type="submit">予約を確定する</button>
    </form>
    <a href="searchRoom.jsp">戻る</a>
</body>
</html>
