<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.or.ddit.db.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	long start = System.currentTimeMillis();

	for(int i = 1 ; i<=100;i++){
	try(
			Connection conn = ConnectionFactory.getConnection();
			Statement stmt = conn.createStatement();
			){
		String sql = "SELECT ENAME FROM EMP WHERE MGR IS NULL";
		ResultSet rs =	stmt.executeQuery(sql);
		if(rs.next()){
		out.println(rs.getString("ENAME"));
		}
	}
	
}
	long end = System.currentTimeMillis();
	
	
%>
	소요시간 : <%=end-start %>

</body>
</html>