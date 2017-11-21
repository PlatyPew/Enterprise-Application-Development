package review;


public class review {
private int id;
private String username,reviews,date,img;
public String getUsername(){
	return username;
} 
public void setUsername(String username){
	this.username=username;
}
public String getReviews(){
	return reviews;
} 
public void setReviews(String reviews){
	this.reviews=reviews;
}
public String getDate(){
	return date;
} 
public void setDate(String date){
	this.date=date;
}
public int getId(){
	return id;
} 
public void setId(int id){
	this.id=id;
}
public String getImg(){
	return img;
} 
public void setImg(int id){
	this.img=img;
}
public review (String username, String reviews,String date,String img){
	this.reviews=reviews;
	this.username=username;
	this.date=date;
	this.img=img;
}
}
