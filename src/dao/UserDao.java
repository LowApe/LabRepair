package dao;



import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;

import bean.Info;
import dbhelper.DBHelper;

public class UserDao {
	
	public static Info checkInfo(final String machnumb){
		Info info=null;
		Connection conn=null;
		PreparedStatement stm=null;
		ResultSet rs=null;
		try {
			conn=(Connection) DBHelper.getConnection();
			String sql="select * from machineinfo where machnumb=?;";
			stm=conn.prepareStatement(sql);
			stm.setString(1, machnumb);
			rs=stm.executeQuery();
			if(rs!=null){
				while(rs.next()){
					info=new Info();
					System.out.println(info+"");
					info.setClassRoom(rs.getString("classroom"));
					info.setMachNumb(rs.getString("machnumb"));
					info.setErrorType(rs.getString("errortype"));
					info.setErrorCause(rs.getString("errorcause"));
					info.setRepairState(rs.getString("repairstate"));
					info.setReportTime(rs.getTime("reporttime"));
				}
			}else{
				return info;
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(rs!=null){
				try {
					rs.close();
					rs=null;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
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
		return info;
	}
	public static boolean insertInfo(final ArrayList<String> list){
		Connection conn=null;
		PreparedStatement stm=null;
		int rs=0;
		
		try {
			conn=(Connection) DBHelper.getConnection();
			String sql="insert into machineinfo values(null,?,?,?,?,?,'未修理',?,now());";	
			stm=conn.prepareStatement(sql);
			stm.setString(1, list.get(0));
			stm.setString(2, list.get(1));
			stm.setString(3, list.get(2));
			stm.setString(4, list.get(3));
			stm.setString(5, list.get(4));
			stm.setString(6, list.get(5));
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
	
	//获取表一 的所有信息
	public static ArrayList<Info> getMachines(){
		ArrayList<Info> list=new ArrayList<>();
		Connection conn=null;
		PreparedStatement stm=null;
		ResultSet rs=null;
		
		try {
			conn=(Connection) DBHelper.getConnection();
			String sql="select * from machineinfo;";
			stm=conn.prepareStatement(sql);
			rs=stm.executeQuery();
			
			while(rs.next()){
				Info info=new Info();
				info.setLocation(rs.getString("location"));
				info.setClassRoom(rs.getString("classroom"));
				info.setMachNumb(rs.getString("machnumb"));
				info.setErrorType(rs.getString("errortype"));
				info.setErrorCause(rs.getString("errorcause"));
				info.setDescribe(rs.getString("reprotdesc"));
				info.setRepairState(rs.getString("repairstate"));
				info.setReportTime(rs.getTime("reporttime"));
				list.add(info);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(rs!=null){
				try {
					rs.close();
					rs=null;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
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
		
		return list;
	}
	
	
	public static boolean deleteMachines(String classroom,String machnumb){
	
		Connection conn=null;
		PreparedStatement stm=null;
		int rs=0;
		
		try {
			conn=(Connection) DBHelper.getConnection();
			String sql="delete from machineinfo where classroom=? and machnumb=?;";
			stm=conn.prepareStatement(sql);
			stm.setString(1,classroom);
			stm.setString(2,machnumb);
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
	public static class TestUserDao{
		public static void main(String[] args) {
			System.out.println(getMachines());
			ArrayList<String> list = new ArrayList<String>();
			list.add(0, null);
			list.add(1, null);
			list.add(2, null);
			list.add(3, null);
			list.add(4,null);
			list.add(5,null);
			System.out.println(UserDao.insertInfo(list));
		}
	}
}
