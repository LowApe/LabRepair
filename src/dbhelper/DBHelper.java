package dbhelper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBHelper {
	private static final String URL="jdbc:mysql://localhost:3306/machine";
	private static final String DRIVER="com.mysql.jdbc.Driver";
	private static final String USERNAME="root";
	private static final String PASSWORD="123456";
	private static Connection conn=null;
	
	static{
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() throws SQLException{
		if(conn==null){
			conn=DriverManager.getConnection(URL,USERNAME,PASSWORD);
			return conn;
		}
		return conn;
	}
	
	public static void main(String[] args) {
			try {
				 Connection conn=DBHelper.getConnection();
				if(conn!=null){
					System.out.println("数据库连接成功.......");
				}else{
					System.out.println("数据库连接失败.......");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
}
