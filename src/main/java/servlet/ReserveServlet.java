package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReservationDAO;

@WebServlet("/reserve")
public class ReserveServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // フォームから受け取るパラメータ
        int userId = Integer.parseInt(request.getParameter("user_id"));
        String reservationDate = request.getParameter("reservation_date");  // 予約日
        String reservationTime = request.getParameter("reservation_time");  // 予約時間

        // ReservationDAO を使って予約情報をデータベースに登録
        ReservationDAO dao = new ReservationDAO();
        boolean success = dao.addReservation(userId, reservationDate, reservationTime);

        // 予約結果をメッセージとして設定
        if (success) {
            request.setAttribute("message", "予約が完了しました！");
        } else {
            request.setAttribute("message", "予約に失敗しましたヨ。");
        }

        // 結果ページに転送
        request.getRequestDispatcher("views/reservation_result.jsp").forward(request, response);
    }
}
