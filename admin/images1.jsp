<%@ page language="java" %> 
<HTML> 
<FORM ENCTYPE="multipart/form-data" ACTION="uploadFile.jsp" METHOD=POST> 
<center> 
<table border="0" bgcolor=#ccFDDEE> 
<tr> 
<center><td colspan="2" align="center"><B>UPLOAD THE FILE</B><center></td> 
</tr> 
<tr><td colspan="2" align="center"> </td></tr> 
<tr><td><b>Choose the file To Upload:</b></td> 
<td><INPUT NAME="file" TYPE="file"></td> 
</tr> 
<tr><td colspan="2" align="center"> </td></tr> 
<tr><td colspan="2" align="center"><input type="submit" value="Send File"> </td></tr> 
<table> 
</center> 
</FORM> 
</HTML> 
upload.jsp 
<%@ page import="java.io.*,java.sql.*,java.util.zip.*" %> 
<% 
String saveFile=""; 
String contentType = request.getContentType(); 
if((contentType != null)&&(contentType.indexOf("multipart/form-data") >= 0)){ 
DataInputStream in = new DataInputStream(request.getInputStream()); 
int formDataLength = request.getContentLength(); 
byte dataBytes[] = new byte[formDataLength]; 
int byteRead = 0; 
int totalBytesRead = 0; 
while(totalBytesRead < formDataLength){ 
byteRead = in.read(dataBytes, totalBytesRead,formDataLength); 
totalBytesRead += byteRead; 
} 
String file = new String(dataBytes); 
saveFile = file.substring(file.indexOf("filename=\"") + 10); 
saveFile = saveFile.substring(0, saveFile.indexOf("\n")); 
saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\"")); 
int lastIndex = contentType.lastIndexOf("="); 
String boundary = contentType.substring(lastIndex + 1,contentType.length()); 
int pos; 
pos = file.indexOf("filename=\""); 
pos = file.indexOf("\n", pos) + 1; 
pos = file.indexOf("\n", pos) + 1; 
pos = file.indexOf("\n", pos) + 1; 
int boundaryLocation = file.indexOf(boundary, pos) - 4; 
int startPos = ((file.substring(0, pos)).getBytes()).length; 
int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length; 
File ff = new File("C:/UploadedFiles/"+saveFile); 
FileOutputStream fileOut = new FileOutputStream(ff); 
fileOut.write(dataBytes, startPos, (endPos - startPos)); 
fileOut.flush(); 
fileOut.close(); 
%><br><table border="2"><tr><td><b>You have successfully upload the file:</b> 
<%out.println(saveFile);%></td></tr></table> 
<% 
Connection connection = null; 
String connectionURL = "jdbc:mysql://localhost:3306/roseindia"; 
PreparedStatement psmnt = null; 
try{ 
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
connection = DriverManager.getConnection(connectionURL, "root", "root"); 
psmnt = connection.prepareStatement("insert into file1(file_path) values(?)"); 
psmnt.setString(1, ff.getPath()); 
int s = psmnt.executeUpdate(); 
if(s>0){ 
System.out.println("Uploaded successfully !"); 
} 
else{ 
System.out.println("Error!"); 
} 
} 
catch(Exception e){ 
    e.printStackTrace(); 
} 
} 
%>