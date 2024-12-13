package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/reserve")
public class ReserveServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String classroom = request.getParameter("classroom");

        // 予約処理（DAO経由でデータベースに登録）
        boolean success = true; // 仮実装

        if (success) {
            request.setAttribute("message", "予約が完了しました！");
        } else {
            request.setAttribute("message", "予約に失敗しました。");
        }

        request.getRequestDispatcher("views/reservation_result.jsp").forward(request, response);
    }
}
