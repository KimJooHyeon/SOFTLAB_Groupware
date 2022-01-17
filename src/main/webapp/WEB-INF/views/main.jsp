<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="app-content content " style="padding: calc(8.5rem) 2rem 0;">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row"></div>
		<div class="content-body">
			<section id="dashboard-ecommerce">
				<div class="row match-height">
					<div class="col-lg-4 col-12" style="flex-flow: row;">
						<div class="row match-height"
							style="margin-right: 0; margin-left: 1.4rem;">
							<div class="widget-container" style="width: 920px;">
								<div class="widget-line">
									<div style="display: flex; width: 1050px; padding-top: 30px;">
										<div class="card card-tiny-line-stats widget"
											style="margin: 2rem;">
											<a href="/password" class="card-body pb-50"
												style="padding-bottom: 1.5rem !important; text-align: center; width: 150px; height: 159px;">
												<h6 style="line-height: 42px; font-size: 1.2rem;">마이페이지</h6>
												<img alt="마이페이지" src="../resources/images/main/마이페이지.png">
												<div>
													<div id="apexcharts9e09xu84"
														class="apexcharts-canvas apexcharts9e09xu84 apexcharts-theme-light"
														style="width: 220px;"></div>
												</div>
											</a>
										</div>
										<div class="card card-tiny-line-stats widget"
											style="margin: 2rem;">
											<a href="/dclz/dclzList?currentPage=1" class="card-body pb-50"
												style="padding-bottom: 1.5rem !important; text-align: center; width: 150px; height: 159px;">
												<h6 style="line-height: 42px; font-size: 1.2rem;">근태관리</h6>
												<img alt="근태관리" src="../resources/images/main/근태관리.png">
												<div>
													<div id="apexcharts9e09xu84"
														class="apexcharts-canvas apexcharts9e09xu84 apexcharts-theme-light"
														style="width: 220px;"></div>
												</div>
											</a>
										</div>
										<div class="card card-tiny-line-stats widget"
											style="margin: 2rem;">
											<a href="/dclz/vcatnForm" class="card-body pb-50"
												style="padding-bottom: 1.5rem !important; text-align: center; width: 150px; height: 159px;">
												<h6 style="line-height: 42px; font-size: 1.2rem;">휴가신청</h6>
												<img alt="휴가신청" src="../resources/images/main/휴가신청.png">
												<div>
													<div id="apexcharts9e09xu84"
														class="apexcharts-canvas apexcharts9e09xu84 apexcharts-theme-light"
														style="width: 220px;"></div>
												</div>
											</a>
										</div>
										<div class="card card-tiny-line-stats widget"
											style="margin: 2rem;">
											<a href="/dclz/bsrpForm" class="card-body pb-50"
												style="padding-bottom: 1.5rem !important; text-align: center; width: 150px; height: 159px;">
												<h6 style="line-height: 42px; font-size: 1.2rem;">출장신청</h6>
												<img alt="출장신청" src="../resources/images/main/출장신청.png">
												<div>
													<div id="apexcharts9e09xu84"
														class="apexcharts-canvas apexcharts9e09xu84 apexcharts-theme-light"
														style="width: 220px;"></div>
												</div>
											</a>
										</div>
									</div>
									<div style="display: flex; width: 1050px;">
										<div class="card card-tiny-line-stats widget"
											style="margin: 2rem;">
											<a href="/hr/crtfForm" class="card-body pb-50"
												style="padding-bottom: 1.5rem !important; text-align: center; width: 150px; height: 159px;">
												<h6 style="line-height: 42px; font-size: 1.2rem;">증명서신청</h6>
												<img alt="증명서신청" src="../resources/images/main/증명서신청.png">
												<div>
													<div id="apexcharts9e09xu84"
														class="apexcharts-canvas apexcharts9e09xu84 apexcharts-theme-light"
														style="width: 220px;"></div>
												</div>
											</a>
										</div>
										<div class="card card-tiny-line-stats widget"
											style="margin: 2rem;">
											<a href="/hr/organization" class="card-body pb-50"
												style="padding-bottom: 1.5rem !important; text-align: center; width: 150px; height: 159px;">
												<h6 style="line-height: 42px; font-size: 1.2rem;">조직도</h6> <img
												alt="조직도" src="../resources/images/main/조직도.png">
												<div>
													<div id="apexcharts9e09xu84"
														class="apexcharts-canvas apexcharts9e09xu84 apexcharts-theme-light"
														style="width: 220px;"></div>
												</div>
											</a>
										</div>
										<div class="card card-tiny-line-stats widget"
											style="margin: 2rem;">
											<a href="/sanction/sanctnList?empNo=${sanctnCountMap.empNo}&tab=wait&btnCode=bc4" class="card-body pb-50"
												style="padding-bottom: 1.5rem !important; text-align: center; width: 150px; height: 159px;">
												<h6 style="line-height: 42px; font-size: 1.2rem;">전자결재</h6>
												<img alt="전자결재" src="../resources/images/main/전자결재.png">
												<div>
													<div id="apexcharts9e09xu84"
														class="apexcharts-canvas apexcharts9e09xu84 apexcharts-theme-light"
														style="width: 220px;"></div>
												</div>
											</a>
										</div>
										<div class="card card-tiny-line-stats widget"
											style="margin: 2rem;">
											<a href="/sanction/elctrnSanctnDrftFormList" class="card-body pb-50"
												style="padding-bottom: 1.5rem !important; text-align: center; width: 150px; height: 159px;">
												<h6 style="line-height: 42px; font-size: 1.2rem;">기안문작성</h6>
												<img alt="기안문작성" src="../resources/images/main/기안문작성.png">
												<div>
													<div id="apexcharts9e09xu84"
														class="apexcharts-canvas apexcharts9e09xu84 apexcharts-theme-light"
														style="width: 220px;"></div>
												</div>
											</a>
										</div>
									</div>
									<div style="display: flex; width: 1050px;">
										<div class="card card-tiny-line-stats widget"
											style="margin: 2rem;">
											<a href="/bbs/noticeList?currentPage=1" class="card-body pb-50"
												style="padding-bottom: 1.5rem !important; text-align: center; width: 150px; height: 159px;">
												<h6 style="line-height: 42px; font-size: 1.2rem;">공지사항</h6>
												<img alt="공지사항" src="../resources/images/main/공지사항.png">
												<div>
													<div id="apexcharts9e09xu84"
														class="apexcharts-canvas apexcharts9e09xu84 apexcharts-theme-light"
														style="width: 220px;"></div>
												</div>
											</a>
										</div>
										<div class="card card-tiny-line-stats widget"
											style="margin: 2rem;">
											<a href="/bbs/libraryList?currentPage=1" class="card-body pb-50"
												style="padding-bottom: 1.5rem !important; text-align: center; width: 150px; height: 159px;">
												<h6 style="line-height: 42px; font-size: 1.2rem;">자료실</h6> <img
												alt="자료실" src="../resources/images/main/자료실.png">
												<div>
													<div id="apexcharts9e09xu84"
														class="apexcharts-canvas apexcharts9e09xu84 apexcharts-theme-light"
														style="width: 220px;"></div>
												</div>
											</a>
										</div>
										<div class="card card-tiny-line-stats widget"
											style="margin: 2rem;">
											<a href="/mtgr/mtgrSchdulList" class="card-body pb-50"
												style="padding-bottom: 1.5rem !important; text-align: center; width: 150px; height: 159px;">
												<h6 style="line-height: 42px; font-size: 1.2rem;">예약</h6> <img
												alt="예약" src="../resources/images/main/예약.png">
												<div>
													<div id="apexcharts9e09xu84"
														class="apexcharts-canvas apexcharts9e09xu84 apexcharts-theme-light"
														style="width: 220px;"></div>
												</div>
											</a>
										</div>
										<div class="card card-tiny-line-stats widget"
											style="margin: 2rem;">
											<a href="/schdul/calendarMain" class="card-body pb-50"
												style="padding-bottom: 1.5rem !important; text-align: center; width: 150px; height: 159px;">
												<h6 style="line-height: 42px; font-size: 1.2rem;">일정관리</h6>
												<img alt="일정관리" src="../resources/images/main/일정관리.png">
												<div>
													<div id="apexcharts9e09xu84"
														class="apexcharts-canvas apexcharts9e09xu84 apexcharts-theme-light"
														style="width: 220px;"></div>
												</div>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row match-height" style="flex-direction: column;">
							<div>
								<div class="card card-congratulation-medal"
									style="width: 400px;">
									<div class="card-body" style="padding: 1.45rem;">
										<div style="padding: 20px; text-align: center;">
											<h5 id="date" class="date"></h5>
											<h1 id="time" class="pt-50 time"></h1>
											<p class="card-text font-small-2"
												style="padding-top: 0.2rem; padding-bottom: 0.5rem">접속
												IP : ${clientIP}</p>
											<input type="hidden" id="clientIp" value="${clientIP}" /> <input
												type="hidden" id="dclzSn" value="${dclzSn}" /> <input
												type="hidden" id="commute" value="${commute}" />
										</div>
										<div class="row text-center mx-0">
											<div
												class="border-top border-right d-flex align-items-between flex-column py-1 col-6">
												<button type="button" id="commuteBtn"
													class="btn btn-flat-primary waves-effect"
													style="font-size: 17px;" onclick=commute()>출근</button>
												<input type="hidden" id="attendTime" value="">
											</div>
											<div
												class="border-top d-flex align-items-between flex-column py-1 col-6">
												<button type="button" id="getoffBtn"
													class="btn btn-flat-primary waves-effect"
													style="font-size: 17px;" onclick=getoff()>퇴근</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div>
								<div class="card card-developer-meetup">
									<div class="meetup-img-wrapper rounded-top text-center">
										<img src="/resources/images/illustration/email.svg"
											alt="Meeting Pic" height="170">
									</div>
									<div class="card-body">
										<div class="meetup-header d-flex align-items-center">
											<div class="meetup-day">
												<h6 class="mb-0">MON</h6>
												<h3 class="mb-0">17</h3>
											</div>
											<div class="my-auto">
												<h4 class="card-title mb-25">Project Presentation</h4>
											</div>
										</div>
										<div class="mt-0">
											<div class="avatar float-start bg-light-primary rounded me-1">
												<div class="avatar-content">
													<svg xmlns="http://www.w3.org/2000/svg" width="14"
														height="14" viewBox="0 0 24 24" fill="none"
														stroke="currentColor" stroke-width="2"
														stroke-linecap="round" stroke-linejoin="round"
														class="feather feather-calendar avatar-icon font-medium-3">
													<rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
													<line x1="16" y1="2" x2="16" y2="6"></line>
													<line x1="8" y1="2" x2="8" y2="6"></line>
													<line x1="3" y1="10" x2="21" y2="10"></line></svg>
												</div>
											</div>
											<div class="more-info">
												<h6 class="mb-0">Mon, Jan 17, 2022</h6>
												<small>14:00 to 17:30</small>
											</div>
										</div>
										<div class="mt-2">
											<div class="avatar float-start bg-light-primary rounded me-1">
												<div class="avatar-content">
													<svg xmlns="http://www.w3.org/2000/svg" width="14"
														height="14" viewBox="0 0 24 24" fill="none"
														stroke="currentColor" stroke-width="2"
														stroke-linecap="round" stroke-linejoin="round"
														class="feather feather-map-pin avatar-icon font-medium-3">
													<path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
													<circle cx="12" cy="10" r="3"></circle></svg>
												</div>
											</div>
											<div class="more-info">
												<h6 class="mb-0">DDIT 406</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</div>

