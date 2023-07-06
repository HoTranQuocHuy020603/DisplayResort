package example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import example.connection.DbCon;
import example.model.Employee;

public class EmployeeDao {

	Connection con = null;
	PreparedStatement pre = null;
	ResultSet rs = null;


	public List<Employee> selectAllEmployee() {
		List<Employee> employees = new ArrayList<>();
		String sql = "select * from displayresort.employee;";
		try {
			con = new DbCon().getConnection();
			pre = con.prepareStatement(sql);
			rs = pre.executeQuery();
			while(rs.next()) {
				employees.add(new Employee(rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getInt(6),
						rs.getInt(7)));
			}
			
		} catch (Exception e) {
		}
		return employees;
	}
	
	public void deleteEmployee(String id) {

		String sql = "delete from displayresort.employee where id = ?;";
		try {
			con = new DbCon().getConnection();
			pre = con.prepareStatement(sql);
			pre.setString(1, id);
			pre.executeUpdate();
			
			
		} catch (Exception e) {
		}
	}
	
	public void insertEmployee(String firstname,String lastname,String email,String phonenumber,String gender,String position) {

		String sql = "insert into employee (firstname,lastname,email,phonenumber,gender,position)\r\n"
				+ "values (?,?,?,?,?,?);";
		try {
			con = new DbCon().getConnection();
			pre = con.prepareStatement(sql);
			pre.setString(1, firstname);
			pre.setString(2, lastname);
			pre.setString(3, email);
			pre.setString(4, phonenumber);
			pre.setString(5, gender);
			pre.setString(6, position);
			pre.executeUpdate();
			
			
		} catch (Exception e) {
		}
	}
	
	public Employee getEmployee(String id) {

		String sql = "select * from displayresort.employee where id = ?;";
		try {
			con = new DbCon().getConnection();
			pre = con.prepareStatement(sql);
			pre.setString(1, id);
			rs = pre.executeQuery();
			while(rs.next()) {
				return new Employee(rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getInt(6),
						rs.getInt(7));
			}
					
		} catch (Exception e) {
		}
		return null;
	}
	public void updateEmployee(String id,String firstname,String lastname,String email,String phonenumber,String gender,String position) {

		String sql = "update employee \r\n"
				+ "set firstname = ?,\r\n"
				+ "lastname =?,\r\n"
				+ "email=?,\r\n"
				+ "phonenumber=?,\r\n"
				+ "gender =?, \r\n"
				+ "position =? \r\n"
				+ "where id=?;";
		try {
			con = new DbCon().getConnection();
			pre = con.prepareStatement(sql);
			pre.setString(1, firstname);
			pre.setString(2, lastname);
			pre.setString(3, email);
			pre.setString(4, phonenumber);
			pre.setString(5, gender);
			pre.setString(6, position);
			pre.setString(7, id);
			pre.executeUpdate();
			
			
		} catch (Exception e) {
		}
	}
	
	public List<Employee> search(String searchValue){
		List<Employee> listESearchs;
		listESearchs = new ArrayList<>();
		
		Connection con =null;
		PreparedStatement stm =  null;
		ResultSet rs = null;
		try {
			con = DbCon.getConnection();
			String sql = "SELECT * FROM displayresort.employee where firstname like ? \r\n"
					+ "or lastname like ?\r\n"
					+ "or email like ?\r\n"
					+ "or phonenumber like ?\r\n"
					+ "or gender like ?\r\n"
					+ "or position like ?;";
			stm = con.prepareStatement(sql);
			stm.setString(1, "%" + searchValue + "%");
			stm.setString(2, "%" + searchValue + "%");
			stm.setString(3, "%" + searchValue + "%");
			stm.setString(4, "%" + searchValue + "%");
			stm.setString(5, "%" + searchValue + "%");
			stm.setString(6, "%" + searchValue + "%");

			rs = stm.executeQuery();
			while (rs.next()) {
				listESearchs.add(new Employee(rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getInt(6),
						rs.getInt(7)));
			}
		} catch (Exception e) {
		}
		return listESearchs;
	}

}
