package passenger;

public class passenger {
private int PID,BID;
private String name;
public passenger(int PID,int BID,String name){
	this.PID=PID;
	this.BID=BID;
	this.name=name;
	
}

public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public int getBID() {
	return BID;
}
public void setBID(int bID) {
	BID = bID;
}
public int getPID() {
	return PID;
}
public void setPID(int pID) {
	PID = pID;
}
}