<div class="modal fade text-left modal-primary final" id="primary"
	tabindex="-1" role="dialog" aria-labelledby="myModalLabel140"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header" style="justify-content: center;">
				<h5 class="modal-title" id="myModalLabel140"
					style="text-align: center; center; font-size: 13px;">최종 확인</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body" style="text-align: center; font-size: 15px;">
				퇴근 등록이 완료되었습니다.<br>
				(최종 퇴근 등록시간으로 등록됩니다.)</div>
		</div>
	</div>
</div>

<div class="sidenav-overlay"></div>
<div class="drag-target"></div>

<script src="/resources/vendors/js/vendors.min.js"></script>
<script src="/resources/vendors/js/charts/apexcharts.min.js"></script>
<script src="/resources/vendors/js/extensions/toastr.min.js"></script>
<script src="/resources/js/core/app-menu.min.js"></script>
<script src="/resources/js/core/app.min.js"></script>
<script src="/resources/js/scripts/customizer.min.js"></script>
<script src="/resources/js/scripts/pages/dashboard-ecommerce.min.js"></script>

<script>

$(window).on('load', function() {
	if (feather) {
		feather.replace({
			width : 14,
			height : 14
		});
	}
	
	const commute = document.getElementById("commute").value;
		console.log("메인페이지 commute:" + commute);
		if(commute=="on"){
			document.getElementById("commuteBtn").disabled=true;
			document.getElementById("commuteBtn").innerText='출근 완료';
	}
})

