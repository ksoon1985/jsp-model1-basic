<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%
   int num 
     =Integer.parseInt(request.getParameter("num"));
    //DAO 가져오기
    BoardDAO dao = BoardDAO.getInstance();
    // DAO메소드실행
    int r = dao.deleteArticle(num);
    // 성공하면 bordList.jsp
    if(r>0)  
      response.sendRedirect("boardList.jsp");//성공
    else out.print("삭제실패");//실폐
   %>
</body>
</html>



