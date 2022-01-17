<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html class="loading" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
<style type="text/css">
.cardHeader-button{
	margin: 10px;
	display: flex;
    justify-content: space-between;
}
#deptSelect{
	width: 200px;
	margin-left: 20px;
}
.navigation li a i,
.navigation li a svg{
	height: 20px;
  	width: 20px;
}
.breadcrumb-wrapper{
	display: flex;
}
input::placeholder { text-align: center; }
.searchEmp{
	display:flex;
}

.rowContent:hover > * {
  background: whitesmoke;
  transition: transform 0.25s ease;
  transform: translateY(-1px); }

</style>
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
    <link rel="stylesheet" type="text/css" href="/resources/vendors/css/tables/datatable/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendors/css/tables/datatable/responsive.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendors/css/tables/datatable/buttons.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendors/css/tables/datatable/rowGroup.bootstrap4.min.css">
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
                <div class="content-header-left col-md-9 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="col-12">
                            <div class="breadcrumb-wrapper">
                            <h2 class="content-header-title float-left mb-0">관리자</h2>
                            <div class="breadcrumb-wrapper">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#" style="cursor: default;">근태관리</a>
                                    </li>
                                    <li class="breadcrumb-item active">휴가관리
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content-header-right text-md-right col-md-3 col-12 d-md-block d-none">
                </div>
            </div>
            <div class="content-body">
                <!-- Basic table -->
                <section id="basic-datatable">
                    <div class="row">
                        <div class="col-12">
                          <div class="card" id="tabVerticalRight1" role="tabpanel" aria-labelledby="baseVerticalRight-tab1" style="height: 650px;width:1450px;">
                        	<div class="cardHeader-button" style="margin-top: 20px;">
                        	<div style="display: flex; justify-content: space-between;">
								<h1 style="margin-left: 10px; padding:5px; font-size: 20px; margin-top: 5px;">연차 내역&nbsp;</h1>
								<input type="hidden" id="searchYear" name="searchYear" value="${nowYear}">
                                <a style="font-size: 20px; margin-top: 5px;" href="#" onclick="moveYear('l')"> &nbsp; < &nbsp; </a>
                                <label style="font-size: 20px; margin-top: 5px;"  id="printYear" >${nowYear}년</label>
                                <a style="font-size: 20px; margin-top: 5px;" href="#" onclick="moveYear('r')"> &nbsp; > </a>
								<p style="padding: 10px;"> &nbsp[ 연차는 회계년도 기준으로 관리됩니다. ]</p>
                        		<div class="searchEmp" style="margin-left: 470px;">
	                        		<select class="form-control form-control-lg" id="deptSelect" name="deptSelect" style="height: 37.98px; font-size: 14px; ">
	                                    <option value="default" selected >부서로 검색</option>
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
                        		
		                        		<input type="text" name="keyword" id="keyword" placeholder="직원 이름으로 검색" class="form-control" />

										<button type="button" class="btn btn-icon btn-outline-primary waves-effect" id="searchBtn" style="width: 45px;height: 38px;">
	                                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
	                                    </button>
                        		</div>
                        	</div>
                        		<c:if test="${!yearData}">
		                        	<button type="button" id="empAdd" class="create-new btn btn-primary"><span><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus mr-50 font-small-4"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>연차 일괄 등록</span></button>
                        		</c:if>
                        	</div>
                        	
					<div class="tab-content">
						<div class="tab-pane active" id="homeIcon" aria-labelledby="homeIcon-tab" role="tabpanel">
							<table class="datatables-basic table" id="empTable" style="border-bottom: 1px solid #ededed;">
                                <thead>
									<tr>
	                                    <th style="text-align:center;">직원번호</th>
										<th style="text-align:center;">부서</th>
										<th style="text-align:center;">이름</th>
										<th style="text-align:center;">직급</th>
										<th style="text-align:center;">입사일</th>
										<th style="text-align:center;">입사년차</th>
										<th style="text-align:center;">발생일수</th>
										<th style="text-align:center;">사용일수</th>
										<th style="text-align:center;">잔여일수</th>
                                    </tr>
                                </thead>
								<tbody class="post">
								<c:if test="${fn:length(empList.content) <= 0}">
									<tr><td colspan='7' style='text-align:center;'>위의 '연차 일괄 등록' 버튼을 눌러 해당 연도의 연차 정보를 등록해주세요.</td></tr>
								</c:if>
								<c:forEach var="row" items="${empList.content}" varStatus="stat">
								<tr class="rowContent" style="height: 48px;">
									<td style="width:150px;text-align: center;">${row.EMP_NO}</td>
									<td style="width:150px;text-align: center;">${row.DEPT_NM}</td>
									<td style="width:150px;text-align: center;">${row.EMP_NM}</td>
									<td style="width:150px;text-align: center;">${row.CLSF}</td>
									<td style="width:200px;text-align: center;">${row.ENCPN_DE}</td>
									<td style="width:150px;text-align: center;">${row.workyear}</td>
									<td style="width:100px;text-align: center;">${row.OCCRRNC_DAYCNT}</td>
									<td style="width:100px;text-align: center;">${row.USE_DAYCNT}</td>
									<td style="width:100px;text-align: center;">${row.REMNDR_DAYCNT}</td>
								</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
                  </div>
                     </div>
                     <!-- 페이징 -->
							<c:if test="${fn:length(empList.content) > 0}">
								<input type="hidden" value="1" id="pageDefault">
               <div class="col-lg-6 col-md-12">
                           <div class="paging" style="display: flex;justify-content: center; width:1450px;margin-left: -12px;">
                               <div style="display: flex;justify-content: center; padding:0px;">
                                   <ul class="pagination firstLast1-links">
                                    <li class="page-item first"><a href="vcatnadmin?currentPage=1" class="page-link">First</a></li>
                                    <li class="page-item prev <c:if test="${empList.startPage<=5}">disabled</c:if>">
                                       <a href="vcatnadmin?currentPage=${empList.startPage-5}" class="page-link">Prev</a>
                                    </li>
                                    <c:forEach var="page" begin="${empList.startPage}" end="${empList.endPage}">
                                       <li class="page-item <c:if test='${param.currentPage eq page}'>active</c:if>">
                                          <a href="vcatnadmin?currentPage=${page}" class="page-link">${page}</a>
                                       </li>
                                    </c:forEach>
                                    <li class="page-item next <c:if test="${empList.endPage>=empList.totalPages}">disabled</c:if>">
                                       <a href="vcatnadmin?currentPage=${empList.startPage+5}" class="page-link">Next</a>
                                    </li>
                                    <li class="page-item last"><a href="vcatnadmin?currentPage=${empList.totalPages}" class="page-link">Last</a></li>
                                   </ul>
                               </div>
                           </div>
               </div>
							</c:if>
                        	<!-- 페이징 끝 -->
                  </div>
              </div>
          </section>
                        	
                        	
                <div class="modal fade text-left modal-primary keyword" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-centered" role="document">
				        <div class="modal-content">
				            <div class="modal-header" style="justify-content: center;">
				                <h5 class="modal-title" id="myModalLabel140" style="text-align: center; center;font-size: 13px;">직원 이름 검색 안내</h5>
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                    <span aria-hidden="true">&times;</span>
				                </button>
				            </div>
				            <div class="modal-body" style="text-align: center;font-size: 15px;">
				                검색어를 입력해주세요.
				            </div>
				            <div class="modal-footer" style="justify-content: center;">
				                <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
				            </div>
				        </div>
				    </div>
				</div>
				
				<div class="modal fade text-left modal-primary after" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-centered" role="document">
				        <div class="modal-content">
				            <div class="modal-header" style="justify-content: center;">
				                <h5 class="modal-title" id="myModalLabel140" style="text-align: center; center;font-size: 13px;">안내사항</h5>
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                    <span aria-hidden="true">&times;</span>
				                </button>
				            </div>
				            <div class="modal-body" style="text-align: center;font-size: 15px;">
				                당해년도까지만 검색이 가능합니다.
				            </div>
				        </div>
				    </div>
				</div>
				
				<div class="modal fade text-left modal-primary select2" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-centered" role="document">
				        <div class="modal-content">
				            <div class="modal-header" style="justify-content: center;">
				                <h5 class="modal-title" id="myModalLabel140" style="text-align: center; center;font-size: 13px;">안내사항</h5>
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                    <span aria-hidden="true">&times;</span>
				                </button>
				            </div>
				            <div class="modal-body" style="text-align: center;font-size: 15px;">
				                현재년도로부터 5년전까지만 검색이 가능합니다.
				            </div>
				        </div>
				    </div>
				</div>              	
                        	
                        	
                        	
                        	

            </div>
        </div>
    </div>
    <!-- END: Content-->

    <script src="/resources/vendors/js/jquery/jquery.min.js"></script>

    <!-- BEGIN: Vendor JS-->
    <script src="/resources/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="/resources/vendors/js/ui/jquery.sticky.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="/resources/js/core/app-menu.js"></script>
    <script src="/resources/js/core/app.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
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
    <!-- END: Page JS-->

