<%@page import="java.util.Objects"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/additional-methods.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.js"></script>
<style type="text/css">

#dataTable{
width: 100%;
}

</style>

</head>
<body>
	<!--  뒤에있는 객체 부터 뒤져서 생성한다-->
	<jsp:useBean id="member" class="kr.or.ddit.vo.MemberVO" scope="request"></jsp:useBean>
	<jsp:useBean id="errors" class="java.util.HashMap" scope="request"></jsp:useBean>

	<%
		//		MemberVO member = (MemberVO) request.getAttribute("member");
		/* Map<String ,String> errors = (Map)request.getAttribute("errors");
		if(errors==null){
			errors = new HashMap<>();
		} */
		MemberVO authMember	=	(MemberVO)session.getAttribute("authMember");
	
		String message = (String) request.getAttribute("message");

		if (StringUtils.isNoneBlank(message)) {
	%>
	<script type="text/javascript">
		alert("<%=message%>");
	</script>
	<%
		}
	%>
	 
	<form method="POST" id="memberForm">
		<table class='table table-bordered'>
		<tbody>
			<tr>
				<th>회원 id</th>
				<td><input type="text" name="memId"
					required    value="<%=member.getMemId()%>" /><label id="memId-error"
					class="error" for="memId"><%=errors.get("memId")%></label></td>
			</tr>
			<tr>
				<th>비밀 번호</th>
				<td><input type="text" name="memPass"
					required    value="<%=member.getMemPass()%>" /><label
					id="memPass-error" class="error" for="memPass"><%=errors.get("memPass")%></label></td>
			</tr>
			<tr>
				<th>회원명</th>
				<td><input type="text" name="memName"
					required    value="<%=member.getMemName()%>" /><label
					id="memName-error" class="error" for="memName"><%=errors.get("memName")%></label></td>
			</tr>
			<tr>
				<th>주민등록번호1</th>
				<td><input type="text" name="memRegno1"
					value="<%=member.getMemRegno1()%>" /><label id="memRegno1-error"
					class="error" for="memRegno1"><%=errors.get("memRegno1")%></label></td>
			</tr>
			<tr>
				<th>주민등록번호2</th>
				<td><input type="text" name="memRegno2"
					value="<%=member.getMemRegno2()%>" /><label id="memRegno2-error"
					class="error" for="memRegno2"><%=errors.get("memRegno2")%></label></td>
			</tr>
			<tr>
				<th>생일</th>
				<td><input type="date" name="memBir"
					value="<%=member.getMemBir()%>" /><label id="memBir-error"
					class="error" for="memBir"><%=errors.get("memBir")%></label></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><input type="text" name="memZip" required    value="<%=member.getMemZip()%>" />
				 	<!-- data-bs-toggle="modal" data-bs-target="#exampleModal" -->
				 	<button type="button" class="btn btn-primary" name="searchZip" id="searchZip"> 검색  </button>
					<label id="memZip-error" class="error" for="memZip"><%=errors.get("memZip")%></label></td>
			</tr>
			<tr>
				<th>주소 1</th>
				<td><input type="text" name="memAdd1"
					required    value="<%=member.getMemAdd1()%>" /><label
					id="memAdd1-error" class="error" for="memAdd1"><%=errors.get("memAdd1")%></label></td>
			</tr>
			<tr>
				<th>주소 2</th>
				<td><input type="text" name="memAdd2"
					required    value="<%=member.getMemAdd2()%>" /><label
					id="memAdd2-error" class="error" for="memAdd2"><%=errors.get("memAdd2")%></label></td>
			</tr>
			<tr>
				<th>집 전화 번호</th>
				<td><input type="text" name="memHometel"
					value="<%=member.getMemHometel()%>" /><label id="memHometel-error"
					class="error" for="memHometel"><%=errors.get("memHometel")%></label></td>
			</tr>
			<tr>
				<th>회사 전화번호</th>
				<td><input type="text" name="memComtel"
					value="<%=member.getMemComtel()%>" /><label id="memComtel-error"
					class="error" for="memComtel"><%=errors.get("memComtel")%></label></td>
			</tr>
			<tr>
				<th>이동 전화번호</th>
				<td><input type="text" name="memHp"
					value="<%=member.getMemHp()%>" /><label id="memHp-error"
					class="error" for="memHp"><%=errors.get("memHp")%></label></td>
			</tr>
			<tr>
				<th>메일</th>
				<td><input type="text" name="memMail"
					required    value="<%=member.getMemMail()%>" /><label
					id="memMail-error" class="error" for="memMail"><%=errors.get("memMail")%></label></td>
			</tr>
			<tr>
				<th>직업</th>
				<td><input type="text" name="memJob"
					value="<%=member.getMemJob()%>" /><label id="memJob-error"
					class="error" for="memJob"><%=errors.get("memJob")%></label></td>
			</tr>
			<tr>
				<th>취미</th>
				<td><input type="text" name="memLike"
					value="<%=member.getMemLike()%>" /><label id="memLike-error"
					class="error" for="memLike"><%=errors.get("memLike")%></label></td>
			</tr>
			<tr>
				<th>기념일 명</th>
				<td><input type="text" name="memMemorial"
					value="<%=member.getMemMemorial()%>" /><label
					id="memMemorial-error" class="error" for="memMemorial"><%=errors.get("memMemorial")%></label></td>
			</tr>
			<tr>
				<th>기념일 날짜</th>
				<td><input type="date" name="memMemorialday"
					value="<%=member.getMemMemorialday()%>" /><label
					id="memMemorialday-error" class="error" for="memMemorialday"><%=errors.get("memMemorialday")%></label></td>
			</tr>
			<tr>
				<th>마일리지</th>
				<td><input type="text" name="memMileage"
					value="<%=member.getMemMileage()%>" /><label id="memMileage-error"
					class="error" for="memMileage"><%=errors.get("memMileage")%></label></td>
			</tr>
			<tr>
				<th>삭제 여부</th>
				<td><input type="text" name="memDelete"
					value="<%=member.getMemDelete()%>" /><label id="memDelete-error"
					class="error" for="memDelete"><%=errors.get("memDelete")%></label></td>
			</tr>
				 <%
						
					if(authMember!=null){
				 %>
			<tr>
				<td colspan="2"><input type="submit" id="modify" data-url='<%=request.getContextPath() %>/member/memberUpdate.do' value="수정 "></td>
		<%
					}else{				 
		%>
				<td colspan="2"><input type="submit" id="insert" value="회원가입 " data-url='<%=request.getContextPath() %>/member/memberInsert.do'></td>	
				<%
					}
				%>
			</tr>
	</tbody>
		</table>
			</form>
			
 	<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog  modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
	<table id='dataTable'>
	<thead>
		<tr>
		<th>우편번호</th>
		<th>시도</th>
		<th>구</th>
		<th>동</th>
		</tr>
	</thead>
		<tbody>
		
		
		</tbody>
	
	</table>     
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
 
 
			
