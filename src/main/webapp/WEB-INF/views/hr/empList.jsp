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
#keyword{
width: 240px;
}
#keyword, #searchBtn, #empAdd{
height: 40px;
}
#searchBtn{
width: 35px;
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
<!--                         <div class="col-12" style="display:flex;"> -->
                            <div class="breadcrumb-wrapper">
                            <a href="/hr/empList?currentPage=1"><h2 class="content-header-title float-left mb-0" style="padding-top: 8px;">직원관리</h2></a>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item" style="padding-top: 8px;"><a href="#" class="deptNm">전체</a>
                                    </li>
                                </ol>
                                <select class="form-control form-control-lg" id="deptSelect" name="deptSelect">
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
                          <div class="card" id="tabVerticalRight1" role="tabpanel" aria-labelledby="baseVerticalRight-tab1" style="height: 584px;width:1450px;">
                             <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="homeIcon-tab" data-toggle="tab" onclick="ingList(${page});" aria-controls="home" role="tab" aria-selected="true"><i data-feather='user'></i> 재직자</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profileIcon-tab" data-toggle="tab" onclick="retireList(1);" aria-controls="profile" role="tab" aria-selected="false" ><i data-feather='slash'></i> 퇴직자</a>
                                </li>
                            </ul>
                           <div class="cardHeader-button" style="margin-bottom: 20px; padding-left: 10px;padding-right: 10px;">
                              <div class="searchEmp">
                                    <input type="text" name="keyword" id="keyword" placeholder="직원 이름 또는 사번으로 검색" class="form-control" />

                              <button type="button" class="btn btn-icon btn-outline-primary waves-effect" id="searchBtn">
                                           <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                                       </button>
                              </div>
                              <button type="button" id="empAdd" class="create-new btn btn-primary"><span><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus mr-50 font-small-4"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>직원 등록</span></button>
                           </div>
                           
               <div class="tab-content">
                  <div class="tab-pane active" id="homeIcon" aria-labelledby="homeIcon-tab" role="tabpanel">
                     <table class="datatables-basic table" id="empTable">
                                <thead>
                           <tr>
                                       <th style="text-align:center;"></th>
                                       <th style="text-align:center;">직원번호</th>
                              <th style="text-align:center;">부서</th>
                              <th style="text-align:center;">이름</th>
                              <th style="text-align:center;">직급</th>
                              <th style="text-align:center;">내선번호</th>
                              <th style="text-align:center;">입사일</th>
                                    </tr>
                                </thead>
                        <tbody class="post">
                        <c:forEach var="row" items="${empList.content}" varStatus="stat">
                        <tr class="rowContent" onclick = "location.href='/hr/empEditForm?empNo=' + ${row.EMP_NO}" style = "cursor:pointer;">
                           <td style="width:4%;text-align: center; padding-left: 20px;">${row.RNUM}</td>
                           <td style="width:16%;text-align: center;">${row.EMP_NO}</td>
                           <td style="width:16%;text-align: center;">${row.DEPT_NM}</td>
                           <td style="width:16%;text-align: center;">${row.EMP_NM}</td>
                           <td style="width:16%;text-align: center;">${row.CLSF}</td>
                           <td style="width:16%;text-align: center;">${row.LXTN_NO}</td>
                           <td style="width:16%;text-align: center;">${row.ENCPN_DE}</td>
                        </tr>
                        </c:forEach>
                        </tbody>
                     </table>
                     <hr style="margin-top: 0.2rem;">
                  </div>
                     </div>
                     </div>
               <!-- 페이징 -->
               <input type="hidden" value="1" id="pageDefault">
               <div class="col-lg-6 col-md-12">
                           <div class="paging" style="display: flex;justify-content: center; width:1450px;margin-left: -12px;">
                               <div style="display: flex;justify-content: center; padding:0px;">
                                   <ul class="pagination firstLast1-links">
                                    <li class="page-item first"><a href="/hr/empList?currentPage=1" class="page-link">First</a></li>
                                    <li class="page-item prev <c:if test="${empList.startPage<=5}">disabled</c:if>">
                                       <a href="/hr/empList?currentPage=${empList.startPage-5}" class="page-link">Prev</a>
                                    </li>
                                    <c:forEach var="page" begin="${empList.startPage}" end="${empList.endPage}">
                                       <li class="page-item <c:if test='${param.currentPage eq page}'>active</c:if>">
                                          <a href="/hr/empList?currentPage=${page}" class="page-link">${page}</a>
                                       </li>
                                    </c:forEach>
                                    <li class="page-item next <c:if test="${empList.endPage>=empList.totalPages}">disabled</c:if>">
                                       <a href="/hr/empList?currentPage=${empList.startPage+5}" class="page-link">Next</a>
                                    </li>
                                    <li class="page-item last"><a href="/hr/empList?currentPage=${empList.totalPages}" class="page-link">Last</a></li>
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
                            <h5 class="modal-title" id="myModalLabel140" style="text-align: center; center;font-size: 13px;">직원 검색 안내</h5>
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
                           
                           
                           
                           
<!-- ===================================================================================================== -->                          
                                
                    <!-- Modal to add new record -->
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
function retireList(page){
   console.log(page);
   var data = {"page" : page}
   $.ajax({
      url:"/hr/retireEmpList",
      data : JSON.stringify(data),
      contentType : "application/json; charset=utf-8",
      type:"POST",
      dataType:"json",
      success:function(result){
         var thead = "";
         var tbody = "";
         var pageStr = '<div class="card-body" style="display: flex;justify-content: center; padding:0px;"><ul class="pagination firstLast1-links">';
         thead += "<tr>";
         thead += "<th style='text-align:center;'></th>";
         thead += "<th style='text-align:center;'>직원번호</th>";
         thead += "<th style='text-align:center;'>부서</th>";
         thead += "<th style='text-align:center;'>이름</th>";
         thead += "<th style='text-align:center;'>직급</th>";
         thead += "<th style='text-align:center;'>내선번호</th>";
         thead += "<th style='text-align:center;'>퇴사일</th>";
         thead += "</tr>";
         $.each(result.content,function(i,v){
            tbody += "<tr class='rowContent' onclick = location.href='/hr/empEditForm?empNo=" + v.EMP_NO + "' style = 'cursor:pointer;'>";
            tbody += "<td style='text-align:center;width:4%; padding-left: 20px;'>" + v.RNUM + "</td>";
            tbody += "<td style='text-align:center;width:16%;'>" + v.EMP_NO + "</td>";
            tbody += "<td style='text-align:center;width:16%;'>" + v.DEPT_NM + "</td>";
            tbody += "<td style='text-align:center;width:16%;'>" + v.EMP_NM + "</td>";
            tbody += "<td style='text-align:center;width:16%;'>" + v.CLSF + "</td>";
            tbody += "<td style='text-align:center;width:16%;'>" + v.LXTN_NO + "</td>";
            tbody += "<td style='text-align:center;width:16%;'>" + v.RETIRE_DE + "</td>";
         });
         pageStr += '<li class="page-item first"><a href="javascript:retireList(1)" class="page-link">First</a></li>';
         pageStr += '<li class="page-item prev '
         if(result.startPage<=5){pageStr += 'disabled'}
         pageStr += '">';
         pageStr += '<a href="javascript:retireList('+(result.startPage-5)+')" class="page-link">Prev</a></li>';
         for(var s=result.startPage; s <= result.endPage; s++){
            pageStr += '<li class="page-item '
            if(result.currentPage==s){pageStr += 'active'}
            pageStr += '">';
            pageStr += '<a href="javascript:retireList('+s+')" class="page-link">'+s+'</a></li>'
         }
         pageStr += '<li class="page-item next ';
         if(result.endPage >= result.totalPages){pageStr += 'disabled'} 
         pageStr += '">';
         pageStr += '<a href="javascript:retireList('+(result.startPage+5)+')" class="page-link">Next</a></li>'
         pageStr += '<li class="page-item last">'
         pageStr += '<a href="javascript:retireList('+result.totalPages+')" class="page-link">Last</a></li>'
         pageStr += '</ul></div>'
         $("thead").html(thead);
         $("tbody").html(tbody);
         $(".paging").html(pageStr);
         console.log(result);
      }
   })
}
function ingList(page){
   console.log(page);
   var data = {"page" : page}
   $.ajax({
      url:"/hr/ingEmpList",
      data : JSON.stringify(data),
      contentType : "application/json; charset=utf-8",
      type:"POST",
      dataType:"json",
      success:function(result){
         var thead = "";
         var tbody = "";
         var pageStr = '<div class="card-body" style="display: flex;justify-content: center; padding:0px;"><ul class="pagination firstLast1-links">';
         thead += "<tr>";
         thead += "<th style='text-align:center;'></th>";
         thead += "<th style='text-align:center;'>직원번호</th>";
         thead += "<th style='text-align:center;'>부서</th>";
         thead += "<th style='text-align:center;'>이름</th>";
         thead += "<th style='text-align:center;'>직급</th>";
         thead += "<th style='text-align:center;'>내선번호</th>";
         thead += "<th style='text-align:center;'>입사일</th>";
         thead += "</tr>";
         $.each(result.content,function(i,v){
            tbody += "<tr class='rowContent' onclick = location.href='/hr/empEditForm?empNo=" + v.EMP_NO + "' style = 'cursor:pointer;'>";
            tbody += "<td style='text-align:center;width:4%; padding-left: 20px;'>" + v.RNUM + "</td>";
            tbody += "<td style='text-align:center;width:16%;'>" + v.EMP_NO + "</td>";
            tbody += "<td style='text-align:center;width:16%;'>" + v.DEPT_NM + "</td>";
            tbody += "<td style='text-align:center;width:16%;'>" + v.EMP_NM + "</td>";
            tbody += "<td style='text-align:center;width:16%;'>" + v.CLSF + "</td>";
            tbody += "<td style='text-align:center;width:16%;'>" + v.LXTN_NO + "</td>";
            tbody += "<td style='text-align:center;width:16%;'>" + v.ENCPN_DE + "</td>";
         });
         pageStr += '<li class="page-item first"><a href="/hr/empList?currentPage=1" class="page-link">First</a></li>';
         pageStr += '<li class="page-item prev '
         if(result.startPage<=5){pageStr += 'disabled'}
         pageStr += '">';
         pageStr += '<a href="/hr/empList?currentPage='+(result.startPage-5)+'" class="page-link">Prev</a></li>';
         for(var s=result.startPage; s <= result.endPage; s++){
            pageStr += '<li class="page-item '
            if(result.currentPage==s){pageStr += 'active'}
            pageStr += '">';
            pageStr += '<a href="/hr/empList?currentPage='+s+'" class="page-link">'+s+'</a></li>'
         }
         pageStr += '<li class="page-item next ';
         if(result.endPage >= result.totalPages){pageStr += 'disabled'} 
         pageStr += '">';
         pageStr += '<a href="/hr/empList?currentPage='+(result.startPage+5)+'" class="page-link">Next</a></li>'
         pageStr += '<li class="page-item last">'
         pageStr += '<a href="/hr/empList?currentPage='+result.totalPages+'" class="page-link">Last</a></li>'
         pageStr += '</ul></div>'
         $("thead").html(thead);
         $("tbody").html(tbody);
         $(".paging").html(pageStr);
         console.log(result);
      }
   })
}
$('#deptSelect').on('change', function(){
   deptSelectAjax(1);
})
function deptSelectAjax(page){
   var deptCode = $("#deptSelect").val();
   var deptNm = $("#deptSelect option:checked").text();
//     var page = $("#pageDefault").val();
    if(deptCode == "ALL" || deptCode == "default"){
       location.href = "/hr/empList?currentPage=1"
    }else{
        var data = {
         deptCode : $("#deptSelect").val(),
         deptNm : $("#deptSelect option:checked").text(),
         page : page
     }
     $.ajax({
        url:"/hr/empListDeptAjax",
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
         thead += "<th style='text-align:center;'></th>";
         thead += "<th style='text-align:center;'>직원번호</th>";
         thead += "<th style='text-align:center;'>부서</th>";
         thead += "<th style='text-align:center;'>이름</th>";
         thead += "<th style='text-align:center;'>직급</th>";
         thead += "<th style='text-align:center;'>내선번호</th>";
         thead += "<th style='text-align:center;'>입사일</th>";
         thead += "<th style='text-align:center;'>퇴사일</th>";
         thead += "</tr>";
           $.each(result.content, function(i,v){
              tbody += "<tr class='rowContent' onclick = location.href='/hr/empEditForm?empNo=" + v.EMP_NO + "' style = 'cursor:pointer;'>";
            tbody += "<td style='text-align:center;width:2%; padding-left: 20px;'>" + v.RNUM + "</td>";
            tbody += "<td style='text-align:center;width:14%;'>" + v.EMP_NO + "</td>";
            tbody += "<td style='text-align:center;width:14%;'>" + v.DEPT_NM + "</td>";
            tbody += "<td style='text-align:center;width:14%;'>" + v.EMP_NM + "</td>";
            tbody += "<td style='text-align:center;width:14%;'>" + v.CLSF + "</td>";
            tbody += "<td style='text-align:center;width:14%;'>" + v.LXTN_NO + "</td>";
            tbody += "<td style='text-align:center;width:14%;'>" + v.ENCPN_DE + "</td>";
              if(v.RETIRE_DE == null){
                 tbody += "<td style='text-align:center;width:14%;'>-</td></tr>";
              }else{
                 tbody += "<td style='text-align:center;width:14%;'>" +v.RETIRE_DE + "</td></tr>"
              }
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
           pageStr += '<a href="javascript:deptSelectAjax('+result.totalPages+')" class="page-link">Last</a></li>'
           pageStr += '</ul></div>'
         
           $("thead").html(thead);
         $("tbody").html(tbody);
           $(".breadcrumb-item").html('<a href="#" class="deptNm">'+deptNm+'</a>');
           $(".paging").html(pageStr);
        },
        error:function(xhr, status) {
           alert(xhr + " : " + status);
        }
     });
   }
}       
       
function search(page){
   var data = {
         keyword : $("#keyword").val(),
         page : page,
         dept : $("#deptSelect").val()
   }
   $.ajax({
      type:'POST',
      url:"/hr/search",
      contentType : "application/json; charset=utf-8",
      data:JSON.stringify(data),
      success:function(result){
         console.log(result.content);
         var thead = "";
         var tbody = "";
         var pageStr = "";
         $(".nav-tabs").html("");
         if(result.content.length){
            thead += "<tr>";
            thead += "<th style='text-align:center;'></th>";
            thead += "<th style='text-align:center;'>직원번호</th>";
            thead += "<th style='text-align:center;'>부서</th>";
            thead += "<th style='text-align:center;'>이름</th>";
            thead += "<th style='text-align:center;'>직급</th>";
            thead += "<th style='text-align:center;'>내선번호</th>";
            thead += "<th style='text-align:center;'>입사일</th>";
            thead += "<th style='text-align:center;'>퇴사일</th>";
            thead += "</tr>";
            $.each(result.content, function(i,v){
               tbody += "<tr class='rowContent' onclick = location.href='/hr/empEditForm?empNo=" + v.EMP_NO + "' style = 'cursor:pointer;'>"
               tbody += "<td style='text-align:center;width:2%; padding-left: 20px;'>" + v.RNUM + "</td>"
               tbody += "<td style='text-align:center;width:14%'>" + v.EMP_NO + "</td>"
               tbody += "<td style='text-align:center;width:14%'>" + v.DEPT_NM + "</td>"
               tbody += "<td style='text-align:center;width:14%'>" + v.EMP_NM + "</td>"
               tbody += "<td style='text-align:center;width:14%'>" + v.CLSF + "</td>"
               tbody += "<td style='text-align:center;width:14%'>" + v.LXTN_NO + "</td>"
               tbody += "<td style='text-align:center;width:14%'>" + v.ENCPN_DE + "</td>"
               if(v.RETIRE_DE == null){
                  tbody += "<td style='text-align:center;width:14%;'>-</td></tr>";
               }else{
                  tbody += "<td style='text-align:center;width:14%;'>" +v.RETIRE_DE + "</td></tr>"
               }
            });
            pageStr += '<div class="card-body" style="display: flex;justify-content: center; padding:0px;margin-top: 10px;"><ul class="pagination firstLast1-links">';
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
            thead += "<tr>";
            thead += "<th style='text-align:center;width:200px;'>직원번호</th>";
            thead += "<th style='text-align:center;width:200px;'>부서</th>";
            thead += "<th style='text-align:center;width:200px;'>이름</th>";
            thead += "<th style='text-align:center;width:200px;'>직급</th>";
            thead += "<th style='text-align:center;width:200px;'>내선번호</th>";
            thead += "<th style='text-align:center;width:200px;'>입사일</th>";
            thead += "<th style='text-align:center;width:200px;'>퇴사일</th>";
            thead += "</tr>";
            tbody += "<tr><td colspan='7' style='text-align:center;'>검색결과가 없습니다.</td></tr>";
         }
         
         
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
    location.href = "/hr/empAddForm";
   });
});
</script>
</body>
<!-- END: Body-->

</html>