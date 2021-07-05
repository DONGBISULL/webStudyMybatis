<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/includee/preScript.jsp"></jsp:include>
<style>

<style>
 
td,tr, th{
 border : 1px solid lightgray; 
padding :10px;

}
</style>

 

</head>
<body>
	<%
		//dispatch 방식으로 꺼내기 

		MemberVO member = (MemberVO) request.getAttribute("member");
		//컨텐츠 꺼내기 
	String message = (String)session.getAttribute("message");
	if(StringUtils.isNotBlank(message)){
		// flash attribute
		session.removeAttribute("message");
		%>
		<script type="text/javascript">
			alert("<%=message %>");
		</script>
		<%
	}
%>
	
	<%= member.getMemName()%>님의 마이페이지
			
	<table class='table table-bordered '>
		<tbody>
			<tr>
				<th>회원 id</th>
				<td><%=member.getMemId() %></td></tr>
			<tr> <th>비밀 번호</th><td><%=member.getMemPass() %></td>
			<tr>		<th>회원명</th>      <td><%=member.getMemName() %></td>   </tr>
			<tr>		<th>주민등록번호1</th>   <td><%=member.getMemRegno1() %></td></tr>
			<tr>		<th>주민등록번호2</th>  <td><%=member.getMemRegno2() %></td> </tr>
			<tr>		<th>생일</th>      <td><%=member.getMemBir() %></td>      </tr>
			<tr>		<th>우편번호</th>   <td><%=member.getMemZip() %></td>    </tr>
			<tr>		<th>주소 1</th>     <td><%=member.getMemAdd1() %></td>     </tr>
			<tr>		<th>주소 2</th>    <td><%=member.getMemAdd2() %></td>     </tr>
			<tr>		<th>집 전화 번호</th> 	<td><%=member.getMemHometel() %></td>   </tr>
			<tr>		<th>회사 전화번호</th><td><%=member.getMemComtel() %></td>  </tr>
			<tr>		<th>이동 전화번호</th> <td><%=member.getMemHp() %></td>  </tr>
			<tr>		<th>메일</th>     <td><%=member.getMemMail() %></td>      </tr>
			<tr>		<th>직업</th>       <td><%=member.getMemJob() %></td>     </tr>
			<tr>		<th>취미</th>     <td><%=member.getMemLike() %></td>       </tr>
			<tr>		<th>기념일 명</th> <td><%=member.getMemMemorial() %></td>     </tr>
			<tr>		<th>기념일 날짜</th>   <td><%=member.getMemMemorialday() %></td>  </tr>
			<tr>		<th>마일리지</th>   <td><%=member.getMemMileage() %></td>    </tr>
			<tr>		<th>삭제 여부</th>   	<td><%=member.getMemDelete()!=null?"삭제됨":"" %></td>    </tr>
<%
	MemberVO authMember = (MemberVO)	session.getAttribute("authMember");
	boolean rendering = member.equals(authMember);
	if(rendering){

%>

			<tr>
				<td colspan="2">
					<input type="button" value="수정" class="controlBtn" id="modify" data-url="<%=request.getContextPath() %>/member/memberUpdate.do"  > 
					<input type="button" value="탈퇴" id="deleteBtn"   > 
					<form method="post" id="deleteForm" action="<%=request.getContextPath()%>/member/memberDelete.do">
						<input  type="hidden"  name="memPass"  />
						
					</form>
			</tr>
 <%} %> 
		</tbody>

	</table>

	<script type="text/javascript">
	
		let modify = $("#modify")
		let deleteForm = $("#deleteForm");
		let deleteBtn = $("#deleteBtn")
		
		modify.on("click" , function(){
			url = $(this).data("url");
			
			 location.href=url;
		})
		deleteBtn.on("click" , function(){
			let memPass  = prompt("비밀번호");
			if(memPass){
				
			deleteForm[0].memPass.value = memPass;
			deleteForm.submit();
			} 
		});
		
		
		
		/* modify.on("click" , function(){
			url =	$(this).data("url")
			console.log(url)
			 location.href=url;
		}) */
		
	
	</script>
 
</body>
</html>