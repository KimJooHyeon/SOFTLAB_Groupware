<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*, java.text.*"%>
<%
	Date date = new Date();
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
	String strdate = simpleDate.format(date);
%>



<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,user-scalable=0,minimal-ui">
<meta name="description"
	content="Vuexy admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
<meta name="keywords"
	content="admin template, Vuexy admin template, dashboard template, flat admin template, responsive admin template, web app">
<meta name="author" content="PIXINVENT">
<title>나의근태관리</title>
<link rel="apple-touch-icon"
	href="/resources/images/ico/apple-icon-120.png">
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/images/ico/favicon.ico">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,400;1,500;1,600"
	rel="stylesheet">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- BEGIN: Vendor CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendors/css/vendors.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/vendors/css/pickers/pickadate/pickadate.css">
<link rel="stylesheet" type="text/css"
	href="/resources/vendors/css/pickers/flatpickr/flatpickr.min.css">
<!-- END: Vendor CSS-->

<!-- BEGIN: Theme CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/bootstrap-extended.css">
<link rel="stylesheet" type="text/css" href="/resources/css/colors.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/components.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/themes/dark-layout.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/themes/bordered-layout.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/themes/semi-dark-layout.css">

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/css/core/menu/menu-types/vertical-menu.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/plugins/forms/pickers/form-flat-pickr.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/plugins/forms/pickers/form-pickadate.css">
<link rel="stylesheet" type="text/css" href="/resources/css/tab.css">
<!-- END: Page CSS-->

<!-- BEGIN: Custom CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/assets/css/style.css">
<!-- END: Custom CSS-->

<style type="text/css">
#crtfSeCode {
	width: 280px;
	height: 2.714rem;
	font-size: 1rem;
}
#content:hover{
	background-color: #F6F6F6;
	cursor: pointer;
}
</style>

<script type="text/javascript">
		  var is_empty = false;
		  var is_save = false;
		  
		  function emptycheck() {
			  var form = $("#crtfForm").serialize();
				$('#crtfForm').find('input[type!="hidden"]').each(function(){
					console.log("!$(this).val() : ",!$(this).val());
 					if(!$(this).val()){
 						is_empty= true;
 					}
				});
				var crtfSeCode = document.getElementById('crtfSeCode').value;
				console.log("crtfSeCode : ", crtfSeCode);
				var reqstdocSj = document.getElementById('reqstdocSj').value;
				console.log("reqstdocSj : ", reqstdocSj);
				var crtfCn = document.getElementById('crtfCn').value;
				console.log("crtfCn : ", crtfCn);
				
				console.log("is_empty 초기값 : " + is_empty);
				if(is_empty){
					// alert("값을 전부 입력해주세요");
					if(crtfSeCode == "default" && reqstdocSj == "" && crtfCn == "") {
						$(".isEmpty").modal();
						console.log("is_empty(모두 다 공백일 경우) : " + is_empty);
					} else if(reqstdocSj == "" && crtfCn == "") {
						$(".isEmpty").modal();
						console.log("is_empty(제목, 내용 공백일 경우) : " + is_empty);
					} else if(crtfSeCode == "default" && reqstdocSj == "") {
						$(".isEmpty").modal();
						console.log("is_empty(증명서 코드, 제목 공백일 경우) : " + is_empty);
					} else if(crtfSeCode == "default" && crtfCn == "") {
						$(".isEmpty").modal();
						console.log("is_empty(증명서 코드, 내용 공백일 경우) : " + is_empty);
					} else if(crtfSeCode == "default") {
						$(".isEmpty").modal();
						console.log("is_empty(증명서 코드 공백일 경우) : " + is_empty);
					} else if(reqstdocSj == "") {
						$(".isEmpty").modal();
						console.log("is_empty(제목 공백일 경우) : " + is_empty);
					} else if(crtfCn == "") {
						$(".isEmpty").modal();
						console.log("is_empty(내용 공백일 경우) : " + is_empty);
					} else if(crtfSeCode != "default" && reqstdocSj != "" && crtfCn != "") {
						is_empty = false;
						console.log("is_empty(공백이 아닐경우) : " + is_empty);
						$.ajax({
							type: "POST",
							url: "insertCrtf",
							dataType: "text",
							contentType: "application/x-www-form-urlencoded; charset=UTF-8",
							data : form,
							success: function(successYn) {
								$(".crtfSuccess").modal();
								if(successYn=="신청 완료"){
									is_save = true;
								}
							}
						});
					}
					event.preventDefault();
				 }else{
					is_empty = false;
					event.preventDefault();
					$.ajax({
						type: "POST",
						url: "insertCrtf",
						dataType: "text",
						contentType: "application/x-www-form-urlencoded; charset=UTF-8",
						data : form,
						success: function(successYn) {
							// alert(successYn);
							$(".crtfSuccess").modal();
							if(successYn=="신청 완료"){
								is_save = true;
							}
						}
					});
				}
			}	
		  function replaceCrtfList() {
			  location.href = "/hr/crtfList?currentPage=1"; 
	     }
	 </script>



