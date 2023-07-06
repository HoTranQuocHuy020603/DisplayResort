package example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import example.connection.DbCon;
import example.model.Customer;

public class CustomerDao {

	Connection con = null;
	PreparedStatement pre = null;
	ResultSet rs = null;


	public List<Customer> selectAllCustomer() {
		List<Customer> customers = new ArrayList<>();
		String sql = "select * from displayresort.customer;";
		try {
			con = new DbCon().getConnection();
			pre = con.prepareStatement(sql);
			rs = pre.executeQuery();
			while(rs.next()) {
				customers.add(new Customer(rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getInt(6)));
			}
			
		} catch (Exception e) {
		}
		return customers;
	}
	
	public void deleteCustomer(String id) {

		String sql = "delete from displayresort.customer where id = ?;";
		try {
			con = new DbCon().getConnection();
			pre = con.prepareStatement(sql);
			pre.setString(1, id);
			pre.executeUpdate();
			
			
		} catch (Exception e) {
		}
	}
	
	public void insertCustomer(String firstname,String lastname,String email,String phonenumber,String gender) {

		String sql = "insert into customer (firstname,lastname,email,phonenumber,gender)\r\n"
				+ "values (?,?,?,?,?);";
		try {
			con = new DbCon().getConnection();
			pre = con.prepareStatement(sql);
			pre.setString(1, firstname);
			pre.setString(2, lastname);
			pre.setString(3, email);
			pre.setString(4, phonenumber);
			pre.setString(5, gender);
			pre.executeUpdate();
			
			
		} catch (Exception e) {
		}
	}
	
	public Customer getCustomer(String id) {

		String sql = "select * from displayresort.customer where id = ?;";
		try {
			con = new DbCon().getConnection();
			pre = con.prepareStatement(sql);
			pre.setString(1, id);
			rs = pre.executeQuery();
			while(rs.next()) {
				return new Customer(rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getInt(6));
			}
					
		} catch (Exception e) {
		}
		return null;
	}
	public void updateCustomer(String id,String firstname,String lastname,String email,String phonenumber,String gender) {

		String sql = "update customer \r\n"
				+ "set firstname = ?,\r\n"
				+ "lastname =?,\r\n"
				+ "email=?,\r\n"
				+ "phonenumber=?,\r\n"
				+ "gender =? \r\n"
				+ "where id=?;";
		try {
			con = new DbCon().getConnection();
			pre = con.prepareStatement(sql);
			pre.setString(1, firstname);
			pre.setString(2, lastname);
			pre.setString(3, email);
			pre.setString(4, phonenumber);
			pre.setString(5, gender);
			pre.setString(6, id);
			pre.executeUpdate();
			
			
		} catch (Exception e) {
		}
	}
	public List<Customer> search(String searchValue){
		List<Customer> listCSearchs;
		listCSearchs = new ArrayList<>();
		
		Connection con =null;
		PreparedStatement stm =  null;
		ResultSet rs = null;
		try {
			con = DbCon.getConnection();
			String sql = "SELECT * FROM displayresort.customer where firstname like ? \r\n"
					+ "or lastname like ?\r\n"
					+ "or email like ?\r\n"
					+ "or phonenumber like ?\r\n"
					+ "or gender like ?;";
			stm = con.prepareStatement(sql);
			stm.setString(1, "%" + searchValue + "%");
			stm.setString(2, "%" + searchValue + "%");
			stm.setString(3, "%" + searchValue + "%");
			stm.setString(4, "%" + searchValue + "%");
			stm.setString(5, "%" + searchValue + "%");

			rs = stm.executeQuery();
			while (rs.next()) {
				listCSearchs.add(new Customer(rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getInt(6)));
			}
		} catch (Exception e) {
		}
		return listCSearchs;
	}

}
