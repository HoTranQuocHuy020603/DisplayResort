package example.model;

public class Service {
	
	private int id;
	private String name;
	private String category;
	private String image;
	
	
	
	public Service() {
	}

	public Service(int id, String name, String category, String image) {
		super();
		this.id = id;
		this.name = name;
		this.category = category;
		this.image = image;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "Service [id=" + id + ", name=" + name + ", category=" + category + ", image=" + image + "]";
	}

	

}
