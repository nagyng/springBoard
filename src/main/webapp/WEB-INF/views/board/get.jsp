<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">게시물 상세</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">게시물 상세보기</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
			
					<div class="form-group">
						<label for="bno">Bno</label>
						<input class="form-control" name="bno" id="bno" value='<c:out value="${board.bno }" />' readonly="readonly">
					</div>
					
					<div class="form-group">
						<label for="title">Title</label>
						<input class="form-control" name="title" id="title" value='<c:out value="${board.title }" />' readonly>
					</div>
					
					<div class="form-group">
						<label for="content">Text area</label>
						<textarea class="form-control" rows="3" name="content" id="content" readonly><c:out value="${board.content }" /></textarea>
					</div>
					 
					<div class="form-group">
						<label for="writer">Writer</label>
						<input class="form-control" name="writer" id="writer" value='<c:out value="${board.writer }" />' readonly>
					</div>
					
					<!-- p254	3/20 -->
					<button data-oper='modify' class="btn btn-primary">수정</button>
							<%-- onclick="location.href='/board/modify?bno=<c:out value="${board.bno}"/>'"  --%>
					<button data-oper='list' class="btn btn-warning">목록</button><!--  onclick="location.href='/board/list'" -->

					<!-- p264 	3/20 -->
					<form id="operForm" action="/board/modify" method="get">
						<input type="hidden" id="bno" name="bno" value='<c:out value="${board.bno }"/>'>
					</form>
			</div>
			<!-- end panel-body -->
		</div>
		<!-- end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->


<%@ include file="../includes/footer.jsp" %> 
<!-- 생성 p252	3/20 -->
</body>



<!-- p265 	3/20 -->
<script type="text/javascript">
$(document).ready(function(){
	
	var operForm = $("#operForm");
	
	//수정 버튼을 클릭한 경우 처리
	$("button[data-oper='modify']").on("click", function(e){
		operForm.attr("action","/board/modify").submit();
	});
	
	//목록 버튼을 클릭한 경우 처리
	$("button[data-oper='list']").on("click", function(e){
		
		operForm.find("#bno").remove();
		operForm.attr("action","/board/list")
		operForm.submit();
		
	});
});
</script>

</html>