function setClock() {
	/** 오늘 날짜 가져오기 **/ 
	var dateInfo = new Date();
	var year = dateInfo.getFullYear();
	var month = dateInfo.getMonth() + 1; // monthIndex를 반환해주기 때문에 1을 더해준다.
	var date = dateInfo.getDate();
	var hour = modifyNumber(dateInfo.getHours());
	var min = modifyNumber(dateInfo.getMinutes());
	var sec = modifyNumber(dateInfo.getSeconds());
	document.getElementById("time").innerHTML = hour + ":" + min + ":"
			+ sec;
	document.getElementById("date").innerHTML = year + "년 " + month
			+ "월 " + date + "일";
}

function modifyNumber(time) {
	if (parseInt(time) < 10) {
		return "0" + time;
	} else
		return time;
}

window.onload = function() {
	setClock();
	setInterval(setClock, 1000); // 1초마다 setClock 함수 실행
}

// 날짜 형식 잡아주는 함수
function dateFormat(date) {
       let month = date.getMonth() + 1;
       let day = date.getDate();

       month = month >= 10 ? month : '0' + month;
       day = day >= 10 ? day : '0' + day;

       return date.getFullYear() + '-' + month + '-' + day;
}

function commute() {
	var dateInfo = new Date();
	var workDe  = dateFormat(dateInfo);
	var attendIp = document.getElementById("clientIp").value;
	console.log("workDe:::", workDe);
	$.ajax({
		url : "dclz/commute",
		type : "POST",
		data : {
			workDe : workDe, 
			attendIp : attendIp
		},
		success : function(data){
			if(data!="fail" && data!="already"){
				console.log("data :" + data);
				document.getElementById("dclzSn").value=data;
				document.getElementById("commuteBtn").disabled=true;
				document.getElementById("commuteBtn").innerText='출근 완료';
			}else if(data == "already"){
				document.getElementById("commuteBtn").disabled=true;
				document.getElementById("commuteBtn").innerText='출근 완료';
			}
		}
	});
}

function getoff() {
	var dateInfo = new Date();
	var year = dateInfo.getFullYear();
	var month = dateInfo.getMonth() + 1; // monthIndex를 반환해주기 때문에 1을 더해준다.
	var date = dateInfo.getDate();
	var workDe  = year + "-" + month + "-" + date
	var lvffcIp = document.getElementById("clientIp").value;
	var dclzSn = document.getElementById("dclzSn").value;
	
	$.ajax({
		url : "dclz/getOff",
		type : "POST",
		data : {
			workDe : workDe,
			lvffcIp : lvffcIp,
			dclzSn : dclzSn
		},
		success : function(data){
			successYn=Number(data); 
			if(successYn>0){
				$(".final").modal();
				
			}
		}
	})
}
</script>
