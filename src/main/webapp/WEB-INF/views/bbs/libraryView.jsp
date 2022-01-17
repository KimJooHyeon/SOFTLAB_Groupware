<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html class="loading" data-textdirection="ltr">
<!-- BEGIN: Head-->
<style type="text/css">
.images{
	height: 300px;
	width: 300px;
}
</style>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=0,minimal-ui">
    <meta name="description" content="Vuexy admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
    <meta name="keywords" content="admin template, Vuexy admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="PIXINVENT">
    <title>Input - Vuexy - Bootstrap HTML admin template</title>
    <link rel="apple-touch-icon" href="/resources/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="/resources/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,400;1,500;1,600" rel="stylesheet">
	
    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/vendors/css/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendors/css/forms/select/select2.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendors/css/pickers/flatpickr/flatpickr.min.css">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/colors.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/components.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/themes/dark-layout.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/themes/bordered-layout.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/themes/semi-dark-layout.css">

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/css/core/menu/menu-types/vertical-menu.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/core/menu/menu-types/horizontal-menu.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/pages/page-blog.min.css">
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/assets/css/style.css">
    <!-- END: Custom CSS-->

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<!-- <body class="horizontal-layout horizontal-menu content-detached-right-sidebar navbar-floating footer-static  " data-open="hover" data-menu="horizontal-menu" data-col="content-detached-right-sidebar"> -->
<body class="vertical-layout vertical-menu-modern  navbar-floating footer-static   menu-collapsed" data-open="click" data-menu="vertical-menu-modern" data-col="content-detached-right-sidebar">
	    <div class="app-content content" style="display: flex; justify-content: center;">
	      <div class="content-overlay"></div>
	      <div class="header-navbar-shadow"></div>
	      <div class="content-wrapper">
	        <div class="content-header row">
	          <div class="content-header-left col-md-9 col-12 mb-2">
	            <div class="row breadcrumbs-top">
	              <div class="col-12">
	                <a href="/bbs/libraryList"><h2 class="content-header-title float-left mb-0">자료실</h2></a>
	              </div>
	            </div>
	          </div>
	        </div>
	        <div class="content-detached content-center">
	          <div class="content-body"><!-- Blog Detail -->
	<div class="blog-detail-wrapper">
	  <div class="row">
	    <!-- Blog -->
	    <div class="col-12">
	      <div class="card">
	        <div class="card-body" style="width:1300px;">
	        <div>
	        <div style="display: flex; justify-content: space-between;height: 5px;">
				<h4 class="card-title">${detail.BBSCTT_SJ}</h4>
				<div class="media">
		            <div class="media-body" style="display:flex; justify-content: flex-end;">
		              <span class="text-body" style="font-weight: bold;">${detail.EMP_NM}<small>(${detail.DEPT_NM})</small></span>
		              <span class="text-muted ml-50 mr-25">|</span>
		              <span class="text-muted">${detail.WRITNG_DE}</span>
		            </div>
				</div>
	        </div>
	          <div class="my-1 py-25">
	            <hr>
	          </div>
	          
	          <iframe id="ifrm" name="ifrm" style="display: none;"></iframe>
	          
	          <div>
	            ${detail.BBSCTT_CN}
				<c:forEach var="list" items="${imgFiles}">
