package example.model;

public class Account {
	private int id;
	private String username;
	private String password;
	private boolean isAdmin;
	private boolean isEmployee;
	
	public Account() {
		super();
	}
	
	public Account(String username, String password, boolean isAdmin, boolean isEmployee) {
		super();
		this.username = username;
		this.password = password;
		this.isAdmin = isAdmin;
		this.isEmployee = isEmployee;
	}

	public Account(int id, String username, String password, boolean isAdmin, boolean isEmployee) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.isAdmin = isAdmin;
		this.isEmployee = isEmployee;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	public boolean getIsEmployee() {
		return isEmployee;
	}

	public void setIsEmployee(boolean isEmployee) {
		this.isEmployee = isEmployee;
	}

	@Override
	public String toString() {
		return "Account [id=" + id + ", username=" + username + ", password=" + password + ", isAdmin=" + isAdmin
				+ ", isEmployee=" + isEmployee + "]";
	}

	
	
}
