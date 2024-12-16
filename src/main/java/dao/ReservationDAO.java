package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ReservationDAO {
    private final String DB_URL = "jdbc:mysql://localhost:3306/reservationsystem";  // データベース名
    private final String DB_USER = "root";  // ユーザー名
    private final String DB_PASS = "password";  // パスワード

    // 予約時間とユーザー情報をデータベースに登録するメソッド
    public boolean addReservation(int userId, String reservationDate, String reservationTime) {
        String query = "INSERT INTO reservations (user_id, reservation_date, reservation_time, status) " +
                       "VALUES (?, ?, ?, 'confirmed')";  // 'confirmed' 状態で予約を追加

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement ps = conn.prepareStatement(query)) {

            // パラメータを設定
            ps.setInt(1, userId);  // ユーザーID
            ps.setString(2, reservationDate);  // 予約日
            ps.setString(3, reservationTime);  // 予約時間

            // SQLを実行して予約をデータベースに登録
            int rowsAffected = ps.executeUpdate();

            // 正常に1行追加された場合、予約成功
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;  // エラーが発生した場合、予約失敗
        }
    }

    // 指定された日時の状態を 'reserved' に更新するメソッド
    public boolean markAsReserved(String date, String time) {
        String query = "UPDATE reservations SET status = 'reserved' WHERE reservation_date = ? AND reservation_time = ? AND status = 'available'";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement ps = conn.prepareStatement(query)) {

            // パラメータを設定
            ps.setString(1, date);
            ps.setString(2, time);

            // SQLを実行して予約状態を更新
            int rowsAffected = ps.executeUpdate();

            // 更新成功時に true を返す
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;  // エラー時に false を返す
        }
    }
}
