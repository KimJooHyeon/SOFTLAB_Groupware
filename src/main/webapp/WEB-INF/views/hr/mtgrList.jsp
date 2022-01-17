<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">

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
<title>회의실 목록</title>
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
<link rel="stylesheet" type="text/css"
	href="/resources/vendors/css/extensions/sweetalert2.min.css">
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
	href="/resources/custom/style.css">
<!-- END: Custom CSS-->

<script type="text/javascript">
    $(function() {
       var chkObj = document.getElementsByName("RowCheck");
      var rowCnt = chkObj.lengh;
      
      $("input[name='allCheck']").click(function(){
         var chk_listArr = $("input[name='RowCheck']");
         for (var i=0; i<chk_listArr.length; i++){
            chk_listArr[i].checked = this.checked;
         }
      });
      $("input[name='RowCheck']").click(function(){
         if($("input[name='RowCheck']:checked").length == rowCnt){
            $("input[name='allCheck']")[0].checked = true;
         }
         else{
            $("input[name='allCheck']")[0].checked = false;
         }
      });
   });
      
    function deleteValue() {
      var confirmText = $('#confirm-text'),
         basicAlert = $('#basic-alert');
      var url = "mtgrDelete";
      var valueArr = new Array();
      var list = $("input[name='RowCheck']");
      for(var i=0; i< list.length; i++){
         if(list[i].checked){
            valueArr.push(list[i].value);
         }
      }
      if (valueArr.length == 0){
         // Basic
         // alert("선택된 회의실이 없습니다.");
         $(".mtgrChk").modal();
               return false;
      }
      else{
         // var chk = confirm("삭제하시겠습니까?");
         // Confirm Text
          $.ajax({
            url : url,
            type : "POST",
            traditional : true,
            data : {
               valueArr : valueArr
            },
            success: function(data) {
               $(".mtgrDelete").modal();
            } // end success
         }); // end ajax
      } // end if
         
      }
    function insertValue() {
      var url = "mtgrInsert";
      var form = $("#mtgrInsert").serialize();
      console.log("form : ", form);
      $.ajax({
			type: "POST",
			url: "mtgrInsert",
			dataType: "text",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data : form,
			success: function(data) {
  		    console.log("data : ",data.length);
  		    console.log("data : ",data);
  			if(data.length > 0){
  				$(".insertMtgr").modal();
  			}else{
  				$(".insert").modal();
  				return false;
  			}
  		} // success 
  	  });
         
      }
    
    function replaceMtgrList() {
          location.replace("mtgrList");
     }
    </script>
