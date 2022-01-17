<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.text.*" %>
<%
	Date date = new Date();
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
	String strdate = simpleDate.format(date);
%>



<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=0,minimal-ui">
    <meta name="description" content="Vuexy admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
    <meta name="keywords" content="admin template, Vuexy admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="PIXINVENT">
    <title>나의근태관리</title>
    <link rel="apple-touch-icon" href="/resources/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="/resources/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,400;1,500;1,600" rel="stylesheet">
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
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
                        <div class="col-12">
                            <h2 class="content-header-title float-left mb-0">휴가신청</h2>
                            <div class="breadcrumb-wrapper">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">휴가관리</a>
                                    </li>
                                    <li class="breadcrumb-item active">휴가신청
                                    </li>
                                </ol>
                            </div>
                        </div>
            
           		<section id="multiple-column-form">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title"></h4>
                                </div>
                                <div class="card-body" style="width:1300px;">
                                    <form class="form" id="vcatnForm">
                                        <div class="row">
                                        	<div class="col-md-3 col-12">
                                                <div class="form-group">
                                                    <label for="first-name-column">기준년도</label>
                                                    <input type="text" id="occrrncYear" class="form-control" value="${yrycVO.occrrncYear}" name="elctrnSanctnSn" style="width:280px;" readonly/>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-12">
                                                <div class="form-group">
                                                    <label for="last-name-column"> 연차 발생일수</label>
                                                    <input type="text" id="occrrncDaycnt" class="form-control" value="${yrycVO.occrrncDaycnt}" name="reqstDe"  style="width:280px;" readonly/>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-12">
                                                <div class="form-group">
                                                    <label for="city-column">사용일수</label>
                                                    <input type="text" id="useDaycnt" class="form-control" value="${yrycVO.useDaycnt}" name="empNm" style="width:280px;" readonly/>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-12">
                                                <div class="form-group">
                                                    <label for="country-floating">남은일수</label>
                                                    <input type="text" id="remndrDaycnt" class="form-control" name="deptNm" value="${yrycVO.remndrDaycnt}" style="width:280px;" readonly/>
                                              	</div>
                                            </div>
                                            <div class="col-md-3 col-12">
                                                <div class="form-group">
                                                    <label for="first-name-column">신청번호</label>
                                                    <input type="text" id="elctrnSanctnSn" class="form-control" value="자동채번" name="elctrnSanctnSn" style="width:280px;" readonly/>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-12">
                                                <div class="form-group">
                                                    <label for="last-name-column">신청일자</label>
                                                    <input type="text" id="reqstDe" class="form-control" value=<%=strdate%> name="reqstDe"  style="width:280px;" readonly/>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-12">
                                                <div class="form-group">
                                                    <label for="city-column">신청자</label>
                                                    <input type="hidden" id="empNo" name="empNo" value="${empVO.empNo}">
                                                    <input type="text" id="empNm" class="form-control" value="${empVO.empNm}" name="empNm" style="width:280px;" readonly/>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-12">
                                                <div class="form-group">
                                                    <label for="country-floating">신청부서</label>
                                                    <input type="text" id="deptNm" class="form-control" name="deptNm" value="${empVO.deptNm}" style="width:280px;" readonly/>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-12">
                                                <div class="form-group">
                                                    <label for="email-id-column">휴가구분</label>
                                                    <select class="form-control mb-1" name="vcatnSeCode" style="width:280px;" >
		                                            	<option value="V1">연차</option>        
		                                            	<option value="V2">반차</option>        
		                                            	<option value="V3">생리휴가</option>        
		                                            	<option value="V4">병가</option>        
		                                            	<option value="V5">경조휴가</option>        
		                                            	<option value="V6">출산휴가</option>        
		                                            	<option value="V7">포상휴가</option>        
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-12">
                                                <div class="form-group">
                                                    <label for="country-floating">기간</label>
                                                    <input type="text" id="bgnDay" name="bgnDe" class="form-control flatpickr-basic2"  placeholder="YYYY-MM-DD" 
                                                    style="width:280px;" />
                                                </div>
                                            </div>
                                            <p style="margin-top:30px; font-weight:bolder; font-size:15px; margin-left:95px;">~</p>
                                            <div class="col-md-3 col-12">
                                                <div class="form-group">
                                               	    <label for="country-floating"></label>
                                                    <input type="text" id="endDay" name="endDe" class="form-control flatpickr-basic3"  placeholder="YYYY-MM-DD" 
                                                    	style="width:280px; height:39.01px; margin-top:5px;" />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-12">
                                                <div class="form-group">
                                                    <label for="email-id-column">신청일수</label>
                                                    <input type="text" id="countday" class="form-control" name="vcatnReqstDaycnt" placeholder="" style="width:280px;" />
                                                </div>
                                            </div>
                           
                                            <div class="col-md-12 col-12">
                                                <div class="form-group">
                                                    <label for="email-id-column">제목</label>
                                                    <input type="text" id="reqstdocSj" class="form-control" name="reqstdocSj" placeholder="제목을 입력하세요" style="width:1242px;"  />
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="email-id-column">휴가사유</label>
                                                    <textarea id="bsrpCn" class="form-control" name="vcatnPrvonsh" placeholder="" style="width:1242px; height:300px;" ></textarea>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <button type="submit" class="btn btn-primary mr-1" style="float: right; margin-left:15px;" onclick=savecheck()>신청</button>
                                                <button type="submit" id="saveBtn" class="btn btn-outline-primary waves-effect" style="float: right; margin-left:10px;" onclick=emptycheck()> 저장</button>
                                                <button type="button" id="vcatnList" class="btn btn-outline-primary waves-effect" style="float: left; margin-left:0px;">임시저장함</button>
                                                <button type="reset" id="resetBtn" class="btn btn-outline-secondary" style="float: right;">초기화</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                
	                      
	                     
	                 
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
            
