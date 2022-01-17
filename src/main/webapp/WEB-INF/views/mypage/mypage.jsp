<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="pageTitle" style="margin: 15px;">
				<h2 class="content-header-title float-left mb-0">마이페이지</h2>
				<i style="height: 2rem; width: 3rem;" data-feather='user'></i>
				<div class="breadcrumb-wrapper">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"></li>
					</ol>
				</div>
			</div>
		</div>
		<div class="content-body">
			<section class="app-user-edit">
				<div class="card">
					<div class="card-body">
						<div class="tab-content" style="display: ''">
							<div class="tab-pane active" id="account"
								aria-labelledby="account-tab" role="tabpanel">
								<form method="post" enctype="multipart/form-data"
									action="/mypage/editProcess" class="form-validate" id="emp">
									<div class="media mb-2">
										<img
											src="/resources/images/emp/${sessionScope.EMPVO.photoFlpth}"
											alt="users avatar" id="userImg"
											class="user-avatar users-avatar-shadow rounded mr-2 my-25 cursor-pointer"
											height="90" width="90" />
									</div>
									<div class="row">
										<div class="col-md-4">
											<div class="form-group">
												<label>직원번호</label> <input type="text" id="empNo"
													class="form-control" value="${sessionScope.EMPVO.empNo}"
													readonly />
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label>이름</label> <input type="text" class="form-control"
													value="${sessionScope.EMPVO.empNm}" readonly />
											</div>
										</div>
										<div class="col-lg-4 col-md-6">
											<div class="form-group">
												<label>생년월일</label> <input type="text" class="form-control"
													value="${sessionScope.EMPVO.brthdy}" readonly />
											</div>
										</div>

										<div class="col-md-4">
											<div class="form-group">
												<label>외부이메일</label> <input type="email"
													class="form-control" name="email" id="email"
													value="${sessionScope.EMPVO.email}" readonly />
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label>휴대폰번호</label> <input type="text" class="form-control"
													placeholder="01012345678"
													value="${sessionScope.EMPVO.phonenum}" readonly />
												<button type="button" class="btn btn-primary" id="updatePn"
													data-toggle="modal" data-target="#updatePhone"
													style="position: absolute; padding: 4px 7px; margin: -3.3vh 0px -2vh 42.4vh;">변경</button>
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label>입사일자</label> <input type="text" class="form-control"
													value="${sessionScope.EMPVO.encpnDe}" readonly />
											</div>
										</div>
										<div class="col-lg-4 col-md-6">
											<div class="form-group">
												<label>담당부서</label> <input type="text" class="form-control"
													value="${deptNm}" readonly />
											</div>
										</div>
										<div class="col-lg-4 col-md-6">
											<div class="form-group">
												<label>직급</label> <input type="text" class="form-control"
													value="${selectClsf}" readonly />
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label>내선번호</label> <input type="text" class="form-control"
													name="lxtnNo" value="${sessionScope.EMPVO.lxtnNo}" readonly />
											</div>
										</div>
										<div class="col-12">
											<h4 class="mb-1 mt-2">
												<svg xmlns="http://www.w3.org/2000/svg" width="14"
													height="14" viewBox="0 0 24 24" fill="none"
													stroke="currentColor" stroke-width="2"
													stroke-linecap="round" stroke-linejoin="round"
													class="feather feather-map-pin font-medium-4 mr-25">
													<path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
													<circle cx="12" cy="10" r="3"></circle></svg>
												<span class="align-middle">Address</span>
											</h4>
										</div>
										<div class="col-lg-4 col-md-6">
											<div class="form-group">
												<label>우편번호</label> <input type="text" class="form-control"
													name="zip" id="zipInput" value="${sessionScope.EMPVO.zip}"
													readonly />
											</div>
										</div>
										<div class="col-lg-4 col-md-6">
											<div class="form-group">
												<label>기본주소</label> <input type="text" class="form-control"
													name="adres1" id="adres1"
													value="${sessionScope.EMPVO.adres1}" readonly />
											</div>
										</div>
										<div class="col-lg-4 col-md-6">
											<div class="form-group">
												<label>상세주소</label> <input type="text" class="form-control"
													value="${sessionScope.EMPVO.adres2}" readonly />
											</div>
										</div>
										<div class="col-12 d-flex flex-sm-row flex-column mt-2"
											style="display: flex; justify-content: space-between;">
											<button type="button" class="btn btn-primary" id="updatePw"
												data-toggle="modal" data-target="#updatePassword">비밀번호
												변경</button>
											<div>
												<button type="button" id="finalAdd"
													class="btn btn-primary mb-1 mb-sm-0 mr-0 mr-sm-1 btn-submit"
													onclick="location.href='/';">메인</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</section>

			<div class="modal fade text-left modal-primary updatePassword"
				id="updatePassword" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel140" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header" style="justify-content: center;">
							<h5 class="modal-title" id="myModalLabel140"
								style="text-align: center; center; font-size: 13px;">비밀번호
								변경</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body"
							style="padding: 0rem 1.4rem 0.8rem 1.4rem;">
							<form class="auth-login-form mt-2" action="/updatePassword"
								name="loginForm" method="POST" id="passwordCheck">
								<div class="form-group">
									<div class="d-flex justify-content-between">
										<label for="login-password">8~16자 영문 대소문자, 숫자, 특수문자를
											사용하세요.</label>
									</div>
									<div class="input-group input-group-merge form-password-toggle">
										<input class="form-control form-control-merge"
											id="login-password" type="password" name="password"
											placeholder="············" aria-describedby="login-password"
											tabindex="2" aria-invalid="false" style="font-family: auto;">
										<div class="input-group-append">
											<span class="input-group-text cursor-pointer">
												<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14"
												 viewBox="0 0 24 24" fill="none" stroke="currentColor"
												 stroke-width="2" stroke-linecap="round"
												 stroke-linejoin="round" class="feather feather-eye">
												<path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
												<circle cx="12" cy="12" r="3"></circle></svg>
											</span>
										</div>
									</div>
								</div>
								<div class="modal-footer"
									style="justify-content: center; padding: 0rem 1.4rem;">
									<button type="button" id="passwordUpdate"
										class="btn btn-primary" data-dismiss="modal"
										onclick="password_update();">변경</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

			<div class="modal fade text-left modal-primary updatePhone"
				id="updatePhone" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel140" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header" style="justify-content: center;">
							<h5 class="modal-title" id="myModalLabel140"
								style="text-align: center; center; font-size: 13px;">휴대폰번호 변경</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body"
							style="padding: 0rem 1.4rem 0.8rem 1.4rem;">
							<p class="card-text mb-2 successPhoneChk"
								style="padding-top: 1.5rem; text-align: center;">휴대폰번호를
								입력하시면 인증번호를 보내드립니다.</p>
							<form class="auth-login-form mt-2" name="loginForm" method="POST"
								id="smsForm">
								<div class="form-group"
									style="display: flex; flex-direction: column; gap: 15px;">
									<div>
										<div class="d-flex justify-content-between">
											<label for="login-password">변경할 휴대폰번호</label>
										</div>
										<div style="display: flex; gap: 6px;">
											<div
												class="input-group input-group-merge form-password-toggle">
												<input class="form-control form-control-merge" id="phone"
													type="text" name="phone" placeholder="01012345678"
													tabindex="2" aria-invalid="false"
													style="font-family: auto;">
											</div>
											<button type="button" class="btn btn-primary"
												onclick="sendSms();" style="width: 78px;">전송</button>
										</div>
									</div>
									<div>
										<div class="d-flex justify-content-between">
											<label for="login-password">인증번호</label>
										</div>
										<div style="display: flex; gap: 6px;">
											<div
												class="input-group input-group-merge form-password-toggle">
												<input class="form-control form-control-merge" id="sms"
													type="text" name="sms" placeholder="123456" tabindex="2"
													aria-invalid="false" style="font-family: auto;">
											</div>
											<button type="button" class="btn btn-primary"
												onclick="phoneCheck();" style="width: 78px;">확인</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="imgs_wrap"></div>
