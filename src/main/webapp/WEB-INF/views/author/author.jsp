<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left col-md-9 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<div class="breadcrumb-wrapper" style="display: flex;">
							<h2 class="content-header-title float-left mb-0"
								style="padding-top: 8px;">권한관리</h2>
							<ol class="breadcrumb">
								<li class="breadcrumb-item" style="padding-top: 8px;"><a
									href="#" style="cursor: default;">전체</a></li>
							</ol>
							<select class="form-control form-control-lg" id="deptSelect"
								name="deptSelect" style="width: 200px; margin-left: 20px;">
								<option value="default" selected>부서를 선택하세요</option>
								<option value="null" disabled></option>
								<option value="ALL">전체</option>
								<option value="RDT">개발</option>
								<option value="DST">설계</option>
								<option value="GAT">총무</option>
								<option value="ACT">회계</option>
								<option value="HRT">인사</option>
								<option value="QCT">품질관리</option>
								<option value="SLT">영업</option>
								<option value="CMT">고객관리</option>
							</select>
							<form name="formDept" id="formDept" action="/author"
								method="post">
								<input type="hidden" id="inputDeptNm" name="inputDeptNm">
								<input type="hidden" id="inputDeptCode" name="inputDeptCode">
							</form>
						</div>
					</div>
				</div>
			</div>
			<div
				class="content-header-right text-md-right col-md-3 col-12 d-md-block d-none">
			</div>
		</div>
		<div class="content-body">
			<section id="basic-datatable">
				<div class="row">
					<div class="col-12">
						<div class="card" id="tabVerticalRight1" role="tabpanel"
							aria-labelledby="baseVerticalRight-tab1">
							<div class="cardHeader-button" style="margin: 10px; display: flex; flex-direction: row-reverse;">
								<div class="searchEmp" style="display: flex;">
									<input type="text" name="keyword" id="keyword"
										placeholder="직원 이름으로 검색" class="form-control" />
									<button type="button"
										class="btn btn-icon btn-outline-primary waves-effect"
										id="searchBtn">
										<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14"
											viewBox="0 0 24 24" fill="none" stroke="currentColor"
											stroke-width="2" stroke-linecap="round"
											stroke-linejoin="round" class="feather feather-search">
											<circle cx="11" cy="11" r="8"></circle>
											<line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
									</button>
								</div>
							</div>
							<div class="tab-content">
								<div class="tab-pane active" id="homeIcon"
									aria-labelledby="homeIcon-tab" role="tabpanel">
									<table class="datatables-basic table">
										<thead>
											<tr>
												<th style="text-align: center; width: 177.8px;">직원번호</th>
												<th style="text-align: center; width: 168.55px;">부서</th>
												<th style="text-align: center; width: 168.55px;">직급</th>
												<th style="text-align: center; width: 168.55px;">이름</th>
												<th style="text-align: center; width: 184.88px;">인사</th>
												<th style="text-align: center; width: 184.88px;">근태</th>
												<th style="text-align: center; width: 184.88px;">휴가</th>
												<th style="text-align: center; width: 184.94px;">출장</th>
												<th style="padding: 4px;"></th>
											</tr>
										</thead>
									</table>
									<div style="height: 58vh; overflow-y: scroll;">
										<table class="datatables-basic table" id="empTable">
											<tbody class="post">
												<c:forEach var="row" items="${empList}" varStatus="stat">
													<tr class="author_rowContent" id="author-tr">
														<td style="width: 200px; text-align: center;">${row.EMP_NO}</td>
														<td style="width: 200px; text-align: center;">${row.DEPT_NM}</td>
														<td style="width: 200px; text-align: center;">${row.CLSF}</td>
														<td style="width: 200px; text-align: center;">${row.EMP_NM}</td>
														<td style="width: 200px; padding-left: 84px;">
															<div class="custom-control custom-checkbox">
																<input type="checkbox" name="authorCheck"
																	class="custom-control-input" id="${row.EMP_NO}-HR"
																	value="${row.HR}" /> <label
																	class="custom-control-label" for="${row.EMP_NO}-HR"></label>
															</div>
														</td>
														<td style="width: 200px; padding-left: 84px;">
															<div class="custom-control custom-checkbox">
																<input type="checkbox" name="authorCheck"
																	class="custom-control-input" id="${row.EMP_NO}-INT"
																	value="${row.INT}" /> <label
																	class="custom-control-label" for="${row.EMP_NO}-INT"></label>
															</div>
														</td>
														<td style="width: 200px; padding-left: 84px;">
															<div class="custom-control custom-checkbox">
																<input type="checkbox" name="authorCheck"
																	class="custom-control-input" id="${row.EMP_NO}-VCT"
																	value="${row.VCT}" /> <label
																	class="custom-control-label" for="${row.EMP_NO}-VCT"></label>
															</div>
														</td>
														<td style="width: 200px; padding-left: 84px;">
															<div class="custom-control custom-checkbox">
																<input type="checkbox" name="authorCheck"
																	class="custom-control-input" id="${row.EMP_NO}-BNT"
																	value="${row.BNT}" /> <label
																	class="custom-control-label" for="${row.EMP_NO}-BNT"></label>
															</div>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="cardFooter">
								<div class="col-12 d-flex flex-sm-row flex-column mt-2"
									style="padding-bottom: 21px; justify-content: center;">
									<div style="display: flex; gap: 20px;">
										<i
											class="create-new btn btn-primary waves-input-wrapper waves-effect waves-float waves-light"
											style="color: rgb(255, 255, 255); background: rgba(0, 0, 0, 0)"><input
											type="submit" id="update" data-toggle="modal" value="수정"
											class="waves-button-input update_btn"
											data-target="#updateCheckModal"
											style="background-color: rgba(0, 0, 0, 0);"></i> <i
											class="btn btn-outline-primary waves-effect waves-input-wrapper"
											style="color: rgb(115, 103, 240); background: rgba(0, 0, 0, 0)"><input
											type="button" value="취소" class="waves-button-input"
											onclick="window.location.reload()"
											style="background-color: rgba(0, 0, 0, 0);"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>


			<div class="modal fade text-left modal-primary keyword" id="primary"
				tabindex="-1" role="dialog" aria-labelledby="myModalLabel140"
				aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header" style="justify-content: center;">
							<h5 class="modal-title" id="myModalLabel140"
								style="text-align: center; center; font-size: 13px;">직원 이름
								검색 안내</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body"
							style="text-align: center; font-size: 15px;">검색어를 입력해주세요.
						</div>
					</div>
				</div>
			</div>

			<div class="modal fade text-left modal-primary update"
				id="updateCheckModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel140" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header" style="justify-content: center;">
							<h5 class="modal-title" id="myModalLabel140"
								style="text-align: center; center; font-size: 13px;">수정 완료
								안내</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body"
							style="text-align: center; font-size: 15px;">수정이 완료되었습니다.
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="sidenav-overlay"></div>
<div class="drag-target"></div>

