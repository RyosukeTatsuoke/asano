<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.SCOREList" %>
<%@ page import="dao.ScoreDAO" %>
<%@ page import="java.sql.SQLException" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Score Update Result</title>
</head>
<body>
    <h1>Score Update Result</h1>
    
    <%-- リクエストパラメーターからフォームデータを取得 --%>
    <% String studentNo = request.getParameter("studentNo"); %>
    <% String subjectCd = request.getParameter("subjectCd"); %>
    <% String schoolCd = request.getParameter("schoolCd"); %>
    <% int point = Integer.parseInt(request.getParameter("point")); %>
    <% int classNum = Integer.parseInt(request.getParameter("classNum")); %>
    
    <%-- 更新するデータを格納するSCOREListオブジェクトを作成 --%>
    <% SCOREList student = new SCOREList(); %>
    <% student.setStudentNo(studentNo); %>
    <% student.setSubjectCd(subjectCd); %>
    <% student.setSchoolCd(schoolCd); %>
    <% student.setPoint(point); %>
    <% student.setClassNum(classNum); %>
    
    <%-- DAOを使ってデータベースを更新 --%>
    <% 
       ScoreDAO dao = new ScoreDAO();
       try {
           dao.updateScore(student);
           out.println("<p>学生データが更新されました。</p>");
       } catch (SQLException e) {
           out.println("<p>データの更新に失敗しました。</p>");
           e.printStackTrace();
       }
    %>
    
    <p><a href="scoreMain.jsp">戻る</a></p>
</body>
</html>
