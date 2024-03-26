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
						<textarea class="form-control" rows="10" name="content" id="content" readonly><c:out value="${board.content }" /></textarea>
					</div>
					 
					<div class="form-group">
						<label for="writer">Writer</label>
						<input class="form-control" name="writer" id="writer" value='<c:out value="${board.writer }" />' readonly>
					</div>
					
					<!-- p254	3/20 -->
					<button data-oper='modify' class="btn btn-primary">수정</button> 
					<button data-oper='list' class="btn btn-warning">목록</button> 

					<!-- p264 	3/20 -->
					<form id="operForm" action="/board/modify" method="get">
						<input type="hidden" id="bno" name="bno" 		 value='<c:out value="${board.bno }"/>'>
						<!-- p317 	3/21 
							페이지번호와 한페이지당 게시물수 추가 --> 
						<input type="hidden" id="pageNum" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
						<input type="hidden" id="amount" name="amount"	 value='<c:out value="${cri.amount }"/>'>
						<!-- p345 	3/22 
							조회 페이지에서 검색 처리 (검색조건, 문자열) -->
						<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
						<input type="hidden" name="type" value='<c:out value="${cri.type}"/>'>
					</form>
			</div>
			<!-- end panel-body -->
		</div>
		<!-- end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->

<!-- p414 	3/26
	 댓글 목록 시작 -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-comments fa-fw"></i>
					댓글
					<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">
						댓글등록
					</button>
				</div>
				
				<div class="panel-body">
					<ul class="chat">
						<li class="left clearfix" data-rno="12">
							<div class="header">
								<strong class="primary-font">user00</strong>
								<small class="pull-right text-muted">2024-03-26 12:16</small>
							</div>
							<p>댓글테스트</p>
						</li>
					</ul>
				</div>
				
				<!-- p439		3/26
					 댓글 페이징 화면 구현 -->
				<div class="panel-footer">
					
				</div>
				
				
			</div>
		</div>
	</div>
<!-- 댓글 목록 종료 -->
 

<!-- p420  	3/26 -->
<!-- 모달창 시작 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">댓글 등록</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>댓글내용</label>
						<input class="form-control" name="reply" value="신규댓글">
					</div>
					<div class="form-group">
						<label>댓글작성자</label>
						<input class="form-control" name="replyer" value="replyer">
					</div>
					<div class="form-group">
						<label>댓글등록일자</label>
						<input class="form-control" name="replyDate" value="">
					</div>
				</div>
				<div class="modal-footer">
					<button id="modalModBtn" type="button" class="btn btn-warning">수정</button>
					<button id="modalRemoveBtn" type="button" class="btn btn-danger">삭제</button>
					<button id="modalRegisterBtn" type="button" class="btn btn-success">등록</button>
					<button id="modalCloseBtn" type="button" class="btn btn-info">닫기</button>
				</div>
			</div>
		</div>
	</div>

<!-- 모달창 종료 -->






 
 
 
<%@ include file="../includes/footer.jsp" %> 
<!-- 이 파일생성 p252	3/20 -->
</body>


<!-- p400  	3/26 -->
<script type="text/javascript" src="/resources/js/reply.js"></script>

<!-- p404 	3/26 -->
<!-- 댓글등록 처리 테스트 --> 
<script>
//상세보기 화면 실행시 게시물 번호를 변수에 대입
/* 
var bnoValue = '<c:out value="${board.bno}"/>';
 */

//reply.js에 선언된 add 함수를 호출
/* 
replyService.add(
	{ reply:"댓글등록 테스트",
	  replyer: "이순신",
	  bno: bnoValue
	},
	function(result){
		alert("결과:" + result);
	}
); */

