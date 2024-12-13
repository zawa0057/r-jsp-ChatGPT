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
}
</style>
</head>
<body>
   <h1>空き部屋予約システム</h1>
   <p>以下のメニューから操作を選択してください。</p>
   <ul>
       <li><a href="searchRoom.jsp">部屋を予約する</a></li>
       <li><a href="viewReservations.jsp">予約状況を確認する(まだ)</a></li>
       <li><a href="cancelReservation.jsp">予約をキャンセルする(まだ)</a></li>
       <li><a href="registerUser.jsp">ユーザー登録(まだ)</a></li>
       <li><a href="KRClist.jsp">部屋使用状況表</a></li>
       
   </ul>
</body>
</html>


