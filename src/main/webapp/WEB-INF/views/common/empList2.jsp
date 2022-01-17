<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
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

</style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=0,minimal-ui">
    <meta name="description" content="Vuexy admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
    <meta name="keywords" content="admin template, Vuexy admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="PIXINVENT">
    <title>Input - Vuexy - Bootstrap HTML admin template</title>
    <link rel="apple-touch-icon" href="/resources/images/ico/apple-icon-120.png">
    
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
    <ul class="main-search-list-defaultlist-other-list d-none">
        <li class="auto-suggestion justify-content-between"><a class="d-flex align-items-center justify-content-between w-100 py-50">
                <div class="d-flex justify-content-start"><span class="mr-75" data-feather="alert-circle"></span><span>No results found.</span></div>
            </a></li>
    </ul>
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
                            <h2 class="content-header-title float-left mb-0">직원목록</h2>
                            <div class="breadcrumb-wrapper">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">전체</a>
                                    </li>
                                </ol>
                                <select class="form-control form-control-lg" id="deptSelect" name="deptSelect">
                                    <option selected>부서를 선택하세요</option>
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
                            <div class="card">
<!--                             <div class="cardHeader-select"> -->
<!--                             </div> -->
                        	<div class="cardHeader-button">
	                        	<button type="button" id="empAdd" class="create-new btn btn-primary"><span><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus mr-50 font-small-4"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>직원 등록</span></button>
                        		<div class="searchEmp">
	                        		<input type="text" name="keyword" id="keyword" placeholder="직원 이름으로 검색" class="form-control"/>
									<button type="button" class="btn btn-icon btn-outline-primary waves-effect" id="searchBtn">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                                    </button>
                        		</div>
                        	</div>
                                <table class="datatables-basic table">
                                    <thead>
                                        <tr>
                                            <th>직원번호</th>
											<th>부서</th>
											<th>이름</th>
											<th>직급</th>
											<th>내선번호</th>
											<th>입사일</th>
                                        </tr>
                                    </thead>
                                    <tbody class="post">
<%-- 										<c:forEach var="row" items="${empList}" varStatus="stat"> --%>
<!-- 											<tr> -->
<%-- 												<td>${row.EMP_NO}</td> --%>
<%-- 												<td>${row.DEPT_NM}</td> --%>
<%-- 												<td>${row.EMP_NM}</td> --%>
<%-- 												<td>${row.CLSF}</td> --%>
<%-- 												<td>${row.LXTN_NO}</td> --%>
<%-- 												<td>${row.ENCPN_DE}</td> --%>
<!-- 											</tr> -->
<%-- 										</c:forEach> --%>
									</tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- Modal to add new record -->
                </section>
                <!--/ Basic table -->

                <!-- Complex Headers -->
                <!--/ Complex Headers -->

                <!-- Row grouping -->
                <!--/ Row grouping -->

                <!-- Multilingual -->
                <!--/ Multilingual -->

            </div>
        </div>
    </div>
    <!-- END: Content-->

    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

    <!-- BEGIN: Footer-->
    <footer class="footer footer-static footer-light">
        <p class="clearfix mb-0"><span class="float-md-left d-block d-md-inline-block mt-25">COPYRIGHT &copy; 2021<a class="ml-25" href="https://1.envato.market/pixinvent_portfolio" target="_blank">Pixinvent</a><span class="d-none d-sm-inline-block">, All rights Reserved</span></span><span class="float-md-right d-none d-md-block">Hand-crafted & Made with<i data-feather="heart"></i></span></p>
    </footer>
    <button class="btn btn-primary btn-icon scroll-top" type="button"><i data-feather="arrow-up"></i></button>
    <!-- END: Footer-->


    <!-- BEGIN: Vendor JS-->
    <script src="/resources/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="/resources/js/core/app-menu.js"></script>
    <script src="/resources/js/core/app.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <script src="/resources/vendors/js/ui/jquery.sticky.js"></script>
    <script src="/resources/vendors/js/jquery/jquery.min.js"></script>
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
    <!-- END: Page JS-->

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
	    		 location.href = "/hr/empAddForm";
	    	 });
	     });
        $(function(){
        	$('#deptSelect').on('change', function(){
        		var deptCode = $(this).val();
//              console.log($('#coin_code').val());
			if(deptCode != null || deptCode != "null" || deptCode != ""){
	             $.ajax({
	                url:"/hr/selectByDept",
	                data:{deptCode: $('#deptSelect').val()},
	                dataType:'json',
	                type:"get",
	                success: function(list){
	                   post = "";
	                   $.each(list,function(i,v){
	                      post +="<tr>";
	                      post += "<td>" + v.get("EMP_NO") + "</td>";
	                      post +="<td>" + v.get("EMP_NM") + "</td>";
	                      post +="<td>" + v.get("DEPT_NM") + "</td>";
	                      post +="<td>" + v.get("CLSF") + "</td>";
	                      post +="<td>" + v.get("LXTN_NO") + "</td>";
	                      post +="<td>" + v.get("ENCPN_DE") + "</td>";
	                      post += "</tr>";
	                      
	                      console.log(v.get("EMP_NO"));
	                   });
	                   
	                   $('.post').html(post);
	                   
	                },
	                error: function(xhr){
	                   console.log(xhr);
	                }
	                
	             });
			} // null check if
          
          });
        });
    </script>
</body>
<!-- END: Body-->

</html>