package example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import example.connection.DbCon;
import example.model.Contract;
public class ContractDao {

	Connection con = null;
	PreparedStatement pre = null;
	ResultSet rs = null;


	public List<Contract> selectAllContract() {
		List<Contract> contracts = new ArrayList<>();
		String sql = "SELECT distinct c.cid,e.lastname,c.falname,c.email,c.phonenumber,c.gender,\r\n"
				+ "c.arrivaldate,c.departuredate,c.adults,c.children,c.roomtype,\r\n"
				+ "c.totalprice,c.category FROM displayresort.contract as c  join \r\n"
				+ "displayresort.employee as e on c.id = e.id;";
		try {
			con = new DbCon().getConnection();
			pre = con.prepareStatement(sql);
			rs = pre.executeQuery();
			while(rs.next()) {
				contracts.add(new Contract(rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getInt(6),
						rs.getString(7),
						rs.getString(8),
						rs.getInt(9),
						rs.getInt(10),
						rs.getString(11),
						rs.getString(12),
						rs.getString(13)));
			}
			
		} catch (Exception e) {
		}
		return contracts;
	}
	
	public void deleteContract(String cid) {

		String sql = "delete from displayresort.contract where cid = ?;";
		try {
			con = new DbCon().getConnection();
			pre = con.prepareStatement(sql);
			pre.setString(1, cid);
			pre.executeUpdate();
			
			
		} catch (Exception e) {
		}
	}
	
	public void insertContract(String falname,String id,String email,String phonenumber,String gender,
			String arrivaldate,String departuredate,String adults,String children,String roomtype,
			String totalprice,String category) {

		String sql = "insert into contract (falname,id,email,phonenumber,gender,arrivaldate,\r\n"
				+ "departuredate,adults,children,roomtype,totalprice,category) values  \r\n"
				+ "(?,?,?,?,?,?,?,?,?,\r\n"
				+ "?,? * datediff(departuredate,arrivaldate),?);";
		try {
			con = new DbCon().getConnection();
			pre = con.prepareStatement(sql);
			pre.setString(1, falname);
			pre.setString(2, id);
			pre.setString(3, email);
			pre.setString(4, phonenumber);
			pre.setString(5, gender);
			pre.setString(6, arrivaldate);
			pre.setString(7, departuredate);
			pre.setString(8, adults);
			pre.setString(9, children);
			pre.setString(10, roomtype);
			pre.setString(11, totalprice);
			pre.setString(12, category);
			pre.executeUpdate();
			
			
		} catch (Exception e) {
		}
	}
	
	public Contract getContract(String cid) {

		String sql = "select * from displayresort.contract where cid = ?;";
		try {
			con = new DbCon().getConnection();
			pre = con.prepareStatement(sql);
			pre.setString(1, cid);
			rs = pre.executeQuery();
			while(rs.next()) {
				return new Contract(rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getInt(6),
						rs.getString(7),
						rs.getString(8),
						rs.getInt(9),
						rs.getInt(10),
						rs.getString(11),
						rs.getString(12),
						rs.getString(13));
			}
					
		} catch (Exception e) {
		}
		return null;
	}
	public void updateContract(String falname,String id,String email,String phonenumber,String gender,
			String arrivaldate,String departuredate,String adults,String children,String roomtype,
			String totalprice,String category, String cid) {
		
		String sql = "update contract \r\n"
				+ "set falname = ?,\r\n"
				+ "id =?,\r\n"
				+ "email=?,\r\n"
				+ "phonenumber=?,\r\n"
				+ "gender =?, \r\n"
				+ "arrivaldate =?, \r\n"
				+ "departuredate =?, \r\n"
				+ "adults =?, \r\n"
				+ "children =?, \r\n"
				+ "roomtype =?, \r\n"
				+ "totalprice =? * datediff(departuredate,arrivaldate), \r\n"
				+ "category =? \r\n"
				+ "where cid=?;";
		
		try {
			con = new DbCon().getConnection();
			pre = con.prepareStatement(sql);
			pre.setString(1, falname);
			pre.setString(2, id);
			pre.setString(3, email);
			pre.setString(4, phonenumber);
			pre.setString(5, gender);
			pre.setString(6, arrivaldate);
			pre.setString(7, departuredate);
			pre.setString(8, adults);
			pre.setString(9, children);
			pre.setString(10, roomtype);
			pre.setString(11, totalprice);
			pre.setString(12, category);
			pre.setString(13, cid);
			pre.executeUpdate();			
			System.out.println("Ok");
		} catch (Exception e) {
		}
	}
	
	public List<Contract> search(String searchValue){
		List<Contract> listHDSearchs;
		listHDSearchs = new ArrayList<>();
		
		Connection con =null;
		PreparedStatement stm =  null;
		ResultSet rs = null;
		try {
			con = DbCon.getConnection();
			String sql = "select distinct c.cid,e.lastname,c.falname,c.email,c.phonenumber,c.gender,\r\n"
					+ "c.arrivaldate,c.departuredate,c.adults,c.children,c.roomtype,\r\n"
					+ "c.totalprice,c.category from displayresort.contract as c join \r\n"
					+ "displayresort.employee as e on c.id = e.id where  \r\n"
					+ "c.falname like ? \r\n"
					+ "or e.lastname like ?\r\n"
					+ "or c.id like ?\r\n"
					+ "or c.email like ?\r\n"
					+ "or c.phonenumber like ?\r\n"
					+ "or c.gender like ?\r\n"
					+ "or c.arrivaldate like ?\r\n"
					+ "or c.departuredate like ?\r\n"
					+ "or c.adults like ?\r\n"
					+ "or c.children like ?\r\n"
					+ "or c.roomtype like ?\r\n"
					+ "or c.totalprice like ?\r\n"
					+ "or c.category like ?;";
			stm = con.prepareStatement(sql);
			stm.setString(1, "%" + searchValue + "%");
			stm.setString(2, "%" + searchValue + "%");
			stm.setString(3, "%" + searchValue + "%");
			stm.setString(4, "%" + searchValue + "%");
			stm.setString(5, "%" + searchValue + "%");
			stm.setString(6, "%" + searchValue + "%");
			stm.setString(7, "%" + searchValue + "%");
			stm.setString(8, "%" + searchValue + "%");
			stm.setString(9, "%" + searchValue + "%");
			stm.setString(10, "%" + searchValue + "%");
			stm.setString(11, "%" + searchValue + "%");
			stm.setString(12, "%" + searchValue + "%");
			stm.setString(13, "%" + searchValue + "%");

			rs = stm.executeQuery();
			while (rs.next()) {
				listHDSearchs.add(new Contract(rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getInt(6),
						rs.getString(7),
						rs.getString(8),
						rs.getInt(9),
						rs.getInt(10),
						rs.getString(11),
						rs.getString(12),
						rs.getString(13)));
			}
		} catch (Exception e) {
		}
		return listHDSearchs;
	}

}
