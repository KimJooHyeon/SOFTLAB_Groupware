<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html class="loading" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
<style>
#event-description-editor{
	height: 200px;
}
*{
	font-weight: bold;
}
#content:hover {
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
    <title>App calendar - Vuexy - Bootstrap HTML admin template</title>
    <link rel="apple-touch-icon" href="/resources/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="/resources/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,400;1,500;1,600" rel="stylesheet">

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/vendors/css/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendors/css/calendars/fullcalendar.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendors/css/forms/select/select2.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendors/css/pickers/flatpickr/flatpickr.min.css">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap-extended.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/colors.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/components.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/themes/dark-layout.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/themes/bordered-layout.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/themes/semi-dark-layout.min.css">

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/css/core/menu/menu-types/vertical-menu.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/plugins/forms/pickers/form-flat-pickr.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/pages/app-calendar.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/plugins/forms/form-validation.css">
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/assets/css/style.css">
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
            </div>
            <div class="content-body">
                <!-- Full calendar start -->
                <section>
                    <div class="app-calendar overflow-hidden border">
                        <div class="row no-gutters">
                            <!-- Sidebar -->
                            <div class="col app-calendar-sidebar flex-grow-0 overflow-hidden d-flex flex-column" id="app-calendar-sidebar">
                                <div class="sidebar-wrapper">
                                    <div class="card-body d-flex justify-content-center">
                                        <button class="btn btn-primary btn-toggle-sidebar btn-block" data-toggle="modal" data-target="#add-new-sidebar">
                                            <span class="align-middle"><i data-feather='plus'></i>회의실 예약</span>
                                        </button>
                                    </div>
                                    <div class="card-body pb-0">
                                    <div class="list-group list-group-labels">
                                      <c:forEach var="row" items="${mtgrUnitList}" varStatus="status">
							            <div class="list-group-item list-group-item-action d-flex align-items-center" style="border: 0;">
							              <span class="bullet bullet-sm bullet-primary me-1"></span>${row.MTGR_UNIT}호 [${row.MTGR_NM} / ${row.ACEPTNC_NMPR}명]
							            </div>
                                      </c:forEach>
							      </div>
                                    </div>
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
                    <div class="modal modal-slide-in event-sidebar fade" id="add-new-sidebar">
                        <div class="modal-dialog sidebar-lg">
                            <div class="modal-content p-0">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><i data-feather='calendar'></i></button>
                                <div class="modal-header mb-1">
                                    <h5 class="modal-title">Reservation</h5>
                                </div>
                                <div class="modal-body flex-grow-1 pb-sm-0 pb-3">
                                    <form method="post" class="form-validate event-form" id="schdulAddForm">
                                        <input type="hidden" id="countHidden">
                                        <div class="form-group">
                                            <label for="title" class="form-label">Title</label>
                                            <input class="form-control" id="title" name="schdulSj" placeholder="Title" required ="true"/>
                                        </div>
                                       <div class="form-group">
                                            <label for="select-label" class="form-label">회의실 목록</label>
                                            <select class="select2 select-label form-control w-100" id="select-label" name="mtgrUnit">
                                            	 <c:forEach var="row" items="${mtgrUnitList}" varStatus="status">
                                                	<option data-label="primary" value="${row.MTGR_UNIT}">${row.MTGR_UNIT}호 [${row.MTGR_NM} / ${row.ACEPTNC_NMPR}]</option>
                                            	</c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group position-relative">
                                            <label for="start-date" class="form-label">Start Date</label>
                                            <input type="text" class="form-control" name="bgnDe" id="start-date" placeholder="Start Date" required="required"/>
                                        </div>
                                        <div class="form-group position-relative">
                                            <label for="end-date" class="form-label">End Date</label>
                                            <input type="text" class="form-control" name="endDe" id="end-date" placeholder="End Date" required="required"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="event-description-editor" class="form-label">Memo</label>
                                            <textarea name="schdulCn" id="event-description-editor" class="form-control" placeholder="600자까지 입력 가능합니다.">${row.RSV_CN}</textarea>
                                        </div>
                                        <div class="form-group d-flex">
                                            <button type="submit" class="btn btn-primary add-event-btn mr-1" id="addBtn" >일정등록</button>
                                            <button type="button" class="btn btn-outline-secondary btn-cancel" data-dismiss="modal">등록취소</button>
                                            <button type="submit" class="btn btn-primary update-event-btn d-none mr-1" id="updateBtn">일정수정</button>
                                            <button class="btn btn-outline-danger btn-delete-event d-none">예약취소</button>
                                        </div>
                                            <div id="content" style="width: 375px; height: 39px;"></div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--/ Calendar Add/Update/Delete event modal-->
                    <!-- 일정 삭제 안내 modal -->
		                 <div class="modal fade text-left modal-primary delete" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel142" aria-hidden="true">
						    <div class="modal-dialog modal-dialog-centered" role="document">
						        <div class="modal-content">
						            <div class="modal-header" style="justify-content: center;">
						                <h5 class="modal-title" id="myModalLabel142" style="text-align: center; center;font-size: 13px;">회의실 예약 취소 안내</h5>
						                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						                    <span aria-hidden="true">&times;</span>
						                </button>
						            </div>
						            <div class="modal-body" style="text-align: center;font-size: 15px;">
						                직접 예약한 일정만 취소 가능합니다.
						            </div>
						        </div>
						    </div>
						</div>
					<!-- 일정 삭제 안내 modal 끝 -->
                    <!-- 일정 수정 안내 modal -->
		                 <div class="modal fade text-left modal-primary update" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel142" aria-hidden="true">
						    <div class="modal-dialog modal-dialog-centered" role="document">
						        <div class="modal-content">
						            <div class="modal-header" style="justify-content: center;">
						                <h5 class="modal-title" id="myModalLabel142" style="text-align: center; center;font-size: 13px;">회의실 예약 수정 안내</h5>
						                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						                    <span aria-hidden="true">&times;</span>
						                </button>
						            </div>
						            <div class="modal-body" style="text-align: center;font-size: 15px;">
						                직접 예약한 일정만 수정 가능합니다.
						            </div>
						        </div>
						    </div>
						</div>
					<!-- 일정 수정 안내 modal 끝 -->
					 <!-- 예약일정 중복 안내 modal -->
		                 <div class="modal fade text-left modal-primary insert" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
						    <div class="modal-dialog modal-dialog-centered" role="document">
						        <div class="modal-content">
						            <div class="modal-header" style="justify-content: center;">
						                <h5 class="modal-title" id="myModalLabel140" style="text-align: center; center;font-size: 13px;">회의실 예약 안내</h5>
						                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						                    <span aria-hidden="true">&times;</span>
						                </button>
						            </div>
						            <div class="modal-body" style="text-align: center;font-size: 15px;">
						                예약 완료된 회의실입니다.
						            </div>
						        </div>
						    </div>
						</div>
					<!-- 예약일정 중복 안내 modal 끝 -->
                </section>
                <!-- Full calendar end -->

            </div>
        </div>
    </div>
    <!-- END: Content-->

    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

    <!-- BEGIN: Vendor JS-->
    <script src="/resources/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="/resources/vendors/js/ui/jquery.sticky.js"></script>
    <script src="/resources/vendors/js/calendar/fullcalendar.min.js"></script>
    <script src="/resources/vendors/js/extensions/moment.min.js"></script>
    <script src="/resources/vendors/js/forms/select/select2.full.min.js"></script>
    <script src="/resources/vendors/js/forms/validation/jquery.validate.min.js"></script>
    <script src="/resources/vendors/js/pickers/flatpickr/flatpickr.min.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="/resources/js/core/app-menu.js"></script>
    <script src="/resources/js/core/app.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <script src="/resources/js/scripts/pages/app-user-edit.js"></script>
    <script src="/resources/js/scripts/pages/app-calendar2.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/x2js/1.2.0/xml2json.min.js"></script>
    <!-- END: Page JS-->