<script src="/resources/vendors/js/jquery/jquery.min.js"></script>
<script src="/resources/vendors/js/vendors.min.js"></script>
<script src="/resources/vendors/js/ui/jquery.sticky.js"></script>
<script src="/resources/js/core/app-menu.js"></script>
<script src="/resources/js/core/app.js"></script>
<script src="/resources/vendors/js/tables/datatable/jquery.dataTables.min.js"></script>
<script src="/resources/vendors/js/tables/datatable/datatables.bootstrap4.min.js"></script>
<script src="/resources/vendors/js/tables/datatable/dataTables.responsive.min.js"></script>
<script src="/resources/vendors/js/tables/datatable/responsive.bootstrap4.js"></script>
<script src="/resources/vendors/js/tables/datatable/datatables.checkboxes.min.js"></script>
<script src="/resources/vendors/js/tables/datatable/datatables.buttons.min.js"></script>
<script src="/resources/vendors/js/tables/datatable/jszip.min.js"></script>
<script src="/resources/vendors/js/tables/datatable/pdfmake.min.js"></script>
<script src="/resources/vendors/js/tables/datatable/vfs_fonts.js"></script>
<script src="/resources/vendors/js/tables/datatable/buttons.html5.min.js"></script>
<script src="/resources/vendors/js/tables/datatable/buttons.print.min.js"></script>
<script src="/resources/vendors/js/tables/datatable/dataTables.rowGroup.min.js"></script>
<script src="/resources/vendors/js/pickers/flatpickr/flatpickr.min.js"></script>
<script src="/resources/js/scripts/components/components-navs.js"></script>

<script>
$(window).on('load', function() {
    if (feather) {
        feather.replace({
            width: 14,
            height: 14
        });
    }
});

