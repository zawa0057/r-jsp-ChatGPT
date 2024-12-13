<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>空き教室予約システム</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
    <h1>予約表</h1>
    <table>
        <tr>
            <th>時間帯</th>
            <% 
                SimpleDateFormat sdf = new SimpleDateFormat("MM/dd");
                Calendar calendar = Calendar.getInstance();
                for (int i = 0; i < 10; i++) {
                    out.print("<th>" + sdf.format(calendar.getTime()) + "</th>");
                    calendar.add(Calendar.DATE, 1);
                }
            %>
        </tr>
        <% 
            for (int hour = 9; hour <= 17; hour++) {
                out.print("<tr><td>" + hour + ":00</td>");
                calendar = Calendar.getInstance();
                for (int i = 0; i < 10; i++) {
                    // 予約状況を取得 (仮のデータ)
                    boolean available = Math.random() > 0.5;
                    out.print("<td>" + (available ? "◎" : "×") + "</td>");
                    calendar.add(Calendar.DATE, 1);
                }
                out.print("</tr>");
            }
        %>
    </table>
</body>
</html>