<!-- 				<div style="display: inline-flex; "> -->
				<div>
					<li style="padding-left:10px; padding-top:10px;"><span class="files">${list.REAL_FILE_NM}</span></li>
						<img alt="" src="${list.FLPTH}${list.FILE_NM}" class="images">
				</div>
				</c:forEach>
	          </div>
	          <div class="media">
	            <div class="media-body">
	            </div>
	          </div>
	          <hr class="my-2" />
				<div style="padding-bottom: 20px;" class="fileList">
					<c:forEach var="list" items="${etcFiles}">
					<div style="display: inline-flex; ">
						<a href="javascript:fn_download('${list.FILE_NM}','${list.FILE_SN}')">
						 <li style="padding-left:10px; padding-bottom:10px;"><span class="files">${list.REAL_FILE_NM}</span></li>
						</a>
					</div>
					</c:forEach>
				</div>
	          <div class="d-flex align-items-center justify-content-between">
	              <button type="button" id="libraryList" class="create-new btn btn-primary">목록</button>
	              <c:if test="${detail.EMP_NO eq loginEmpNo}">
					<div>
						<form action="/bbs/libraryEditForm" method="post" id="goEdit">
							<input type="hidden" value="${detail.BBSCTT_SN}" name="bbscttSn">
							<button type="submit" id="update" class="create-new btn btn-primary">수정</button>
							<button type="button" id="delete" class="btn btn-outline-primary waves-effect">삭제</button>
						</form>
					</div>
	              </c:if>
	          </div>
	        </div>
	      </div>
	    </div>
	    <!--/ Blog -->
<!-- Leave a Blog Comment -->
	<h6 class="section-label mt-25" style="margin-left: 15px;">Comment</h6>
		    <div class="col-12 mt-1">
		      <div class="card">
		        <div class="card-body" style="padding-bottom: 0px;">
		          <form action="#" class="form">
		            <div class="row">
		              <div class="col-sm-6 col-12">
		              <small>300자 제한&nbsp;<span id="TA_cnt">(0 / 300)</span></small>
		              </div>
		              <div class="col-12" style="display: flex;">
		                <textarea class="form-control mb-2" style="height: 70px;" placeholder="댓글을 입력해주세요." name="answerTA" id="answerTA"></textarea>
		                <button type="button" class="btn btn-primary" id="answerSubmit" style="height: 70px; width: 70px;"><i style="width: 25px;height: 25px;" data-feather='smile' class="smile"></i></button>
		              </div>
		            </div>
		          </form>
		        </div>
		      </div>
		    </div>
<!--/ Leave a Blog Comment -->

	    <!-- Blog Comment List -->
	    <div class="col-12 mt-1" id="blogComment">
	      <div class="commentList">
		      <c:forEach var="answer" items="${answerList}">
		      	<input type="hidden" value="${answer.ANSWER_SN}" id="answerSn">
		      	<div style="margin-bottom: 1px;">
			      <div class="card">
			        <div class="card-body">
			          <div class="media">
			            <div class="media-body" style="display: flex;">
				            <div style="display: flex;">
				              <h6 class="font-weight-bolder mb-25">${answer.EMP_NM}<small>(${answer.DEPT_NM})</small></h6>
				              <span class="text-muted ml-50 mr-25">|</span>
				              <p class="card-text">${answer.WRITNG_DE}</p>
				            </div>
				              <c:if test="${answer.UPD_DE ne '' and answer.UPD_DE ne null}">
					              <small class="card-text" style="color: #7367f0;">&nbsp;(댓글 수정 : ${answer.UPD_DE})</small>
				              </c:if>
			            </div>
			            <c:if test="${answer.EMP_NO eq loginEmpNo}">
				            <div class="answerEditor${answer.ANSWER_SN}">
				              <a href="javascript:answerUpdate('${answer.ANSWER_CN}',${answer.ANSWER_SN});" class="updateAnswer${answer.ANSWER_SN}">수정</a>
				              &nbsp;
				              <a href="javascript:answerDeleteModal(${answer.ANSWER_SN});">삭제</a>
			                </div>
		                </c:if>
			          </div>
			          <hr class="commentHr">
			              <p class="card-text answerCn${answer.ANSWER_SN}">
			                ${answer.ANSWER_CN}
			              </p>
			        </div>
			      </div>
				</div>
		      </c:forEach>
	      </div>
	    </div>
	    <!--/ Blog Comment List -->
	

	  </div>
	</div>
	<!--/ Blog Detail -->
	
	          </div>
	        </div>
	        </div>
	      </div>
	      </div>
    <!-- END: Content-->