//p407  	3/26
//특정 게시물번호에 대한 댓글 목록 테스트
//list : 댓글리스트값을 가지는 변수
/* 
replyService.getList({bno: bnoValue,page: 1},
   	 function(list){
	
		for(var i=0;i<list.length;i++){
			console.log(list[i]);
		}
});
 */

 //p409 	3/26
 //23번 댓글 삭제 테스트
 /* 
 replyService.remove(23, function(result) {
	
	 console.log(result);
	 
	 if (result === "success"){
		 alert("삭제되었다.");
	 }
 }, function(err) {
	 alert("에러.....");
 });
  */
  
  /* 
  //p411  	3/26
  //22번 댓글 수정
	replyService.update({
		rno: 22,
		bno: bnoValue,
		reply: "댓글 수정처리"
	},function(result){
		alert("댓글 수정처리 성공");
	});
  */
	
  //p413  	3/26
  /* 
  replyService.get(10, function(data){
	  console.log(data);
  })
 */	

  
</script>


<!-- p265 	3/20 -->

<script>
	$(document).ready(function(){
		
		var operForm = $("#operForm");
		
		//수정 버튼을 클릭한 경우 처리
		$("button[data-oper='modify']").on("click",function(e){
			operForm.attr("action","/board/modify")
			        .submit();
		});
		
		//목록 버튼을 클릭시 처리
		$("button[data-oper='list']").on("click",function(e){
			operForm.attr("action","/board/list")
			        .submit();
		});
		
		//p415
		//특정 게시물 번호를 변수에 대입
		var bnoValue = '<c:out value="${board.bno}"/>';
		
		//댓글영역을 변수에 대입
		var replyUL = $(".chat");
		
		showList(1);
		
		//특정 게시물 번호에 대한 댓글을 조회하는 함수
		function showList(page){
			
			//list: 댓글목록을 가지는 변수
			replyService.getList({
				bno: bnoValue,page: page || 1
				//p438 		3/26 
				//replyCnt 추가 
			},function(replyCnt,list){
				
				var str = "";
				
				if(list == null || list.length == 0){
					replyUL.html("");
					
					return;
				}
				
				//댓글이 존재하면
				for(var i=0;i<list.length;i++){
					
					str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
					str += "<div><div class='header'><strong class='primary-font'>" + list[i].replyer + "</strong>";
					str += "<small class='pull-right text-muted'>" + list[i].replyDate + "</small></div>";
					str += "<p>" + list[i].reply + "</p></div></li>";
				}
				
				//댓글영역에 댓글목록을 출력
				replyUL.html(str);
				
				//추가
				showReplyPage(replyCnt);
			}); 
		}//
		
		 
		
		//p422  	3/26  
		//댓글 등록 모달창 버튼 처리
		//모달창 div 영역의 값을 변수에 대입
		var modal = $(".modal");
		
		//입력한 댓글내용을 변수에 대입
		var modalInputReply = modal.find("input[name='reply']");
		//입력한 댓글작성자를 변수에 대입
		var modalInputReplyer = modal.find("input[name='replyer']");
		//댓글 작성일을 변수에 대입
		var modalInputReplyDate = modal.find("input[name='replyDate']");
		
		//수정버튼의 모든 정보를 변수에 대입
		var modalModBtn = $("#modalModBtn");
		//삭제버튼의 모든 정보를 변수에 대입
		var modalRemoveBtn = $("#modalRemoveBtn");
		//등록버튼의 모든 정보를 변수에 대입
		var modalRegisterBtn = $("#modalRegisterBtn");
		//닫 기 버 튼 
		var modalCloseBtn = $("#modalCloseBtn");
		
		//댓글등록 버튼을 클릭했을때 처리
		$("#addReplyBtn").on("click",function(e){
			
			//입력창을 클리어
			modal.find("input").val("");
			
			//댓글 등록일자 div영역을 숨기기
			modalInputReplyDate.closest("div").hide();
			modal.find("button[id != 'modalCloseBtn']").hide();
			
			//댓글등록 버튼을 보여주기
			modalRegisterBtn.show();
			
			//모달창 보여주기
			$(".modal").modal("show");
			
		});
		
		//p423  	3/26 
		//모달창 등록버튼 처리
		modalRegisterBtn.on("click",function(e){
			
			//객체형태
			var reply = {
				//모달창에서 입력한 댓글내용	
				reply: modalInputReply.val(),
				//모달창의 댓글작성자
				replyer: modalInputReplyer.val(),
				//댓글을 달려는 특정 게시물번호
				bno: bnoValue
			};
			
			//reply.js에 댓글등록 처리
			replyService.add(reply,function(result){
				
				alert(result);
				
				//댓글등록후 화면 클리어
				modal.find("input").val("");
				//모달창 닫기
				modal.modal("hide");
				
				//1페이지 새로고침
				showList(1);
			});
			
		});//
		
		//p425  	3/26 
		//댓글 목록에서 특정 댓글 클릭시 상세보기 모달창 구현
		$(".chat").on("click","li",function(e){
						
			//현재 클릭한 댓글번호를 변수에 대입
			var rno = $(this).data("rno");
			
			//reply:특정 댓글내역을 가지고 있는 변수
			replyService.get(rno,function(reply){
				
				//리턴된 댓글내용을 모달창에 표시
				modalInputReply.val(reply.reply);
				//리턴된 댓글작성자를 모달창에 표시
				modalInputReplyer.val(reply.replyer).attr("readonly","readonly");
				//리턴된 댓글 작성일자를 모달창에 표시
				modalInputReplyDate.val(reply.replyDate).attr("readonly","readonly");
				
				//모달창의 data-rno 속성에 리턴된 댓글번호를 대입
				modal.data("rno",reply.rno);
				modal.find("button[id != 'modalCloseBtn']").hide();
				
				//댓글 수정 & 삭제 버튼을 보이기
				modalModBtn.show();
				modalRemoveBtn.show();
				
				//모달창 보이기
				$(".modal").modal("show");
				
			});
			
		});
		 
		//p427  	3/26 
		//모달창 수정버튼 클릭 처리
		modalModBtn.on("click",function(e){
			
			//JSON 형태로 객체를 생성
			var reply = {
				//수정하려는 댓글번호	
				rno: modal.data("rno"),
				//수정한 댓글내용
				reply: modalInputReply.val()
			};
			
			replyService.update(reply,function(result){
				//정상적으로 댓글 수정후 모달창 닫기 & 화면 새로고침
				alert(result);
				modal.modal("hide");
				showList(pageNum);
			});
			
		});
		
		//p427  	3/26 
		//모달창 삭제버튼 클릭 처리
		modalRemoveBtn.on("click",function(e){
			//삭제하려는 댓글번호를 변수에 대입
			var rno = modal.data("rno");
			replyService.remove(rno,function(result){
				alert(result);
				modal.modal("hide");
				showList(pageNum);
			});
		});

		//p---  	3/26 
		//닫기 버튼 처리
		modalCloseBtn.on("click",function(e){
			
			$(".modal").modal("hide");
		});
		
		
		
			
		/* p440 	3/26 */
		var pageNum = 1;
		var replyPageFooter = $(".panel-footer");
		
		function  showReplyPage(replyCnt){
			
			var endNum = Math.ceil(pageNum /10.0) * 10;
			var startNum = endNum - 9;
			
			var prev = startNum != 1;
			var next = false;
			
			if(endNum * 10 >= replyCnt){
				endNum = Math.ceil(replyCnt / 10.0);
			}
			
			if(endNum * 10 < replyCnt) {
				next = true;
			}
			
			var str = "<ul class='pagination pull-right'>";
			
			if(prev){
				str += "<li class='page-item'><a class='page-link' href='"+(startNum-1)+"'>이전</a></li>";
			}
			
			for(var i=startNum;i<=endNum;i++){
				
				var active = pageNum == i ? "active" : "";
				
				str += "<li class='page-item " + active + "'><a class='page-link' href='"+i+"'>" + i + "</a></li>"; 
			}			
			
			
			if(next){
				str += "<li class='page-item'><a class='page-link' href='"+(endNum+1)+"'>다음</a></li>";
			}
			
			str += "</ul></div>";
			
			replyPageFooter.html(str);
				
		}
		
		//p441
		replyPageFooter.on("click","li a",function(e){
			
			e.preventDefault();
			
			var targetPageNum = $(this).attr("href");
			
			pageNum = targetPageNum;
			
			showList(pageNum);
			
		});
		
		
		

	});

</script>




</html>