<script>

$(window).on('load', function() {
	if (feather) {
		feather.replace({
			width: 14,
			height: 14
		});
	}
// 	/*** 달력 선택값 제어 ***/   
// 	var basicPicker2 = $('.flatpickr-basic2');
// 	var basicPicker3 = $('.flatpickr-basic3');
// 	var flat3;
	
// 	// 오늘 이후 날짜 선택 
// 	if (basicPicker2.length) {
// 		basicPicker2.flatpickr({
// 			minDate: '',
// 			maxDate:'today',
// 			onChange:function(selectDates, dateStr, instance){
// 				flat3.set("minDate",dateStr);
// 			}
// 		});
// 	}
  
// 	// basicPickr2 이후 날짜 선택 
// 	if (basicPicker3.length) {
// 		flat3 = basicPicker3.flatpickr({
// 			minDate:'',
// 			maxDate:'today'
// 		});
// 	}
        
});

 var formData = new FormData($("#schdulAddForm")[0]);
     

 console.log(${MTGR_UNIT});
 $("#content").on("click", function() {
	console.log("click");
	$("#title").val("총무팀 회의");
	$("#select-label").val("402").prop("selected", true).trigger('change');
	$("#start-date").val("2022-01-24 14:00");
	$("#end-date").val("2022-01-24 15:30");
	$("#event-description-editor").val("총무팀 신입사원 채용 관련 회의");
})
</script>
</body>
<!-- END: Body-->

</html>