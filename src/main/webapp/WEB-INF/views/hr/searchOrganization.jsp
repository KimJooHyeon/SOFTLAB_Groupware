<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->

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
<title>Dashboard ecommerce - Vuexy - Bootstrap HTML admin
	template</title>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap')
	;

.mb-50 {
	margin-top: 0.5rem;
}

.time {
	color: #7367F0;
}

.widget:hover {
	opacity: .7;
}
</style>
<link rel="apple-touch-icon"
	href="/resources/images/ico/apple-icon-120.png">
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/images/ico/favicon.ico">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,400;1,500;1,600"
	rel="stylesheet">
<!--     <link rel="preconnect" href="https://fonts.googleapis.com"> -->
<!-- 	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> -->
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap"
	rel="stylesheet">

<!-- BEGIN: Vendor CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendors/css/vendors.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/vendors/css/charts/apexcharts.css">
<link rel="stylesheet" type="text/css"
	href="/resources/vendors/css/extensions/toastr.min.css">
<!-- END: Vendor CSS-->

<!-- BEGIN: Theme CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/bootstrap-extended.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/colors.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/components.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/themes/dark-layout.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/themes/bordered-layout.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/themes/semi-dark-layout.min.css">

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/css/core/menu/menu-types/vertical-menu.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/pages/dashboard-ecommerce.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/plugins/charts/chart-apex.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/plugins/extensions/ext-component-toastr.min.css">
<!-- END: Page CSS-->

<!-- BEGIN: Custom CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/custom/style.css">
<!-- END: Custom CSS-->

<!-- jQuery EasyUi API -->
<link rel="stylesheet" type="text/css"
	href="/resources/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/easyui/themes/icon.css" />
