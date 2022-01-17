<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>




<head>
   <style type="text/css">
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
    <title></title>
    <link rel="apple-touch-icon" href="/resources/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="/resources/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,400;1,500;1,600" rel="stylesheet">
   
   
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   <link rel="stylesheet" type="text/css" href="/resources/js/bootstrap-monthpicker.css">
   
    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/vendors/css/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendors/css/pickers/pickadate/pickadate.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendors/css/pickers/flatpickr/flatpickr.min.css">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/colors.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/components.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/themes/dark-layout.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/themes/bordered-layout.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/themes/semi-dark-layout.css">

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/css/core/menu/menu-types/vertical-menu.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/plugins/forms/pickers/form-flat-pickr.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/plugins/forms/pickers/form-pickadate.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/tab.css">
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/assets/css/style.css">
    <!-- END: Custom CSS-->
   <%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
	
	%>
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
      var url = "deleteCrtf";
      var valueArr = new Array();
      var list = $("input[name='RowCheck']");
      for(var i=0; i< list.length; i++){
         if(list[i].checked){
            valueArr.push(list[i].value);
         }
      }
      if (valueArr.length == 0){
         // alert("선택된 값이 없습니다.");
    	  $(".crtfChk").modal();
      }
      else{
        $.ajax({
           url : url,
           type : "POST",
           traditional : true,
           data : {
              valueArr : valueArr
           },
           success: function(data) {
        	  console.log("data : ", data);
        	  if(data == 1) {
              	// alert("신청취소 되었습니다.");
        		  $(".crtfReturn").modal();
        	  } else {
        		  // alert("결재완료가 된 증명서는 신청 취소가 불가능합니다.");
        		  $(".crtfImpass").modal();
        	  }
           } // end success
        }); // end ajax
      }
   }
    
    function replaceCrtfList() {
     	  location.replace("crtfList")
     }
    
     $(document).on("click", ".printCrtf", function(){
      event.preventDefault();      // built-in event막기
      //event.stopPropergation(); // 이벤트 전파 막기
		console.log($(this).val());
        var crtfReqstSn = $(this).val(); // 증명서 일련번호
		
		// ajax
        $.ajax({
           type : 'get',
           url : "/hr/crtfDetail",
           data : "crtfReqstSn=" + crtfReqstSn,
           dataType : 'json',
           success : function(crtfData) {
              console.log("test");
              console.log(crtfData);
              console.log(crtfData.crtfSeCode);
              console.log(crtfData.crtfReqstSn);
          	  // 증명서 날짜 계산
              var encpndate = crtfData.encpndate;
              var requestdate = crtfData.requestdate;
              console.log("encpndate : " , encpndate);
      		  console.log("requestdate : ", requestdate);
      		
              var arr1 = encpndate.split('-');
              var arr2 = requestdate.split('-');
              var dat1 = new Date(arr1[0], arr1[1], arr1[2]);
              var dat2 = new Date(arr2[0], arr2[1], arr2[2]);
              
              console.log("dat1 arr : ", arr1[0], arr1[1], arr1[2]);
              console.log("dat2 arr : ", arr2[0], arr2[1], arr2[2]);
              console.log("dat1 : ", dat1);
              console.log("dat2 : ", dat2);

              // 날짜 빼기
              // 날짜 차이 알아 내기 
			  var diff = dat2 - dat1;
			  var currDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
			  var currMonth = currDay * 30;// 월 만듬
			  var currYear = currMonth * 12; // 년 만듬
			  
			  var year = parseInt(diff/currYear);
			  var month = parseInt(diff/currMonth);
			  if(month >= 12) {
				  month = month -12;
			  }
			  var day = parseInt(diff/currDay);
			  if(day >= 30) {
				  day = day - 30;
			  }
              var crtfDate = (year + "년" + month + "월" + day + "일");
              console.log(crtfDate);
              
              var tblCrtf="";
              if(crtfData.crtfSeCode == "재직증명서"){
           	  	tblCrtf += "<div style='text-align: center; font-weight: bold;'><br><h2>재직증명서</h2><br></div>";
              } else if(crtfData.crtfSeCode == "경력증명서"){
            	tblCrtf += "<div style='text-align: center; font-weight: bold;'><br><h2>경력증명서</h2><br></div>";
              }
              tblCrtf += "<table border='1'>";
              tblCrtf += "<tr style='height: 50px;'>";
              tblCrtf += "<td style='width: 100px; text-align: center;'>성명</td>";
              tblCrtf += "<td style='width: 150px;' id='empNmModal'>&nbsp;" + crtfData.empNm + "</td>";    
              tblCrtf += "<td style='width: 100px; text-align: center;'>생년월일</td>";    
              tblCrtf += "<td id='brthdyModal'>&nbsp;" + crtfData.brthdy + "</td>";    
              tblCrtf += "</tr> <tr style='height: 50px;'>";    
              tblCrtf += "<td style='text-align: center;'>부서</td>";    
              tblCrtf += "<td id='deptNmModal'>&nbsp;" + crtfData.deptNm + "</td>";    
              tblCrtf += "<td style='text-align: center;'>직위</td>";
              tblCrtf += "<td id='clsfCodeModal'>&nbsp;" + crtfData.clsfCode + "</td>";    
              tblCrtf += "</tr> <tr style='height: 50px;'>";    
              tblCrtf += "<td style='text-align: center;'>주소</td>";
              if(crtfData.adres2 == null) {
           	  	tblCrtf += "<td colspan='3' id='adresModal'>&nbsp;" + crtfData.adres1 + "</td>";
              } else if(crtfData.adres2 != null) {
                tblCrtf += "<td colspan='3' id='adresModal'>&nbsp;" + crtfData.adres1 + crtfData.adres2 + "</td>";
              }
              tblCrtf += "</tr> <tr style='height: 50px;'>";
              tblCrtf += "<td style='text-align: center;'>회사명</td>";    
              tblCrtf += "<td id='empNmModal'>&nbsp;SOFTLAB</td>";    
              tblCrtf += "<td style='text-align: center;'>재직기간</td>";    
              tblCrtf += "<td style='width: 450px;' id='encpnDeModal'>&nbsp;" + crtfData.encpnDe + " ~ " + crtfData.reqstDe + "</td>";  
              tblCrtf += "</tr> <tr style='height: 50px;'>";    
              tblCrtf += "<td style='text-align: center;'>발급사유</td>";    
              tblCrtf += "<td colspan='3' id='crtfCn'>&nbsp;" + crtfData.crtfCn + "</td>";
              tblCrtf += "</tr> <tr style='height: 50px;'>";
              if(crtfData.crtfSeCode == "재직증명서"){
              	tblCrtf += "<td colspan='4'>";
              	tblCrtf += "<br><br><br>";
              	tblCrtf += "<div style='text-align: center;'>상기와 같이 재직하고 있음을 증명함</div>";
              	tblCrtf += "<div style='text-align: center;'>" + crtfData.reqstDe + "</div>";
              	tblCrtf += "<br><br><br>";
              	tblCrtf += "<div style='text-align: right; margin-right: 50px'>" + crtfData.ceonm + "</div>";
              	tblCrtf += "<br><br><br>";
              	tblCrtf += "</td>";
              } else if(crtfData.crtfSeCode == "경력증명서"){
            	  tblCrtf += "<td colspan='4'>";
                	tblCrtf += "<br><br><br>";
                	tblCrtf += "<div style='text-align: center;'>상기와 같이 경력을 증명함</div>";
                	tblCrtf += "<div style='text-align: center;'>" + crtfData.reqstDe + "</div>";
                	tblCrtf += "<br><br><br>";
                	tblCrtf += "<div style='text-align: right; margin-right: 50px'>" + crtfData.ceonm + "</div>";
                	tblCrtf += "<br><br><br>";
                	tblCrtf += "</td>";
              }
              tblCrtf += "</table>";
              $("#printCrtfCn").html(tblCrtf);
            }
         });
       });
     
     function printPage(){
    	 var initBody;
    	 window.onbeforeprint = function(){
    	  initBody = document.body.innerHTML;
  	 	  document.body.innerHTML =  document.getElementById('printCrtfCn').innerHTML;
    	 };
     	 window.onafterprint = function(){
     	  document.body.innerHTML = initBody;
     	 };
    	 window.print();
    	 location.replace("crtfList")
//     	 return false;
    	}

    </script>    
