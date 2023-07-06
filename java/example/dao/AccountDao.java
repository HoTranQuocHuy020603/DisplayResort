package example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import example.connection.DbCon;
import example.model.Account;

public class AccountDao {
	


	public Account checkLogin(String username, String password) {
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;

		try {
			con = DbCon.getConnection();
			if (con != null) {
				String sql = "SELECT * FROM displayresort.user where username=? and password=?";
				pre = con.prepareStatement(sql);
				pre.setString(1, username);
				pre.setString(2, password);

				rs = pre.executeQuery();
				while (rs.next()) {
					return new Account(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getBoolean(4),rs.getBoolean(5)); 
				}
			}

		} catch(Exception e) {			
		}
		return null;
	}
	
	public Account checkAccount(String username) {
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;

		try {
			con = DbCon.getConnection();
			if (con != null) {
				String sql = "SELECT * FROM displayresort.user where username=?";
				pre = con.prepareStatement(sql);
				pre.setString(1, username);

				rs = pre.executeQuery();
				while (rs.next()) {
					return new Account(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getBoolean(4),rs.getBoolean(5)); 
				}
			}

		} catch(Exception e) {			
		}
		return null;
	}
	
	public void signUpAccount(String username,String password) {
		Connection con = null;
		PreparedStatement pre = null;

		try {
			con = DbCon.getConnection();
			if (con != null) {
				String sql = " INSERT INTO  `user` (`username`,`password`,isAdmin,isEmployee) VALUES (?,?,0,0); ";
				pre = con.prepareStatement(sql);
				pre.setString(1, username);
				pre.setString(2, password);
				pre.executeUpdate();
			}

		} catch(Exception e) {			
		}
	}
	
	
	Connection con = null;
	PreparedStatement pre = null;
	ResultSet rs = null;
	
	public List<Account> selectAllAccount() {
		List<Account> accounts = new ArrayList<>();
		String sql = "select * from displayresort.`user`;";
		try {
			con = new DbCon().getConnection();
			pre = con.prepareStatement(sql);
			rs = pre.executeQuery();
			while(rs.next()) {
				accounts.add(new Account(rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getBoolean(4),
						rs.getBoolean(5)));
			}
			
		} catch (Exception e) {
		}
		return accounts;
	}
	
	public void deleteAccount(String id) {

		String sql = "delete from displayresort.`user` where id = ?;";
		try {
			con = new DbCon().getConnection();
			pre = con.prepareStatement(sql);
			pre.setString(1, id);
			pre.executeUpdate();
			
			
		} catch (Exception e) {
		}
	}
	
	public void insertAccount(String username,String password,String isAdmin,String isEmployee) {

		try {
			con = DbCon.getConnection();
			if (con != null) {
				String sql = " INSERT INTO  displayresort.`user` (`username`,`password`,isAdmin,isEmployee) VALUES (?,?,?,?); ";
				pre = con.prepareStatement(sql);
				pre.setString(1, username);
				pre.setString(2, password);
				pre.setString(3, isAdmin);
				pre.setString(4, isEmployee);
				pre.executeUpdate();
			}

		} catch(Exception e) {			
		}
	}
	
	public Account getAccount(String id) {

		String sql = "select * from displayresort.`user` where id = ?;";
		try {
			con = new DbCon().getConnection();
			pre = con.prepareStatement(sql);
			pre.setString(1, id);
			rs = pre.executeQuery();
			while(rs.next()) {
				return new Account(rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getBoolean(4),
						rs.getBoolean(5));
			}
					
		} catch (Exception e) {
		}
		return null;
	}
	
	public void updateAccount(String id,String username,String password,String isAdmin,String isEmployee) {

		String sql = "update `user`\r\n"
				+ "set\r\n"
				+ "`password` =?,\r\n"
				+ "isAdmin=?,\r\n"
				+ "isEmployee=? \r\n"
				+ "where id=?;";
		try {
			con = new DbCon().getConnection();
			pre = con.prepareStatement(sql);
			pre.setString(1, password);
			pre.setString(2, isAdmin);
			pre.setString(3, isEmployee);
			pre.setString(4, id);
			pre.executeUpdate();
			
			
		} catch (Exception e) {
		}
	}
	public List<Account> search(String searchValue){
		List<Account> listASearchs;
		listASearchs = new ArrayList<>();
		
		Connection con =null;
		PreparedStatement stm =  null;
		ResultSet rs = null;
		try {
			con = DbCon.getConnection();
			String sql = "SELECT * FROM displayresort.`user` where username like ? \r\n"
					+ "or password like ?\r\n"
					+ "or isAdmin like ?\r\n"
					+ "or isEmployee like ?;";
			stm = con.prepareStatement(sql);
			stm.setString(1, "%" + searchValue + "%");
			stm.setString(2, "%" + searchValue + "%");
			stm.setString(3, "%" + searchValue + "%");
			stm.setString(4, "%" + searchValue + "%");

			rs = stm.executeQuery();
			while (rs.next()) {
				listASearchs.add(new Account(rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getBoolean(4),
						rs.getBoolean(5)));
			}
		} catch (Exception e) {
		}
		return listASearchs;
	}
	
	
}
