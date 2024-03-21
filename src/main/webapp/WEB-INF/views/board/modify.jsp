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
<!-- p260 	3/20 --> 
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">게시물 수정</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">게시물 수정 삭제</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
			<form role="form" action="/board/modify" method="post">
			
					<div class="form-group">
						<label for="bno">Bno</label>
						<input class="form-control" name="bno" id="bno" 
								value='<c:out value="${board.bno }" />' readonly="readonly">
					</div>
					
					<div class="form-group">
						<label for="title">Title</label>
						<input class="form-control" name="title" id="title" value='<c:out value="${board.title }" />' >
					</div>
					
					<div class="form-group">
						<label for="content">Text area</label>
						<textarea class="form-control" rows="20" name="content" id="content" ><c:out value="${board.content }" /></textarea>
					</div>
					 
					<div class="form-group">
						<label for="writer">Writer</label>
						<input class="form-control" name="writer" id="writer" value='<c:out value="${board.writer }" />' readonly>
					</div> 
					
					<!-- p254	3/20 -->
					<button data-oper='modify' type="submit" class="btn btn-primary">수정</button>
					<button data-oper='remove' type="submit" class="btn btn-danger">삭제</button>
					<button data-oper='list' type="submit" class="btn btn-warning">목록</button>
					
					<!-- p319 	3/21 -->
					<input type="hidden" id="pageNum" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
					<input type="hidden" id="amount" name="amount"	 value='<c:out value="${cri.amount }"/>'>
 
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
</body>



<!-- p262 	3/20 -->
<script type="text/javascript">
$(document).ready(function() {
	
	var formObj = $("form");
	
	/* 버튼을 클릭하면 이벤트 정보가 매개변수 e 대입 */
	$('button').on("click", function(e){
		
		// 원래 태그의 기능을 막는다. (ex. 페이지 이동)
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'remove'){		//삭제 버튼 클릭 처리 
			formObj.attr("action", "/board/remove");				// '/' 랑 ',' 빼먹음 주의....
		} else if (operation === 'list'){	//목록 버튼 클릭 처리 
			//move to list
			//self.location = "/board/list";
			//return; 
			
			formObj.attr("action", "/board/list").attr("method","get"); 
			//p321 	3/21
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			
			//p266 	3/20
			formObj.empty();		//empty() : 태그는 그대로 두고 값만 삭제. & remove() : 모두 삭제
			//p321 	3/21
			formObj.append(pageNumTag);
			formObj.append(amountTag);
		}
		
		formObj.submit();	//수정 버튼 클릭 처리 
		
	});
});
</script>
</html>