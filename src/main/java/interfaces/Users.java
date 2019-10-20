package interfaces;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import beans.UsersBean;
import jdbc.DBConnect;

public interface Users {
	public static UsersBean getUser(String emailP,String passwordP) {
		String sql = "SELECT name, cnic, email, password, dob, fName, contact, gender\n"
				+ " FROM KhanGym.Users where email=? and password=?;";
		UsersBean usersBean = new UsersBean();
		try {
			PreparedStatement ps = DBConnect.getCon().prepareStatement(sql);

			ps.setString(1, emailP);
			ps.setString(2, passwordP);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String name = rs.getString(1);
				String cnic = rs.getString(2);
				String email = rs.getString(3);
				String password = rs.getString(4);
				Date dob = rs.getDate(5);
				String fName = rs.getString(6);
				String contact = rs.getString(7);
				String gender = rs.getString(8);
				usersBean = new UsersBean(name, cnic, email, password, dob, fName, contact, gender);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return usersBean;
	};
	public static boolean updateUser(UsersBean usersBean) {
		boolean isUpdated = false;
		String sql = "UPDATE KhanGym.Users\n"
				+ "SET name=?, password=?, dob=?, fName=?, contact=?, gender=? WHERE cnic=?;";
		
		try(Connection con = DBConnect.getCon();) {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,usersBean.getfName());
			ps.setString(2, usersBean.getPassword());
			ps.setDate(3, new Date(usersBean.getDob().getTime()));
			ps.setString(4, usersBean.getfName());
			ps.setString(5, usersBean.getContact());
			ps.setString(6, usersBean.getGender());
			isUpdated=!ps.execute();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return isUpdated;
	}
	public static boolean addUser(UsersBean usersBean) {
		boolean isAdded=false;
		String sql="INSERT INTO KhanGym.Users\n" + 
				"(name, cnic, email, password, dob, fName, contact, gender)\n" + 
				"VALUES(?, ?, ?, ?, ?, ?, ?, ?);";
		
		try(Connection con = DBConnect.getCon();) {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, usersBean.getName());
			ps.setString(2, usersBean.getCnic());
			ps.setString(3, usersBean.getEmail());
			ps.setString(4, usersBean.getPassword());
			ps.setDate(5, new Date(usersBean.getDob().getTime()));
			ps.setString(6, usersBean.getfName());
			ps.setString(7, usersBean.getContact());
			ps.setString(8, usersBean.getGender());
			isAdded=!ps.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return isAdded;
	}
}
