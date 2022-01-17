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
                        <div class="col-12" style="padding-bottom: 10px;">
                            <h2 class="content-header-title float-left mb-0">근태관리</h2>
                            <div class="breadcrumb-wrapper">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#" style="cursor: default;">휴가관리</a>
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
                                <div class="card-body" style="width:1300px;">
                                    <form class="form" id="formData">
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
                                                    <input type="hidden" id="vcatnSn" class="form-control" value="${vcatnVO.vcatnSn}" name="vcatnSn" style="width:280px;" readonly/>
                                                    <input type="hidden" id="sanctnYn" class="form-control" value="${vcatnVO.sanctnYn}" name="sanctnYn" style="width:280px;" readonly/>
                                                    <input type="hidden" id="inSn" class="form-control" value="${vcatnVO.elctrnSanctnSn}" name="inSn" style="width:280px;" readonly/>
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
                                                    <input type="hidden" id="empNo" name="empNo" value="${vcatnVO.empNo}">
                                                    <input type="text" id="empNm" class="form-control" value="${empMap.EMP_NM}" name="empNm" style="width:280px;" readonly/>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-12">
                                                <div class="form-group">
                                                    <label for="country-floating">신청부서</label>
                                                    <input type="text" id="deptNm" class="form-control" name="deptNm" value="${empMap.DEPT_NM}" style="width:280px;" readonly/>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-12">
                                                <div class="form-group">
                                                    <label for="email-id-column">휴가구분</label>
                                                    <input type="text" id="selectvcatSeCode" class="form-control" name="deptNm" value="${vcatnVO.vcatnSeCode}" style="width:280px;" readonly/>
                                                    <select class="form-control mb-1" id="vcatnSeCode" name="vcatnSeCode" style="width:280px; display: none" >
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
                                                    <input type="text" id="bgnDe" name="bgnDe" class="form-control flatpickr-basic5" value="${vcatnVO.bgnDe}" style="width:280px;" readonly/>
                                                </div>
                                            </div>
                                            <p style="margin-top:30px; font-weight:bolder; font-size:15px; margin-left:95px;">~</p>
                                            <div class="col-md-3 col-12">
                                                <div class="form-group">
                                               	    <label for="country-floating"></label>
                                                    <input type="text" id="endDe" name="endDe" class="form-control flatpickr-basic4" value="${vcatnVO.endDe}" placeholder="" style="width:280px; height:39.01px; margin-top:5px;" readonly/>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-12">
                                                <div class="form-group">
                                                    <label for="email-id-column">신청일수</label>
                                                    <input type="text" id="countday" class="form-control" name="vcatnReqstDaycnt" value="${vcatnVO.vcatnReqstDaycnt}" style="width:280px;" readonly/>
                                                </div>
                                            </div>
                           
                                            <div class="col-md-12 col-12">
                                                <div class="form-group">
                                                    <label for="email-id-column">제목</label>
                                                    <input type="text" id="reqstdocSj" class="form-control" name="reqstdocSj" value="${vcatnVO.reqstdocSj}" style="width:1242px;"  readonly/>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="email-id-column">휴가사유</label>
                                                    <textarea id="bsrpCn" class="form-control" name="vcatnPrvonsh" style="width:1242px; height:300px;" readonly>${vcatnVO.vcatnPrvonsh}</textarea>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <button type="button" id="requestBtn" class="btn btn-primary mr-1" style="float: right; margin-left:15px;" onclick=apply()>신청</button>
                                                <button type="button" id="updateBtn" class="btn btn-outline-primary waves-effect" style="float: right; margin-left:10px;" onclick=updatevcant()> 수정</button>
                                                <button type="button" id="vcatnList" class="btn btn-outline-primary waves-effect" style="float: left; margin-left:0px;">목록</button>
                                                <button type="button" id="deleteBtn" class="btn btn-outline-secondary" style="float: right;" onclick=deletedetail()>삭제</button>
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
	        
	        	<div class="modal fade text-left modal-primary delselect" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-centered" role="document">
				        <div class="modal-content">
				            <div class="modal-header" style="justify-content: center;">
				                <h5 class="modal-title" id="myModalLabel140" style="text-align: center; center;font-size: 13px;">안내사항</h5>
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                    <span aria-hidden="true">&times;</span>
				                </button>
				            </div>
				            <div class="modal-body" style="text-align: center;font-size: 15px;">
				                선택된 값이 없습니다. 
				            </div>
				            <div class="modal-footer" style="justify-content: center;">
				                <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
				            </div>
				        </div>
				    </div>
				</div>
				
			<div class="modal fade text-left modal-primary final" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-centered" role="document">
				        <div class="modal-content">
				            <div class="modal-header" style="justify-content: center;">
				                <h5 class="modal-title" id="myModalLabel140" style="text-align: center; center;font-size: 13px;">최종 확인</h5>
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                    <span aria-hidden="true">&times;</span>
				                </button>
				            </div>
				            <div class="modal-body" style="text-align: center;font-size: 15px;">
				                삭제하시겠습니까?
				            </div>
				            <div class="modal-footer" style="justify-content: center;">
				                <button type="button" class="btn btn-primary" data-dismiss="modal" id="deleteConfirm">yes</button>
				                <button type="button" class="btn btn-primary" data-dismiss="modal" id="deleteCancel" >no</button>
				            </div>
				        </div>
				    </div>
				</div> 
				
				 <div class="modal fade text-left modal-primary c-updateconfirm" id="primary3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-centered" role="document">
				        <div class="modal-content">
				            <div class="modal-header" style="justify-content: center;">
				                <h5 class="modal-title" id="myModalLabel140" style="text-align: center; center;font-size: 13px;">안내사항</h5>
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                    <span aria-hidden="true">&times;</span>
				                </button>
				            </div>
				            <div class="modal-body" style="text-align: center;font-size: 15px;">
				                수정이 완료되었습니다.
				            </div>
				            <div class="modal-footer" style="justify-content: center;">
				                <button type="button" class="btn btn-primary" data-dismiss="modal" id="updateY">확인</button>
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
         
            const sanctnYn = document.getElementById('sanctnYn').value;
            if(sanctnYn=='Y'){
            	document.getElementById('updateBtn').remove();
            	document.getElementById('deleteBtn').remove();
            	document.getElementById('requestBtn').setAttribute("onClick","confirm()");
            	document.getElementById('requestBtn').innerText = "문서확인";
            }
        });

        
      	$(function(){
	 		$("#vcatnList").on("click", function(){
		 	location.href = "/dclz/vcatnList";
		 	});
		}); 
      	
      	// 주현
      	function confirm() {
      		var elctrnSanctnSn = document.getElementById('inSn').value
      		
      		// 해당 문서의 결재상태 가져와서 tab, btnCode 부여
			$.ajax({
				url : 'openWindow',
				type : 'POST',
				data : {
					'elctrnSanctnSn' : elctrnSanctnSn
				},
				success : function(res) {
					var tab = res.tab
					var btnCode = res.btnCode
					var width = 992
		            var height = 910
		            var left = 10
		            var top = 10
		            var specs = 'width=' + width
		            specs += ',height=' + height
		            specs += ',left=' + left
		            specs += ',top=' + top
					
		            window.open('/sanction/sanctnDetail?elctrnSanctnSn=' + elctrnSanctnSn + '&tab=' + tab +
		                    '&btnCode=' + btnCode, ', document', specs + ', scrollbars=no') 
				}
			})
      	}
		 	
      	function updatevcant() {
      		/* 글 작성 가능하게 변경 */
			document.getElementById('bgnDe').readOnly=false;
			document.getElementById('endDe').readOnly=false;
			document.getElementById('reqstdocSj').readOnly=false;
			document.getElementById('bsrpCn').readOnly=false;
			document.getElementById('selectvcatSeCode').setAttribute("type","hidden");
			document.getElementById('vcatnSeCode').style.display = 'block';
           
   			/* 달력 선택 값 제한 */
	        var minDate= $('#bgnDe').val();     
	        var basicPicker4 = $('.flatpickr-basic4');
	        var basicPicker5 = $('.flatpickr-basic5');
	        var flat4;
	        
	        if(basicPicker5.length){ //bgnDe값 선택 
	        	basicPicker5.flatpickr({
	        		minDate: 'today',
	        		onChange:function(selectDates, dateStr, instance){
	        			flat4.set("minDate",dateStr);
	        			$('#endDe').attr('placeholder','YYYY-MM-DD');
	        			document.getElementById('countday').value='';
	        			document.getElementById('countday').readOnly=false;
						
	        		}
	        	})
	        } 
	        
	       if(basicPicker4.length){ //endDe값 선택 
	        	flat4 = basicPicker4.flatpickr({
	        		minDate: minDate,
	        		onChange:function(selectDates, dateStr, instance){
	        			calcDate();
	        		}
	        	})
			}
	       
	       document.getElementById('deleteBtn').remove();
 	       document.getElementById('requestBtn').innerText='취소';
 	       document.getElementById('requestBtn').setAttribute("onclick","resetForm()");
 	       document.getElementById('updateBtn').setAttribute("onclick","updateConfirm()");
      	}
 	    
      	function resetForm() {
      		var vcatnSn = document.getElementById('vcatnSn').value;
      		location.replace("vcatnDetail?vcatnSn="+vcatnSn);
      	}
      	
      	 // 휴일을 제외한 날짜 수 계산 
	    function calcDate() {
   		 	console.log("bgnDay : " + document.getElementById('bgnDe').value);
			var date1 = new Date(document.getElementById('bgnDe').value);								
			var date2 = new Date(document.getElementById('endDe').value);
			var count = 0;
			
			while(true) {  
			    var temp_date = date1;
			    if(temp_date.getTime() > date2.getTime()) {
			        console.log("count : " + count);
			        break;
			    } else {
			        var tmp = temp_date.getDay();
			        if(tmp == 0 || tmp == 6) {
			        } else {
			            count++;         
			        }
			        temp_date.setDate(date1.getDate() + 1); 
			    }
			}
			document.getElementById('countday').value =count;
			document.getElementById('countday').readOnly=true;
		}
		
        
      	
      	
      	
      	
        function updateConfirm() {
	    	   var form = $("#formData").serialize();
	    	   var vcatnSn = document.getElementById('vcatnSn').value;
	    	   console.log("formData :" + form);
	    	   const updateY = document.querySelector("#updateY");
	    	   
				$.ajax({
					type : "POST",
					url : "vcatnUpdate",
					data : form,
					success : function(successYn) {
						console.log(successYn);
						deleteYn = Number(successYn);
						if(deleteYn>0){
							$(".c-updateconfirm").modal();
							updateY.addEventListener('click', function() {
							location.replace("vcatnDetail?vcatnSn="+vcatnSn)
							})
						}
					}
				})
        }
	    	   
	      	
      	function deletedetail(){
			var url = "vcatnDetailDelete";
			var vcatnSn = document.getElementById("vcatnSn").value;
			var deleteYn;
			$(".final").modal();
			var btn = document.querySelector("#deleteBtn");
			const confirm = document.querySelector('#deleteConfirm')
			const deleteCancel = document.querySelector('#deleteCancel')
			confirm.addEventListener('click', function() {
				$.ajax({
					url : url,
					type : "POST",
					data : {
						vcatnSn : vcatnSn
					},
					success : function(successYn) {
						deleteYn = Number(successYn);
						if(deleteYn>0){
							location.replace("vcatnList")
						}
					}
				})
			})
		};
	    
		function apply(){
			
			var bgnDe = document.getElementById('bgnDe').value;
			var endDe = document.getElementById('endDe').value;
			var selectvcatSeCode = document.getElementById('selectvcatSeCode').value;
			var countday = document.getElementById('countday').value;
			var bsrpCn = document.getElementById('bsrpCn').value;
			var snNumber = document.getElementById('vcatnSn').value;
			
			
			var width = 992
			var height = 910
			var left = 10
			var top = 10
			var specs = 'width=' + width
			specs += ',height=' + height
			specs += ',left=' + left
			specs += ',top=' + top
			var docSj = document.getElementById("reqstdocSj").value;
			var docCn = '';
			docCn += '<table border="1" style="border-collapse: collapse; font-size: 15px;">';
			docCn += '<tr style="height: 20px;">'
			docCn += '<th scope="row", style="width: 100px; text-align: center;">기간</th>'
			docCn += '<td style="width: 830px; padding: 20px;">'+bgnDe+' ~ '+endDe+'</td></tr>'
			docCn += '<tr style="height: 20px;"><th scope="row", style="width: 100px; text-align: center;">신청일수</th>'
			docCn += '<td style="width: 830px; padding: 20px;">'+countday+'</td></tr>'
			docCn += '<tr style="height: 20px;"><th scope="row", style="width: 100px; text-align: center;">휴가구분</th>'
			docCn += '<td style="width: 830px; padding: 20px;">'+selectvcatSeCode+'</td></tr>'
			docCn += '<tr style="height: 180px;"><th scope="row", style="width: 100px; text-align: center;">휴가사유</th>'
			docCn += '<td style="width: 830px; padding: 20px;">'+bsrpCn+'</td>'
			docCn += '</tr></table>'
			
			
			window.open('/sanction/elctrnSanctnDrftFormDetail?drftFormSn=2&docSj='+docSj+'&docCn='+docCn+'&snNumber='+snNumber,', document', specs + ', scrollbars=no')
		}
        
        
    </script>
 
</body>
<!-- END: Body-->


