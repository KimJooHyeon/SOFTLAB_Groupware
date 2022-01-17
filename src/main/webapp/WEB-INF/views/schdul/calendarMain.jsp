<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html class="loading" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
<style>
#event-description-editor {
	height: 200px;
}

* {
	font-weight: bold;
}

.card-body {
	padding: 1rem;
}

#content:hover {
	background-color: #F6F6F6;
	cursor: pointer;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,user-scalable=0,minimal-ui">
<meta name="description"
	content="Vuexy admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
<meta name="keywords"
	content="admin template, Vuexy admin template, dashboard template, flat admin template, responsive admin template, web app">
<meta name="author" content="PIXINVENT">
<title>App calendar - Vuexy - Bootstrap HTML admin template</title>
<link rel="apple-touch-icon"
	href="/resources/images/ico/apple-icon-120.png">
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/images/ico/favicon.ico">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,400;1,500;1,600"
	rel="stylesheet">

<!-- BEGIN: Vendor CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendors/css/vendors.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/vendors/css/calendars/fullcalendar.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/vendors/css/forms/select/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/vendors/css/pickers/flatpickr/flatpickr.min.css">
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
	href="/resources/css/core/menu/menu-types/vertical-menu.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/plugins/forms/pickers/form-flat-pickr.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/pages/app-calendar.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/plugins/forms/form-validation.css">
<!-- END: Page CSS-->

<!-- BEGIN: Custom CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/assets/css/style.css">
<!-- END: Custom CSS-->
<script type="text/javascript">
	/**
	 * App Calendar Events
	 */

	'use strict';
