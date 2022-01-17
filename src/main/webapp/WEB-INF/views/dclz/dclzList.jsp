<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,user-scalable=0,minimal-ui">
<meta name="description"
	content="Vuexy admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
<meta name="keywords"
	content="admin template, Vuexy admin template, dashboard template, flat admin template, responsive admin template, web app">
<meta name="author" content="PIXINVENT">
<title>나의근태관리</title>
<link rel="apple-touch-icon"
	href="/resources/images/ico/apple-icon-120.png">
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/images/ico/favicon.ico">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,400;1,500;1,600"
	rel="stylesheet">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- BEGIN: Vendor CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendors/css/vendors.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/vendors/css/pickers/pickadate/pickadate.css">
<link rel="stylesheet" type="text/css"
	href="/resources/vendors/css/pickers/flatpickr/flatpickr.min.css">
<!-- END: Vendor CSS-->

<!-- BEGIN: Theme CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/bootstrap-extended.css">
<link rel="stylesheet" type="text/css" href="/resources/css/colors.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/components.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/themes/dark-layout.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/themes/bordered-layout.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/themes/semi-dark-layout.css">

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/css/core/menu/menu-types/vertical-menu.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/plugins/forms/pickers/form-flat-pickr.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/plugins/forms/pickers/form-pickadate.css">
<link rel="stylesheet" type="text/css" href="/resources/css/tab.css">
<!-- END: Page CSS-->

<!-- BEGIN: Custom CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/assets/css/style.css">
<!-- END: Custom CSS-->


