package booking;

public class booking {
private String CC,PID,email;
private int BID,FID,CC1,NP,C;
public booking(String cc,int bid,int fid,int np,String pid,int C,String email){
	this.BID=bid;
	this.FID=fid;
	this.NP=np;
	this.PID=pid;
	this.CC=cc;
	this.C=C;
	this.email=email;
}
public int getBID(){
	return BID;
}
public void setBID(int a){
	this.BID=a;
}
public String getCC(){
	return CC;
}
public void setCC(String a){
	this.CC=a;
}
public int getCC1(){
	return CC1;
}
public void setCC1(int a){
	this.CC1=a;
}
public int getFID(){
	return FID;
}
public void setFID(int a){
	this.FID=a;
}
public void setNP(int a){
	this.NP=a;
}
public int getNP(){
	return NP;
}
public void setPID(String a){
	this.PID=a;
}
public String getPID(){
	return PID;
}
public int getC() {
	return C;
}
public void setC(int c) {
	C = c;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}



}
