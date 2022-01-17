<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html class="loading" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
<style>
.fixInfo{
	cursor: default;
}
.td1{
	width: 100px;
	padding-right: 12px;
	text-align: right;
	background-color: #f4f4f4;
	font-size: 12px;
}
.labelTitle{
	font-size:11px;
	color: #7367f0;
}
table{
	border-color: #A4A4A4;
}
.preview-file{
	overflow: auto; 
}
#content:hover{
	background-color: #F6F6F6;
	cursor: pointer;
}
</style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=0,minimal-ui">
    <meta name="description" content="Vuexy admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
    <meta name="keywords" content="admin template, Vuexy admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="PIXINVENT">
    <title>Blog Edit - Vuexy - Bootstrap HTML admin template</title>
    <link rel="apple-touch-icon" href="/resources/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="/resources/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,400;1,500;1,600" rel="stylesheet">

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/vendors/css/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendors/css/forms/select/select2.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendors/css/editors/quill/katex.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendors/css/editors/quill/monokai-sublime.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendors/css/editors/quill/quill.snow.css">
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
    <link rel="stylesheet" type="text/css" href="/resources/css/plugins/forms/form-quill-editor.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/pages/page-blog.css">
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="../../../assets/css/style.css">
    <!-- END: Custom CSS-->

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu-modern  navbar-floating footer-static  menu-collapsed" data-open="click" data-menu="vertical-menu-modern" data-col="">

    <!-- BEGIN: Header-->
    <!-- END: Header-->


    <!-- BEGIN: Main Menu-->
    <!-- END: Main Menu-->

    <!-- BEGIN: Content-->
    <div class="app-content content ">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper container-xxl p-0">
            <div class="content-header row">
                <div class="content-header-left col-md-9 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="col-12">
                            	<a href="/bbs/libraryList"><h2 class="content-header-title float-left mb-0">자료실</h2></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content-body">
                <!-- Blog Edit -->
                <div class="blog-edit-wrapper">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body" style="margin-top: -30px;">
                                <form action="/bbs/bbsAddProcess" method="post" enctype ="multipart/form-data" class="mt-2" id="contentForm">
                                    <input type="hidden" name="se" value="B2">
                                    <label class="labelTitle">Title</label>
                                    <div class="media">
                                    	<input style="width:100%; "type="text" id="blog-edit-title" class="form-control" value="" name="sj" placeholder="제목을 입력하세요."/>
                                    </div>
                                    	<input type="hidden" value="${empNm}" name="empNm" readonly/>
                                    	<input type="hidden" class="form-control fixInfo" value="${now}" name="writngDe" readonly/>
                                    
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="form-group mb-2">
                                                    <label class="labelTitle">Content</label>
                                                    <div id="blog-editor-wrapper">
                                                        <div id="blog-editor-container">
                                                                <textarea id="editor" rows="15" cols="192" name="cn"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 mb-2">
                                                <div class="border rounded p-2" style="height: 170px;margin-top: -20px;">
                                                   <div class="form-group mb-0"  style="display: flex;">
														<h4 class="mb-1" style="width:115px; padding-top:8px;">파일 업로드</h4>
                                                        <div class="custom-file" style="display: flex;">
                                                       	<input type="hidden" value="${fileSn}" name="fileSn"/>
                                                       	<div style="display:flex; justify-content: flex-start;">
                                                            <input type="file" class="custom-file-input" name="uploadFiles" id="file-input" style="width:160px;" multiple/>
                                                            <label class="custom-file-label" for="blogCustomFile" style="width:160px;">파일 등록</label>
                                                       	</div>
                                                       </div>
                                                   </div>
                                                    <div class="media flex-column flex-md-row">
                                                        <div class="media-body" style="margin-bottom:-25px;">
                                                            <small class="text-muted">20MB 제한</small>
                                                            <p class="my-50">
                                                            </p>
                                                            <div class="preview-file" style="height: 70px;"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                       		</div>
                                            <div class="col-12 mt-50">
                                                <div class="d-flex align-items-center justify-content-between">
													<button type="button" id="libraryList" class="create-new btn btn-primary">목록</button>
													<div id="content" style="width: 700px; height: 39px; text-align: center;"></div>
													<div>
														<button type="submit" id="" class="create-new btn btn-primary">등록</button>
														<button type="button" id="reset" class="btn btn-outline-secondary waves-effect">초기화</button>
													</div>
								              </div>
                                            </div>
                                        </div>
                                    </form>
                                    <!--/ Form -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/ Blog Edit -->

            </div>
        </div>
    </div>
    <!-- END: Content-->