<div class="sidenav-overlay"></div>
<div class="drag-target"></div>

<script src="/resources/vendors/js/vendors.min.js"></script>
<script src="/resources/vendors/js/ui/jquery.sticky.js"></script>
<script src="/resources/vendors/js/forms/select/select2.full.min.js"></script>
<script src="/resources/vendors/js/forms/validation/jquery.validate.min.js"></script>
<script src="/resources/vendors/js/pickers/flatpickr/flatpickr.min.js"></script>
<script src="/resources/js/core/app-menu.js"></script>
<script src="/resources/js/core/app.js"></script>
<script src="/resources/js/scripts/forms/form-tooltip-valid.js"></script>
<script src="/resources/js/scripts/pages/app-user-edit.js"></script>
<script src="/resources/js/scripts/components/components-navs.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

<script>
  
  $(window).on('load', function() {
       if (feather) {
           feather.replace({
               width: 14,
               height: 14
           });
       }
   });
   
  function password_update() {
	  const updateForm = document.querySelector('#passwordCheck')
	  updateForm.submit()
  }
  
  function sendSms() {
  	var phone = $("#phone").val();
  	if (!phone) {
  		$(".successPhoneChk").text("휴대폰번호를 입력해 주세요.");
	$(".successPhoneChk").css("color","red");
	return false;
}
  	
  	$.ajax({ 
  		type:"get",
  		url: "sendSms?phone=" + phone,
  		dataType:"json",
  		success: function(data) { 
  			if (data.result == "true") {
  				$(".successPhoneChk").text("인증번호가 전송되었습니다.");
			$(".successPhoneChk").css("color","#7367f0");
  			} else if (data.result == "false") {
  				$(".successPhoneChk").text("인증번호 전송에 실패했습니다.");
			$(".successPhoneChk").css("color","red");
  			} else if (data.result == "dupl") {
  				$(".successPhoneChk").text("중복된 휴대폰번호 입니다.");
			$(".successPhoneChk").css("color","red");
  				
  			}
  		} 
  	}); 
  }
  
  function phoneCheck() {
  	var sms = $("#sms").val();
  	var param ={
  			"smsNo" : sms
  	}
  	
  	if (!sms) {
  		$(".successPhoneChk").text("인증번호를 입력해 주세요.");
	$(".successPhoneChk").css("color","red");
	return false;
}
  	
  	$.ajax({ 
  		type:"post",
  		url: "/smsCheck",
  		data :{
  			smsNo : sms,
  		},
	dataType:"json",
  		success: function(data) {
  			if (data.result == "true") { 
  				$(".successPhoneChk").text("휴대폰번호가 변경되었습니다.");
			$(".successPhoneChk").css("color","#7367f0");
  			} else if (data.result == "false") {
  				$(".successPhoneChk").text("인증번호가 맞지 않습니다.");
			$(".successPhoneChk").css("color","red");
  			} 
  		} 
  	}); 
  }

  </script>