<script>

	$('#deptSelect').on('change', function(){
		deptSelectAjax(1);
	})
	function deptSelectAjax(page){
		var deptCode = $("#deptSelect").val();
		var deptNm = $("#deptSelect option:checked").text();
	 	if(deptCode == "ALL" || deptCode == "default"){
	 		location.href = "vcatnadmin"
	 	}else{
	  		var data = {
				deptCode : $("#deptSelect").val(),
				deptNm : $("#deptSelect option:checked").text(),
				page : page,
				searchYear : searchYear
	  	}
	  	$.ajax({
	  		url:"vcatnSelectByDept",
	  		type:"POST",
	  		data: JSON.stringify(data),
	  		contentType : "application/json; charset=utf-8",
	  		dataType:"json",
	  		success:function(result){
	  			var thead = "";
	  			var tbody = "";
	  			var pageStr = '<div class="card-body" style="display: flex;justify-content: center; padding:0px;margin-top: 10px;"><ul class="pagination firstLast1-links">';
	  			$(".nav-tabs").html("");
	  			thead += "<tr>";
				thead += "<th style='text-align:center;'>직원번호</th>";
				thead += "<th style='text-align:center;'>부서</th>";
				thead += "<th style='text-align:center;'>이름</th>";
				thead += "<th style='text-align:center;'>직급</th>";
				thead += "<th style='text-align:center;'>입사일</th>";
				thead += "<th style='text-align:center;'>입사년차</th>";
				thead += "<th style='text-align:center;'>발생일수</th>";
				thead += "<th style='text-align:center;'>사용일수</th>";
				thead += "<th style='text-align:center;'>잔여일수</th>";
				thead += "</tr>";
	  			$.each(result.content, function(i,v){
	  				tbody += "<tr class='rowContent'> ";
	  				tbody += "<td style='text-align:center;width:207.14px;'>" + v.EMP_NO + "</td>";
	  				tbody += "<td style='text-align:center;width:207.14px;'>" + v.DEPT_NM + "</td>";
	  				tbody += "<td style='text-align:center;width:207.14px;'>" + v.EMP_NM + "</td>";
	  				tbody += "<td style='text-align:center;width:207.14px;'>" + v.CLSF + "</td>";
	  				tbody += "<td style='text-align:center;width:207.14px;'>" + v.ENCPN_DE + "</td>";
	  				tbody += "<td style='text-align:center;width:207.14px;'>" + v.workyear + "</td>";
	  				tbody += "<td style='text-align:center;width:116px;'>" + v.OCCRRNC_DAYCNT + "</td>"
					tbody += "<td style='text-align:center;width:116px;'>" + v.USE_DAYCNT + "</td>"
					tbody += "<td style='text-align:center;width:116px;'>" + v.OCCRRNC_DAYCNT + "</td></tr>"
	  				
	  			});
	  			pageStr += '<li class="page-item first"><a href="javascript:deptSelectAjax(1)" class="page-link">First</a></li>';
	  			pageStr += '<li class="page-item prev '
	  			if(result.startPage<=5){pageStr += 'disabled'}
	  			pageStr += '">';
	  			pageStr += '<a href="javascript:deptSelectAjax('+(result.startPage-5)+')" class="page-link">Prev</a></li>';
	  			for(var s=result.startPage; s <= result.endPage; s++){
	  				pageStr += '<li class="page-item '
	  				if(result.currentPage==s){pageStr += 'active'}
	  				pageStr += '">';
	  				pageStr += '<a href="javascript:deptSelectAjax('+s+')" class="page-link">'+s+'</a></li>'
	  			}
	  			pageStr += '<li class="page-item next ';
	  			if(result.endPage >= result.totalPages){pageStr += 'disabled'} 
	  			pageStr += '">';
	  			pageStr += '<a href="javascript:deptSelectAjax('+(result.startPage+5)+')" class="page-link">Next</a></li>'
	  			pageStr += '<li class="page-item last">'
	  			pageStr += '<a href="javascript:deptSelectAjax('+result.endPage+')" class="page-link">Last</a></li>'
	  			pageStr += '</ul></div>'
				
	  			$("thead").html(thead);
				$("tbody").html(tbody);
	  			$(".paging").html(pageStr);
	  		},
	  		error:function(xhr, status) {
	  			alert(xhr + " : " + status);
	  		}
	  	});
		}
	} 
	
	/** 년도별 조회 **/
	 var date = new Date();
     var nowCal = date.getFullYear();
     var searchYear = document.getElementById("searchYear").value;
     var page = document.getElementById("pageDefault").value;
     	
     function moveYear(a){
     	if(a == "l" && (nowCal - 5) <= Number(searchYear)){
     		searchYear = Number(searchYear)-1;
     	}else if(a == "r" && (nowCal) > Number(searchYear)){
     		searchYear = Number(searchYear)+1;
     	}else if(a =="r" && (nowCal) <= Number(searchYear)){
     		$(".after").modal();
     	}else{
     		$(".select2").modal();
     		return;
     	}
     	document.getElementById("printYear").innerHTML = searchYear + "년";
      
     	var data = {
 				searchYear : searchYear,
					page : page    				
 	  	}
     	
     	$.ajax({
			type:'POST',
			url:"vcatnadmintYear",
			contentType : "application/json; charset=utf-8",
			data:JSON.stringify(data),
			success:function(result){
				console.log(result.content);
				var thead = "";
				var tbody = "";
				var pageStr = '<div class="card-body" style="display: flex;justify-content: center; padding:0px;margin-top: 10px;"><ul class="pagination firstLast1-links">';
				$(".nav-tabs").html("");
				if(result.content.length){
					thead += "<tr>";
					thead += "<th style='text-align:center;'>직원번호</th>";
					thead += "<th style='text-align:center;'>부서</th>";
					thead += "<th style='text-align:center;'>이름</th>";
					thead += "<th style='text-align:center;'>직급</th>";
					thead += "<th style='text-align:center;'>입사일</th>";
					thead += "<th style='text-align:center;'>입사년차</th>";
					thead += "<th style='text-align:center;'>발생일수</th>";
					thead += "<th style='text-align:center;'>사용일수</th>";
					thead += "<th style='text-align:center;'>잔여일수</th>";
					thead += "</tr>";
					$.each(result.content, function(i,v){
						tbody += "<tr class='rowContent'>"
							tbody += "<td style='text-align:center;width:174px;'>" + v.EMP_NO + "</td>"
							tbody += "<td style='text-align:center;width:174px;'>" + v.DEPT_NM + "</td>"
							tbody += "<td style='text-align:center;width:174px;'>" + v.EMP_NM + "</td>"
							tbody += "<td style='text-align:center;width:174px;'>" + v.CLSF + "</td>"
							tbody += "<td style='text-align:center;width:232px;'>" + v.ENCPN_DE + "</td>"
							tbody += "<td style='text-align:center;width:174px;'>" + v.workyear + "</td>"
							tbody += "<td style='text-align:center;width:116px;'>" +v.OCCRRNC_DAYCNT + "</td>"
							tbody += "<td style='text-align:center;width:116px;'>" +v.USE_DAYCNT + "</td>"
							tbody += "<td style='text-align:center;width:116px;'>" +v.OCCRRNC_DAYCNT + "</td></tr>"
					});
				}else if(result.content.length == 0){
					thead += "<tr>";
					thead += "<th style='text-align:center;width:174px;'>직원번호</th>";
					thead += "<th style='text-align:center;width:174px;'>부서</th>";
					thead += "<th style='text-align:center;width:174px;'>이름</th>";
					thead += "<th style='text-align:center;width:174px;'>직급</th>";
					thead += "<th style='text-align:center;width:232px;'>입사일</th>";
					thead += "<th style='text-align:center;width:174px;'>입사년차</th>";
					thead += "<th style='text-align:center;width:116px;'>발생일수</th>";
					thead += "<th style='text-align:center;width:116px;'>사용일수</th>";
					thead += "<th style='text-align:center;width:116px;'>잔여일수</th>";
					thead += "</tr>";
					tbody += "<tr><td colspan='9' style='text-align:center;'>검색결과가 없습니다.</td></tr>";
				}
				pageStr += '<li class="page-item first"><a href="javascript:search(1)" class="page-link">First</a></li>';
				pageStr += '<li class="page-item prev '
				if(result.startPage<=5){pageStr += 'disabled'}
				pageStr += '">';
				pageStr += '<a href="javascript:search('+(result.startPage-5)+')" class="page-link">Prev</a></li>';
				for(var s=result.startPage; s <= result.endPage; s++){
					pageStr += '<li class="page-item '
					if(result.currentPage==s){pageStr += 'active'}
					pageStr += '">';
					pageStr += '<a href="javascript:search('+s+')" class="page-link">'+s+'</a></li>'
				}
				pageStr += '<li class="page-item next ';
				if(result.endPage >= result.totalPages){pageStr += 'disabled'} 
				pageStr += '">';
				pageStr += '<a href="javascript:search('+result.startPage+5+')" class="page-link">Next</a></li>'
				pageStr += '<li class="page-item last">'
				pageStr += '<a href="javascript:search('+result.endPage+')" class="page-link">Last</a></li>'
				pageStr += '</ul></div>'
				
				$(".paging").html(pageStr);
				$("thead").html(thead);
				$("tbody").html(tbody);
				console.log(result);
			},
			error : function(xhr, status) {
			      	
			}
		});
     }
	       
	function search(page){
		var data = {
				keyword : $("#keyword").val(),
				page : page,
				searchYear : searchYear
		}
		$.ajax({
			type:'POST',
			url:"vcatnadminSearch",
			contentType : "application/json; charset=utf-8",
			data:JSON.stringify(data),
			success:function(result){
				console.log(result.content);
				var thead = "";
				var tbody = "";
				var pageStr = '<div class="card-body" style="display: flex;justify-content: center; padding:0px;margin-top: 10px;"><ul class="pagination firstLast1-links">';
				$(".nav-tabs").html("");
				if(result.content.length){
					thead += "<tr>";
					thead += "<th style='text-align:center;'>직원번호</th>";
					thead += "<th style='text-align:center;'>부서</th>";
					thead += "<th style='text-align:center;'>이름</th>";
					thead += "<th style='text-align:center;'>직급</th>";
					thead += "<th style='text-align:center;'>입사일</th>";
					thead += "<th style='text-align:center;'>입사년차</th>";
					thead += "<th style='text-align:center;'>발생일수</th>";
					thead += "<th style='text-align:center;'>사용일수</th>";
					thead += "<th style='text-align:center;'>잔여일수</th>";
					thead += "</tr>";
					$.each(result.content, function(i,v){
						tbody += "<tr class='rowContent'>"
							tbody += "<td style='text-align:center;width:174px;'>" + v.EMP_NO + "</td>"
							tbody += "<td style='text-align:center;width:174px;'>" + v.DEPT_NM + "</td>"
							tbody += "<td style='text-align:center;width:174px;'>" + v.EMP_NM + "</td>"
							tbody += "<td style='text-align:center;width:174px;'>" + v.CLSF + "</td>"
							tbody += "<td style='text-align:center;width:232px;'>" + v.ENCPN_DE + "</td>"
							tbody += "<td style='text-align:center;width:174px;'>" + v.workyear + "</td>"
							tbody += "<td style='text-align:center;width:116px;'>" +v.OCCRRNC_DAYCNT + "</td>"
							tbody += "<td style='text-align:center;width:116px;'>" +v.USE_DAYCNT + "</td>"
							tbody += "<td style='text-align:center;width:116px;'>" +v.OCCRRNC_DAYCNT + "</td></tr>"
					});
				}else if(result.content.length == 0){
					thead += "<tr>";
					thead += "<th style='text-align:center;width:174px;'>직원번호</th>";
					thead += "<th style='text-align:center;width:174px;'>부서</th>";
					thead += "<th style='text-align:center;width:174px;'>이름</th>";
					thead += "<th style='text-align:center;width:174px;'>직급</th>";
					thead += "<th style='text-align:center;width:232px;'>입사일</th>";
					thead += "<th style='text-align:center;width:174px;'>입사년차</th>";
					thead += "<th style='text-align:center;width:116px;'>발생일수</th>";
					thead += "<th style='text-align:center;width:116px;'>사용일수</th>";
					thead += "<th style='text-align:center;width:116px;'>잔여일수</th>";
					thead += "</tr>";
					tbody += "<tr><td colspan='9' style='text-align:center;'>검색결과가 없습니다.</td></tr>";
				}
				pageStr += '<li class="page-item first"><a href="javascript:search(1)" class="page-link">First</a></li>';
				pageStr += '<li class="page-item prev '
				if(result.startPage<=5){pageStr += 'disabled'}
				pageStr += '">';
				pageStr += '<a href="javascript:search('+(result.startPage-5)+')" class="page-link">Prev</a></li>';
				for(var s=result.startPage; s <= result.endPage; s++){
					pageStr += '<li class="page-item '
					if(result.currentPage==s){pageStr += 'active'}
					pageStr += '">';
					pageStr += '<a href="javascript:search('+s+')" class="page-link">'+s+'</a></li>'
				}
				pageStr += '<li class="page-item next ';
				if(result.endPage >= result.totalPages){pageStr += 'disabled'} 
				pageStr += '">';
				pageStr += '<a href="javascript:search('+result.startPage+5+')" class="page-link">Next</a></li>'
				pageStr += '<li class="page-item last">'
				pageStr += '<a href="javascript:search('+result.endPage+')" class="page-link">Last</a></li>'
				pageStr += '</ul></div>'
				
				$(".paging").html(pageStr);
				$("thead").html(thead);
				$("tbody").html(tbody);
				console.log(result);
			},
			error : function(xhr, status) {
			      	
			}
		});
	}
	       
	$("#searchBtn").on("click",function(){
		console.log("click");
		if($("#keyword").val() == ""){
			$(".keyword").modal();
			return false;
		}
		search(1);
	});
	$("#keyword").keyup(function(event) {
	    if (event.keyCode === 13) {
	    	if($("#keyword").val() == ""){
	    		$(".keyword").modal();
	    		return false;
	    	}
	    	search(1);
	    }
	});
</script>
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
	$("#empAdd").on("click", function(){
		$.ajax({
			type:'POST',
			url:"vcatnAdminInsert",
			contentType : "application/json; charset=utf-8",
			success:function(result){
				location.replace("vcatnadmin?currentPage=1");
									}
		});
		
	});
});
</script>
</body>
<!-- END: Body-->

</html>