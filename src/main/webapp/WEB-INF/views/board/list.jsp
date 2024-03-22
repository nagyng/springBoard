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
                                			<%-- <a class="move" href='/board/get?bno=<c:out value="${board.bno }"/>'>
                                			<c:out value="${board.title }"/></a> --%>
                                		<!-- p314	 3/21 수정 -->
                                		<a class="move" href='<c:out value="${board.bno }"/>'>
                                			<c:out value="${board.title }"/></a>
                                	</td>
                                	<td><c:out value="${board.writer }"/></td>
                                	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }"/></td>
                                	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate }"/></td>
                                </tr>
                                </c:forEach>
                            </table><!-- table 태그의 끝 -->
                            
                            <!-- p343 	3/22 -->
                            <!-- 게시물 검색 조건 & 검색 문자열 추가 시작 -->
                            <form id="searchForm" action="/board/list" method="get">
                            	<select name="type">
                            		<option value="" <c:out 	value="${pageMaker.cri.type == null ? 'selected' : '' }"/>>
                            			 -- </option>
                            		<option value="T" <c:out 	value="${pageMaker.cri.type eq 'T' ? 'selected' : '' }"/>>
                            			 제목 </option>
                            		<option value="C" <c:out 	value="${pageMaker.cri.type eq 'C' ? 'selected' : '' }"/>>
                            			 내용 </option>
                            		<option value="W" <c:out 	value="${pageMaker.cri.type eq 'W' ? 'selected' : '' }"/>>
                            			 작성자 </option>
                            		<option value="TC" <c:out 	value="${pageMaker.cri.type eq 'TC' ? 'selected' : '' }"/>>
                            			 제목 or 내용 </option>
                            		<option value="TW" <c:out 	value="${pageMaker.cri.type eq 'TW' ? 'selected' : '' }"/>>
                            			 제목 or 작성자 </option>
                            		<option value="TWC" <c:out 	value="${pageMaker.cri.type eq 'TWC' ? 'selected' : '' }"/>>
                            			 제목 or 내용 or 작성자 </option>
                            	</select>
                            	<!-- 검색 문자열을 입력 -->
                            	<input type="text" name="keyword" 	value='<c:out value="${pageMaker.cri.keyword}"/>' />
                            	<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
                            	<input type="hidden" name="amount" 	value='<c:out value="${pageMaker.cri.amount}"/>' />
                            	<button class="btn btn-default">검색</button>
                            </form> 
                            <!-- 게시물 검색 조건 & 검색 문자열 추가 종료 -->
                            
                            <!-- p308  	3/20 -->
                            <!-- 화면 하단에 페이징 처리 시작 -->
                            <!-- pull-right : 화면 오른쪽에 표시 처리 -->
                            <div class="pull-right">
                            	<ul class="pagination"> 
                            		<!-- p310 	3/21 페이지 액티브 수정 -->
                            		<c:if test="${pageMaker.prev }">
                            			<li class="paginate_button previous"><a href="${pageMaker.startPage -1 }">Previous</a></li>
                            		</c:if>
                            		
                            		<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                            			<li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active':'' }" ><a href="${num }">${num }</a></li>
                            		</c:forEach>
                            		
                            		<c:if test="${pageMaker.next }">
                            			<li class="paginate_button next"><a href="${pageMaker.endPage +1 }">Next</a></li>
                            		</c:if>
                            	</ul> 
                            </div>
                            <!-- 화면 하단에 페이징 처리 종료 --> 
                            
                            <!-- p311 	 3/21 
                            	 페이징 화면 처리 - 별도의 a 태그 동작 -->
                            <form action="/board/list" method="get" id="actionForm">
                            	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
                            	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">  
                            	<!-- p343 	3/22 
                            		검색조건,검색문자열을 hidden선언 -->
                            	<input type="hidden" name="type" value="${pageMaker.cri.type }">
                            	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">  
                            </form>
                            
                             
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
	/* history.replaceState({},null,null); */
	
	function checkModal(result) {
		
		/* === : 값, 자료형이 모두 같다 */
							/* (+) 뒤로가기 중복등록 수정 */
		if(result === '' /* || history.state */ ) {
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
	
	/* p312 	3/21  
		하단 페이지 번호를 클릭 시 처리 */
	var actionForm = $("#actionForm");
	
	$(".paginate_button a").on("click", function(e) {
		
		//태그의 원래 기능을 막는다 
		e.preventDefault();
		
		console.log('click');
		
		//클릭한 페이지 번호를 pageNum input 태그에 값을 대입한 후 submit 을 하면 해당 페이지로 이동 
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		
		actionForm.submit();
		 
	});
	 
	//p315 	3/21 
	//p315 제목을 클릭한 경우 게시물 상세보기 화면으로 이동
	$(".move").on("click",function(e){
		
		e.preventDefault();
		
		actionForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href") + "'>");
		actionForm.attr("action","/board/get");
		actionForm.submit();
	});
	
	//p342 	3/22 
	//검색 버튼의 이벤트 처리
	//조회 버튼의 모든 정보를 변수에 대입 
	var searchForm = $("#searchForm");
	
	$("#searchForm button").on("click", function(e){
		
		if(!searchForm.find("option:selected").val()){
			alert("검색종류를 선택하세요.");
			return false;
		}

		if(!searchForm.find("input[name='keyword']").val()){
			alert("키워드를 입력하세요.");
			return false;
		}
		
		//검색 후에 1페이지로 이동
		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();
		
		//검색에서 입력받은 데이터를 서버로 전송
		searchForm.submit();
		
	});
	
});


</script>

