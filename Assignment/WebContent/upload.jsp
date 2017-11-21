<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.io.*" %>
<%
try {
	//to get the content type information from JSP Request Header
	String contentType = request.getContentType();
	/*here we are checking the content type is not equal to Null and
 as well as the passed data from mulitpart/form-data is greater than or
 equal to 0*/
	if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
 		DataInputStream in = new DataInputStream(request.
getInputStream());
		//we are taking the length of Content type data
		int formDataLength = request.getContentLength();
		byte dataBytes[] = new byte[formDataLength];
		int byteRead = 0;
		int totalBytesRead = 0;
		//this loop converting the uploaded file into byte code
		while (totalBytesRead < formDataLength) {
			byteRead = in.read(dataBytes, totalBytesRead, 
formDataLength);
			totalBytesRead += byteRead;
			}
					String file = new String(dataBytes);
		//for saving the file name
		String saveFile = file.substring(file.indexOf("filename=\"") + 10);
		saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
		saveFile = saveFile.substring(saveFile.lastIndexOf("\\")
 + 1,saveFile.indexOf("\""));
		int lastIndex = contentType.lastIndexOf("=");
		String boundary = contentType.substring(lastIndex + 1,
contentType.length());
		int pos;
		//extracting the index of file 
		pos = file.indexOf("filename=\"");
		pos = file.indexOf("\n", pos) + 1;
		pos = file.indexOf("\n", pos) + 1;
		pos = file.indexOf("\n", pos) + 1;
		int boundaryLocation = file.indexOf(boundary, pos) - 4;
		int startPos = ((file.substring(0, pos)).getBytes()).length;
		int endPos = ((file.substring(0, boundaryLocation))
.getBytes()).length;
		// creating a new file with the same name and writing the 
//content in new file
File loc= new File("C:/Users/chuny/workspace/OnlineShop1/WebContent/images/uploadedimages/"+saveFile);//change to where uploaded images is.
		OutputStream fileOut = new FileOutputStream(loc);
		fileOut.write(dataBytes, startPos, (endPos - startPos));
		fileOut.flush();
		fileOut.close();
				%><Br><table border="2"><tr><td><b>You have successfully
 upload the file by the name of:</b>
		<% out.println(saveFile); %></td></tr><tr><td><b>at the location <% out.println(loc); %></b></td></tr></table> <%
		}
} catch (Exception e) {
	out.println("Error");
}
%>
</body>
</html>