<!-- 모달 시작 -->  
<div class="modal fade text-left modal-primary delete" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header" style="justify-content: center;">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="text-align: center;font-size: 15px;">
                삭제하시겠습니까?
            </div>
            <div class="modal-footer" style="justify-content: center;">
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="javascript:deleteCheck(true);">YES</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="javascript:deleteCheck(false);">NO</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade text-left modal-primary answerDelete" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
    <input type="hidden" id="answerSnHidden"/>
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header" style="justify-content: center;">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="text-align: center;font-size: 15px;">
                삭제하시겠습니까?
            </div>
            <div class="modal-footer" style="justify-content: center;">
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="answerDelete()">YES</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="return false;">NO</button>
            </div>
        </div>
	</div>
</div>
<!-- 모달 끝 -->  

    <!-- BEGIN: Vendor JS-->
    <script src="/resources/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="/resources/vendors/js/ui/jquery.sticky.js"></script>
    <script src="/resources/vendors/js/forms/select/select2.full.min.js"></script>
    <script src="/resources/vendors/js/forms/validation/jquery.validate.min.js"></script>
    <script src="/resources/vendors/js/pickers/flatpickr/flatpickr.min.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="/resources/js/core/app-menu.js"></script>
    <script src="/resources/js/core/app.js"></script>
    <script src="/resources/js/scripts/customizer.min.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <script src="/resources/js/scripts/forms/form-tooltip-valid.js"></script>
    <script src="/resources/js/scripts/components/components-navs.js"></script>
    <!-- END: Page JS-->

<script>
	function fn_download(fname,fsn) {
		// iframe 요소
		var vIfrm = document.getElementById("ifrm");
		vIfrm.src = "/bbs/bbsFileDownload?fileName=" + encodeURIComponent(fname) + "&fileSn=" + fsn;
	}
</script>

<script>
//댓글 등록
$("#answerSubmit").on("click", function(){
	if($("#answerTA").val() == null || $("#answerTA").val() == ""){
		return false;
	}
	var data = {
			"answerCn":$("#answerTA").val(),
			"bbscttSn":${detail.BBSCTT_SN}
	}
	
	$.ajax({
		url:"/answer/answerAdd",
		data:JSON.stringify(data),
		contentType : "application/json; charset=utf-8",
		type : 'POST',
		success:function(result){
			$("#answerTA").val("");
			if(result.length){
				var str = "";
				$.each(result, function(i,v){
					str += '<input type="hidden" value="'+ v.ANSWER_SN +'" id="answerSn">';
					str += '<div style="margin-bottom: 1px;"><div class="card"><div class="card-body"><div class="media"><div class="media-body" style="display: flex;">';
					str += '<div style="display: flex;">';
					str += '<h6 class="font-weight-bolder mb-25">' + v.EMP_NM +'<small>('+v.DEPT_NM+')</small></h6>';
					str += '<span class="text-muted ml-50 mr-25">|</span>';
					str += '<p class="card-text">'+v.WRITNG_DE+'</p>';
					str += '</div>'
					if(v.UPD_DE != null){
						str += '<small class="card-text" style="color: #7367f0;">&nbsp;(댓글 수정 : '+v.UPD_DE+')</small>'
					}
					str += '</div>'
					if(v.EMP_NO == ${loginEmpNo}){
						str += '<div class="answerEditor'+v.ANSWER_SN+'">';
						str += '<a onclick="answerUpdate(\''+ v.ANSWER_CN +'\','+v.ANSWER_SN+');" href="#">수정</a>';
						str += '&nbsp;&nbsp;&nbsp;'
						str += '<a href="javascript:answerDeleteModal('+v.ANSWER_SN+');">삭제</a>'
						str += '</div>'
					}
					str += '</div><hr>';
					str += '<p class="card-text answerCn'+v.ANSWER_SN+'">'+v.ANSWER_CN+'</p>'
					str += '</div></div></div>'
				});
				$(".commentList").html(str)
				console.log("ajax result : ", result);
			}else{
				alert("삭제 실패");
			}
		}
	})
})
// 글자 수 제한 300자
$('#answerTA').on('keyup', function() {
    $('#TA_cnt').html("("+$(this).val().length+" / 300)");

    if($(this).val().length > 100) {
        $(this).val($(this).val().substring(0, 300));
        $('#TA_cnt').html("(300 / 300)");
    }
});