</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body
	class="pace-done vertical-layout footer-static menu-hide vertical-overlay-menu navbar-sticky  "
	data-open="click" data-menu="vertical-menu-modern" data-col="">

	<!-- BEGIN: Header-->
	<!-- END: Header-->

	<!-- BEGIN: Main Menu-->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js"></script>

	<script type="text/javascript"
		src="/resources/easyui/jquery.easyui.min.js"></script>

	<script>
		$(function() {
			$('.tree-title').on(
					'click',
					function() {
						var empNo = $(this).children('.empNo').val();
						$.ajax({
							type : 'get',
							url : "/hr/detailOrganizationAjax",
							data : "empNo=" + empNo /*JSON.stringify(param)*/,
							dataType : 'json',
							success : function(empData) {
								//						alert(empNo);
								$("#pictureViewImg").attr(
										"src",
										"/resources/images/emp/" + empNo
												+ ".jpg");
								console.log("empData : " + "src",
										"/resources/images/emp/" + empNo
												+ ".jpg");
								$("#empNo").text(empData.detailUser.empNo);
								$(".empNm").text(empData.detailUser.empNm);
								$("#deptNm").text(empData.detailUser.deptNm);
								$(".clsfCode").text(empData.detailUser.clsfCode);
								$("#email").text(empData.detailUser.email);
								$("#lxtnNo").text(empData.detailUser.lxtnNo);

								if(empData.selectWorkStleCode == 'W1') {
									$("#detail-st").html('<span class="badge bg-light-primary">출근</span>');
								} else if(empData.selectWorkStleCode == 'W2') {
									$("#detail-st").html('<span class="badge bg-light-secondary">결근</span>');
								} else if(empData.selectWorkStleCode == 'W4') {
									$("#detail-st").html('<span class="badge bg-light-warning">휴가</span>');
								} else if(empData.selectWorkStleCode == 'W6') {
									$("#detail-st").html('<span class="badge bg-light-info">출장</span>');
								} else if(empData.selectWorkStleCode == 'W7') {
									$("#detail-st").html('<span class="badge bg-light-danger">휴일</span>');
								} else if(empData.selectWorkStleCode == '' || empData.selectWorkStleCode == null) {
									$("#detail-st").html('<span class="badge bg-light-success">오프라인</span>');
								}
							}
						});
					});

			$("#searchBtn").on("click", function() {
				/* var type = $("#searchType").val();
				console.log(type);
				var pageSize = $("#perPageNum").val();
				console.log(pageSize); */
				var keyword = $("#keyword").val();
				console.log(keyword);
				/* var empNo = $("#empNo").val();
				console.log(emp_no); */
				// location.href="/hr/searchOrganization?keyword=" + keyword;
			});
		});
		/* $("#rightMenu").load("/hr/detailOrganizationAjax", {empNo}); */
	</script>

	<!-- BEGIN: Main Menu-->
	<!-- END: Main Menu-->

	<!-- BEGIN: Content-->
	<div class="app-content content"
		style="display: flex; justify-content: center;">
		<div class="content-overlay"></div>
		<div class="header-navbar-shadow"></div>
		<div class="content-wrapper container-xxl p-0" style="margin-left: 28vh; margin-top: 4vh;">
			<div class="content-header row" style="padding: 5px;">
				 <div class="col-12" style="padding-bottom: 10px;">
                            <h2 class="content-header-title float-left mb-0" style="cursor: default;">인사관리</h2>
                            <div class="breadcrumb-wrapper">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#" style="cursor: default;">조직도</a>
                                    </li>
                                    <li class="breadcrumb-item active" style="cursor: default;">직원정보
                                    </li>
                                </ol>
                            </div>
                        </div>
			</div>
			<div class="content-detached content-center">
				<div class="content-body" style="width: 110vh;">
					<div class="card" style="padding-bottom: 30px;">
						<div class="card-header" style="display: flex;flex-direction: row-reverse;">
							<h4 class="card-title" style="padding-top: 3px;padding-right: 5px;">
							<!-- Dashboard Ecommerce Starts -->
								<form action="/hr/empSearch">
									<span style="display: flex;">
										<input type="text" name="keyword" id="keyword" placeholder="직원 이름으로 검색" class="form-control" />
										<button type="submit" class="btn btn-icon btn-outline-primary waves-effect" id="searchBtn" name="searchBtn">
		                                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
		                                </button>
									</span>
								</form>
							</h4>
						</div>
						<div class="card-body" style="width: 210vh; height: 500px;">
							<div class="row match-height">
								<div class="col-md-3 col-12">
									<div class="row match-height"
										style="width: 330px; margin-left: 34px; margin-right: 0px; overflow: scroll; height: 450px; overflow-x: hidden;">
										<div class="widget-container" style="width: 0px;">
											<div class="widget-line">
												<div style="width: 0px;">
													<div style="margin-right: 5px;">
														<ul class="easyui-tree" type="square">
															<li><span>SoftLab</span>
														<ul>
															<c:forEach items="${deptList}" var="deptList">
																<!-- 부서명 -->
																<c:if test="${deptList.lvl<2}">
																	<li data-options="state:'opend'"><span>${deptList.deptNm}</span>
																</c:if>
																	<c:if test="${deptList.lvl>1}">
																		<ul>
																			<li data-options="state:'opend'"><span>${deptList.deptNm}</span>
																	</c:if>
																<ul>
																	<c:forEach items="${empSearch}" var="empSearch">
																		<!-- 부서 직원 목록 -->
																		<c:if
																			test="${deptList.deptCode eq empSearch.deptCode}">
																			<li>[${deptList.deptNm}&nbsp;&nbsp; /
																				&nbsp;&nbsp;${empSearch.clsfCode}]
																				&nbsp;&nbsp;${empSearch.empNm}
																				<input type="hidden"
																				class="empNo" value="${empSearch.empNo}">
																			</li>
																		</c:if>
																	</c:forEach>
																	<c:if test="${deptList.lvl>1}">
																		</ul>
																	</c:if>
																</ul>
															</c:forEach>
														</ul>
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="rightMenu" style="display: flex; padding-top: 5%;">
								<form class="form-signin" id="form">
									<form role="form" class="form-horizontal" id="frm">
										<input type="hidden" name="empNo" value="${empDetail.empNo}" />
								    </form>
									<div class="user-avatar-section" style="padding-right: 50px;">
										<div class="d-flex align-items-center flex-column">
											<img class="img-fluid rounded mt-3 mb-2" id="pictureViewImg"
												src="/resources/images/logo/logo.jpg"
												style="object-fit: cover; height: 130px; width: 130px; border: 1px solid #dadada;" alt="User avatar">
											<div class="user-info text-center">
												<c:choose>
													<c:when test="${empDetail.empNm == null || empDetail.empNm == ''}">
														<h4 class="empNm"> 이름 </h4>
													</c:when>
													<c:otherwise>
														<h4 class="empNm">${empDetail.empNm}</h4>
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${empDetail.clsfCode == null || empDetail.clsfCode == ''}">
														<span class="badge bg-light-secondary clsfCode"> 직급 </span>
													</c:when>
													<c:otherwise>
														<span class="badge bg-light-secondary clsfCode">${empDetail.clsfCode}</span>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>
	
									<div>
										<h4 class="fw-bolder border-bottom pb-50 mb-1"
											style="padding-top: 30px;">상세정보</h4>
										<div class="info-container">
											<ul class="list-unstyled">
												<li class="mb-75" style="display: flex; gap: 10px; flex-direction: row;"><span class="fw-bolder me-25" style="color: #99999e;">이름 :</span>
													<c:choose>
														<c:when test="${empDetail.empNm == null || empDetail.empNm == ''}">
															<span class="empNm"> - </span>
														</c:when>
														<c:otherwise>
															<span class="empNm">${empDetail.empNm}</span>
														</c:otherwise>
													</c:choose>
												</li>
												<li class="mb-75" style="display: flex; gap: 10px; flex-direction: row;"><span class="fw-bolder me-25" style="color: #99999e;">부서 :</span>
													<c:choose>
														<c:when test="${empDetail.deptNm == null || empDetail.deptNm == ''}">
															<span id="deptNm"> - </span>
														</c:when>
														<c:otherwise>
															<span id="deptNm">${empDetail.deptNm}</span>
														</c:otherwise>
													</c:choose>
												</li>
												<li class="mb-75" style="display: flex; gap: 10px; flex-direction: row;"><span class="fw-bolder me-25" style="color: #99999e;">직급 :</span>
													<c:choose>
														<c:when test="${empDetail.clsfCode == null || empDetail.clsfCode == ''}">
															<span class="clsfCode">-</span>
														</c:when>
														<c:otherwise>
															<span class="clsfCode">${empDetail.clsfCode}</span>
														</c:otherwise>
													</c:choose>
												</li>
												<li class="mb-75" style="display: flex; gap: 10px; flex-direction: row;"><span class="fw-bolder me-25" style="color: #99999e;">내선번호 :</span>
													<c:choose>
														<c:when test="${empDetail.lxtnNo == null || empDetail.lxtnNo == ''}">
															<span id="lxtnNo"> - </span>
														</c:when>
														<c:otherwise>
															<span id="lxtnNo">${empDetail.lxtnNo}</span>
														</c:otherwise>
													</c:choose>
												</li>
												<li class="mb-75" style="display: flex; gap: 10px; flex-direction: row;"><span class="fw-bolder me-25" style="color: #99999e;">이메일 :</span>
													<c:choose>
														<c:when test="${empDetail.email == null || empDetail.email == ''}">
															<span id="email"> - </span>
														</c:when>
														<c:otherwise>
															<span id="email">${empDetail.email}</span>
														</c:otherwise>
													</c:choose>
												</li>
												<li class="mb-75" style="display: flex; gap: 10px; flex-direction: row;"><span class="fw-bolder me-25" style="color: #99999e;">상태 :</span>
													<span id="detail-st" class="badge detail-state" style="padding: 2px; font-size: .9rem;"> - </span>
												</li>
											</ul>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<!-- Dashboard Ecommerce ends -->
				</div>
			</div>
		</div>
	</div>
	<!-- END: Content-->

	<!-- BEGIN: Customizer-->
	<!-- End: Customizer-->

	<!-- Buynow Button-->

	<div class="sidenav-overlay"></div>
	<div class="drag-target"></div>

	<!-- BEGIN: Vendor JS-->
	<script src="/resources/vendors/js/vendors.min.js"></script>
	<!-- BEGIN Vendor JS-->

	<!-- BEGIN: Page Vendor JS-->
	<script src="/resources/vendors/js/charts/apexcharts.min.js"></script>
	<script src="/resources/vendors/js/extensions/toastr.min.js"></script>
	<!-- END: Page Vendor JS-->

	<!-- BEGIN: Theme JS-->
	<script src="/resources/js/core/app-menu.min.js"></script>
	<script src="/resources/js/core/app.min.js"></script>
	<script src="/resources/js/scripts/customizer.min.js"></script>
	<!-- END: Theme JS-->

	<!-- BEGIN: Page JS-->
	<script src="/resources/js/scripts/pages/dashboard-ecommerce.min.js"></script>
	<!-- END: Page JS-->

	<script>
		$(window).on('load', function() {
			if (feather) {
				feather.replace({
					width : 14,
					height : 14
				});
			}
		})
	</script>
</body>
<!-- END: Body-->

</html>