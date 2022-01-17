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
		           <h2 class="content-header-title float-left mb-0">재직자 직원상세정보</h2><i style="height: 2rem; width: 3rem;" data-feather='settings'></i>
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
							<form:form modelAttribute="emp" method="post"  enctype ="multipart/form-data" action="/hr/empEditProcess" class="form-validate" id="emp">
                                    <!-- users edit media object start -->
                                    <div class="media mb-2">
                                        <img src="/resources/images/emp/${emp.photoFlpth}" alt="users avatar" id="userImg" class="user-avatar users-avatar-shadow rounded mr-2 my-25 cursor-pointer" height="95" width="90" />
                                        <div class="media-body mt-50">
                                            <div class="col-12 d-flex mt-1 px-0">
                                                <label class="btn btn-primary mr-75 mb-0" for="change-picture">
                                                    <span class="d-n one d-sm-block">UPLOAD</span>
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
                                                    <form:input path="empNo" type="text" id="empNo" class="form-control" placeholder="직원번호" value="${emp.empNo}" readonly="true"/>
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
                                                        <form:option value="CEO" label="대표"/>
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
                                                        <form:option value="C1" label="대표" />
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
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-map-pin font-medium-4 mr-25"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
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
                                            <div class="col-12 d-flex flex-sm-row flex-column mt-2" style="display: flex; justify-content: space-between;">
                                                <button type="button" id="empList" class="create-new btn btn-primary">목록</button>
                                                <div>
	                                                <input type="submit" id="update" value="수정" class="create-new btn btn-primary" onclick="javascript:empSubmit();"/>
	                                                <input type="button" value="퇴사" class="btn btn-outline-primary waves-effect" onclick="javascript:retireEmp();">
                                                </div>
                                            </div>
                                        </div>
                                        
                  <div class="modal fade text-left modal-primary retire" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-centered" role="document">
				        <div class="modal-content">
				            <div class="modal-header" style="justify-content: center;">
				                <h5 class="modal-title" id="myModalLabel140" style="text-align: center; center;font-size: 13px;">퇴직 최종 안내</h5>
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                    <span aria-hidden="true">&times;</span>
				                </button>
				            </div>
				            	
				            <div class="modal-body" style="text-align: center;font-size: 15px;">
				            		<div class="form-group">
                                       <form:label path="retireDe">퇴직일자(현재 날짜와 과거 날짜만 입력 가능합니다.)</form:label>
                                       <form:input path="retireDe" type="text" id="retireDe" class="form-control birthdate-picker" placeholder="YYYY-MM-DD" style="text-align: center;"/>
                                   </div>
				                확인을 누르시면 해당 직원은 퇴직 처리 됩니다.
				            </div>
				            <div class="modal-footer" style="justify-content: center;">
				                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="javascript:finalRetireCheck(true);">YES</button>
				                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="javascript:finalRetireCheck(false);">NO</button>
				            </div>
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
				                5MB 크기의 이미지만 업로드 가능합니다.
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
				                수정하시겠습니까?
				            </div>
				            <div class="modal-footer" style="justify-content: center;">
				                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="javascript:finalCheck(true);">yEs</button>
				                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="javascript:finalCheck(false);">nO</button>
				            </div>
				        </div>
				    </div>
				</div>
				
				<div class="modal fade text-left modal-primary retireDate" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-centered" role="document">
				        <div class="modal-content">
				            <div class="modal-header" style="justify-content: center;">
				                <h5 class="modal-title" id="myModalLabel140" style="text-align: center; center;font-size: 13px;">퇴사일자 안내</h5>
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                    <span aria-hidden="true">&times;</span>
				                </button>
				            </div>
				            <div class="modal-body" style="text-align: center;font-size: 15px;">
				                현재날짜와 과거날짜만 입력 가능합니다.
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
$(window).on('load', function() {
    if (feather) {
        feather.replace({
            width: 14,
            height: 14
        });
    }
    fileCheckReadonly();
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
    
//-----------------------------------------------------------------------
      


var count = 0;
var imgSrc = document.getElementById("userImg").src;
var empNo = document.getElementById('empNo').value;
var file = document.getElementById('change-picture').value;
var url = 'resources/images/emp/' + empNo;

// 사진 수정이 없을 경우 파일 체크 버튼을 아예 비활성화 시킴
function fileCheckReadonly(){
	console.log(imgSrc)
	if((imgSrc.indexOf(url)) >= 0){
		$("#fileCheck").attr('disabled', true);
		count = 1;
	}
}
// 사진을 새로 등록했을 때 파일 체크 버튼 다시 활성화
$("#change-picture").change(function(e){
	$("#fileCheck").attr('disabled', false);
	count = 0;
})

// 파일 확장자와 크기 제한 체크 함수
function checkExtension(fileName, fileSize){
	var regex = new RegExp("(.*?\.(jpg)$)");
	var maxSize = 5242880; // 5mb(5242880)	
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
	imgSrc = "/resources/images/emp/"+empNo+".jpg";
	return false;
}


$("#fileCheck").on("click", function(){
	imgSrc = document.getElementById("userImg").src
	  
	console.log(imgSrc.indexOf(url));
	count = 1;
	if(imgSrc.indexOf(url) == -1){
		var inputFile = $("#change-picture");
		var files = inputFile[0].files;
 	  
		console.log("imgSrc : " + imgSrc);
 	  
		if(!checkExtension(files[0].name, files[0].size)){	// 문제발생 시
			// 프로그램 종료
			return false;
 		}
	}
});
      



function empSubmit(){
console.log("***********", count);
	var empNm = document.getElementById('empNm').value;
	var brthdy = document.getElementById('brthdy').value;
	var email = document.getElementById('email').value;
	var encpnDe = document.getElementById('encpnDe').value;
	var zipInput = document.getElementById('zipInput').value;
	var adres1 = document.getElementById('adres1').value;
	var deptSelect = document.getElementById('deptSelect').value;
	var clsfSelect = document.getElementById('clsfSelect').value;
	
	if(empNm != "" && brthdy != "" && email != "" && encpnDe != "" && zipInput != "" && adres1 != "" && deptSelect != "null" && clsfSelect != "null" && count > 0){
		$(".final").modal();
	}
	if(!(empNm != "" && brthdy != "" && email != "" && encpnDe != "" && zipInput != "" && adres1 != "" && deptSelect != "null" && clsfSelect != "null")){
		$(".select").modal();
		return false;
	}
	if(count == 0){
		$(".check").modal();
		return false;
	}
}


function retireEmp(){
	$(".retire").modal();
}
function finalRetireCheck(check){
	var today = new Date();  
	var retireDe = document.getElementById('retireDe')
	var retireDeValue = retireDe.value;
	var retireDate = new Date(retireDeValue);
	var year = today.getFullYear(); // 년도
	var month = today.getMonth() + 1;  // 월
	var date = today.getDate();  // 날짜
	var day = today.getDay();  // 요일
	
	if(check && today>=retireDate){
		console.log("today : " + today + "/ retireDe : " + retireDate);
		document.getElementById('emp').submit();
	}else if(today<retireDate){
		$(".retireDate").modal();
		retireDe.value = null;
		return false;
	}
};	


function finalCheck(check){
	if(check){
		document.getElementById('emp').submit();
	}
};

$(function(){
	 $("#empList").on("click", function(){
		 location.href = "/hr/empList?currentPage=1";
	 });
});       
      
    </script>
</body>
<!-- END: Body-->

</html>