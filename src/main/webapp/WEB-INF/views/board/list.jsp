<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp" %>


<% 
/*  뒤로가기 수정에서 별도 추가 코드	3/20 
	구글 크롬 브라우저 경우 
	Back-Forward Cache 기능이 활성화 -> 삭제하기 */
   response.setHeader("Cache-Control","no-store"); 
   response.setHeader("Pragma","no-cache");
   response.setDateHeader("Expires",0); 
 
   if (request.getProtocol().equals("HTTP/1.1")){
      response.setHeader("Cache-Control", "no-cache"); 
   }
%>


            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">게시물목록</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <!-- p250 	3/20 -->
                            Board List Page
                            <button id="regBtn" type="button" class="btn btn-xs btn-success pull-right">게시물 등록</button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover text-center" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>게시물번호</th>
                                        <th>제목</th>
                                        <th>내용</th>
                                        <th>작성일</th>
                                        <th>수정일</th>
                                    </tr>
                                </thead>
                                
                                <!-- p237 테이블 게시물 출력	3/19
                                	 BoardController.java 에서 리턴된 속성 list 를 반복문 사용해 출력. -->
                                <c:forEach var="board" items="${list }" >
                                <tr> 
                                	<td><c:out value="${board.bno }"/></td>
                                	<td>
                                		<!-- p254	3/20 
                                			제목 클릭 시 상세보기 화면이 열린다.  target="_blank" -->
                                		<a href='/board/get?bno=<c:out value="${board.bno }"/>'><c:out value="${board.title }"/></a>
                                	</td>
                                	<td><c:out value="${board.writer }"/></td>
                                	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }"/></td>
                                	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate }"/></td>
                                </tr>
                                </c:forEach>
                            </table><!-- table 태그의 끝 -->
                            
                            <!-- p308  	3/20 -->
                            <!-- 화면 하단에 페이징 처리 시작 -->
                            <!-- pull-right : 화면 오른쪽에 표시 처리 -->
                            <div class="pull-right">
                            	<ul class="pagination"> 
                            		<c:if test="${pageMaker.prev }">
                            			<li class="paginate_button previous"><a href="#">Previous</a></li>
                            		</c:if>
                            		
                            		<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                            			<li class="paginate_button"><a href="#">${num }</a></li>
                            		</c:forEach>
                            		
                            		<c:if test="${pageMaker.next }">
                            			<li class="paginate_button next"><a href="#">Next</a></li>
                            		</c:if>
                            	</ul> 
                            </div>
                            <!-- 화면 하단에 페이징 처리 종료 --> 
                            
                             
                            <!-- Modal 창 시작 -->
                            <!-- aria-hidden="true" : 모달창 초기값은 hidden -->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            	<div class="modal-dialog">
                            		<div class="modal-content">
                            			<div class="modal-header">
                            			   <!--  data-dismiss="modal" : 모든 창 닫기 -->
                            				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            					&times;
                            				</button>
                            				<h4 class="modal-title" id="myModalLabel">Modal Title</h4>
                            			</div>
                            			<div class="modal-body">
                            				처리가 완료되었습니다.
                            			</div>
                            			<div class="modal-footer">
                            				<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                            				<button type="button" class="btn btn-primary" data-dismiss="modal">저장</button>
                            			</div>
                            		</div>
                            	</div> 
                            </div>
                            <!-- Modal 창 종료 -->
                            
                            
                            <!-- p246	3/20 -->
                            <!-- Modal 창 시작 -->
                            <!-- aria-hidden="true" : 모달창 초기값은 hidden -->  <!-- 
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            	<div class="model-dialog">
                            		<div class="model-content">
                            			<div class="model-header"> -->	
                            				<!-- data-dismiss="modal" : 모든 창 닫기 --> <!-- 
                            				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            				<h4 class="modal-title" id="myModalLabel">Modal title</h4>
                            			</div>
                            			<div class="modal-body">처리가 완료되었습니다.</div>
                            			<div class="modal-footer">
                            				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            				<button type="button" class="btn btn-primary">Save Changes</button>
                            			</div>
                            		</div> -->
                            		<!-- /.modal-content -->
                            	</div>
                            	<!-- /.modal-dialog -->
                            </div> 
                            <!-- /.modal Modal 창 종료 -->
                            
                            
                            	 
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>

<%@ include file="../includes/footer.jsp" %>



<!-- p248 	3/20 -->
<script type="text/javascript">
$(document).ready(function() {
	
	/* BoardController 에서 생성한 속성값(게시물번호)을 변수에 대입 */
	var result = '<c:out value="${result}"/>';
	
	/* 밑에 선언한 함수 먼저 호출 
		호이스팅 : 함수 먼저 호출해도 된다. */
	checkModal(result);
	
	/* p257 	3/20 
		뒤로가기 중복등록 현상 수정 
		현재 이동하는 페이지를 변경 
						매개변수
						첫번째 : 전달되는 값
						두번째 : 제목 
						세번째 : 실행되는 url */
	history.replaceState({},null,null);
	
	function checkModal(result) {
		
		/* === : 값, 자료형이 모두 같다 */
							/* (+) 뒤로가기 중복등록 수정 */
		if(result === '' || history.state ) {
			return;
		}
		/* 리턴된 게시물 번호를 숫자로 변환 */
		if(parseInt(result) > 0){
			/* Modal 창 body 부분을 변경 */
			$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
		}
		/* Modal 창 보이기 */
		$("#myModal").modal("show");
	}
	
	/* p250		3/20 
		게시물 등록 버튼 처리 */
	$("#regBtn").on("click", function(){
		self.location = "/board/register";
	});
	
});
</script>

