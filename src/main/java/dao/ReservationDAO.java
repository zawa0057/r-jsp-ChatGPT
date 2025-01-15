package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ReservationDAO {
    // データベース接続情報
    private final String DB_URL = "jdbc:mysql://localhost:3306/reservationsystem"; // データベース名
    private final String DB_USER = "root"; // ユーザー名
    private final String DB_PASS = "password"; // パスワード

    // データベース接続を取得するメソッド
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
    }

    /**
     * 予約情報をデータベースに登録するメソッド
     * 
     * @param userId ユーザーID
     * @param reservationDate 予約日
     * @param reservationTime 予約時間
     * @return 登録成功なら true、それ以外は false
     */
    public boolean addReservation(int userId, String reservationDate, String reservationTime) {
        String query = "INSERT INTO reservations (user_id, reservation_date, reservation_time, status) " +
                       "VALUES (?, ?, ?, 'confirmed')";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            // パラメータを設定
            ps.setInt(1, userId);
            ps.setString(2, reservationDate);
            ps.setString(3, reservationTime);

            // SQLを実行して予約をデータベースに登録
            int rowsAffected = ps.executeUpdate();

            return rowsAffected > 0; // 1行以上追加されたら成功

        } catch (SQLException e) {
            e.printStackTrace();
            return false; // エラー時は false を返す
        }
    }

    /**
     * 指定された日時の予約状態を 'reserved' に更新するメソッド
     * 
     * @param date 更新対象の日付
     * @param time 更新対象の時間
     * @return 更新成功なら true、それ以外は false
     */
    public boolean markAsReserved(String date, String time) {
        String query = "UPDATE reservations SET status = 'reserved' " +
                       "WHERE reservation_date = ? AND reservation_time = ? AND status = 'available'";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            // パラメータを設定
            ps.setString(1, date);
            ps.setString(2, time);

            // SQLを実行して予約状態を更新
            int rowsAffected = ps.executeUpdate();

            return rowsAffected > 0; // 更新成功なら true

        } catch (SQLException e) {
            e.printStackTrace();
            return false; // エラー時は false を返す
        }
    }

    /**
     * 指定された日時が予約可能かどうかを確認するメソッド
     * 
     * @param date 確認対象の日付
     * @param time 確認対象の時間
     * @return 予約可能なら true、それ以外は false
     */
    public boolean checkAvailability(String date, String time) {
        String sql = "SELECT COUNT(*) FROM reservations WHERE reservation_date = ? AND reservation_time = ? AND status = 'confirmed'";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // パラメータを設定
            pstmt.setString(1, date);
            pstmt.setString(2, time);

            // クエリを実行して結果を取得
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count == 0; // 予約がない場合に true を返す
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // デフォルトでは予約不可とする
    }

}
