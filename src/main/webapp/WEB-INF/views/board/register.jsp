<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp" %>

<!-- p239	3/20 -->
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">게시물등록</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<!-- panel 의 제목 (heading) -->
			<div class="panel-heading">Board Register</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form role="form" action="/board/register" method="post">
					<div class="form-group">
						<label for="title">Title</label>
						<input class="form-control" name="title" id="title">
					</div>
					
					<div class="form-group">
						<label for="content">Text area</label>
						<textarea class="form-control" rows="3" cols="50" name="content" id="content"></textarea>
					</div>
					 
					<div class="form-group">
						<label for="writer">Writer</label>
						<input class="form-control" name="writer" id="writer">
					</div>
					<button type="submit" class="btn btn-primary">등록</button>
					<button type="reset" class="btn btn-danger">취소</button>
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
<!-- 생성 p239	3/20 -->
