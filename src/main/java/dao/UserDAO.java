package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    private final String DB_URL = "jdbc:mysql://localhost:3306/reservationsystem";  
    private final String DB_USER = "root";  
    private final String DB_PASS = "password";  

    public boolean validateUser(String username, String password) {
        String query = "SELECT * FROM users WHERE username = ? AND password = ?";
        
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, username);
            ps.setString(2, password); // 本番ではハッシュ化したパスワードを使う

            ResultSet rs = ps.executeQuery();
            return rs.next(); // 結果があればログイン成功

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
