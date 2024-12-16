<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>メニュー</title>
    <style>
        /* メニューバーのスタイル */
        nav {
            background-color: #333;
            overflow: hidden;
        }
        nav a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        nav a:hover {
            background-color: #575757;
        }
        nav a.active {
            background-color: #04AA6D;
        }
    </style>
</head>
<body>
    <nav>
        <a href="index.jsp">ホーム</a>
        <a href="mypage.jsp">マイページ</a>
        <a href="schedule.jsp">スケジュール</a>
        <a href="about.jsp">詳細情報</a>
        <a href="contact.jsp">お問い合わせ</a>
    </nav>
</body>
</html>
