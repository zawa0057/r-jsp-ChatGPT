package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Test {

    public static void main(String[] args) {

    // 変数の準備
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

    // SQL文の作成
        String sql = "SELECT * FROM users";

        try {
            // JDBCドライバのロード
            Class.forName("com.mysql.cj.jdbc.Driver");
            // データベース接続
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/reservationsystem", "root", "AdminDef");
            // SQL実行準備
            stmt = con.prepareStatement(sql);
            // 実行結果取得
            rs = stmt.executeQuery();

      // データがなくなるまで(rs.next()がfalseになるまで)繰り返す
            while (rs.next()) {
            	String user_id = rs.getString("user_id");
                String username = rs.getString("username");
            	String email = rs.getString("email");
                String password = rs.getString("password");
                String created_at = rs.getString("created_at");
            


                System.out.println("ID: " + user_id);
                System.out.println("名前: " + username);
                System.out.println("メールアドレス: " + email);
                System.out.println("パスワード: " + password);
                System.out.println("作成日時: " + created_at);
                System.out.println();

            }
        } catch (ClassNotFoundException e) {
            System.out.println("JDBCドライバのロードでエラーが発生しました");
        } catch (SQLException e) {
            System.out.println("データベースへのアクセスでエラーが発生しました。");
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                System.out.println("データベースへのアクセスでエラーが発生しました。");
            }
        }
    }

}
