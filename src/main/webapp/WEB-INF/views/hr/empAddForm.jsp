<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html class="loading" data-textdirection="ltr">
<!-- BEGIN: Head-->
<style type="text/css">
input::placeholder { text-align: center; }
.searchEmp{
	display:flex;
}

#zipInput{
	cursor: pointer;
}
#content:hover{
	background-color: #F6F6F6;
	cursor: pointer;
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
    <link rel="stylesheet" type="text/css" href="/resources/css/core/menu/menu-types/horizontal-menu.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/plugins/forms/pickers/form-flat-pickr.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/plugins/forms/form-validation.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/pages/app-user.css">
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/assets/css/style.css">
    <!-- END: Custom CSS-->

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu-modern  navbar-floating footer-static   menu-collapsed" data-open="click" data-menu="vertical-menu-modern" data-col="">

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
			    <div class="pageTitle" style="margin: 15px;">
		           <h2 class="content-header-title float-left mb-0">직원정보등록</h2>
		           <div class="breadcrumb-wrapper">
		               <ol class="breadcrumb">
		                   <li class="breadcrumb-item">
		                   </li>
		               </ol>
		           </div>
				</div>
            </div>
            <div class="content-body">
                <!-- users edit start -->
                <section class="app-user-edit">
                    <div class="card">
                        <div class="card-body">
                            <div class="tab-content">
                                <!-- Account Tab starts -->
                                <div class="tab-pane active" id="account" aria-labelledby="account-tab" role="tabpanel">
                                    <!-- users edit media object ends -->
                <!-- users edit account form start -->
							<form:form modelAttribute="emp" method="post"  enctype ="multipart/form-data" action="/hr/empAddProcess" class="form-validate" id="emp">
                                    <!-- users edit media object start -->
                                    <div class="media mb-2">
                                        <img src="/resources/images/logo/logo.png" alt="users avatar" id="userImg" class="user-avatar users-avatar-shadow rounded mr-2 my-25 cursor-pointer" height="90" width="90" />
                                        <div class="media-body mt-50">
                                            <div class="col-12 d-flex mt-1 px-0">
                                                <label class="btn btn-primary mr-75 mb-0" for="change-picture">
                                                    <span class="d-none d-sm-block">UPLOAD</span>
                                                    <input class="form-control" type="file" name="photoFlpthFile" id="change-picture" hidden accept="image/jpg" />
                                                    <span class="d-block d-sm-none">
                                                        <i class="mr-0" data-feather="edit"></i>
                                                    </span>
                                                </label>
                                                    <button type="button" class="btn btn-outline-primary" id="fileCheck" data-toggle="modal" data-target=".img" style="padding:10px;">
													    File Check!
													</button>
													<input type="hidden" name="count" value="0">
                                            </div>
                                        </div>
                                    </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <form:label path="empNo">직원번호</form:label>
                                                    <form:input path="empNo" type="text" class="form-control" placeholder="직원번호" value="${emp.empNo}" readonly="true"/>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <form:label path="empNm">이름</form:label>
                                                    <form:input path="empNm" type="text" class="form-control" placeholder="이름" />
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-6">
                                                <div class="form-group">
                                                    <form:label path="brthdy">생년월일</form:label>
                                                    <form:input path="brthdy" type="text" class="form-control birthdate-picker" placeholder="YYYY-MM-DD"/>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <form:label path="email">외부이메일</form:label>
                                                    <form:input path="email" type="email" class="form-control" placeholder="외부이메일" name="email" id="email" />
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <form:label path="phonenum">휴대폰번호</form:label>
                                                    <form:input path="phonenum" type="text" class="form-control" placeholder="휴대폰번호는 해당 직원이 직접 입력합니다." readonly="true"/>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <form:label path="encpnDe">입사일자</form:label>
                                                    <form:input path="encpnDe" type="text" class="form-control birthdate-picker" placeholder="YYYY-MM-DD"/>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-6">
                                                <div class="form-group">
                                                    <form:label path="deptVO.deptCode">담당부서</form:label>
                                                    <form:select path="deptVO.deptCode" class="form-control" id="deptSelect">
                                                        <form:option value="null" label="부서선택" selected="true" />
                                                        <form:option value="null" label="" disabled="true"/>
                                                        <form:option value="QCT" label="품질관리팀"/>
                                                        <form:option value="SLT" label="영업팀"/>
                                                        <form:option value="CMT" label="고객관리팀"/>
                                                        <form:option value="RDT" label="개발팀"/>
                                                        <form:option value="DST" label="설계팀"/>
                                                        <form:option value="GAT" label="총무팀"/>
                                                        <form:option value="ACT" label="회계팀"/>
                                                        <form:option value="HRT" label="인사팀"/>
                                                        <form:option value="MND" label="관리부"/>
                                                        <form:option value="BSD" label="영업부"/>
                                                        <form:option value="RDD" label="개발부"/>
                                                        <form:option value="ADD" label="행정부"/>
                                                        <form:option value="DTR" label="임원"/>
                                                        <form:option value="CEO" label="대표" disabled="true"/>
                                                    </form:select>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-6">
                                                <div class="form-group">
                                                    <form:label path="clsfCode">직급</form:label>
                                                    <form:select path="clsfCode" class="form-control" id="clsfSelect">
                                                        <form:option value="null" label="직급선택" selected="true" />
                                                        <form:option value="null" label="" disabled="true"/>
                                                        <form:option value="C8" label="사원" />
                                                        <form:option value="C7" label="대리" />
                                                        <form:option value="C6" label="과장" />
                                                        <form:option value="C5" label="차장" />
                                                        <form:option value="C4" label="팀장" />
                                                        <form:option value="C3" label="부장" />
                                                        <form:option value="C2" label="이사" />
                                                        <form:option value="C1" label="대표" disabled="true"/>
                                                    </form:select>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <form:label path="lxtnNo">내선번호</form:label>
                                                    <form:input type="text" path="lxtnNo" class="form-control" placeholder="내선번호" name="lxtnNo" value="${emp.lxtnNo}" readonly="true"/>
                                                </div>
                                            </div>
                                             <div class="col-12">
                                                <h4 class="mb-1 mt-2">
                                                    <i data-feather="map-pin" class="font-medium-4 mr-25"></i>
                                                    <span class="align-middle">Address</span>
                                                </h4>
                                            </div>
                                            <div class="col-lg-4 col-md-6">
                                                <div class="form-group">
                                                    <form:label path="zip">우편번호</form:label>
		                                            <form:input path="zip" type="text" class="form-control" placeholder="우편번호" name="zip" id="zipInput" readonly="true" style="background:white;" onclick="openHomeSearch();"/>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-6">
                                                <div class="form-group">
                                                    <form:label path="adres1">기본주소</form:label>
                                                    <form:input path="adres1" type="text" class="form-control" placeholder="기본주소" name="adres1" id="adres1"/>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-6">
                                                <div class="form-group">
                                                    <form:label path="adres2">상세주소</form:label>
                                                    <form:input path="adres2" type="text" class="form-control" placeholder="상세주소"  />
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <form:label path="password">비밀번호</form:label>
                                                    <form:input path="password" type="text" class="form-control" placeholder="직원번호" name="password" value="${emp.empNo}" readonly="true"/>
                                                </div>
                                            </div>
                                            <div class="col-12 d-flex flex-sm-row flex-column mt-2" style="display: flex; justify-content: space-between;">
                                                <button type="button" id="empList" class="create-new btn btn-primary">목록</button>
                                                <div id="content" style="width: 700px; height: 39px; text-align: center;"></div>
                                                <div>
	                                                <input type="submit" id="finalAdd" value="등록" class="btn btn-primary mb-1 mb-sm-0 mr-0 mr-sm-1 btn-submit" onclick="javascript:empSubmit();"/>
	                                                <input type="reset" value="초기화" class="btn btn-outline-secondary">
                                                </div>
                                            </div>
                                        </div>
							</form:form>
            <!-- users edit account form ends -->
                                </div>
                                <!-- Account Tab ends -->

                            </div>
                        </div>
                    </div>
                </section>
                                <!-- 프로필 사진 파일명 넘겨주기 -->
								<div class="imgHtml"></div>
				<!-- Modal start -->
				<div class="modal fade text-left modal-primary jpg img" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-centered" role="document">
				        <div class="modal-content">
				            <div class="modal-header" style="justify-content: center;">
				                <h5 class="modal-title" id="myModalLabel140" style="text-align: center; center;font-size: 13px;">프로필 사진 업로드 안내</h5>
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                    <span aria-hidden="true">&times;</span>
				                </button>
				            </div>
				            <div class="modal-body" style="text-align: center;font-size: 15px;">
				                프로필 사진은 jpg 확장자만 업로드 가능합니다.
				            </div>
				        </div>
				    </div>
				</div>
				
				
				<div class="modal fade text-left modal-primary fileSize img" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-centered" role="document">
				        <div class="modal-content">
				            <div class="modal-header" style="justify-content: center;">
				                <h5 class="modal-title" id="myModalLabel140" style="text-align: center; center;font-size: 13px;">프로필 사진 업로드 안내</h5>
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                    <span aria-hidden="true">&times;</span>
				                </button>
				            </div>
				            <div class="modal-body" style="text-align: center;font-size: 15px;">
				                5MB 미만의 이미지만 업로드 가능합니다.
				            </div>
				        </div>
				    </div>
				</div>
				
				
				<div class="modal fade text-left modal-primary success img" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-centered" role="document">
				        <div class="modal-content">
				            <div class="modal-header" style="justify-content: center;">
				                <h5 class="modal-title" id="myModalLabel140" style="text-align: center; center;font-size: 13px;">프로필 사진 업로드 안내</h5>
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                    <span aria-hidden="true">&times;</span>
				                </button>
				            </div>
				            <div class="modal-body" style="text-align: center;font-size: 15px;">
				                업로드 가능합니다.
				            </div>
				        </div>
				    </div>
				</div>
				
				<div class="modal fade text-left modal-primary check" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-centered" role="document">
				        <div class="modal-content">
				            <div class="modal-header" style="justify-content: center;">
				                <h5 class="modal-title" id="myModalLabel140" style="text-align: center; center;font-size: 13px;">File Check! 안내</h5>
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                    <span aria-hidden="true">&times;</span>
				                </button>
				            </div>
				            <div class="modal-body" style="text-align: center;font-size: 15px;">
				                프로필 사진 업로드 후 File Check! 버튼을 눌러주세요.
				            </div>
				        </div>
				    </div>
				</div>
				
				<div class="modal fade text-left modal-primary select" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-centered" role="document">
				        <div class="modal-content">
				            <div class="modal-header" style="justify-content: center;">
				                <h5 class="modal-title" id="myModalLabel140" style="text-align: center; center;font-size: 13px;">필수입력사항 안내</h5>
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                    <span aria-hidden="true">&times;</span>
				                </button>
				            </div>
				            <div class="modal-body" style="text-align: center;font-size: 15px;">
				                이름 / 생년월일 / 외부이메일 /<br> 
				                입사일자 / 담당부서 / 직급 / <br>
				                우편번호 / 기본주소는 필수입력사항입니다.
				            </div>
				        </div>
				    </div>
				</div>
				
				<div class="modal fade text-left modal-primary final" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-centered" role="document">
				        <div class="modal-content">
				            <div class="modal-header" style="justify-content: center;">
				                <h5 class="modal-title" id="myModalLabel140" style="text-align: center; center;font-size: 13px;">최종 확인</h5>
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                    <span aria-hidden="true">&times;</span>
				                </button>
				            </div>
				            <div class="modal-body" style="text-align: center;font-size: 15px;">
				                등록하시겠습니까?
				            </div>
				            <div class="modal-footer" style="justify-content: center;">
				                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="javascript:finalCheck(true);">YES</button>
				                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="javascript:finalCheck(false);">NO</button>
				            </div>
				        </div>
				    </div>
				</div>
				
				<!-- Modal end -->
                <!-- users edit ends -->

            </div>
        </div>
    </div>
    <div class="imgs_wrap"></div>
    <!-- END: Content-->

    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

    <!-- BEGIN: Footer-->
    <footer class="footer footer-static footer-light">
    </footer>
    <button class="btn btn-primary btn-icon scroll-top" type="button"><i data-feather="arrow-up"></i></button>
    <!-- END: Footer-->

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
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <script src="/resources/js/scripts/forms/form-tooltip-valid.js"></script>
    <script src="/resources/js/scripts/pages/app-user-edit.js"></script>
    <script src="/resources/js/scripts/components/components-navs.js"></script>
    <!-- END: Page JS-->
    
	<!-- 우편번호 찾는 API -->
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
    



