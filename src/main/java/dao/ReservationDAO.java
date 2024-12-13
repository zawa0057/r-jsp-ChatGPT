package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class ReservationDAO {
    private final String DB_URL = "jdbc:mysql://localhost:3306/classroom_reservation";
    private final String DB_USER = "root";
    private final String DB_PASS = "password";

    public boolean addReservation(String date, String time, String classroom) {
        String query = "INSERT INTO reservations (reservation_date, start_time, classroom_id) VALUES (?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, date);
            ps.setString(2, time);
            ps.setString(3, classroom);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
