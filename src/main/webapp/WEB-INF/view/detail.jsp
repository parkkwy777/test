<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/webjars/bootstrap/4.5.2/css/bootstrap.min.css"/>
<style>

#content{
	border:solid red;
	height:500px;
	margin-bottom: 10px;
}
#titleDiv{margin-bottom: 50px; }

</style>
<script src="/webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
	
		$("#inReple").click(function(){
			var no=${detail.no};
				$("[name=no]").val(no);
			
				//가장 상위
				$("[name=repno]").val(0);
				
		$("#reple").attr("action","/notice?method=insertReple");
		$("#reple").submit();
		});
	});
	
	function inReple(){
		
		
	}
	function goPage(no){
			
	
			$("[name=curPage]").val(no);
			//무조건get방식일때
			/* 	$(location).attr("href","/notice/list?curPage="+no); */
			$("form").submit();
	}
	
	function goDetail(n){			
	
	
		'<div class="input-group mb-3" style="box-sizing: border-box; width:100%;">'
		 +'<input type="text" name="r_writer" placeholder="아이디"'
		 +'class="form-control" style="width:10%;">'
				+'<input type="text" class="form-control" name="r_etc"'
				+'placeholder="Something clever.." style="width:60%;">'
				+'<div class="input-group-append" style="width:30%;">'
					+'<button onclick="inReple(${detail.no})" class="btn btn-primary" type="button" style="width:50%">OK</button>'
					+'<button onclick="" class="btn btn-danger" type="button" style="width:50%;">Cancel</button>'
				+'</div>'
		+'</div>'
	}
</script>

</head>
<body>
	<div class="container">
		<h2>귀멸의 칼날 게시판</h2>
		<br>
		<h5>${detail.title}</h5>
		
		<div id="titleDiv">
			<div style="float: left;">
				<span>글쓴이: ${detail.writer}&nbsp;|&nbsp;작성시간:
					<fmt:formatDate value="${detail.tolist}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
			</div>
			<div style="float: right;">
				<span>조회수: ${detail.counting}&nbsp;|&nbsp;추천:
					${detail.upPoint}&nbsp;|&nbsp; 댓글수: </span>
			</div>
		</div>
		<div id="content">
				${detail.etc}
		</div>
		<form id="reple" method="post" autocomplete="off">
			<input type="hidden" name="curPage"/>
			<input type="hidden" name="no"/>
			<input type="hidden" name="repno"/>
			
			<div id="repleDiv" >
				<div id="repleContent">

					<table class="table table-bordered table-hover">
					<%-- 	<colgroup>
							<col style="width: 10%;">
							<col style="width: 15%;">
							<col style="width: 35%">
							<col style="width: 10%;">
							<col style="width: 10%;">
							<col style="width: 10%;">
							<col style="width: 10%;">
						</colgroup> --%>
						<thead>
							<tr>
								<th>글쓴이</th>
								<th>작성일</th>
							    <th>내용</th>
							</tr>
						</thead>
						<tbody id="data">

							<c:forEach items="${reples}" var="reple">
								<tr onclick="javascript:goDetail(${reple.no})">
									<td>${reple.r_writer}</td>
									<td><fmt:formatDate value="${reple.r_tolist}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									<td>${reple.r_etc}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div> 
			
				<div class="input-group mb-3" style="box-sizing: border-box; width:100%;">
				 <input type="text" name="r_writer" placeholder="아이디
				 " class="form-control" style="width:10%;">
					<input type="text" class="form-control" name="r_etc"
						placeholder="Something clever.." style="width:60%;">
					<div class="input-group-append" style="width:30%;">
						<button id="inReple" class="btn btn-primary" type="button" style="width:50%">OK</button>
						<button onclick="" class="btn btn-danger" type="button" style="width:50%;">Cancel</button>
					</div>
				</div>

				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link"
						href="javascript:goPage(${nsch.startBlock-1})">이전</a></li>
					<c:forEach var="cnt" begin="${nsch.startBlock}"
						end="${nsch.endBlock}">
						<li class="page-item ${nsch.curPage==cnt? 'active':''}"><a
							class="page-link" href="javascript:goPage(${cnt})">${cnt}</a></li>
					</c:forEach>
					<li class="page-item"><a class="page-link"
						href="javascript:goPage(${nsch.endBlock==nsch.pageCount?
															nsch.endBlock:nsch.endBlock+1 })">다음</a></li>

				</ul>

				<!-- <r_writer> -->
			</div>
		</form>
	</div>
</body>
</html>