$(function(){
	$('#deptSelect').on('change', function(){
		var deptCode = $(this).val();
		var deptNm = $("#deptSelect option:checked").text();
		
		if(deptCode == "ALL" || deptCode == "default"){
			location.href = "/author"
		} else{
 		var data = {
 			deptCode : $(this).val(),
 			deptNm : $("#deptSelect option:checked").text()
 		}
 		
 		$.ajax({
 			url:"/author/empListDeptAjax",
 			type:"POST",
 			data: JSON.stringify(data),
 			contentType : "application/json; charset=utf-8",
 			dataType:"json",
 			success:function(result){
 				var thead = "";
        				var tbody = "";
        				$(".nav-tabs").html("");
        				thead += "<tr>";
						thead += "<th style='text-align:center; width: 177.8px;'>직원번호</th>";
						thead += "<th style='text-align:center; width: 168.55px;'>부서</th>";
						thead += "<th style='text-align:center; width: 168.55px;'>직급</th>";
						thead += "<th style='text-align:center; width: 168.55px;'>이름</th>";
						thead += "<th style='text-align:center; width: 184.88px;'>인사</th>";
						thead += "<th style='text-align:center; width: 184.88px;'>근태</th>";
						thead += "<th style='text-align:center; width: 184.88px;'>휴가</th>";
						thead += "<th style='text-align:center; width: 184.94px;'>출장</th>";
						thead += "<th style='padding: 4px;'></th>";
						thead += "</tr>";
        				$.each(result,function(i,v){
        					tbody += "<tr class='author_rowContent'>";
        					tbody += "<td style='width:200px; text-align:center;'>" + v.EMP_NO + "</td>";
        					tbody += "<td style='width:200px; text-align:center;'>" + v.DEPT_NM + "</td>";
        					tbody += "<td style='width:200px; text-align:center;'>" + v.CLSF + "</td>";
        					tbody += "<td style='width:200px; text-align:center;'>" + v.EMP_NM + "</td>";
        					tbody += "<td style='width:200px; padding-left: 84px;'> <div class='custom-control custom-checkbox'> <input type='checkbox' name='authorCheck' class='custom-control-input' id='" + v.EMP_NO + "-HR' value='" + v.HR + "' /> <label class='custom-control-label' for='" + v.EMP_NO + "-HR'></label></div></td>";
        					tbody += "<td style='width:200px; padding-left: 84px;'> <div class='custom-control custom-checkbox'> <input type='checkbox' name='authorCheck' class='custom-control-input' id='" + v.EMP_NO + "-INT' value='" + v.INT + "' /> <label class='custom-control-label' for='" + v.EMP_NO + "-INT'></label></div></td>";
        					tbody += "<td style='width:200px; padding-left: 84px;'> <div class='custom-control custom-checkbox'> <input type='checkbox' name='authorCheck' class='custom-control-input' id='" + v.EMP_NO + "-VCT' value='" + v.VCT + "' /> <label class='custom-control-label' for='" + v.EMP_NO + "-VCT'></label></div></td>";
        					tbody += "<td style='width:200px; padding-left: 84px;'> <div class='custom-control custom-checkbox'> <input type='checkbox' name='authorCheck' class='custom-control-input' id='" + v.EMP_NO + "-BNT' value='" + v.BNT + "' /> <label class='custom-control-label' for='" + v.EMP_NO + "-BNT'></label></div></td>";
							tbody += "</tr>";
        				});
        				$("thead").html(thead);
    					$("tbody").html(tbody);
        				
        				$('input:checkbox[name="authorCheck"]').each(function() {
        					
        				    if (this.value == "1"){ // 값 비교
        						this.checked = true; // checked 처리
        				    
        				    } else if (this.value == "0") {
        				    	this.checked = false;
        					} 
        				});
        				
        				$(".breadcrumb-item").html('<a href="#" style="cursor: default;">'+deptNm+'</a>');
        			},
        			error:function(xhr, status) {
        				alert(xhr + " : " + status);
        			}
        		});
       		}
       	});
       });
       
       function search(){
       	$.ajax({
			type:'POST',
			url:"/author/search",
			contentType : "application/json; charset=utf-8",
			data:$("#keyword").val(),
			success:					
				function(result){
				var thead = "";
				var tbody = "";
				$(".nav-tabs").html("");
				
				if(result.length){
						thead += "<tr>";
						thead += "<th style='text-align:center; width: 177.8px;'>직원번호</th>";
						thead += "<th style='text-align:center; width: 168.55px;'>부서</th>";
						thead += "<th style='text-align:center; width: 168.55px;'>직급</th>";
						thead += "<th style='text-align:center; width: 168.55px;'>이름</th>";
						thead += "<th style='text-align:center; width: 184.88px;'>인사</th>";
						thead += "<th style='text-align:center; width: 184.88px;'>근태</th>";
						thead += "<th style='text-align:center; width: 184.88px;'>휴가</th>";
						thead += "<th style='text-align:center; width: 184.94px;'>출장</th>";
						thead += "<th style='padding: 4px;'></th>";
						thead += "</tr>";
       				$.each(result,function(i,v){
       					tbody += "<tr class='author_rowContent'>";
       					tbody += "<td style='width:200px; text-align:center;'>" + v.EMP_NO + "</td>";
       					tbody += "<td style='width:200px; text-align:center;'>" + v.DEPT_NM + "</td>";
       					tbody += "<td style='width:200px; text-align:center;'>" + v.CLSF + "</td>";
       					tbody += "<td style='width:200px; text-align:center;'>" + v.EMP_NM + "</td>";
       					tbody += "<td style='width:200px; padding-left: 84px;'> <div class='custom-control custom-checkbox'> <input type='checkbox' name='authorCheck' class='custom-control-input' id='" + v.EMP_NO + "-HR' value='" + v.HR + "' /> <label class='custom-control-label' for='" + v.EMP_NO + "-HR'></label></div></td>";
       					tbody += "<td style='width:200px; padding-left: 84px;'> <div class='custom-control custom-checkbox'> <input type='checkbox' name='authorCheck' class='custom-control-input' id='" + v.EMP_NO + "-INT' value='" + v.INT + "' /> <label class='custom-control-label' for='" + v.EMP_NO + "-INT'></label></div></td>";
       					tbody += "<td style='width:200px; padding-left: 84px;'> <div class='custom-control custom-checkbox'> <input type='checkbox' name='authorCheck' class='custom-control-input' id='" + v.EMP_NO + "-VCT' value='" + v.VCT + "' /> <label class='custom-control-label' for='" + v.EMP_NO + "-VCT'></label></div></td>";
       					tbody += "<td style='width:200px; padding-left: 84px;'> <div class='custom-control custom-checkbox'> <input type='checkbox' name='authorCheck' class='custom-control-input' id='" + v.EMP_NO + "-BNT' value='" + v.BNT + "' /> <label class='custom-control-label' for='" + v.EMP_NO + "-BNT'></label></div></td>";
       					tbody += "</tr>";
       				});
       				
				}else if(result.length == 0){
					thead += "<tr>";
					thead += "<th style='text-align:center; width: 177.8px;'>직원번호</th>";
					thead += "<th style='text-align:center; width: 168.55px;'>부서</th>";
					thead += "<th style='text-align:center; width: 168.55px;'>직급</th>";
					thead += "<th style='text-align:center; width: 168.55px;'>이름</th>";
					thead += "<th style='text-align:center; width: 184.88px;'>인사</th>";
					thead += "<th style='text-align:center; width: 184.88px;'>근태</th>";
					thead += "<th style='text-align:center; width: 184.88px;'>휴가</th>";
					thead += "<th style='text-align:center; width: 184.94px;'>출장</th>";
					thead += "<th style='padding: 4px;'></th>";
					thead += "</tr>";
					tbody += "<tr><td colspan='7' style='text-align:center; padding:40px;'>검색결과가 없습니다.</td></tr>";
				}
				$("thead").html(thead);
				$("tbody").html(tbody);
				$('input:checkbox[name="authorCheck"]').each(function() {
   				    if (this.value == "1"){ // 값 비교
   						this.checked = true; // checked 처리
   				    
   				    } else if (this.value == "0") {
   				    	this.checked = false;
   					} 
   				});
			},
			error : function(xhr, status) {
	        	$(".keyword").modal();
  				}
    	   });
       }
       
   $("#searchBtn").on("click",function(){
   	search();
   });
   
	$("#keyword").keyup(function(event) {
	    if (event.keyCode === 13) {
	    	search();
	    }
});