<!-- modal start-->
<div class="modal fade text-left modal-primary fileSize" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header" style="justify-content: center;">
                <h5 class="modal-title" id="myModalLabel140" style="text-align: center; center;font-size: 13px;">파일 업로드 안내</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="text-align: center;font-size: 15px;">
                20MB 미만의 파일만 업로드 가능합니다.
            </div>
        </div>
    </div>
</div>
<div class="modal fade text-left modal-primary empty" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header" style="justify-content: center;">
                <h5 class="modal-title" id="myModalLabel140" style="text-align: center; center;font-size: 13px;">필수입력사항 누락 안내</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="text-align: center;font-size: 15px;">
                제목 혹은 내용을 입력해주세요.
            </div>
        </div>
    </div>
</div>
<!-- modal end-->



    <!-- BEGIN: Vendor JS-->
    <script src="/resources/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="/resources/vendors/js/forms/select/select2.full.min.js"></script>
	<script src="/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="/resources/js/core/app-menu.js"></script>
    <script src="/resources/js/core/app.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <script src="/resources/js/scripts/pages/page-blog-edit.js"></script>
    <!-- END: Page JS-->

<script>
//파일만 리셋
function fileReset(){
	var resetBoolean = $("#resetBoolean");
	resetBoolean.value = "true";
	$('.preview-file').empty();
}
// 게시물 전체 리셋 눌렀을 때
$("#reset").on("click",function(){
	$("#editor").html(''); 
	$("#blog-edit-title").val('');
	fileReset();
	console.log("reset :::", $("#editor").val());
})
// 파일 리셋 버튼 눌렀을 때 함수 실행
$("#fileReset").on("click", function(){
	fileReset();
})

function checkExtension(fileSize){
  var maxSize = 20971520;  //20MB
  
  if(fileSize >= maxSize){
	$(".fileSize").modal();
    $("input[type='file']").val("");  //파일 초기화
    return false;
  }
  return true;
}

// 파일첨부
const fileInput = document.querySelector('#file-input')
const preview = document.querySelector('.preview-file')

fileInput.addEventListener('click', function () {
    preview.innerHTML = ''
})

const handler = {
	
    init() {
        fileInput.addEventListener('change', () => {
            console.dir("fileInput : " + fileInput)
            const files = Array.from(fileInput.files)
            files.forEach(file => {
	        	if(!checkExtension(file.size)){
	        		return false;
	        	}
	            console.log(file.name)
                preview.innerHTML 
                += '<div id="' + file.name +'" style="display: inline-flex; "><li style="padding-left:10px; padding-bottom:10px;">&nbsp;'
                + file.name + "<button type='button' data-index='" 
                + file.name 
                + "' class='file-remove btn btn-sm btn-icon delete-record'>" 
                + '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-delete"><path d="M21 4H8l-7 8 7 8h13a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2z"></path><line x1="18" y1="9" x2="12" y2="15"></line><line x1="12" y1="9" x2="18" y2="15"></line></svg>'
                + "</button></li></div>"
            })
        })
    },

    removeFile: () => {
        document.addEventListener('click', (e) => {
        	console.log(e.target.dataset.index)
            if (e.target.classList.contains('file-remove') === false) return
            const removeTargetId = e.target.dataset.index
            const removeTarget = document.getElementById(removeTargetId)
            const files = document.querySelector('#file-input').files
            const dataTransfer = new DataTransfer()

            Array.from(files)
                .filter(file => file.name != removeTargetId)
                .forEach(file => {
                    dataTransfer.items.add(file)
                })

            document.querySelector('#file-input').files = dataTransfer.files

            removeTarget.remove()
        })
    }
}

