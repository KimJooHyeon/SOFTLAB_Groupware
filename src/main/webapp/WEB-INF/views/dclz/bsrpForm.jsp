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
<style>
#content:hover{
	background-color: #F6F6F6;
	cursor: pointer;
}
</style>
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
                        <div class="col-12" style="padding-bottom: 15px;">
                            <h2 class="content-header-title float-left mb-0">근태관리</h2>
                            <div class="breadcrumb-wrapper">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#" style="cursor: default;">출장관리</a>
                                    </li>
                                    <li class="breadcrumb-item active">출장신청
                                    </li>
                                </ol>
                            </div>
                        </div>
            
           		<section id="multiple-column-form">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body" style="width:1300px;">
                                    <form class="form" id="bsrpForm">
                                        <div class="row">
                                            <div class="col-md-3 col-12">
                                                <div class="form-group">
                                                    <label for="first-name-column">신청번호</label>
                                                    <input type="text" id="elctrnSanctnSn" class="form-control" value="자동채번" name="elctrnSanctnSn" style="width:280px;" readonly/>
                                                    <input type="hidden" id="insertBsrpSn" value="">
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
                                                    <label for="email-id-column">출장지역</label>
                                                    <input type="text" id="bsrpPlace" class="form-control" name="bsrpPlace" placeholder="출장지역" style="width:280px;" />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-12">
                                                <div class="form-group">
                                                    <label for="email-id-column">출장목적</label>
                                                    <input type="text" id="bsrpPrvonsh" class="form-control" name="bsrpPrvonsh" placeholder="출장목적" style="width:280px;" />
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
                                                    <label for="email-id-column">신청내용</label>
                                                    <textarea id="bsrpCn" class="form-control" name="bsrpCn" placeholder="" style="width:1242px; height:300px;" ></textarea>
                                                </div>
                                            </div>
                                            <div class="col-12" style="display: flex; justify-content: space-between;">
                                                <button type="button" id="bsrpList" class="btn btn-outline-primary waves-effect" style="float: left; margin-left:0px;">임시저장함</button>
                                                <div id="content" style="width: 700px; height: 39px; text-align: center;"></div>
                                                <div>
	                                                <button type="submit" class="btn btn-primary mr-1" style="float: right; margin-left:15px;" onclick=savecheck()>신청</button>
	                                                <button type="submit" id="saveBtn" class="btn btn-outline-primary waves-effect" style="float: right; margin-left:10px;" onclick=emptycheck()> 저장</button>
	                                                <button type="reset" id="resetBtn" class="btn btn-outline-secondary" style="float: right;">초기화</button>
                                                </div>
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

	<!-- 모달 -->
	<div class="modal fade text-left modal-primary select" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-centered" role="document">
				        <div class="modal-content">
				            <div class="modal-header" style="justify-content: center;">
				                <h5 class="modal-title" id="myModalLabel140" style="text-align: center; center;font-size: 13px;">필수입력사항 안내</h5>
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                    <span aria-hidden="true">&times;</span>
				                </button>
				            </div>
				            <div class="modal-body" style="text-align: center;font-size: 15px;">
				                모두 입력 후 저장 가능합니다. 
				            </div>
				            <div class="modal-footer" style="justify-content: center;">
				                <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
				            </div>
				        </div>
				    </div>
				</div>
				
				
	<div class="modal fade text-left modal-primary apply" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-centered" role="document">
				        <div class="modal-content">
				            <div class="modal-header" style="justify-content: center;">
				                <h5 class="modal-title" id="myModalLabel140" style="text-align: center; center;font-size: 13px;">신청 안내</h5>
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                    <span aria-hidden="true">&times;</span>
				                </button>
				            </div>
				            <div class="modal-body" style="text-align: center;font-size: 15px;">
				                저장 후 신청 가능합니다. 
				            </div>
				            <div class="modal-footer" style="justify-content: center;">
				                <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
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
            
            /*** 달력 선택값 제어 ***/   
            var basicPicker2 = $('.flatpickr-basic2');
            var basicPicker3 = $('.flatpickr-basic3');
            var flat3;
            
        	 // 오늘 이후 날짜 선택 
            if (basicPicker2.length) {
             basicPicker2.flatpickr({
         		minDate:'today',
         		onChange:function(selectDates, dateStr, instance){
         			console.log(selectDates,dateStr,instance);
         			flat3.set("minDate",dateStr);
         			console.log(basicPickr3)	
         		}
         		
         	 });
            }
            
          	// basicPickr2 이후 날짜 선택 
            if (basicPicker3.length) {
             flat3 = basicPicker3.flatpickr({
          		minDate:'today'
          	 });
            }
            
        });
        
      	$(function(){
      		/** 출장 임시저장 목록 이동 */
	 		$("#bsrpList").on("click", function(){
		 	location.href = "/dclz/bsrpList";
			});
		}); 
      	
      	/** 버튼 클릭시 이벤트*/
      	var is_empty = false;
		var is_save = false;
		  
		function emptycheck() {
			  var form = $("#bsrpForm").serialize();
				$('#bsrpForm').find('input[type!="hidden"]'&&'textarea').each(function(){
					if(!$(this).val()){
						is_empty = true;
					} 
				});
				if(is_empty){
 					event.preventDefault();
					$(".select").modal();
					is_empty = false;
				}else{
 					event.preventDefault();
					$.ajax({
						type: "POST",
						url: "bsrpInsert",
						dataType: "text",
						contentType: "application/x-www-form-urlencoded; charset=UTF-8",
						data : form,
						success: function(data){
							console.log("넘어온 Sn : " + data);
							if(data!="fail"){
								location.replace("bsrpDetail?bsrpSn="+ data);
							}
						}
					});
				}
			}	
		
	     	
		  function savecheck() {
				event.preventDefault();
				$(".apply").modal();
			}
      	
		  $("#content").on("click",function(){
			  $("#bgnDay").val("2022-01-27");
			  $("#endDay").val("2022-01-28");
			  $("#bsrpPlace").val("대전");
			  $("#bsrpPrvonsh").val("멘토링");
			  $("#reqstdocSj").val("대덕인재개발원 출장");
			  $("#bsrpCn").val("01월 27일, 01월 28일(2일) 출장 신청합니다.");
			  
		  })
    </script>
 
</body>
<!-- END: Body-->


