<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page import="java.util.*, java.text.*" %>

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
    <link rel="stylesheet" type="text/css" href="/resources/css/tab.css">

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
        <div class="content-wrapper container-xxl p-0" style="margin-left: 10px;">
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
                                    <li class="breadcrumb-item active">근태관리
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
            	<div class="container">
            	<div class="row" id="basic-table">
		           		
                <!-- Basic table -->
                <section id="basic-datatable">
                    <div class="row">
                        <div class="col-12">
                          <div class="card" id="tabVerticalRight1" role="tabpanel" aria-labelledby="baseVerticalRight-tab1" style="height:560px; width:1600px;">

                        	<div class="cardHeader-button" style="margin-bottom: 20px;">
                        		<div class="searchEmp">
                        			<input type="hidden" id="searchMonth" name="searchMonth" value="${searchMonth}">
<!-- 	                                <a style="font-size: 20px;" href="#" onclick="moveYear('l')"> &nbsp; < &nbsp; </a> -->
	                                <label style="font-size: 20px; width: 140px; margin-left: 30px; margin-top:10px;"   id="printMonth" >${printMonth}</label>
<!-- 	                                <a style="font-size: 20px;" href="#" onclick="moveYear('r')"> > </a> -->
	                        
                        		</div>
                        		
									<div class="workStyle" style="width:800px; margin-left: 1076px; margin-top: 23px;" >
										<span class="bullet bullet-dark font-small-3 me-50 " style="width: 10px;height:10px; margin-right:4px;"></span>출근
										<span class="bullet bullet-secondary font-small-3 me-50 " style="width: 10px;height:10px;margin-right:4px;"></span>조퇴
										<span class="bullet bullet-primary font-small-3 me-50 " style="width: 10px;height:10px;margin-right:4px;"></span>지각
										<span class="bullet bullet-info font-small-3 me-50 " style="width: 10px;height:10px;margin-right:4px;"></span>출장
										<span class="bullet bullet-success font-small-3 me-50 " style="width: 10px;height:10px;margin-right:4px;"></span>휴가
										<span class="bullet bullet-warning font-small-3 me-50 " style="width: 10px;height:10px;margin-right:4px;"></span>휴일
										<span class="bullet bullet-danger font-small-3 me-50 " style="width: 10px;height:10px;margin-right:4px;"></span>결근
									</div>

                        	</div>
                        	
					<div class="tab-1">
						<div class="tab-pane active" id="homeIcon" aria-labelledby="homeIcon-tab" role="tabpanel">
						
							<table class="datatables-basic table" id="empTable">
                               <thead>
	                                        <tr>
	                                            <th style="text-align: center;">사번</th>
	                                            <th style="text-align: center;">이름</th>
	                                            <th style="text-align: center;">부서</th>
	                                            <th style="text-align: center;">직급</th>
	                                            
	                                            <c:forEach begin="1" end="${lastDay}" var="day">
	                                            
	                                            	<th class="searchDay" style="width:1px; padding:10px;">${day}</th>
	                                            
	                                            </c:forEach>
	                                        </tr>
	                                    </thead>
								<tbody class="post">
								
								
								<c:forEach var="row" items="${empList.content}" varStatus="stat">
								
								<tr class="rowContent" onclick = "location.href='dclzListadmin?empNo=' + ${row.EMP_NO}" style = "cursor:pointer;">
									<td style="width:98px;text-align:center;">${row.EMP_NO}</td>
									<td style="width:125px;text-align:center; padding:10px;">${row.DEPT_NM}</td>
									<td style="width:100.89px;text-align:center; padding:10px;">${row.EMP_NM}</td>
									<td style="width:96.89px;text-align:center; ">${row.CLSF}</td>
									
									<c:forEach var="currDay" items="${dates}">
	                                     		                                     
	                                    <td id="stle" style="width:1px; padding:10px; font-size:3px;">
	                                 	<c:forEach var="workdates" items="${row.workdates}">
                                        	<c:if test="${workdates.WORK_DE eq currDay}">
		                                       <c:choose>
												<c:when test="${workdates.WORK_STLE_CODE eq 'W1'}"><span class="bullet bullet-dark font-small-3 me-50 cursor-pointer" style="width: 10px;height:10px;"></span></c:when>
												<c:when test="${workdates.WORK_STLE_CODE eq 'W2'}"><span class="bullet bullet-danger font-small-3 me-50 cursor-pointer" style="width: 10px;height:10px;"></span></c:when>
												<c:when test="${workdates.WORK_STLE_CODE eq 'W3'}"><span class="bullet bullet-secondary font-small-3 me-50 cursor-pointer" style="width: 10px;height:10px;"></span></c:when>
												<c:when test="${workdates.WORK_STLE_CODE eq 'W4'}"><span class="bullet bullet-success font-small-3 me-50 cursor-pointer" style="width: 10px;height:10px;"></span></c:when>
												<c:when test="${workdates.WORK_STLE_CODE eq 'W5'}"><span class="bullet bullet-primary font-small-3 me-50 cursor-pointer" style="width: 10px;height:10px;"></span></c:when>
												<c:when test="${workdates.WORK_STLE_CODE eq 'W6'}"><span class="bullet bullet-info font-small-3 me-50 cursor-pointer" style=" width: 10px; height:10px;"></span></c:when>
												<c:when test="${workdates.WORK_STLE_CODE eq 'W7'}"><span class="bullet bullet-warning font-small-3 me-50 cursor-pointer" style="width: 10px;height:10px;"></span></c:when>
												<c:otherwise> </c:otherwise>
											  </c:choose>    
		                                     
		                                     </c:if>		                                     
                                     	</c:forEach>
	                                    </td>
	                                            
	                                </c:forEach>
	                                            
								</tr>
								</c:forEach>
								</tbody>
							</table>
							<hr>
							<div class="cardFooter"  style="display: flex;justify-content: center;">
							</div>
						</div>
                  </div>
                 </div>
               
               <!-- 페이징 -->
			   <input type="hidden" value="1" id="pageDefault">
               <div class="col-lg-6 col-md-12">
                           <div class="paging" style="display: flex;justify-content: center; width:1450px;margin-left: -12px;">
                               <div style="display: flex;justify-content: center; padding:0px;">
                                   <ul class="pagination firstLast1-links">
                                    <li class="page-item first"><a href="managedclzList?currentPage=1" class="page-link">First</a></li>
                                    <li class="page-item prev <c:if test="${empList.startPage<=5}">disabled</c:if>">
                                       <a href="managedclzList?currentPage=${empList.startPage-5}" class="page-link">Prev</a>
                                    </li>
                                    <c:forEach var="page" begin="${empList.startPage}" end="${empList.endPage}">
                                       <li class="page-item <c:if test='${param.currentPage eq page}'>active</c:if>">
                                          <a href="managedclzList?currentPage=${page}" class="page-link">${page}</a>
                                       </li>
                                    </c:forEach>
                                    <li class="page-item next <c:if test="${empList.endPage>=empList.totalPages}">disabled</c:if>">
                                       <a href="managedclzList?currentPage=${empList.startPage+5}" class="page-link">Next</a>
                                    </li>
                                    <li class="page-item last"><a href="managedclzList?currentPage=${empList.totalPages}" class="page-link">Last</a></li>
                                   </ul>
                               </div>
                           </div>
              		 </div>
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
			
