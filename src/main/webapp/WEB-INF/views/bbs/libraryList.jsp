<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html class="loading" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
<style type="text/css">
.cardHeader-button{
	margin: 15px;
	display: flex;
    justify-content: space-between;
    align-items: center;
}
.seachLibrary{
	padding-top: 10px;
	display:flex;
}
#searchFilter{ 
	width: 165px;
    height: 40px;
}
#keyword, #searchBtn{
	height: 40px;
}
#searchBtn{
	width: 45px;
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
                            	<a href="/bbs/libraryList"><h2 class="content-header-title float-left mb-0" style="margin-left: 70px;">자료실</h2></a>
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
                 <div class="col-12">
					<div class="noPaging" style="display:flex; justify-content: center;">
                          <div class="card" id="tabVerticalRight1" role="tabpanel" aria-labelledby="baseVerticalRight-tab1" style="height: 575px;width: 1300px;">
                        	<div class="cardHeader-button">
                        		<div class="seachLibrary">
                        			<select class="form-control mb-1" id="searchFilter" name="searchFilter">
	                                    <option value="sj_cn" selected>제목+내용</option>
	                                    <option value="sj">제목</option>
	                                    <option value="cn">내용</option>
	                                    <option value="emp">작성자</option>
	                                </select>
	                        		<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요." class="form-control" />

									<button type="button" class="btn btn-icon btn-outline-primary waves-effect" id="searchBtn">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                                    </button>
                        		</div>
		                        	<button type="button" id="libraryAdd" class="create-new btn btn-primary"><span><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus mr-50 font-small-4"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>글쓰기</span></button>
                        	</div>
                        	
					<div class="tab-content">
						<div class="tab-pane active">
							<table class="datatables-basic table" id="libraryTable">
                                <thead>
									<tr>
	                                    <th style="text-align:center;">번호</th>
										<th style="text-align:center;">제목</th>
										<th style="text-align:center;">작성자</th>
										<th style="text-align:center;">날짜</th>
										<th style="text-align:center;">조회</th>
                                    </tr>
                                </thead>
								<tbody class="post">
								<c:forEach var="row" items="${list.content}" varStatus="stat">
								<tr class="rowContent" onclick = "location.href='/bbs/libraryView?bbscttSn=' + ${row.BBSCTT_SN}" style = "cursor:pointer;">
									<td style="width:50px;text-align: center;">${row.RNUM}</td>
									<td style="width:400px;text-align: left;">${row.BBSCTT_SJ}</td>
									<td style="width:50px;text-align: center;">${row.EMP_NM}</td>
									<td style="width:100px;text-align: center;">${row.WRITNG_DE}</td>
									<td style="width:50px;text-align: center;">${row.BBSCTT_RDCNT}</td>
								</tr>
								</c:forEach>
								</tbody>
							</table>
					<hr style="margin-top: 0.2rem;">
						</div>
                               
                           </div>
                        </div>
                   </div>
						<!-- 페이징 -->
						<input type="hidden" value="1" id="pageDefault">
						<div class="col-lg-6 col-md-12">
                           <div class="paging" style="display: flex;justify-content: center; width:1300px;">
                               <div style="display: flex;justify-content: center; padding:0px;margin-top: 10px;">
                                   <ul class="pagination firstLast1-links">
                                    <li class="page-item first"><a href="/bbs/libraryList?currentPage=1" class="page-link">First</a></li>
                                    <li class="page-item prev <c:if test="${list.startPage<=5}">disabled</c:if>">
                                    	<a href="/bbs/libraryList?currentPage=${list.startPage-5}" class="page-link">Prev</a>
                                    </li>
                                    <c:forEach var="page" begin="${list.startPage}" end="${list.endPage}">
                                    	<li class="page-item <c:if test='${param.currentPage eq page}'>active</c:if>">
                                    		<a href="/bbs/libraryList?currentPage=${page}" class="page-link">${page}</a>
                                    	</li>
                                    </c:forEach>
                                    <li class="page-item next <c:if test="${list.endPage>=list.totalPages}">disabled</c:if>">
                                    	<a href="/bbs/libraryList?currentPage=${list.startPage+5}" class="page-link">Next</a>
                                    </li>
                                    <li class="page-item last"><a href="/bbs/libraryList?currentPage=${list.totalPages}" class="page-link">Last</a></li>
                                   </ul>
                               </div>
                           </div>
                       	</div>
                       	<!-- 페이징 끝 -->
                    </div>
                </section>
                        	
                        	
                <div class="modal fade text-left modal-primary keyword" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-centered" role="document">
				        <div class="modal-content">
				            <div class="modal-header" style="justify-content: center;">
				                <h5 class="modal-title" id="myModalLabel140" style="text-align: center; center;font-size: 13px;">검색 오류</h5>
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                    <span aria-hidden="true">&times;</span>
				                </button>
				            </div>
				            <div class="modal-body" style="text-align: center;font-size: 15px;">
				                검색어를 입력해주세요.
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
        $(window).on('load', function() {
            if (feather) {
                feather.replace({
                    width: 14,
                    height: 14
                });
            }
        });
        $(function(){
	    	 $("#libraryAdd").on("click", function(){
	    		 location.href = "/bbs/libraryWriteForm";
	    	 });
	     });
        
        function search(pageValue){
        	var data = {
        			filter : $("#searchFilter").val(),
        			keyword : $("#keyword").val(),
        			page : pageValue
        	}
        	$.ajax({
				url:"/bbs/librarySearch",
				type:"POST",
				contentType : "application/json; charset=utf-8",
				data: JSON.stringify(data),
				success:function(result){
					console.log(result);
					var tbody = "";
					var pageStr = '<div class="card-body" style="display: flex;justify-content: center; padding:0px;margin-top: 10px;"><ul class="pagination firstLast1-links">';
					if(result.content.length){
						$.each(result.content, function(i,v){
							tbody += "<tr class='rowContent' onclick = location.href='/bbs/libraryView?bbscttSn=" + v.BBSCTT_SN + "' style = 'cursor:pointer;'>"
							tbody += "<td style='width:50px;text-align: center;'>" + v.RNUM + "</td>"
							tbody += "<td style='width:400px;text-align: left;'>" + v.BBSCTT_SJ + "</td>"
							tbody += "<td style='width:50px;text-align: center;'>" + v.EMP_NM + "</td>"
							tbody += "<td style='width:100px;text-align: center;'>" + v.WRITNG_DE + "</td>"
							tbody += "<td style='width:50px;text-align: center;'>" + v.BBSCTT_RDCNT + "</td>"
						});
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
						pageStr += '<a href="javascript:search('+result.totalPages+')" class="page-link">Last</a></li>'
						pageStr += '</ul></div>'
					}else if(result.content.length == 0){
						tbody += "<tr><td colspan='7' style='text-align:center;'>검색결과가 없습니다.</td></tr>";
					}
					$("tbody").html(tbody);
					$(".paging").html(pageStr);
				},
				error : function(xhr, status) {
					alert(xhr + ":" + status)
   				}
     	   });
        }
        
    $("#searchBtn").on("click",function(){
    	console.log("click");
    	search($("#pageDefault").val());
    });
	$("#keyword").keyup(function(event) {
	    if (event.keyCode === 13) {
	    	search($("#pageDefault").val());
	    }
	});
    </script>
</body>
<!-- END: Body-->

</html>