//             /*** 달력 선택값 제어 ***/   
//             var basicPicker2 = $('.flatpickr-basic2');
//             var basicPicker3 = $('.flatpickr-basic3');
//             var flat3;
            
//         	 // 오늘 이후 날짜 선택 
//             if (basicPicker2.length) {
//              basicPicker2.flatpickr({
//          		minDate:'today',
//          		onChange:function(selectDates, dateStr, instance){
//          			console.log(selectDates,dateStr,instance);
//          			flat3.set("minDate",dateStr);
//          		}
         		
//          	 });
//             }
            
//           	// basicPickr2 이후 날짜 선택 
//             if (basicPicker3.length) {
//              flat3 = basicPicker3.flatpickr({
//           		minDate:'today',
//           		onChange:function(selectDates, dateStr, instance){
//           			calcDate()
//           		}
//           	 });
//             }
//         });
        
//         // 휴일을 제외한 날짜 수 계산 
//         function calcDate() {
// 			var date1 = new Date(document.getElementById('bgnDay').value);								
// 			var date2 = new Date(document.getElementById('endDay').value);
// 			var count = 0;
			
// 			while(true) {  
// 			    var temp_date = date1;
// 			    if(temp_date.getTime() > date2.getTime()) {
// 			        console.log("count : " + count);
// 			        break;
// 			    } else {
// 			        var tmp = temp_date.getDay();
// 			        if(tmp == 0 || tmp == 6) {
// 			        } else {
// 			            count++;         
// 			        }
// 			        temp_date.setDate(date1.getDate() + 1); 
// 			    }
// 			}
// 			document.getElementById('countday').value =count;
// 			document.getElementById('countday').readOnly=true;
// 		}
        
//       	$(function(){
//       		/** 출장 임시저장 목록 이동 */
// 	 		$("#vcatnList").on("click", function(){
// 		 	location.href = "/dclz/vcatnList";
// 			});
// 		}); 
      	
//       	/** 버튼 클릭시 이벤트*/
//       	var is_empty = false;
// 		var is_save = false;
		  
// 		function emptycheck() {
// 			  var form = $("#vcatnForm").serialize();
// 				$('#vcatnForm').find('input[type!="hidden"]').each(function(){
// 					if(!$(this).val()){
// 						is_empty= true;
// 					}
// 				});
// 				if(is_empty){
// 					alert("값을 전부 입력해주세요");
// 					event.preventDefault();
// 				}else{
//  					event.preventDefault();
// 					$.ajax({
// 						type: "POST",
// 						url: "vcatnInsert",
// 						dataType: "text",
// 						contentType: "application/x-www-form-urlencoded; charset=UTF-8",
// 						data : form,
// 						success: function(data) {
// 							console.log("넘어온 Sn : " + data);
// 							if(data!="fail"){
// 								location.replace("vcatnDetail?vcatnSn="+ data);
// 							}
// 						}
// 					});
// 				}
// 			}	
	     	
// 		  function savecheck() {
// 				event.preventDefault();
// 			  	if(is_save!=true){
// 					alert("저장 후 신청가능합니다");
// 				}else{
// 					alert("신청가능");
// 				}
// 			}
      	
        
    </script>
 
</body>
<!-- END: Body-->


