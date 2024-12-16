 <jsp:include page="menu.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>予約表</title>
</head>
<body>
    <h1>予約表</h1>
    <form action="reserve" method="post">
        <label for="date">日付:</label>
        <input type="date" id="date" name="date" required><br>
        <label for="time">時間:</label>
        <input type="time" id="time" name="time" required><br>
        <label for="classroom">教室:</label>
        <input type="text" id="classroom" name="classroom" required><br>
        <button type="submit">予約</button>
    </form>
</body>
</html>