handler.init()
handler.removeFile()

$("#contentForm").submit(function(){ 
	oEditors.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
	let content = $("#editor").val();
	let title = $("#blog-edit-title").val();
	if(content == '<p>&nbsp;</p>' || title == '') { 
		$(".empty").modal();
		oEditors.getById["editor"].exec("FOCUS"); 
		return false;
	} else{
		console.log(content);
	}
})

function delImg(_this){
    $(_this).parent('li').remove()
}

</script>


<script>
var oEditors = [];

$("#content").on("click",function(){
	var str = '<p align="left"><strong malgun="" gothic",="" tahoma,="" gulim,="" sans-serif;="" vertical-align:="" baseline;="" background-image:="" none;="" background-position:="" initial;="" background-size:="" background-repeat:="" background-attachment:="" background-origin:="" background-clip:="" letter-spacing:="" -1px;="" text-align:="" center;"="" style="margin: 0px; padding: 0px; border: 0px currentcolor; font-style: inherit; font-size: 18px;"><span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-family: Dotum; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><strong malgun="" gothic",="" tahoma,="" gulim,="" sans-serif;="" vertical-align:="" baseline;="" background-image:="" none;="" background-position:="" initial;="" background-size:="" background-repeat:="" background-attachment:="" background-origin:="" background-clip:="" text-align:="" start;"="" style="margin: 0px; padding: 0px; border: 0px currentcolor; font-style: inherit; font-size: 12px;"><span style="margin: 0px; padding: 0px; border: 0px currentcolor; font-style: inherit; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">동호회명칭, 신청금액, 회원변동 등의 내용을 기입하여 사내동호회 보조금 신청서 작성시 사용하는 신청서 양식입니다.</span></span></strong><br></span></strong></p><p><font face="Dotum"><span style="font-size: 12pt;"><b>아래 첨부파일을 확인해주십시오.</b></span></font></p><p><strong malgun="" gothic",="" tahoma,="" gulim,="" sans-serif;="" vertical-align:="" baseline;="" background:="" none;"="" style="font-family: Dotum; font-size: 14px; font-style: inherit; margin: 0px; padding: 0px; border: 0px currentcolor;"><span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><br></span></strong></p><p><strong malgun="" gothic",="" tahoma,="" gulim,="" sans-serif;="" vertical-align:="" baseline;="" background:="" none;"="" style="font-family: Dotum; font-size: 14px; font-style: inherit; margin: 0px; padding: 0px; border: 0px currentcolor;"><span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">문의사항 :</span></strong><font face="Dotum"><span style="font-size: 14px; font-style: inherit;">&nbsp;</span><span style="font-size: 14px;">042-282-1503</span><span style="font-size: 14px; font-style: inherit;">&nbsp;(회계팀 담당자)</span></font></p>'
	$("#blog-edit-title").val("사내동호회 보조금 신청서 양식");
	oEditors.getById["editor"].exec("PASTE_HTML", [str]);
	$("#editor").val(str);
	console.log($("#blog-edit-title").val(),"/",$("#editor").val());
})

$(window).on('load', function() {
    if (feather) {
        feather.replace({
            width: 14,
            height: 14
        });
    }
    
});
        
$(function(){
   nhn.husky.EZCreator.createInIFrame({
      oAppRef: oEditors,
      elPlaceHolder: "editor",
      //SmartEditor2Skin.html 파일이 존재하는 경로
      sSkinURI: "/resources/smarteditor/SmartEditor2Skin.html",  
      htParams : {
          // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
          bUseToolbar : true,             
          // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
          bUseVerticalResizer : true,     
          // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
          bUseModeChanger : true,         
          fOnBeforeUnload : function(){
               
          }
      }, 
      fCreator: "createSEditor2"
      });
   });
   
$(function(){
	 $("#libraryList").on("click", function(){
		 location.href = "/bbs/libraryList?currentPage=1";
	 });
});
</script>
</body>
<!-- END: Body-->

</html>