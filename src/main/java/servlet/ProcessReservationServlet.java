package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReservationDAO;

@WebServlet("/processReservation")
public class ProcessReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // フォームデータを取得
        String date = request.getParameter("date");
        String time = request.getParameter("time");

        // セッションからユーザーIDを取得
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            // セッションにユーザーIDがない場合はログインページへリダイレクト
            response.sendRedirect("login.jsp");
            return;
        }

        // DAOを使って予約処理を実行
        ReservationDAO dao = new ReservationDAO();
        boolean success = dao.addReservation(userId, date, time); // 予約登録
        boolean marked = false;

        if (success) {
            // 対象日時を予約済みに変更
            marked = dao.markAsReserved(date, time);
        }

        if (success && marked) {
            request.setAttribute("message", "予約が完了しました！");
        } else {
            request.setAttribute("message", "予約に失敗しました。");
        }

        // 結果ページへフォワード
        request.getRequestDispatcher("views/reservation_result.jsp").forward(request, response);
    }
}