</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body
	class="vertical-layout vertical-menu-modern  navbar-floating footer-static  "
	data-open="click" data-menu="vertical-menu-modern" data-col="">


	<!-- BEGIN: Content-->
	<div class="app-content content ">
		<div class="content-overlay"></div>
		<div class="header-navbar-shadow"></div>
		<div class="content-wrapper container-xxl p-0">
			<div class="content-header row">
				<div class="content-header-left col-md-9 col-12 mb-2">
					<div class="row breadcrumbs-top">
						<div class="col-12">
							<h2 class="content-header-title float-left mb-0">근태현황</h2>
							<div class="breadcrumb-wrapper">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#" style="cursor: default;">근태관리</a>
									</li>
									<li class="breadcrumb-item active">근태현황</li>
								</ol>
							</div>
						</div>
						<div class="content-body">
							<div class="container" style="margin-top: 25px;">
							
							<ul class="s tabs" role="tablist">
	                                <li class="tab-link day current" id="daytabcl">
	                                    <a class="nav-link active" id="daytab" data-toggle="tab" onclick="window.location.reload()" role="tab" aria-selected="true">일자별</a>
	                                </li>
	                                <li class="tab-link week" id="weektabcl">
	                                    <a class="nav-link" id="weektab" data-toggle="tab" role="tab" onclick="weekdclz()" aria-selected="false" >주간별</a>
	                                </li>
                           		 </ul>
								
										<!-- tab-1 start -->
										<div id="tab-1" class="tab-content current">
											<div class="card">

												<div class="card-body" style="padding: 0.8rem; display: flex; height: 90px;">
													<input type="hidden" id="empNo" name="empNo" value="${empNo}">
													<input type="hidden" id="searchMonth" name="searchMonth" value="${searchMonth}">
					                                <a id="movel" style="font-size: 20px; margin-top: 15px;" href="#" onclick="moveYear('l')"> &nbsp; < &nbsp; </a>
					                                <label style="font-size: 20px; width: 130px; margin-top: 15px;"  id="printMonth" >${printMonth}</label>
					                                <a id="mover" style="font-size: 20px; margin-top: 15px;" href="#" onclick="moveYear('r')"> > </a>
														<div align="right" class="form-group"
															style="margin-left: 79vh;">
															<section id="flatpickr">
																<div class="row">
																	<label
																		style="margin-top: 22px; font-size: 14px; margin-inline: 5px;">기간
																		&nbsp;</label>
																	<div class="form-group" style="margin-bottom: 5px;">
																		<input type="text" id="searhStart"
																			name="flatpickr-basic2"
																			class="form-control flatpickr-basic2" value=""
																			placeholder="YYYY-MM-DD" style="margin-top: 15px;" />
																	</div>
																	<p
																		style="font-size: larger; font-weight: 600; margin-top: 22px; margin-inline: 10px;">
																		~</p>
																	<div class="form-group" style="margin-bottom: 5px;">
																		<input type="text" id="searchEnd"
																			name="flatpickr-basic3"
																			class="form-control flatpickr-basic3" value=""
																			placeholder="YYYY-MM-DD" style="margin-top: 15px;"/>
																	</div>
																	<button type="submit"
																		class="btn btn-icon btn-outline-primary waves-effect"
																		id="searchButton"
																		style="margin-left: 2px; height: 39px; margin-top: 15px;"
																		onclick=searchDclz()>
																		<svg xmlns="http://www.w3.org/2000/svg" width="14"
																			height="14" viewBox="0 0 24 24" fill="none"
																			stroke="currentColor" stroke-width="2"
																			stroke-linecap="round" stroke-linejoin="round"
																			class="feather feather-search">
				                                                <circle cx="11"
																				cy="11" r="8"></circle>
				                                                <line x1="21"
																				y1="21" x2="16.65" y2="16.65"></line></svg>
																	</button>
																</div>
															</section>
														</div>
													</div>

												<div class="table-responsive">
													<table class="table">
														<thead>
															<tr>
																<th style="text-align: center; width: 183.55px;">일자</th>
																<th style="text-align: center; width: 183.55px;">사번</th>
																<th style="text-align: center; width: 141.19px;">이름</th>
																<th style="text-align: center; width: 141.19px">근무형태</th>
																<th style="text-align: center; width:310.64px">출근시각</th>
																<th style="text-align: center; width:310.64px">퇴근시각</th>
																<th style="text-align: center; width:141.25px">근무시간</th>
																<th style="padding: 10px;"></th>
															</tr>
														</thead>
													</table>
													<div style="height: 56vh; overflow-y: scroll;">
														<table class="table" id="dclzTable">
															<tbody>
																<c:forEach var="dclzVO" items="${mapList}"
																	varStatus="stat">
																	<tr>
																		<td style="width: 13%; text-align: center;">${dclzVO.WORK_DE}</td>
																		<td style="width: 13%; text-align: center;">${dclzVO.EMP_NO}</td>
																		<td style="width: 10%; text-align: center;">${dclzVO.EMP_NM}</td>
																		<td style="width: 10%; text-align: center;">${dclzVO.WORK_STLE_CODE}</td>
																		<c:choose>
																			<c:when test="${dclzVO.ATTEND_TIME == null || dclzVO.ATTEND_TIME == ''}">
																				<td style="width: 22%; text-align: center;">-</td>
																			</c:when>
																			<c:otherwise>
																				<td style="width: 22%; text-align: center;">${dclzVO.ATTEND_TIME}</td>
																			</c:otherwise>
																		</c:choose>
																		<c:choose>
																			<c:when test="${dclzVO.LVFFC_TIME == null || dclzVO.LVFFC_TIME == ''}">
																				<td style="width: 22%; text-align: center;">-</td>
																			</c:when>
																			<c:otherwise>
																				<td style="width: 22%; text-align: center;">${dclzVO.LVFFC_TIME}</td>
																			</c:otherwise>
																		</c:choose>
																		<c:choose>
																			<c:when test="${dclzVO.WORK_TIME == null || dclzVO.WORK_TIME == ''}">
																				<td style="width: 10%; text-align: center;">-</td>
																			</c:when>
																			<c:otherwise>
																				<td style="width: 10%; text-align: center;">${dclzVO.WORK_TIME}</td>
																			</c:otherwise>
																		</c:choose>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
										<!-- tab-1 end -->

									</div>
								</div>
								<!-- Basic Tables end -->


								<div class="modal fade text-left modal-primary select" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
								    <div class="modal-dialog modal-dialog-centered" role="document">
								        <div class="modal-content">
								            <div class="modal-header" style="justify-content: center;">
								                <h5 class="modal-title" id="myModalLabel140" style="text-align: center; center;font-size: 13px;">필수 선택사항 안내</h5>
								                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								                    <span aria-hidden="true">&times;</span>
								                </button>
								            </div>
								            <div class="modal-body" style="text-align: center;font-size: 15px;">
								                기간을 선택해주세요.
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
         		minDate: '',
         		maxDate:'today',
         		onChange:function(selectDates, dateStr, instance){
         			flat3.set("minDate",dateStr);
         		}
         	 });
            }
            
          	// basicPickr2 이후 날짜 선택 
            if (basicPicker3.length) {
             flat3 = basicPicker3.flatpickr({
          		minDate:'',
          		maxDate:'today'
          	 });
            }
            
        });
        
        /** 월별 조회 **/
   		var date = new Date();
        var searchMonth = document.getElementById("searchMonth").value;
        var searchday = new Date(searchMonth);
        var tabBoolean = true;
        var searchMonth = searchday.getMonth();
        var empNo = document.getElementById("empNo").value;
        	
        function moveYear(a){
        	if(a == "l"){
        		searchday.setMonth(searchday.getMonth()-1);
        	}else if(a == "r"){
        		searchday.setMonth(searchday.getMonth()+1);
        	}
        	
	   	 	var year = searchday.getFullYear();
	   		var month = searchday.getMonth() +1 ;
	   		if(month<10){
	   			 month = "0"+month;
	   		 }
	   		document.getElementById("searchMonth").value = year+"-"+month; 
	   		searchMonth = document.getElementById("searchMonth").value;
	        document.getElementById("printMonth").innerHTML = year+"년 "+month+"월";
        	
         
        	var data = {
    			searchMonth : searchMonth,
    	  	}
        	
        	if(tabBoolean){
	        	$.ajax({
	        		type: "POST",
	        		url: "dclzListMonth",
	        		contentType: "application/json; charset=utf-8",
	        		data : JSON.stringify(data),
	        		success:function(result){
	   					var thead = "";
	   					var tbody = "";
	   					$(".nav-tabs").html("");
						
	   					if(result.length){
	   						$.each(result, function(i,v){
	   							tbody += "<tr>";
	   							tbody += "<td style='text-align:center;width:183.55px;'>"+v.WORK_DE+"</td>";
	   							tbody += "<td style='text-align:center;width:183.55px;'>" + v.EMP_NO + "</td>";
	   							tbody += "<td style='text-align:center;width:141.19px;'>" + v.EMP_NM + "</td>";
	   							tbody += "<td style='text-align:center;width:141.19px;'>" + v.WORK_STLE_CODE+"</td>" ;
	   							if(v.ATTEND_TIME == null || v.ATTEND_TIME== ''){
		            				tbody += "<td style='width:22%;text-align: center;width:310.64px;'>-</td>";            					
	            				} else{
	   								tbody += "<td style='text-align:center;width:310.64px;'>" + v.ATTEND_TIME + "</td>";
	            				}
	   							if(v.LVFFC_TIME == null || v.LVFFC_TIME == ''){
		            				tbody += "<td style='width:22%;text-align: center;width:310.64px;'>-</td>";            					
	            				} else{
		            				tbody += "<td style='width:22%;text-align: center;width:310.64px'>"+v.LVFFC_TIME+"</td>";            					
	            				}
	            				if(v.WORK_TIME == null || v.WORK_TIME == ''){
	            					tbody += "<td style='width:22%;text-align: center;width:141.25px'>-</td>";            					
	            				} else{
	            					tbody += "<td style='width:22%;text-align: center;width:141.25px'>"+v.WORK_TIME+"</td>";            					
	            				}
	   							tbody += "</tr>";
	   							
	   						});
	   					}else if(result.length == 0){
	   						tbody += "<tr><td colspan='7' style='text-align:center;'>검색결과가 없습니다.</td></tr>";
	   					}
						
	   					$("tbody").html(tbody);
	   					console.log(result);
	   				},
	   				error : function(xhr, status) {
	   				      	
	   				}
	   			});
        	}else{
        		
        		$.ajax({
            		type: "POST",
            		url: "weekDclzList",
            		dataType: "json",
            		data : {
            			empNo : empNo,
            			searchMonth : searchMonth
            		},
            		success:function(result){
            			var thead = "";
       					var tbody = "";
       					$(".nav-tabs").html("");
    					
       					if(result.length){
       						thead += "<tr>";
       						thead += "<th style='text-align:center;'>주차</th>";
       						thead += "<th style='text-align:center;'>기간</th>";
       						thead += "<th style='text-align:center;'>근무시간</th>";
       						thead += "<th style='text-align:center;'>52시간 준수여부</th>";
       						thead += "</tr>";
       						
       						$.each(result, function(i,v){
       							tbody += "<tr>";
       							tbody += "<td style='text-align:center;width:183.55px;'>"+(i+1)+"</td>";
       							tbody += "<td style='text-align:center;width:300px;'>" + v.START_DATE + " ~ "+ v.END_DATE +"</td>" ;
       							if(v.TIMETOTAL == null || v.TIMETOTAL== ''){
    	            				tbody += "<td style='width:22%;text-align: center;width:310.64px;'>-</td>";            					
                				} else{
       								tbody += "<td style='text-align:center;width:310.64px;'>" + v.TIMETOTAL + "</td>";
                				}
       							if(v.VALIDATE == null || v.VALIDATE == ''){
    	            				tbody += "<td style='width:22%;text-align: center;width:310.64px;'>-</td>";            					
                				} else{
    	            				tbody += "<td style='width:22%;text-align: center;width:310.64px'>"+v.VALIDATE+"</td>";            					
                				}
                				
       							tbody += "</tr>";
       							
       						});
       					}else if(result.length == 0){
       						thead += "<tr>";
       						thead += "<tr>";
       						thead += "<th style='text-align:center;'>주차</th>";
       						thead += "<th style='text-align:center;'>기간</th>";
       						thead += "<th style='text-align:center;'>근무시간</th>";
       						thead += "<th style='text-align:center;'>52시간 준수여부</th>";
       						thead += "</tr>";
       						thead += "</tr>";
       						tbody += "<tr><td colspan='7' style='text-align:center;'>검색결과가 없습니다.</td></tr>";
       					}
       					
    					
       					$("thead").html(thead);
       					$("tbody").html(tbody);
       					console.log(result);
       				},
       				error : function(xhr, status) {
       				}
       			});
        	}
        }
		
        
        
        /** 기간으로 검색 */
        function searchDclz() {
        	
        	var searchStart = document.getElementById("searhStart").value;
        	var searchEnd = document.getElementById("searchEnd").value;
        	
        	if(searchStart == "" || searchStart == null || searchEnd == "" || searchEnd == null) {
        		$(".select").modal();
  				return false;
  			}
        	
        	if(tabBoolean){
        		
        	$.ajax({
        		type: "POST",
        		url: "searchDclzList",
        		dataType: "json",
        		data : {
        			searchStart : searchStart,
        			searchEnd : searchEnd
        		},
        		success:function(data){
        			$('#dclzTable > tbody').empty();
        			$('#printMonth').text("검색결과");
        			$("#printMonth").css("color","#6755cd");
        			$("#printMonth").css("padding-left","20px");
        			$('#movel').remove();
        			$('#mover').remove();
        			$('#paging').remove();
        			if(data.length>=1){
        				for(var i=0; i<data.length; i++){
        					str =  "<tr>"
            				str += "<td style='width:13%;text-align: center;'>"+data[i].WORK_DE+"</td>";
            				str += "<td style='width:13%;text-align: center;'>"+data[i].EMP_NO+"</td>";
            				str += "<td style='width:10%;text-align: center;'>"+data[i].EMP_NM+"</td>";
            				str += "<td style='width:10%;text-align: center;'>"+data[i].WORK_STLE_CODE+"</td>";
            				str += "<td style='width:22%;text-align: center;'>"+data[i].ATTEND_TIME+"</td>";
            				if(data[i].LVFFC_TIME == null || data[i].LVFFC_TIME == ''){
	            				str += "<td style='width:22%;text-align: center;'>-</td>";            					
            				} else{
	            				str += "<td style='width:22%;text-align: center;'>"+data[i].LVFFC_TIME+"</td>";            					
            				}
            				if(data[i].WORK_TIME == null || data[i].WORK_TIME == ''){
	            				str += "<td style='width:22%;text-align: center;'>-</td>";            					
            				} else{
	            				str += "<td style='width:22%;text-align: center;'>"+data[i].WORK_TIME+"</td>";            					
            				}
            				str += "</tr>"
            				$('#dclzTable').append(str);
        				}
        			}else{
        				str =  "<tr>"
        				str += "<td colspan='7' style='text-align:center; padding:40px;'>검색결과가 없습니다.</td>"
        				str += "</tr>"
        			    $('#dclzTable').append(str);
        			}
        		}
        	})
        	}
		}
        
        // 주차별 검색
        function weekdclz(){
        	$('#daytabcl').removeClass('current');
        	$('#weektabcl').addClass('current');
        	
        	var empNo = document.getElementById("empNo").value;
        	var searchMonth = document.getElementById("searchMonth").value;
        	tabBoolean = false;
        	$("#flatpickr").remove();
        	
        	$.ajax({
        		type: "POST",
        		url: "weekDclzList",
        		dataType: "json",
        		data : {
        			empNo : empNo,
        			searchMonth : searchMonth
        		},
        		success:function(result){
        			var thead = "";
   					var tbody = "";
   					$(".nav-tabs").html("");
					
   					if(result.length){
   						thead += "<tr>";
   						thead += "<th style='text-align:center; width:231.75px;'>주차</th>";
   						thead += "<th style='text-align:center; width:378.8px;'>기간</th>";
   						thead += "<th style='text-align:center; width:392.2px;'>근무시간</th>";
   						thead += "<th style='text-align:center;'>52시간 준수여부</th>";
   						thead += "</tr>";
   						
   						$.each(result, function(i,v){
   							tbody += "<tr>";
   							tbody += "<td style='text-align:center;width:183.55px;'>"+(i+1)+"</td>";
   							tbody += "<td style='text-align:center;width:300px;'>" + v.START_DATE + " ~ "+ v.END_DATE +"</td>" ;
   							if(v.TIMETOTAL == null || v.TIMETOTAL== ''){
	            				tbody += "<td style='width:22%;text-align: center;width:310.64px;'>-</td>";            					
            				} else{
   								tbody += "<td style='text-align:center;width:310.64px;'>" + v.TIMETOTAL + "</td>";
            				}
   							if(v.VALIDATE == null || v.VALIDATE == ''){
	            				tbody += "<td style='width:22%;text-align: center;width:310.64px;'>-</td>";            					
            				} else{
	            				tbody += "<td style='width:22%;text-align: center;width:310.64px'>"+v.VALIDATE+"</td>";            					
            				}
            				
   							tbody += "</tr>";
   							
   						});
   					}else if(result.length == 0){
   						thead += "<tr>";
   						thead += "<tr>";
   						thead += "<th style='text-align:center;'>주차</th>";
   						thead += "<th style='text-align:center;'>기간</th>";
   						thead += "<th style='text-align:center;'>근무시간</th>";
   						thead += "<th style='text-align:center;'>52시간 준수여부</th>";
   						thead += "<th style='text-align:center; padding:7px;'></th>";
   						thead += "</tr>";
   						thead += "</tr>";
   						tbody += "<tr><td colspan='7' style='text-align:center;'>검색결과가 없습니다.</td></tr>";
   					}
   					$("thead").html(thead);
   					$("tbody").html(tbody);
   					console.log(result);
   				},
   				error : function(xhr, status) {
   				}
   			});
        }
        
    </script>

</body>
<!-- END: Body-->


