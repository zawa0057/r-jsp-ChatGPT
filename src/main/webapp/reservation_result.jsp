<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="dao.ReservationDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>予約確認結果</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1 {
            color: #333;
        }
        .result-container {
            border: 1px solid #ccc;
            padding: 20px;
            background-color: #f9f9f9;
            margin-top: 20px;
        }
        .result-container h2 {
            color: #0066cc;
        }
        .button {
            background-color: #0066cc;
            color: white;
            padding: 10px 20px;
            border: none;
            text-decoration: none;
            border-radius: 5px;
            display: inline-block;
        }
        .button:hover {
            background-color: #005bb5;
        }
        .back-link {
            display: inline-block;
            text-decoration: none;
            color: #0066cc;
            margin-top: 20px;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>予約確認結果</h1>

    <% 
        // リクエストパラメータから日時を取得
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        int userId = 1; // 仮にユーザーIDを1として処理（実際にはセッションなどから取得）

        ReservationDAO dao = new ReservationDAO();
        boolean isReserved = false;
        String reservationMessage = "";

        // 予約可能か確認
        if (date != null && time != null) {
            boolean available = dao.checkAvailability(date, time);
            if (available) {
                // 予約をデータベースに追加
                isReserved = dao.addReservation(userId, date, time);
                if (isReserved) {
                    reservationMessage = "予約が完了しました！";
                } else {
                    reservationMessage = "予約の登録に失敗しました。";
                }
            } else {
                reservationMessage = "指定された日時はすでに予約されています。";
            }
        } else {
            reservationMessage = "入力された情報に誤りがあります。";
        }
    %>

    <div class="result-container">
        <h2>予約情報</h2>
        <% if (isReserved) { %>
            <p><strong>予約日時:</strong> <%= date %> <%= time %></p>
            <p><strong>予約ステータス:</strong> 完了</p>
            <p><%= reservationMessage %></p>
        <% } else { %>
            <p><%= reservationMessage %></p>
        <% } %>
    </div>

    <a href="reservation_form.jsp" class="button">予約フォームに戻る</a>
    <a href="index.jsp" class="back-link">ホームに戻る</a>
</body>
</html>
