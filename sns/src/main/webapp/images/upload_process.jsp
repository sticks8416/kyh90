<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업로드 처리</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String savePath = "/mvcspring/images";
	int uploadFileSizeLimit = 5*1024*1024;
	String encType = "UTF-8";
	
	ServletContext context = getServletContext();
	String uploadFilePath = context.getRealPath(savePath);
	try{
		MultipartRequest multi = new MultipartRequest(
				request,
				uploadFilePath,
				uploadFileSizeLimit,
				encType,
				new DefaultFileRenamePolicy());
		String fileName = multi.getFilesystemName("uploadFile");
		if(fileName ==null){
			System.out.print("업로드 실패");
		}else{
			
		}
	}catch(Exception e){
		e.printStackTrace();
	}


%>


</body>
</html>