package example.model;

public class Contract {
    private int cid;
    private String id;
    private String falname;
    private String email;
    private String phonenumber;
    private int gender;
    private String arrivaldate;
    private String departuredate;
    private int adults;
    private int children;
    private String roomtype;
    private String totalprice;
    private String category;
    
	public Contract() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Contract( int cid,String id, String falname, String email, String phonenumber, int gender, String arrivaldate,
			String departuredate, int adults, int children, String roomtype, String totalprice, String category) {
		super();
		this.cid = cid;
		this.id = id;
		this.falname = falname;
		this.email = email;
		this.phonenumber = phonenumber;
		this.gender = gender;
		this.arrivaldate = arrivaldate;
		this.departuredate = departuredate;
		this.adults = adults;
		this.children = children;
		this.roomtype = roomtype;
		this.totalprice = totalprice;
		this.category = category;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFalname() {
		return falname;
	}

	public void setFalname(String falname) {
		this.falname = falname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getArrivaldate() {
		return arrivaldate;
	}

	public void setArrivaldate(String arrivaldate) {
		this.arrivaldate = arrivaldate;
	}

	public String getDeparturedate() {
		return departuredate;
	}

	public void setDeparturedate(String departuredate) {
		this.departuredate = departuredate;
	}

	public int getAdults() {
		return adults;
	}

	public void setAdults(int adults) {
		this.adults = adults;
	}

	public int getChildren() {
		return children;
	}

	public void setChildren(int children) {
		this.children = children;
	}

	public String getRoomtype() {
		return roomtype;
	}

	public void setRoomtype(String roomtype) {
		this.roomtype = roomtype;
	}

	public String getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(String totalprice) {
		this.totalprice = totalprice;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Contract [cid=" + cid + ", id=" + id + ", falname=" + falname + ", email=" + email + ", phonenumber="
				+ phonenumber + ", gender=" + gender + ", arrivaldate=" + arrivaldate + ", departuredate="
				+ departuredate + ", adults=" + adults + ", children=" + children + ", roomtype=" + roomtype
				+ ", totalprice=" + totalprice + ", category=" + category + "]";
	}

	
    
	
}