</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body
	class="vertical-layout vertical-menu-modern  navbar-floating footer-static  "
	data-open="click" data-menu="vertical-menu-modern" data-col="">


	<!-- BEGIN: Content-->
	<div class="app-content content ">
		<div class="content-overlay"></div>
		<div class="header-navbar-shadow"></div>
		<div class="content-wrapper container-xxl p-0">
			<div class="content-header row">
				<div class="content-header-left col-md-9 col-12 mb-2">
					<div class="row breadcrumbs-top" style="padding-left: 80px;">
						<div class="col-12" style="padding-bottom: 10px;">
							<h2 class="content-header-title float-left mb-0">인사관리</h2>
							<div class="breadcrumb-wrapper">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#"
										style="cursor: default;">증명서</a></li>
									<li class="breadcrumb-item active">증명서 신청</li>
								</ol>
							</div>
						</div>

						<section id="multiple-column-form">
							<div class="row">
								<div class="col-12" style="padding-bottom: 10px;">
									<div class="card">
										<div class="card-body" style="width: 1300px;">
											<form class="form-validate" id="crtfForm">
												<div class="row">
													<div class="col-md-3 col-12">
														<div class="form-group">
															<label for="first-name-column">신청번호</label> 
															<input type="text" id="elctrnSanctnSn" class="form-control"
																value="자동채번" name="elctrnSanctnSn" style="width: 280px;"
																readonly />
														</div>
													</div>
													<div class="col-md-3 col-12">
														<div class="form-group">
															<label for="last-name-column">신청일자</label> 
															<input type="text" id="reqstDe" class="form-control"
																value=<%=strdate%> name="reqstDe" style="width: 280px;"
																readonly />
														</div>
													</div>
													<div class="col-md-3 col-12">
														<label class="form-label" for="select2-disabled-result">증명서 분류</label> 
														<select class="form-control form-control-lg"
															id="crtfSeCode" name="crtfSeCode">
															<option value="default" selected>선택하세요</option>
															<option value="C1">재직증명서</option>
															<option value="C2">경력증명서</option>
														</select>
													</div>
													<div class="col-md-3 col-12"></div>
													<div class="col-md-3 col-12">
														<div class="form-group">
															<label for="country-floating">부서</label> 
															<input type="text" id="deptNm" class="form-control"
																name="deptNm" value="${empVO.deptNm}"
																style="width: 280px;" readonly />
														</div>
													</div>
													<div class="col-md-3 col-12">
														<div class="form-group">
															<label for="country-floating">직급</label> 
															<input type="text" id="clsf" class="form-control" name="clsf"
																value="${empVO.clsf}" style="width: 280px;" readonly />
														</div>
													</div>
													<div class="col-md-3 col-12">
														<div class="form-group">
															<label for="city-column">사원번호</label> 
															<input type="hidden" id="empNo" name="empNo"
																value="${empVO.empNo}"> <input type="text"
																id="empNm" class="form-control" value="${empVO.empNo}"
																name="empNm" style="width: 280px;" readonly />
														</div>
													</div>
													<div class="col-md-3 col-12">
														<div class="form-group">
															<label for="city-column">사원명</label> 
															<input type="hidden" id="empNo" name="empNo" value="${empVO.empNo}">
															<input type="text" id="empNm" class="form-control" value="${empVO.empNm}" 
															name="empNm" style="width: 280px;" readonly />
														</div>
													</div>
													<div class="col-md-12 col-12">
														<div class="form-group">
															<label for="email-id-column">제목</label> 
															<input type="text" id="reqstdocSj" class="form-control"
																name="reqstdocSj" placeholder="제목을 입력하세요"
																style="width: 1242px;" required="required" />
														</div>
													</div>
													<div class="col-md-6 col-12">
														<div class="form-group">
															<label for="email-id-column">신청내용</label>
															<textarea id="crtfCn" class="form-control" name="crtfCn"
																placeholder="" style="width: 1242px; height: 300px;" required="required"></textarea>
														</div>
													</div>
													<div class="col-12" style="display: flex;justify-content: space-between;">
														<div></div>
														<div id="content" style="width: 700px; height: 39px; text-align: center;"></div>
														<div>
															<button type="submit" class="btn btn-primary mr-1"
																style="float: right; margin-left: 10px;"
																onclick=emptycheck()>신청</button>
															<button type="reset" class="btn btn-outline-secondary"
																style="float: right;">초기화</button>
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</section>
						<!-- 증명서 신청완료 창 modal -->
						<div class="modal fade text-left modal-primary crtfSuccess"
							id="primary" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel142" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header" style="justify-content: center;">
										<h5 class="modal-title" id="myModalLabel142"
											style="text-align: center; center; font-size: 13px;">증명서 승인 안내</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body"
										style="text-align: center; font-size: 15px;">신청 되었습니다.</div>
									<div class="modal-footer" style="justify-content: center;">
										<button type="button" class="btn btn-primary crtfOk"
											data-dismiss="modal" onclick="replaceCrtfList()">확인</button>
									</div>
								</div>
							</div>
						</div>
						<!-- 증명서 신청완료 창 modal 끝 -->
						<!-- 증명서 값 전부 입력 modal -->
						<div class="modal fade text-left modal-primary isEmpty"
							id="primary" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel142" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header" style="justify-content: center;">
										<h5 class="modal-title" id="myModalLabel142"
											style="text-align: center; center; font-size: 13px;">증명서 승인 안내</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body"
										style="text-align: center; font-size: 15px;">필수항목을 입력해주세요.</div>
									<div class="modal-footer" style="justify-content: center;">
										<button type="button" class="btn btn-primary crtfOk"
											data-dismiss="modal">확인</button>
									</div>
								</div>
							</div>
						</div>
						<!-- 증명서 값 전부 입력 창 modal 끝 -->
					</div>
				</div>
			</div>
		</div>
	</div>






	<!-- BEGIN: Vendor JS-->
	<script src="/resources/vendors/js/vendors.min.js"></script>
	<!-- BEGIN Vendor JS-->

	<!-- BEGIN: Page Vendor JS-->
	<script src="/resources/vendors/js/pickers/pickadate/picker.js"></script>
	<script src="/resources/vendors/js/pickers/pickadate/picker.date.js"></script>
	<script src="/resources/vendors/js/pickers/pickadate/picker.time.js"></script>
	<script src="/resources/vendors/js/pickers/pickadate/legacy.js"></script>
	<script src="/resources/vendors/js/pickers/flatpickr/flatpickr.min.js"></script>
	<script src="/resources/vendors/js/forms/validation/jquery.validate.min.js"></script>
	<!-- END: Page Vendor JS-->

	<!-- BEGIN: Theme JS-->
	<script src="/resources/js/core/app-menu.js"></script>
	<script src="/resources/js/core/app.js"></script>
	<!-- END: Theme JS-->

	<!-- BEGIN: Page JS-->
	<script src="/resources/js/scripts/forms/pickers/form-pickers.js"></script>
	<!-- END: Page JS-->

	<script>
        $(window).on('load', function() {
            if (feather) {
                feather.replace({
                    width: 14,
                    height: 14
                });
            }
            
        });
        $("#content").on("click",function(){
        	$("#crtfSeCode").val("C1");
        	$("#reqstdocSj").val("${empVO.deptNm} ${empVO.empNm} 재직증명서 신청서");
        	$("#crtfCn").val("금융기관 제출용");
        	
        }) 
    </script>

</body>
<!-- END: Body-->


