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
					<div class="card-body" style="height: 584.52px;">
						<div class="tab-content">
							<div class="tab-pane active" id="account"
								aria-labelledby="account-tab" role="tabpanel"
								style="margin-top: 14%;">
								<form class="auth-login-form mt-2" action="/passwordCheck"
									name="loginForm" method="POST" id="passwordCheck"
									style="width: 385px; margin-left: 33%; margin-bottom: 30px;">
									<div class="form-group">
										<div class="d-flex justify-content-between">
											<label for="login-password">비밀번호</label>
										</div>
										<div
											class="input-group input-group-merge form-password-toggle">
											<input class="form-control form-control-merge"
												id="login-password" type="password" name="password"
												placeholder="············" aria-describedby="login-password"
												tabindex="2" aria-invalid="false" style="font-family: auto;">
											<div class="input-group-append">
												<span class="input-group-text cursor-pointer"> <svg
														xmlns="http://www.w3.org/2000/svg" width="14" height="14"
														viewBox="0 0 24 24" fill="none" stroke="currentColor"
														stroke-width="2" stroke-linecap="round"
														stroke-linejoin="round" class="feather feather-eye">
											<path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
											<circle cx="12" cy="12" r="3"></circle></svg></span>
											</div>
										</div>
									</div>
									<button type="button"
										class="btn btn-primary btn-block waves-effect waves-float waves-light"
										id="loginCheck">확인</button>
								</form>
								<font color="red"> <span id="loginFail"
									style="margin-left: 41%;">${message}</span>
								</font>
							</div>
						</div>
					</div>
				</div>
			</section>
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
				width : 14,
				height : 14
			});
		}
	});

	const passwordCheck = document.querySelector('#passwordCheck');
	const logincheck = document.querySelector('#loginCheck');

	loginCheck.addEventListener('click', function() {

		var idInput = $("#login-password").val();

		if (idInput == '' || idInput == null) {
			$("#loginFail").text("비밀번호를 입력해 주세요.");
			$("#idInput").attr("autofocus", true);
			return false;
		} else {
			passwordCheck.submit();
		}
	});
</script>