<!-- 체크박스 체크 여부 -->
$('input:checkbox[name="authorCheck"]').each(function() {

    if (this.value == "1"){ // 값 비교
		this.checked = true; // checked 처리
    
    } else if (this.value == "0") {
    	this.checked = false;
	} 
});

<!-- 권한 수정 -->
$(".update_btn").on("click", function(){
	var list =[];
	
	$('input:checkbox[name="authorCheck"]').each(function(){
		
	  	if (this.checked == true){ 
			this.value = "1"; 
	    
	    } else if (this.checked == false) {
	    	this.value = "0";
		} 
		
		if(this.value == "1"){
			
			var getId = this.id;
			var memId = getId.split("-")[0];
			var division = getId.split("-")[1];
			
			var updateData = {id : memId, division : division, isAuthor : "Y"}
			list.push(updateData);
			
		} else if(this.value =="0"){
			
			var getId = this.id;
			var memId = getId.split("-")[0];
			var division = getId.split("-")[1];
			
			var updateData = {id : memId, division : division, isAuthor : "N"}
			list.push(updateData);
		}			
	});

	$.ajax({
		url :"/author/updateAuthor",
		type : "POST",
		dataType : "json",
		data : JSON.stringify(list),
		contentType: "application/json; charset=UTF-8",
		success : function(data) {
			if (data) {
				console.log("성공!");
			} else {
				console.log("실패..");
			}
		}
	});
});
</script>