<script>     
var regex = new RegExp("(.*?\.(jpg)$)");
var maxSize = 5242880; // 5mb(5242880)
var count = 0;

// 파일 크기랑 확장자 제한하는 함수 
function checkExtension(fileName, fileSize){
	if(fileSize >= maxSize){
		$(".fileSize").modal();
		count = 0;
		return false;
	}
	// 파일명의 정규식 체크
	if(!regex.test(fileName)){
		$(".jpg").modal();
		count = 0;
		return false;
	}
	
	// 문제가 없다면
	$(".success").modal();
	count = 1;
	return false;
}

// 파일 체크 버튼 누르면 ~?
$("#fileCheck").on("click", function(){
	count = 1;
  	var inputFile = $("#change-picture");
  	var files = inputFile[0].files;
  	
  	console.log("name : " + files[0].name);
  
  	if(!checkExtension(files[0].name, files[0].size)){	// 문제발생 시
		// 프로그램 종료
		return false;
	}
 });
 

function empSubmit(){
	console.log("******************", count);
	var empNm = document.getElementById('empNm').value;
	var brthdy = document.getElementById('brthdy').value;
	var email = document.getElementById('email').value;
	var encpnDe = document.getElementById('encpnDe').value;
	var zipInput = document.getElementById('zipInput').value;
	var adres1 = document.getElementById('adres1').value;
	var deptSelect = document.getElementById('deptSelect').value;
	var clsfSelect = document.getElementById('clsfSelect').value;
	
	var imgSrc = document.getElementById("userImg").src;
	
	if(empNm != "" && brthdy != "" && email != "" && encpnDe != "" && zipInput != "" && adres1 != "" && deptSelect != "null" && clsfSelect != "null" && count == 1 && imgSrc.indexOf("/resources/images/logo/logo.png") <= -1){
		$(".final").modal();
	}else if(!(empNm != "" && brthdy != "" && email != "" && encpnDe != "" && zipInput != "" && adres1 != "" && deptSelect != "null" && clsfSelect != "null")){
		$(".select").modal();
		return false;
	}else if(count == 0 || imgSrc.indexOf("/resources/images/logo/logo.png") >= 0){
		$(".check").modal();
		return false;
	}
}

// 직원 등록 최종 확인을 눌렀을 때
function finalCheck(check){
	if(check){
		document.getElementById('emp').submit();
	}
};
</script>
    
<script>
$("#content").on("click",function(){
	$("#empNm").val("강동원");
	$("#brthdy").val("1997-01-18");
	$("#email").val("iamdongwon@naver.com");
	$("#encpnDe").val("2022-01-03");
	$("#deptSelect").val("DST");
	$("#clsfSelect").val("C8");
	
})



$(window).on('load', function() {
    if (feather) {
        feather.replace({
            width: 14,
            height: 14
        });
    }
});
      
    //다음 우편번호 검색
function openHomeSearch(){
	new daum.Postcode({
		oncomplete:function(data){
		$('[name=zip]').val(data.zonecode);
		$('[name=adres1]').val(data.address);
		}
	}).open();
}
$("#empList").on("click", function(){
	location.href = "/hr/empList?currentPage=1";
});
      
</script>
</body>
<!-- END: Body-->

</html>