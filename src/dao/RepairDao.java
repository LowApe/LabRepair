package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.Info;
import dbhelper.DBHelper;

public class RepairDao {
	
	public static boolean insertInfo(final Info info){
		Connection conn=null;
		PreparedStatement stm=null;
		int rs=0;
		
		try {
			conn=(Connection) DBHelper.getConnection();
			String sql="insert into machinerepair values(null,?,?,?,?,?,'已修理',now());";	
			stm=conn.prepareStatement(sql);
			stm.setString(1, info.getLocation());
			stm.setString(2, info.getClassRoom());
			stm.setString(3, info.getMachNumb());
			stm.setString(4, info.getErrorType());
			stm.setString(5, info.getErrorCause());
			rs=stm.executeUpdate();
			if(rs>0){
				return true;
			}else{
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(stm!=null){
				try {
					stm.close();
					stm=null;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return false;
	}
}