<style type="text/css" media="print">
 @page {
        size:  auto;   /* auto is the initial value */
        margin: 0mm;  /* this affects the margin in the printer settings */
 }
 
 @media print {
	header, footer, .no-print { display:none }
 }
}
</style>


</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu-modern  navbar-floating footer-static  " data-open="click" data-menu="vertical-menu-modern" data-col="">

    
    <!-- BEGIN: Content-->
    <div class="app-content content ">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper container-xxl p-0">
            <div class="content-header row">
                <div class="content-header-left col-md-9 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="col-12" style="padding-left: 75px; padding-bottom: 10px;">
                            <h2 class="content-header-title float-left mb-0">인사관리</h2>
                            <div class="breadcrumb-wrapper">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#" style="cursor: default;">증명서</a>
                                    </li>
                                    <li class="breadcrumb-item active">증명서 발급대장
                                    </li>
                                </ol>
                            </div>
                        </div>
            <div class="content-body">
                 <div class="container">
                   <!-- Basic Tables start -->
                   <div class="row" id="basic-table">
                       <div class="col-12" style="margin-top: 10px;">
                          <div class="noPaging" style="display:flex; justify-content: center;">
                              <div class="card" style="width: 1300px;">
                               
                                  <div class="card-body" style="padding: 0.8rem; width: 1300px; padding-bottom: 15px; padding-top: 15px;">
                                  	<div style="display: flex; flex-direction: row-reverse; gap: 5px;">
	                                  <button type="button" id="crtfForm" class="btn btn-primary mr-1">증명서 신청</button>
	                                  <!-- <button type="button"  class="btn btn-primary mr-1" style="float:right; margin-top:5px; margin-left: 5px; " onclick="printValue();"> 출력 </button> -->
	                                  <button type="button"  class="btn btn-outline-primary waves-effect" onclick="deleteValue();">신청 취소 </button>
                                  	</div>
                                  </div>
                               
                               <div class="table-responsive" style="height:590px;width: 1300px;">
                                   <table class="table" style="text-align: center;">
                                       <thead>
                                           <tr>
                                              <th style="width:1%;">
                                              	<div class="custom-control custom-checkbox">		
													<input id="allCheck" type="checkbox" name="allCheck" class="custom-control-input" />
													<label class="custom-control-label" for="allCheck"></label>
												</div>
                                              </th>
                                               <th style="width:7%;">순번</th>
                                               <th>신청일</th>
                                               <th>증명서</th>
                                               <th>신청사유</th>
                                               <th>신청인</th>
                                               <th>진행상태</th>
                                           </tr>
                                       </thead>
                                       <tbody id="tbodyCn">
                                       
                                       <c:forEach var="row" items="${crtfList.content}" varStatus="status">
                                           <tr class="rowContent" style = "height: 53px;">
                                              <td>
                                             	<div class="custom-control custom-checkbox">
                                              		<input name="RowCheck" type="checkbox" class="custom-control-input" id="${status.count}-checkboxSn" value="${row.CRTF_REQST_SN}">
                                              		<label class="custom-control-label" for="${status.count}-checkboxSn"></label>
                                              	</div>
                                              </td>
                                               <td class="crtfContent">${status.count}</td>
                                               <td class="crtfContent reqstDe" id="reqstDe">${row.REQST_DE}</td>
                                               <td class="crtfContent crtfSeCode" id="crtfSeCode">${row.CRTF_SE_CODE}</td>
                                               <td class="crtfContent crtfCn" id="crtfCn">${row.CRTF_CN}</td>
                                               <td class="crtfContent empNm" id="empNm">${row.EMP_NM}
                                               <input type="hidden" class="crtfReqstSn" id="crtfReqstSn" value="${row.CRTF_REQST_SN}">
                                               <input type="hidden" class="empNo" id="empNo" value="${row.EMP_NO}">
                                               <input type="hidden" class="brthdy" id="brthdy" value="${row.BRTHDY}">
                                               <input type="hidden" class="adres1" id="adres1" value="${row.ADRES1}">
                                               <input type="hidden" class="adres2" id="adres2" value="${row.ADRES2}">
                                               <input type="hidden" class="deptNm" id="deptNm" value="${row.DEPT_NM}">
                                               <input type="hidden" class="clsfCode" id="clsfCode" value="${row.CLSF_CODE}">
                                               <input type="hidden" class="encpnDe" id="encpnDe" value="${row.ENCPN_DE}">
                                               <input type="hidden" class="encpndate" id="encpndate" value="${row.ENCPN_DE}">
                                               <input type="hidden" class="requestdate" id="requestdate" value="${row.REQST_DE}">
                                               <input type="hidden" class="ceonm" id="ceonm" value="${row.EMP_NM}">
                                               </td>
                                               <c:if test="${row.SANCTN_YN eq 'N'}">
                                                  <td class="crtfContent">진행중</td>
                                               </c:if>
                                               <c:if test="${row.SANCTN_YN eq 'Y'}">
                                                  <td class="crtfContent">
                                                  	<button class="btn btn-outline-primary waves-effect printCrtf" 
                                                  	data-toggle="modal" data-target="#printCrtf" id="printCrtfBtn"
                                                  	 value="${row.CRTF_REQST_SN}"
                                                  	 style="padding-top: 8px; padding-bottom: 10px; padding-left: 10px; padding-right: 10px;">출력</button>
                                                  </td>
                                               </c:if>
                                               <c:if test="${row.SANCTN_YN eq 'R'}">
                                                  <td class="crtfContent">
                                                     <a href="#">반려</a>
                                                  </td>
                                               </c:if>
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
                          <div class="paging" style="margin-bottom: 0px; width: 1300px;">
                              <div class="card-body" style="display: flex;justify-content: center; padding:0px;margin-top: 10px;">
                                  <ul class="pagination firstLast1-links">
                                   <li class="page-item first"><a href="/hr/crtfList?currentPage=1" class="page-link">First</a></li>
                                   <li class="page-item prev <c:if test="${crtfList.startPage<=5}">disabled</c:if>">
                                   	<a href="/hr/crtfList?currentPage=${crtfList.startPage-5}" class="page-link">Prev</a>
                                   </li>
                                   <c:forEach var="page" begin="${crtfList.startPage}" end="${crtfList.endPage}">
                                   	<li class="page-item <c:if test='${param.currentPage eq page}'>active</c:if>">
                                   		<a href="/hr/crtfList?currentPage=${page}" class="page-link">${page}</a>
                                   	</li>
                                   </c:forEach>
                                   <li class="page-item next <c:if test="${crtfList.endPage>=crtfList.totalPages}">disabled</c:if>">
                                   	<a href="/hr/crtfList?currentPage=${crtfList.startPage+5}" class="page-link">Next</a>
                                   </li>
                                   <li class="page-item last"><a href="/hr/crtfList?currentPage=${crtfList.endPage}" class="page-link">Last</a></li>
                                  </ul>
                              </div>
                          </div>
             </div>
				<!-- 페이징 끝 -->
				<!-- 선택된 증명서 신청이 없을 때 삭제안내 modal -->
                       <div class="modal fade text-left modal-primary crtfChk" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel142" aria-hidden="true">
                      <div class="modal-dialog modal-dialog-centered" role="document">
                          <div class="modal-content">
                              <div class="modal-header" style="justify-content: center;">
                                  <h5 class="modal-title" id="myModalLabel142" style="text-align: center; center;font-size: 13px;">증명서 승인 안내</h5>
                                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                      <span aria-hidden="true">&times;</span>
                                  </button>
                              </div>
                              <div class="modal-body" style="text-align: center;font-size: 15px;">
                                  선택된 신청이 없습니다.
                              </div>
                          </div>
                      </div>
                  </div>
               <!-- 선택된 증명서 신청이 없을 때 삭제안내 modal 끝 -->
				<!-- 증명서 취소 창 modal -->
                       <div class="modal fade text-left modal-primary crtfReturn" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel142" aria-hidden="true">
                      <div class="modal-dialog modal-dialog-centered" role="document">
                          <div class="modal-content">
                              <div class="modal-header" style="justify-content: center;">
                                  <h5 class="modal-title" id="myModalLabel142" style="text-align: center; center;font-size: 13px;">증명서 승인 안내</h5>
                                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                      <span aria-hidden="true">&times;</span>
                                  </button>
                              </div>
                              <div class="modal-body" style="text-align: center;font-size: 15px;">
                                  신청취소 되었습니다.
                              </div>
                              <div class="modal-footer" style="justify-content: center;">
                                  <button type="button" class="btn btn-primary crtfOk" data-dismiss="modal" onclick="replaceCrtfList()">확인</button>
                              </div>
                          </div>
                      </div>
                  </div>
               <!-- 증명서 취소 창 modal 끝 -->
				<!-- 증명서 재결재불가 안내창 modal -->
                       <div class="modal fade text-left modal-primary crtfImpass" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel142" aria-hidden="true">
                      <div class="modal-dialog modal-dialog-centered" role="document">
                          <div class="modal-content">
                              <div class="modal-header" style="justify-content: center;">
                                  <h5 class="modal-title" id="myModalLabel142" style="text-align: center; center;font-size: 13px;">증명서 승인 안내</h5>
                                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                      <span aria-hidden="true">&times;</span>
                                  </button>
                              </div>
                              <div class="modal-body" style="text-align: center;font-size: 15px;">
                                  결재완료가 된 증명서는 신청 취소가 불가능합니다.
                              </div>
                              <div class="modal-footer" style="justify-content: center;">
                                  <button type="button" class="btn btn-primary crtfOk" data-dismiss="modal" onclick="replaceCrtfList()">확인</button>
                              </div>
                          </div>
                      </div>
                  </div>
               <!-- 증명서 재결재불가 안내창 modal 끝 -->
                            </div>
                         <!-- tab-1 end -->
                         
                        <!-- 출력 modal -->
                       <div class="modal fade text-left modal-primary insert" id="printCrtf" 
                       tabindex="-1" role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
                      <div class="modal-dialog modal-dialog-centered" role="document">
                          <div class="modal-content"  style="width: 880px; height: 770px;">
                              <div class="modal-header" style="justify-content: center;">
                                  <h5 class="modal-title" id="myModalLabel140" style="text-align: center; center;font-size: 13px;">증명서 출력</h5>
                                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                      <span aria-hidden="true">&times;</span>
                                  </button>
                              </div>
                              <!-- 프린트 될 부분 시작 -->
                              <div class="modal-body"  style="width: 700px; height: 770px; font-size: 15px;" id="printCrtfCn">
                                 
                              </div>
                              <!-- 프린트 될 부분 끝 -->
                              <div class="modal-footer" style="justify-content: center;">
                                  <button type="button" class="btn btn-primary" onclick="printPage();">출력하기 </button>
                                  <button type="button" class="btn btn-outline-primary waves-effect" data-dismiss="modal">확인</button>
                              </div>
                              <br>
                          </div>
                      </div>
                  </div>
               <!-- 출력 modal 끝 -->
                            
                            
                           </div>
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

    <script>
        $(window).on('load', function() {
            if (feather) {
                feather.replace({
                    width: 14,
                    height: 14
                });
            }
        })
        
          $(function(){
          /** 증명서 목록 이동 */
          $("#crtfForm").on("click", function(){
          location.href = "/hr/crtfForm";
         });
      }); 
    </script>
 
</body>
<!-- END: Body-->

