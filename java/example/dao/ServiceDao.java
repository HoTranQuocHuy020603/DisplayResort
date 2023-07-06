package example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.*;
import example.model.*;

public class ServiceDao {
	private Connection con;
	private PreparedStatement pre;
	private ResultSet rs;
	private String sql;

	public ServiceDao(Connection con) {
		this.con = con;
	}

	public List<Service> getAllService() {
		List<Service> services = new ArrayList<Service>();

		try {
			sql = "SELECT * FROM displayresort.service";
			pre = this.con.prepareStatement(sql);
			rs = pre.executeQuery();
			while (rs.next()) {
				Service row = new Service();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setImage(rs.getString("image"));

				services.add(row);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return services;
	}

}
