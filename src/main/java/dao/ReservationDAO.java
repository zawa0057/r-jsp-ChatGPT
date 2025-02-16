package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ReservationDAO {
    private final String DB_URL = "jdbc:mysql://localhost:3306/reservationsystem";
    private final String DB_USER = "root";
    private final String DB_PASS = "AdminDef";

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
    }

    public boolean addReservation(int userId, String reservationDate, String reservationTime) {
        String query = "INSERT INTO reservations (user_id, reservation_date, reservation_time) VALUES (?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, userId);
            ps.setDate(2, java.sql.Date.valueOf(reservationDate));
            ps.setString(3, reservationTime);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean checkAvailability(String date, String time) {
        String sql = "SELECT COUNT(*) FROM reservations WHERE reservation_date = ? AND reservation_time = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, date);
            pstmt.setString(2, time);
            ResultSet rs = pstmt.executeQuery();
            return rs.next() && rs.getInt(1) == 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
