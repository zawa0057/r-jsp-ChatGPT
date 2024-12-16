 <jsp:include page="menu.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.time.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>部屋予約状況</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #333;
            text-align: center;
            padding: 10px;
        }
        th {
            background-color: #f2f2f2;
        }
        .available {
            color: green;
            text-decoration: none;
        }
        .unavailable {
            color: red;
        }
    </style>
</head>
<body>
    <h1>部屋予約状況</h1>
    <table>
        <thead>
            <tr>
                <th>時刻</th>
                <% 
                    // 今日から10日分の日付を生成して表示
                    LocalDate today = LocalDate.now();
                    for (int i = 0; i < 10; i++) {
                        LocalDate date = today.plusDays(i);
                        out.print("<th>" + date + "</th>");
                    }
                %>
            </tr>
        </thead>
        <tbody>
            <% 
                // 時刻のループ
                for (int hour = 9; hour <= 17; hour++) {
                    out.print("<tr>");
                    out.print("<td>" + hour + ":00</td>");
                    
                    // 日付のループ
                    for (int i = 0; i < 10; i++) {
                        LocalDate date = today.plusDays(i);
                        String formattedDate = date.toString();
                        String time = hour + ":00";

                        // DAOや予約データから予約可否をチェック (簡略化)
                        boolean isAvailable = true; // 例: DBから確認する処理を追加

                        if (isAvailable) {
                            // 予約可能な場合
                            out.print("<td><a class='available' href='confirmReservation.jsp?date=" + formattedDate + "&time=" + time + "'>◎</a></td>");
                        } else {
                            // 予約不可な場合
                            out.print("<td class='unavailable'>×</td>");
                        }
                    }
                    out.print("</tr>");
                }
            %>
        </tbody>
    </table>
</body>
</html>
