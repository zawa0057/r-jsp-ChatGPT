 <jsp:include page="menu.jsp" />
 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>空き部屋予約システム</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1 {
            color: #333;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            margin: 10px 0;
        }
        a {
            text-decoration: none;
            color: #0066cc;
        }
        a:hover {
            text-decoration: underline;
        }
        nav {
            width: 100%;
            height: 70px;
            background-color: dimgray;
            margin-bottom: 20px;
        }
        .menu {
            padding: 15px;
            display: flex;
            justify-content: space-around;
            align-items: center;
        }
        .menu a {
            color: white;
            font-size: 16px;
        }
    </style>
</head>
<body>

    <h1>空き部屋予約システム</h1>
    <p>以下のメニューから操作を選択してください。</p>
    <ul>
        <li><a href="reservation_form.jsp">部屋を予約する</a></li>
        <li><a href="viewReservations.jsp">予約状況を確認する</a></li>
        <li><a href="cancelReservation.jsp">予約をキャンセルする</a></li>
        <li><a href="registerUser.jsp">ユーザー登録</a></li>
    </ul>
</body>
</html>