</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body
	class="vertical-layout vertical-menu-modern  navbar-floating footer-static"
	data-open="click" data-menu="vertical-menu-modern" data-col="">


	<!-- BEGIN: Content-->
	<div class="app-content content ">
		<div class="content-overlay"></div>
		<div class="header-navbar-shadow"></div>
		<div class="content-wrapper container-xxl p-0">
			<div class="content-header row">
				<div class="content-header-left col-md-9 col-12 mb-2">
					<div class="row breadcrumbs-top">
						<div class="col-12">
							<h2 class="content-header-title float-left mb-0">회의실 목록</h2>
							<div class="breadcrumb-wrapper">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#" style="cursor: default;">예약</a>
									</li>
									<li class="breadcrumb-item active">회의실 목록</li>
								</ol>
							</div>
						</div>
						<div class="content-body">
							<div class="container">
								<!-- Basic Tables start -->
								<div class="row" id="basic-table">
									<div class="col-12" style="margin-top: 10px;">
										<div class="noPaging" style="display:flex; justify-content: center;">
											<div class="card"  style="width: 1300px;">
												<div class="card-body" style="padding: 15px; display:flex; width: 1300px;">
													<div class="basic-modal">
														<!-- Confirm option section -->
														<section id="confirm-option">
															<c:if test="${isAuth}">
																<button type="button" class="btn btn-primary"
																	data-toggle="modal" data-target="#addMtgr"
																	style="float: right; margin-top: 5px; margin-inline: 20px;">회의실 등록</button>
																<button type="button" class="btn btn-outline-primary"
																	style="float: right; margin-top: 5px; margin-left: 1050px;"
																	onclick="deleteValue();">삭제</button>
															</c:if>
														</section>
														<!--/ Confirm option section -->

													</div>
													<div class="row">
														<div class="form-group"></div>
													</div>
												</div>

												<div class="table-responsive"
													 style="height:575px;width: 1300px; display:flex;">
													<table class="table">
														<thead>
															<tr>
																<c:if test="${isAuth}">
																	<th style="width: 1%;">
																		<div class="custom-control custom-checkbox">		
																			<input id="allCheck" type="checkbox" name="allCheck" class="custom-control-input" />
																			<label class="custom-control-label" for="allCheck"></label>
																		</div>
																	</th>
																</c:if>
																<th>순번</th>
																<th>호수</th>
																<th>회의실명</th>
																<th>위치</th>
																<th>수용인원</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach var="row" items="${mtgrList.content}"
																varStatus="stat">
																<tr class="rowContent"
																	style="height: 53px;">
																	<c:if test="${isAuth}">
																		<td>
																			<div class="custom-control custom-checkbox">
																				<input type="checkbox" name="RowCheck" class="custom-control-input" 
																				id="${row.RNUM}-RowCheck" value="${row.MTGR_UNIT}">
																				<label class="custom-control-label" for="${row.RNUM}-RowCheck"></label>
																			</div>
																		</td>
																	</c:if>
																	<td>${row.RNUM}</td>
																	<td>${row.MTGR_UNIT}호</td>
																	<td>${row.MTGR_NM}</td>
																	<td>${row.MTGR_LC}</td>
																	<td>${row.ACEPTNC_NMPR}명</td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
										</div>
												<!-- paging -->
												<!-- 페이징 -->
												<div style="text-align: center;">
													<input type="hidden" value="1" id="pageDefault">
													<div class="paging" style="display: flex;justify-content: center; width:1300px;">
														<div class="card-body"
															style="display: flex; justify-content: center; padding: 0px; margin-top: 10px;">
															<ul class="pagination firstLast1-links">
																<li class="page-item first"><a
																	href="/mtgr/mtgrList?currentPage=1" class="page-link">First</a></li>
																<li
																	class="page-item prev <c:if test="${mtgrList.startPage<=5}">disabled</c:if>">
																	<a
																	href="/mtgr/mtgrList?currentPage=${mtgrList.startPage-5}"
																	class="page-link">Prev</a>
																</li>
																<c:forEach var="page" begin="${mtgrList.startPage}"
																	end="${mtgrList.endPage}">
																	<li
																		class="page-item <c:if test='${param.currentPage eq page}'>active</c:if>">
																		<a href="/mtgr/mtgrList?currentPage=${page}"
																		class="page-link">${page}</a>
																	</li>
																</c:forEach>
																<li
																	class="page-item next <c:if test="${mtgrList.endPage>=mtgrList.totalPages}">disabled</c:if>">
																	<a
																	href="/mtgr/mtgrList?currentPage=${mtgrList.startPage+5}"
																	class="page-link">Next</a>
																</li>
																<li class="page-item last"><a
																	href="/mtgr/mtgrList?currentPage=${mtgrList.endPage}"
																	class="page-link">Last</a></li>
															</ul>
														</div>
													</div>
												</div>
												<!-- 페이징 끝 -->
												<!-- 등록 Modal -->

												<div class="modal fade text-left" id="addMtgr" tabindex="-1"
													role="dialog" aria-labelledby="mtgrModal"
													aria-hidden="true">
													<div class="modal-dialog modal-dialog-centered"
														role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h4 class="modal-title" id="mtgrModal">회의실 등록</h4>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<form class="form" id="mtgrInsert">
																<div class="modal-body">
																	<label>호수</label>
																	<div class="form-group">
																		<input type="text" name="mtgrUnit"
																			placeholder="ex)301(o) 301호(x)" class="form-control" />
																	</div>

																	<label>회의실명 </label>
																	<div class="form-group">
																		<input type="text" name="mtgrNm" placeholder="ex)세미나실"
																			class="form-control" />
																	</div>

																	<label>위치</label>
																	<div class="form-group">
																		<input type="text" name="mtgrLc"
																			placeholder="ex)3-301" class="form-control" />
																	</div>

																	<label>수용인원</label>
																	<div class="form-group">
																		<input type="text" name="aceptncNmpr"
																			placeholder="ex)50(o) 50명(x)" class="form-control" />
																	</div>
																</div>
																<div class="modal-footer">
																	<button type="button"
																		onclick="insertValue();"
																		class="btn btn-primary" data-dismiss="modal">등록</button>
																</div>
															</form>
														</div>
													</div>
												</div>

												<!-- /modal  -->
												<!-- 회의실 중복 안내 modal -->
												<div class="modal fade text-left modal-primary insert"
													id="primary" tabindex="-1" role="dialog"
													aria-labelledby="myModalLabel140" aria-hidden="true">
													<div class="modal-dialog modal-dialog-centered"
														role="document">
														<div class="modal-content">
															<div class="modal-header"
																style="justify-content: center;">
																<h5 class="modal-title" id="myModalLabel140"
																	style="text-align: center; center; font-size: 13px;">회의실 등록 안내</h5>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body"
																style="text-align: center; font-size: 15px;">이미 등록된 회의실입니다.</div>
														</div>
													</div>
												</div>
												<!-- 회의실 중복 안내 modal 끝 -->
												<!-- 회의실 등록 안내 modal -->
												<div class="modal fade text-left modal-primary insertMtgr"
													id="primary" tabindex="-1" role="dialog"
													aria-labelledby="myModalLabel140" aria-hidden="true">
													<div class="modal-dialog modal-dialog-centered"
														role="document">
														<div class="modal-content">
															<div class="modal-header"
																style="justify-content: center;">
																<h5 class="modal-title" id="myModalLabel140"
																	style="text-align: center; center; font-size: 13px;">회의실 등록 안내</h5>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body"
																style="text-align: center; font-size: 15px;">등록 완료되었습니다.</div>
														</div>
													</div>
												</div>
												<!-- 회의실 중복 안내 modal 끝 -->
												<!-- 선택된 회의실이 없을 때 삭제안내 modal -->
												<div class="modal fade text-left modal-primary mtgrChk"
													id="primary" tabindex="-1" role="dialog"
													aria-labelledby="myModalLabel142" aria-hidden="true">
													<div class="modal-dialog modal-dialog-centered"
														role="document">
														<div class="modal-content">
															<div class="modal-header"
																style="justify-content: center;">
																<h5 class="modal-title" id="myModalLabel142"
																	style="text-align: center; center; font-size: 13px;">회의실 삭제 안내</h5>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body"
																style="text-align: center; font-size: 15px;">선택된 회의실이 없습니다.</div>
														</div>
													</div>
												</div>
												<!-- 선택된 회의실이 없을 때 삭제안내 modal 끝 -->
												<!-- 회의실 삭제 창 modal -->
												<div class="modal fade text-left modal-primary mtgrDelete"
													id="primary" tabindex="-1" role="dialog"
													aria-labelledby="myModalLabel142" aria-hidden="true">
													<div class="modal-dialog modal-dialog-centered"
														role="document">
														<div class="modal-content">
															<div class="modal-header"
																style="justify-content: center;">
																<h5 class="modal-title" id="myModalLabel142"
																	style="text-align: center; center; font-size: 13px;">회의실 삭제 안내</h5>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body"
																style="text-align: center; font-size: 15px;">삭제 되었습니다.</div>
														</div>
													</div>
												</div>
												<!-- 회의실 삭제 창 modal 끝 -->
											</div>
										</div>
										<!-- tab-1 end -->

									</div>
								</div>
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
	<!-- END: Page Vendor JS-->

	<!-- BEGIN: Theme JS-->
	<script src="/resources/js/core/app-menu.js"></script>
	<script src="/resources/js/core/app.js"></script>
	<!-- END: Theme JS-->

	<!-- BEGIN: Page JS-->
	<script src="/resources/js/scripts/forms/pickers/form-pickers.js"></script>
	<!-- END: Page JS-->

	<!-- BEGIN: alert JS -->
	<script
		src="/resources/js/scripts/extensions/ext-component-sweet-alerts.js"></script>
	<script src="/resources/vendors/js/vendors.min.js"></script>
	<script src="/resources/vendors/js/extensions/sweetalert2.all.min.js"></script>
	<script src="/resources/vendors/js/extensions/polyfill.min.js"></script>
	<!-- END: alert JS -->

	<script>
        $(window).on('load', function() {
            if (feather) {
                feather.replace({
                    width: 14,
                    height: 14
                });
            }
        })
        
    </script>

</body>
<!-- END: Body-->



</html>