//----------------------------------------------------------------------------------------------------------------------------------

//댓글 수정 누를 때
function answerUpdate(answer, answerSn){
	answer = answer.replaceAll("<br>", "\n");
	var answer_br = answer.replaceAll("\n", "<br>");
	console.log(answer);
	var str = "<div style='display:flex;'><textarea id='answerUpdateTa"+answerSn+"' class='form-control md-2' style='height: 70px;'>"
	str += answer;
	str += "</textarea>";
	str += "<button type='button' class='btn btn-outline-primary waves-effect' style='height: 70px; width: 70px;' onclick='answerUpdateBtn("+answerSn+")'>"
	str += '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-smile" style="width: 25px;height: 25px;"><circle cx="12" cy="12" r="10"></circle><path d="M8 14s1.5 2 4 2 4-2 4-2"></path><line x1="9" y1="9" x2="9.01" y2="9"></line><line x1="15" y1="9" x2="15.01" y2="9"></line></svg>'
	str += "</button></div>"; 
	$(".answerCn"+answerSn).html(str);
	
	var text = '<a onclick="answerUpdateCancel(\'' + answer_br +'\',' + answerSn + ');" href="#">취소</a>'
	$(".answerEditor"+answerSn).html(text);
	
} 

// 댓글 수정 submit할 때
function answerUpdateBtn(answerSn){
	var answerUpdateTA = $("#answerUpdateTa"+answerSn).val();
	answerUpdateTA = answerUpdateTA.replaceAll("\n", "<br>");
	
	var data = {"updateCn" : answerUpdateTA,
			"updateSn" : answerSn,
			"bbscttSn" : ${detail.BBSCTT_SN}}
	
	$.ajax({
		url:"/answer/update",
		data:JSON.stringify(data),
		contentType : "application/json; charset=utf-8",
		type:"POST",
		success : function(result){
			console.log("updateAjax : " , result);
			if(result.length){
				var str = "";
				$.each(result, function(i,v){
					str += '<input type="hidden" value="'+ v.ANSWER_SN +'" id="answerSn">';
					str += '<div style="margin-bottom: 1px;"><div class="card"><div class="card-body"><div class="media"><div class="media-body" style="display: flex;">';
					str += '<div style="display: flex;">';
					str += '<h6 class="font-weight-bolder mb-25">' + v.EMP_NM +'<small>('+v.DEPT_NM+')</small></h6>';
					str += '<span class="text-muted ml-50 mr-25">|</span>';
					str += '<p class="card-text">'+v.WRITNG_DE+'</p>';
					str += '</div>'
					if(v.UPD_DE != null){
						str += '<small class="card-text" style="color: #7367f0;">&nbsp;(댓글 수정 : '+v.UPD_DE+')</small>'
					}
					str += '</div>'
					if(v.EMP_NO == ${loginEmpNo}){
						str += '<div class="answerEditor'+v.ANSWER_SN+'">';
						str += '<a onclick="answerUpdate(\''+ v.ANSWER_CN +'\','+v.ANSWER_SN+');" href="#">수정</a>';
						str += '&nbsp;&nbsp;&nbsp;'
						str += '<a href="javascript:answerDeleteModal('+v.ANSWER_SN+');">삭제</a>'
						str += '</div>'
					}
					str += '</div><hr>';
					str += '<p class="card-text answerCn'+v.ANSWER_SN+'">'+v.ANSWER_CN+'</p>'
					str += '</div></div></div>'
				});
				$(".commentList").html(str)
				console.log("ajax result : ", result);
			}else{
				alert("수정 실패");
			}
		}
	})
	
	console.log("수정할 댓글 번호 : " , answerSn);
	console.log("수정할 댓글 내용 : " , answerUpdateTA);
}