<script type="text/javascript">


$(function(){
			let insert = $("#insert");
			let modify = $("#modify");
			let memberForm =$("#memberForm");
			let searchZip = $("#searchZip")
			
			let tbody = $("#dataTable tbody")
			//let exampleModal =  $("#exampleModal")
	
			let memZip = $("[name='memZip'")
	 		
			
	$("input[type='button']").on("click" , function(){
		let url = this.data("url");   
		memberForm.attr("action" , url)
		memberForm.submit();
	})
	
	
	$("#memberForm").validate();
	
 
	let exampleModal = $("#exampleModal").modal({
		show:false
	}).on('show.bs.modal' , function(event){
/* 		console.log(event.relatedTarget);
		let trTag = event.relatedTarget;
		if(!trTag) return false;
		 */
		$.ajax({
			url :  "<%=request.getContextPath()%>/member/zipList.do"  ,
			method : "post",
			dataType : "json",
			success : function(data){
				let trs =[]
			$('#dataTable').DataTable({
				data: data,		
				destroy:true,
				
				 columns: [
					 { data: 'zipcode' },
				  	 { data: 'sido' },
				     { data: 'gugun' },
				     { data: 'dong' }
				]
			});
			 
			}
		})
			
 
	}).on('hidden.bs.modal' , function(){
		exampleModal.find('#tah').empty();
	}); //모달
	

			
	$("tbody").on("click" , "button[name='searchZip']", function(){
		exampleModal.modal('show');
	}).css("cursor" , "pointer");
	
 	
	$("tbody").on("click" , "tr", function(){
	 	//console.log(this)
	 	//console.log($(this).find("td"))
		//this.get(0)
		zip = $(this).find("td")[0] 
	 	let str =""
	 	for(i in 3){
	 		str += $($(this).find("td")[i]).text();
	 		
	 	}
		 console.log(str)
		 
	 	 
	 	//console.log(ver1.text())
	 	memZip.val($(zip).text())
	}).css("cursor" , "pointer");
	
	
 
})
	


	 

</script>
<jsp:include page="/includee/footer.jsp"></jsp:include>
</body>
</html>