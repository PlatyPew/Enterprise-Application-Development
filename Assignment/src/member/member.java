package member;

public class member {
	private String email,role,pwd,user,pic;
	public member (String email,String role,String pwd,String user,String pic){
		this.email=email;
		this.role=role;
		this.pwd=pwd;
		this.user=user;
		this.pic=pic;
	}
	
	public member() {
		// TODO Auto-generated constructor stub
	}
	public void setEmail(String a){
		this.email=a;
	}
	public String getEmail(){
		return this.email;
	} 
	public void setRole(String a){
		this.role=a;
	}
	public String getRole(){
		return this.role;
	} 
	public void setPwd(String a){
		this.pwd=a;
	}
	public String getPwd(){
		return this.pwd;
	} 
	public void setUser(String a){
		this.user=a;
	}
	public String getUser(){
		return this.user;
	} 
	public void setPic(String a){
		this.pic=a;
	}
	public String getPic(){
		return this.pic;
	} 
	
}