// 댓글 수정을 취소할 때
function answerUpdateCancel(answer, answerSn){
	$(".answerCn"+answerSn).html(answer);
	var text = '<a onclick="answerUpdate(\'' + answer +'\',' + answerSn + ');" href="#">수정</a>&nbsp;&nbsp;'
	text += '&nbsp;<a href="javascript:answerDeleteModal('+ answerSn +');">삭제</a>'
	$(".answerEditor"+answerSn).html(text);	
// 	console.log(answer);
}

// 댓글 삭제 확인 모달
function answerDeleteModal(answerSn){
	$(".answerDelete").modal();
	$("#answerSnHidden").val(answerSn);
// 	answerDelete(answerSn);
}

// 댓글 삭제 ajax
function answerDelete(){
// 	console.log($("#answerSnHidden").val());
	var data = {
		answerSn : $("#answerSnHidden").val(),
		bbscttSn : ${detail.BBSCTT_SN}
	}

	$.ajax({
		url : '/answer/answerDelete',
		data : JSON.stringify(data),
		contentType : "application/json; charset=utf-8",
		type : 'POST',
		success : function(result){
				var str = "";
			if(result.length){
				$.each(result, function(i,v){
					str += '<input type="hidden" value="'+ v.ANSWER_SN +'" id="answerSn">';
					str += '<div style="margin-bottom: 1px;"><div class="card"><div class="card-body"><div class="media"><div class="media-body" style="display: flex;">';
					str += '<div style="display: flex;">';
					str += '<h6 class="font-weight-bolder mb-25">' + v.EMP_NM +'<small>('+v.DEPT_NM+')</small></h6>';
					str += '<span class="text-muted ml-50 mr-25">|</span>';
					str += '<p class="card-text">'+v.WRITNG_DE+'</p>';
					str += '</div>'
					if(v.UPD_DE != null){
						str += '<small class="card-text" style="color: #7367f0;">&nbsp;(댓글 수정 : '+v.UPD_DE+')</small>'
					}
					str += '</div>'
					if(v.EMP_NO == ${loginEmpNo}){
						str += '<div class="answerEditor'+v.ANSWER_SN+'">';
						str += '<a onclick="answerUpdate(\''+ v.ANSWER_CN +'\','+v.ANSWER_SN+');" href="#">수정</a>';
						str += '&nbsp;&nbsp;&nbsp;'
						str += '<a href="javascript:answerDeleteModal('+v.ANSWER_SN+');">삭제</a>'
						str += '</div>'
					}
					str += '</div><hr>';
					str += '<p class="card-text answerCn'+v.ANSWER_SN+'">'+v.ANSWER_CN+'</p>'
					str += '</div></div></div>'
				});
				$(".commentList").html(str)
				console.log("ajax result : ", result);
			}else{
				$(".commentList").html(str)
			}
		},
		error:
			function(e){
			console.log("error ::: ", e);
		}
	});
}

// 글 삭제 확인 모달
$("#delete").on("click", function(){
	$(".delete").modal();
})

// 글 삭제 함수
function deleteCheck(check){
	if(check){
		location.href = "/bbs/bbsDelete?bbscttSn=" + ${detail.BBSCTT_SN} + "&se=B2";
	}
}
</script>






    
<script>
	$(window).on('load', function() {
	    if (feather) {
	        feather.replace({
	            width: 14,
	            height: 14
	        });
	    }
	});
	$("#libraryList").on("click", function(){
		location.href = "/bbs/libraryList?currentPage=1";
	});
</script>
</body>
<!-- END: Body-->

</html>