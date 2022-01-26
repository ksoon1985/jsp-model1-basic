<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>    
<%@ taglib prefix="c" 
    uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글내용</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="./js/boardScript.js"></script>
<script src="./js/jquery_board.js" type="text/javascript"></script>
<link href="./css/board.css" rel="stylesheet">
</head>
<body>
<%  //이전 페이지에서 보내준 데이터받기
    int num = 
      Integer.parseInt(request.getParameter("num"));
    //실제 데이터 가져오기
    //DAO 사용.. 인스턴스 얻어오기
    BoardDAO dao = BoardDAO.getInstance();
    //해당 인스턴스에서 해당되는 메소드 실행
    BoardDTO dto = dao.getArticle(num);
    //setAttribute를 해줘야 됨
    request.setAttribute("dto", dto);
%>
   <table border =1>
    <thead>
      <tr>
         <th colspan=2> <h3>글쓰기</h3> 
         </th>
       </tr>
    </thead>
    <tbody>
        <tr>
            <th>제목: </th>
            <td><c:out value="${dto.subject}"/></td>
        </tr>
        <tr>
            <th>내용: </th>
            <td><textarea  cols="80" rows="20" readonly="readonly">
               <c:out  value="${dto.content}"/>
             </textarea></td>
        </tr>
        <tr>
            <th>첨부파일: </th>
            <td><c:out  value="${dto.attachNm}"/></td>
        </tr>
        <tr>
            <th>작성자: </th>
            <td><a href='mailto:<c:out value="${dto.email}"/>'> 
		       <c:out value="${dto.writer}"/>
		       </a> </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="button" id="up_btn" value="글수정" onclick="pwCheck('u');"/>
                <input type="button" id="del_btn"value="글삭제" onclick="pwCheck('d');"/>
                <input type="button" value="답글" id="reply"/>
                <input type="button" value="글 목록으로... " id="list1"/>
            </td>
        </tr>
    </tbody>
  </table>
    <form action ="" name="parentForm" method="post"> 
      <input type="hidden" name="cpass" value="">
      <input type="text" name="passwd" value="${dto.passwd }">
      <input type="hidden" name="num" value="${dto.num}">
      <input type="hidden" name="ref" value="${dto.ref}">
      <input type="hidden" name="re_step" value="${dto.re_step}">
      <input type="hidden" name="re_level" value="${dto.re_level}">
    </form>    
</body>
</html>



