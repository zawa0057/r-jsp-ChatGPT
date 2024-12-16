 <jsp:include page="menu.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>部屋予約フォーム</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            text-align: center;
            padding: 10px;
        }
        th {
            background-color: #f4f4f4;
        }
        td a {
            text-decoration: none;
            color: #0066cc;
        }
        td a:hover {
            text-decoration: underline;
        }
        .back-link {
            margin-top: 20px;
            display: inline-block;
            text-decoration: none;
            color: #0066cc;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>部屋予約フォーム</h1>
    <p>以下の予約可能な日時をクリックして予約を確定してください。</p>
    <table>
        <thead>
            <tr>
                <th>時間</th>
                <% 
                    // システム日付から10日間分の日付を生成
                    java.util.Calendar calendar = java.util.Calendar.getInstance();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("MM/dd(E)");
                    for (int i = 0; i < 10; i++) {
                        String date = sdf.format(calendar.getTime());
                        out.print("<th>" + date + "</th>");
                        calendar.add(java.util.Calendar.DATE, 1);
                    }
                %>
            </tr>
        </thead>
        <tbody>
            <% 
                // 時間（9:00～17:00）を生成
                String[] times = {"09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00"};
                for (String time : times) {
                    out.print("<tr>");
                    out.print("<td>" + time + "</td>");
                    
                    calendar = java.util.Calendar.getInstance(); // 再度初期化
                    for (int i = 0; i < 10; i++) {
                        String date = sdf.format(calendar.getTime());
                        
                        // DAOを利用して予約可否を確認 (仮実装: 全て予約可)
                        boolean isAvailable = true; // ここでDBチェックを行い、予約可否を取得
                        
                        if (isAvailable) {
                            out.print("<td><a href='confirmReservation.jsp?date=" + date + "&time=" + time + "'>◎</a></td>");
                        } else {
                            out.print("<td>×</td>");
                        }
                        
                        calendar.add(java.util.Calendar.DATE, 1);
                    }
                    out.print("</tr>");
                }
            %>
        </tbody>
    </table>
    <a href="index.jsp" class="back-link">ホームに戻る</a>
</body>
</html>