</script>
</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body
	class="vertical-layout vertical-menu-modern  navbar-floating footer-static   menu-collapsed"
	data-open="click" data-menu="vertical-menu-modern" data-col="">

	<!-- BEGIN: Header-->
	<!-- END: Header-->


	<!-- BEGIN: Main Menu-->
	<!-- END: Main Menu-->

	<!-- BEGIN: Content-->
	<div class="app-content content ">
		<div class="content-overlay"></div>
		<div class="header-navbar-shadow"></div>
		<div class="content-wrapper container-xxl p-0">
			<div class="content-header row"></div>
			<div class="content-body">
				<!-- Full calendar start -->
				<section>
					<div class="app-calendar overflow-hidden border">
						<div class="row no-gutters">
							<!-- Sidebar -->
							<div
								class="col app-calendar-sidebar flex-grow-0 overflow-hidden d-flex flex-column"
								id="app-calendar-sidebar">
								<div class="sidebar-wrapper">
									<div class="card-body d-flex justify-content-center">
										<button class="btn btn-primary btn-toggle-sidebar btn-block"
											data-toggle="modal" data-target="#add-new-sidebar">
											<span class="align-middle"><i data-feather='plus'></i>일정
												추가</span>
										</button>
									</div>
									<div class="card-body pb-0">
										<h5 class="section-label mb-1">
											<span class="align-middle">Filter</span>
										</h5>
										<div class="custom-control custom-checkbox mb-1">
											<input type="checkbox"
												class="custom-control-input select-all" id="select-all"
												value="all" checked /> <label class="custom-control-label"
												for="select-all">View All</label>
										</div>
										<div class="calendar-events-filter">
											<div
												class="custom-control custom-control-danger custom-checkbox mb-1">
												<input type="checkbox"
													class="custom-control-input input-filter" id="personal"
													data-value="personal" name="view_check" value="private"
													checked /> <label class="custom-control-label"
													for="personal">Private</label>
											</div>
											<div
												class="custom-control custom-control-warning custom-checkbox mb-1">
												<input type="checkbox"
													class="custom-control-input input-filter" id="family"
													data-value="family" name="view_check" value="dept" checked />
												<label class="custom-control-label" for="family">Department</label>
											</div>
											<div
												class="custom-control custom-control-success custom-checkbox mb-1">
												<input type="checkbox"
													class="custom-control-input input-filter" id="holiday"
													data-value="holiday" name="view_check" value="softlab"
													checked /> <label class="custom-control-label"
													for="holiday">SoftLab</label>
											</div>
										</div>
									</div>
								</div>
								<div class="mt-auto">
									<img src="/resources/images/pages/calendar-illustration.png"
										alt="Calendar illustration" class="img-fluid" />
								</div>
							</div>
							<!-- /Sidebar -->

							<!-- Calendar -->
							<div class="col position-relative">
								<div class="card shadow-none border-0 mb-0 rounded-0">
									<div class="card-body pb-0">
										<div id="calendar"></div>
									</div>
								</div>
							</div>
							<!-- /Calendar -->
							<div class="body-content-overlay"></div>
						</div>
					</div>

					<!--                     Calendar Add/Update/Delete event modal -->
					<div class="modal modal-slide-in event-sidebar fade"
						id="add-new-sidebar">
						<div class="modal-dialog sidebar-lg">
							<div class="modal-content p-0">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<i data-feather='calendar'></i>
								</button>
								<div class="modal-header mb-1">
									<h5 class="modal-title">Schedule</h5>
								</div>
								<div class="modal-body flex-grow-1 pb-sm-0 pb-3">
									<form method="post" class="form-validate event-form"
										id="schdulAddForm">
										<input type="hidden" id="countHidden">
										<div class="form-group">
											<label for="title" class="form-label">Title</label> <input
												class="form-control" id="title" name="schdulSj"
												placeholder="Title" required="true" />
										</div>
										<div class="form-group">
											<label for="select-label" class="form-label">Label</label> <select
												class="select2 select-label form-control w-100"
												id="select-label" name="schdulSeCode">
												<option data-label="danger" value="S1" id="Personal">Private</option>
												<option data-label="warning" value="S2" id="Family">Department</option>
												<option data-label="success" value="S3" id="Holiday">SoftLab</option>
											</select>
										</div>
										<div class="form-group position-relative">
											<label for="start-date" class="form-label">Start Date</label>
											<input type="text" class="form-control birthdate-picker"
												name="bgnDe" id="start-date" placeholder="Start Date"
												required="required" />
										</div>
										<div class="form-group position-relative">
											<label for="end-date" class="form-label">End Date</label> <input
												type="text" class="form-control birthdate-picker"
												name="endDe" id="end-date" placeholder="End Date"
												required="required" />
										</div>
										<div class="form-group">
											<label for="event-description-editor" class="form-label">Memo</label>
											<textarea name="schdulCn" id="event-description-editor"
												class="form-control" placeholder="600자까지 입력 가능합니다."></textarea>
										</div>
										<div class="form-group d-flex">
											<button type="submit"
												class="btn btn-primary add-event-btn mr-1" id="addBtn">Add</button>
											<button type="button"
												class="btn btn-outline-secondary btn-cancel"
												data-dismiss="modal">Cancel</button>
											<button type="submit"
												class="btn btn-primary update-event-btn d-none mr-1">Update</button>
											<button
												class="btn btn-outline-danger btn-delete-event d-none">Delete</button>
										</div>
										<div id="content" style="width: 375px; height: 39px;"></div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!--/ Calendar Add/Update/Delete event modal-->
					<!-- 일정 삭제 안내 modal -->
					<div class="modal fade text-left modal-primary delete" id="primary"
						tabindex="-1" role="dialog" aria-labelledby="myModalLabel140"
						aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header" style="justify-content: center;">
									<h5 class="modal-title" id="myModalLabel140"
										style="text-align: center; center; font-size: 13px;">일정
										삭제 안내</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body"
									style="text-align: center; font-size: 15px;">직접 입력한 일정만
									삭제 가능합니다.</div>
							</div>
						</div>
					</div>
					<!-- 일정 삭제 안내 modal 끝 -->
				</section>
				<!-- Full calendar end -->

			</div>
		</div>
	</div>
	<!-- END: Content-->

	<div class="sidenav-overlay"></div>
	<div class="drag-target"></div>

	<!-- BEGIN: Footer-->
	<!-- END: Footer-->


	<!-- BEGIN: Vendor JS-->
	<script src="/resources/vendors/js/vendors.min.js"></script>
	<!-- BEGIN Vendor JS-->

	<!-- BEGIN: Page Vendor JS-->
	<script src="/resources/vendors/js/ui/jquery.sticky.js"></script>
	<script src="/resources/vendors/js/calendar/fullcalendar.min.js"></script>
	<script src="/resources/vendors/js/extensions/moment.min.js"></script>
	<script src="/resources/vendors/js/forms/select/select2.full.min.js"></script>
	<script
		src="/resources/vendors/js/forms/validation/jquery.validate.min.js"></script>
	<script src="/resources/vendors/js/pickers/flatpickr/flatpickr.min.js"></script>
	<!-- END: Page Vendor JS-->

	<!-- BEGIN: Theme JS-->
	<script src="/resources/js/core/app-menu.js"></script>
	<script src="/resources/js/core/app.js"></script>
	<!-- END: Theme JS-->

	<!-- BEGIN: Page JS-->
	<script src="/resources/js/scripts/pages/app-user-edit.js"></script>
	<script src="/resources/js/scripts/pages/app-calendar.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/x2js/1.2.0/xml2json.min.js"></script>
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
		$("#content").on("click", function() {
			console.log("click");
			$("#title").val("개발부 전체 회식");
			$("#select-label").val("S2").prop("selected", true).trigger('change');
			$("#event-description-editor").val("코로나 거리두기 정부지침에 따라 일정이 변경될 수 있습니다.");
		})
	</script>
</body>
<!-- END: Body-->

</html>