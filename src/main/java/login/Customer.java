package login;

public class Customer implements java.io.Serializable {
	
	private int id;
	private String name;
	private String password;
	private String school_cd;

	
	
	public int getId() {
		return id;
	}
	public String getLogin() {
		return name;
	}
	public String getPassword() {
		return password;
	}
	
	public String getSchool_cd() {
		return school_cd;
	}
	public void setId(int id) {
		this.id=id;
	}
	public void setLogin(String login) {
		this.name=login;
	}
	public void setPassword(String password) {
		this.password=password;
	}
	public void setSchool_cd(String school_cd) {
		this.school_cd=school_cd;
	}

}