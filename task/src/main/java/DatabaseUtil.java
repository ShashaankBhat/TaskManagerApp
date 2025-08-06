import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseUtil {
	 private static final String DB_URL = "jdbc:mysql://localhost:3306/task";
	    private static final String DB_USER = "root";
	    private static final String DB_PASSWORD = "root123";

	    // Load the MySQL driver (if needed, depending on JDBC version)
	    static {
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        }
	    }

	    // Method to establish and return a database connection
	    public static Connection getConnection() throws SQLException {
	        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	    }
	}