// 	 /** 월별 조회 **/
// 	 var date = new Date();
//      var searchMonth = document.getElementById("searchMonth").value;
//      var searchday = new Date(searchMonth);
     
//      var page = document.getElementById("pageDefault").value;
//      var searchMonth = searchday.getMonth();
     	
//      function moveYear(a){
//      	if(a == "l"){
//      		searchday.setMonth(searchday.getMonth()-1);
//      	}else if(a == "r"){
//      		searchday.setMonth(searchday.getMonth()+1);
//      	}
     	
// 	 	var year = searchday.getFullYear();
// 		var month = searchday.getMonth() +1 ;
// 		if(month<10){
// 			 month = "0"+month;
// 		 }
// 		document.getElementById("searchMonth").value = year+"-"+month; 
//      	document.getElementById("printMonth").innerHTML = year+"년 "+month+"월";
     	
      
//      	var data = {
//  			searchMonth : searchMonth,
// 			page : page    				
//  	  	}      

//      }


	 $(window).on('load', function() {
	     if (feather) {
	         feather.replace({
	             width: 14,
	             height: 14
	         });
	     }
	     var stle = document.getElementById("stle").innerText;
	     console.log("stle: "+ stle);
	 });
	 

</script>
</body>
<!-- END: Body-->

</html>