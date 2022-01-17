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
                        <div class="col-12" style="padding-bottom: 15px;">
                            <h2 class="content-header-title float-left mb-0">근태관리</h2>
                            <div class="breadcrumb-wrapper">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#" style="cursor: default;">출장관리</a>
                                    </li>
                                    <li class="breadcrumb-item active">출장신청함
                                    </li>
                                </ol>
                            </div>
                        </div>
            
           		<section id="multiple-column-form">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body" style="width:1300px;">
                                    <form class="form" id="formData" >
                                        <div class="row">
                                            <div class="col-md-3 col-12">
                                                <div class="form-group">
                                                    <label for="first-name-column">신청번호</label>
                                                    <input type="text" id="elctrnSanctnSn" class="form-control" value="자동채번" name="elctrnSanctnSn" style="width:280px;" readonly/>
                                                    <input type="hidden" id="bsrpSn" class="form-control" value="${bsrpVO.bsrpSn}" name="bsrpSn" style="width:280px;" readonly/>
                                                    <input type="hidden" id="sanctnYn" class="form-control" value="${bsrpVO.sanctnYn}" name="sanctnYn" style="width:280px;" readonly/>
                                                    <input type="hidden" id="inSn" class="form-control" value="${bsrpVO.elctrnSanctnSn}" name="inSn" style="width:280px;" readonly/>
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
                                                    <input type="hidden" id="empNo" name="empNo" value="${bsrpVO.empNo}">
                                                    <input type="text" id="empNm" class="form-control" value="${empMap.EMP_NM}" name="empNm" style="width:280px;" readonly/>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-12">
                                                <div class="form-group">
                                                    <label for="country-floating">신청부서</label>
                                                    <input type="text" id="deptNm" class="form-control" name="deptNm" value="${empMap.DEPT_NM}" style="width:280px;" readonly/>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-12">
                                                <div class="form-group">
                                                    <label for="country-floating">기간</label>
                                                    <input type="text" id="bgnDe" name="bgnDe" class="form-control flatpickr-basic5" value="${bsrpVO.bgnDe}" style="width:280px;" readonly/>
                                                </div>
                                            </div>
                                            <p style="margin-top:30px; font-weight:bolder; font-size:15px; margin-left:95px;">~</p>
                                            <div class="col-md-3 col-12">
                                                <div class="form-group">
                                               	    <label for="country-floating"></label>
                                                    <input type="text" id="endDe" name="endDe" class="form-control flatpickr-basic4" value="${bsrpVO.endDe}" placeholder="" style="width:280px; height:39.01px; margin-top:5px;" readonly/>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-12">
                                                <div class="form-group">
                                                    <label for="email-id-column">출장지역</label>
                                                    <input type="text" id="bsrpPlace" class="form-control" name="bsrpPlace" value="${bsrpVO.bsrpPlace}" style="width:280px;" readonly/>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-12">
                                                <div class="form-group">
                                                    <label for="email-id-column">출장목적</label>
                                                    <input type="text" id="bsrpPrvonsh" class="form-control" name="bsrpPrvonsh" value="${bsrpVO.bsrpPrvonsh}" style="width:280px;" readonly/>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-12">
                                                <div class="form-group">
                                                    <label for="email-id-column">제목</label>
                                                    <input type="text" id="reqstdocSj" class="form-control" name="reqstdocSj" value="${bsrpVO.reqstdocSj}" style="width:1242px;" readonly/>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="email-id-column">신청내용</label>
                                                    <textarea id="bsrpCn" class="form-control" name="bsrpCn" style="width:1242px; height:300px;" readonly>${bsrpVO.bsrpCn}</textarea>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <button type="button" id="requestBtn" class="btn btn-primary mr-1" style="float: right; margin-left:15px;" onclick=apply()>신청</button>
                                                <button type="button" id="updateBtn" class="btn btn-outline-primary waves-effect" style="float: right; margin-left:10px;" onclick=updatebsrp()> 수정</button>
                                                <button type="button" id="bsrpList" class="btn btn-outline-primary waves-effect" style="float: left; margin-left:0px;">목록</button>
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

	        	<!-- 모달창 -->
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
	 		$("#bsrpList").on("click", function(){
		 	location.href = "/dclz/bsrpList";
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
		 	
      	function updatebsrp() {
      		/* 글 작성 가능하게 변경 */
			document.getElementById('bgnDe').readOnly=false;
			document.getElementById('endDe').readOnly=false;
			document.getElementById('bsrpPlace').readOnly=false;
			document.getElementById('bsrpPrvonsh').readOnly=false;
			document.getElementById('reqstdocSj').readOnly=false;
			document.getElementById('bsrpCn').readOnly=false;
			
			/* 달력 선택 값 제한 */
 	        var minDate= $('#bgnDe').val();     
 	        var basicPicker4 = $('.flatpickr-basic4');
 	        var basicPicker5 = $('.flatpickr-basic5');
 	        var flat4;
	        
 	        if(basicPicker4.length){
 	        	flat4 = basicPicker4.flatpickr({
 	        		minDate: minDate
 	        	})
 	        } 
	        
 	        if(basicPicker5.length){
 	        	basicPicker5.flatpickr({
 	        		minDate: 'today',
 	        		onChange:function(selectDates, dateStr, instance){
 	        			flat4.set("minDate",dateStr);
 	        			$('#endDe').attr('placeholder','YYYY-MM-DD');
 	        		}
 	        	})
 	        } 
			
 	       document.getElementById('deleteBtn').remove();
 	       document.getElementById('requestBtn').innerText='취소';
 	       document.getElementById('requestBtn').setAttribute("onclick","resetForm()");
 	       document.getElementById('updateBtn').setAttribute("onclick","updateConfirm()");
 	    
		}
      	
      	function resetForm() {
      		var bsrpSn = document.getElementById('bsrpSn').value;
      		location.replace("bsrpDetail?bsrpSn="+bsrpSn);
      		
      	}
      	
 	       
        function updateConfirm() {
	    	   var form = $("#formData").serialize();
	    	   var bsrpSn = document.getElementById('bsrpSn').value;
	    	   console.log("formData :" + form);
	    	   const updateY = document.querySelector("#updateY");
	    	   
				$.ajax({
					type : "POST",
					url : "bsrpUpdate",
					data : form,
					success : function(successYn) {
						console.log(successYn);
						deleteYn = Number(successYn);
						if(deleteYn>0){
							$(".c-updateconfirm").modal();
							updateY.addEventListener('click', function() {
							location.replace("bsrpDetail?bsrpSn="+bsrpSn)
							})
						}
					}
				})
        }
	    	   
	      	
      	function deletedetail(){
			var url = "bsrpDetailDelete";
			var bsrpSn = document.getElementById("bsrpSn").value;
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
						bsrpSn : bsrpSn
					},
					success : function(successYn) {
						deleteYn = Number(successYn);
						if(deleteYn>0){
							$(".delconfirm").modal();
							location.replace("bsrpList")
						}
					}
				})
			})	
		};
		
		function apply(){
				
			var bgnDe = document.getElementById('bgnDe').value;
			var endDe = document.getElementById('endDe').value;
			var bsrpPlace = document.getElementById('bsrpPlace').value;
			var bsrpPrvonsh = document.getElementById('bsrpPrvonsh').value;
			var bsrpCn = document.getElementById('bsrpCn').value;
			var snNumber = document.getElementById('bsrpSn').value;
			
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
			docCn += '<tr style="height: 20px;"><th scope="row", style="width: 100px; text-align: center;">지역</th>'
			docCn += '<td style="width: 830px; padding: 20px;">'+bsrpPlace+'</td></tr>'
			docCn += '<tr style="height: 20px;"><th scope="row", style="width: 100px; text-align: center;">목적</th>'
			docCn += '<td style="width: 830px; padding: 20px;">'+bsrpPrvonsh+'</td></tr>'
			docCn += '<tr style="height: 180px;"><th scope="row", style="width: 100px; text-align: center;">신청 내용</th>'
			docCn += '<td style="width: 830px; padding: 20px;">'+bsrpCn+'</td>'
			docCn += '</tr></table>'
			
			window.open('/sanction/elctrnSanctnDrftFormDetail?drftFormSn=3&docSj='+docSj+'&docCn='+docCn+'&snNumber='+snNumber,', document', specs + ', scrollbars=no')
		}
        
    </script>
 
</body>
<!-- END: Body-->


