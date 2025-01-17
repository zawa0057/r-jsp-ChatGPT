<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>使用状況一覧</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f9f9f9;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        caption {
            font-size: 1.5em;
            font-weight: bold;
            margin-bottom: 10px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        td {
            font-size: 1.1em;
        }
    </style>
</head>
<body>
    <jsp:include page="menu.jsp" />
    <table>
        <caption>KRCドーム授業使用表</caption>
        <tr>
            <th>時間/曜日</th>
            <th>月曜日</th>
            <th>火曜日</th>
            <th>水曜日</th>
            <th>木曜日</th>
            <th>金曜日</th>
        </tr>
        <tr>
            <td>1限</td>
            <td>1AB</td>
            <td>4A</td>
            <td>1G</td>
            <td>2C</td>
            <td>2E</td>
        </tr>
        <tr>
            <td>2限</td>
            <td>2A</td>
            <td>2BN</td>
            <td>1H</td>
            <td>3E</td>
            <td>2D</td>
        </tr>
        <tr>
            <td>昼休み</td>
            <td>空</td>
            <td>空</td>
            <td>空</td>
            <td>空</td>
            <td>空</td>
        </tr>
        <tr>
            <td>3限</td>
            <td>3A</td>
            <td>1CD</td>
            <td>部活動</td>
            <td>1F</td>
            <td>1E</td>
        </tr>
        <tr>
            <td>放課後</td>
            <td>空</td>
            <td>空</td>
            <td>部活動</td>
            <td>空</td>
            <td>空</td>
        </tr>
    </table>
</body>
</html>
