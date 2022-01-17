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
                                    <li class="breadcrumb-item"><a href="#" style="cursor: default;">출장관리</a>
                                    </li>
                                    <li class="breadcrumb-item active">출장신청내역
                                    </li>
                                </ol>
                            </div>
                        </div>
            <div class="content-body">
           		<div class="container">
	                <!-- Basic Tables start -->
	                <div class="row" id="basic-table">
	                    <div class="col-12" style="margin-top: 10px;">
		           			
           		
	                      	
	                      	<!-- tab-1 start -->
	                      	<div id="tab-1" class="tab-content current">
	                        	<div class="card" style="height:600px;">
		                        	<div class="cardHeader-button" style="margin: 2px; margin-left:20px; display: flex; justify-content: space-between; align-items: center;">
	                        		<div class="searchBsrp" style="padding-top: 10px; display: flex;">
	                        			<select class="form-control mb-1" id="searchFilter" name="searchFilter" style="width: 165px; height: 40px;">
		                                    <option value="sj">제목</option>
		                                    <option value="cn">내용</option>
		                                    <option value="place">장소</option>
		                                </select>
		                        		<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요." class="form-control" style="height: 40px;"/>
	
										<button type="button" class="btn btn-icon btn-outline-primary waves-effect" id="searchBtn" style="height: 40px; width: 45px;" >
	                                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
	                                    </button>
	                        		</div>
		                            <div class="card-body" style="padding: 0.8rem">
		                               <div class="row" style="flex-direction: row-reverse;">
		                          			<div align="right" class="form-group" style="display: flex; position: relative; right: 30px;">
		                            			<button type="button"  class="btn btn-outline-primary waves-effect" style="float:right; margin-top:8px; " onclick=deleteValue()> 선택 삭제 </button>
		                           			</div>
		                      			</div>
		                            </div>
	                        		</div>
	                            
	                            
	                            <div class="table-responsive">
	                                <table class="table" id="bsrpTable"> 
	                                    <thead>
	                                        <tr>
	                                        	<th style="width:1%;">
	                                        		<div class="custom-control custom-checkbox">
	                                        			<input id="allCheck" type="checkbox" name="allCheck" class="custom-control-input"/>
	                                        			<label class="custom-control-label" for="allCheck"></label>
	                                        		</div>
	                                        	</th>
                                            	<th style="width:7%;">순번</th>
	                                            <th>제목</th>
	                                            <th>일정</th>
	                                            <th>장소</th>
	                                            <th>신청일자</th>
	                                            <th>신청상태</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                    <c:forEach var="b" items="${pagination.content}" varStatus="status">
	                                        <tr class="rowContent" style = "cursor:pointer;">
	                                        	<td>
	                                        		<div class="custom-control custom-checkbox">
	                                        			<input name="RowCheck" type="checkbox" value="${b.BSRP_SN}" class="custom-control-input" id="${b.BSRP_SN}-RowCheck">
	                                        			<label class="custom-control-label" for="${b.BSRP_SN}-RowCheck"></label>
	                                        		</div>
	                                        	</td>
	                                            <td class="bsrpContent" onclick = "location.href='/dclz/bsrpDetail?bsrpSn=' + ${b.BSRP_SN}">${status.count}</td>
	                                            <td class="bsrpContent" onclick = "location.href='/dclz/bsrpDetail?bsrpSn=' + ${b.BSRP_SN}">${b.REQSTDOC_SJ}</td>
	                                            <td class="bsrpContent" onclick = "location.href='/dclz/bsrpDetail?bsrpSn=' + ${b.BSRP_SN}">${b.BGN_DE} ~ ${b.END_DE}</td>
	                                            <td class="bsrpContent" onclick = "location.href='/dclz/bsrpDetail?bsrpSn=' + ${b.BSRP_SN}">${b.BSRP_PLACE}</td>
	                                            <td class="bsrpContent" onclick = "location.href='/dclz/bsrpDetail?bsrpSn=' + ${b.BSRP_SN}">${b.REQST_DE}</td>
	                                            <td class="bsrpContent" onclick = "location.href='/dclz/bsrpDetail?bsrpSn=' + ${b.BSRP_SN}">${b.sanctnStat}</td>
	                                        </tr>
	                                    </c:forEach>
	                                    </tbody>
	                                </table>
	                            </div>
	                            </div>
	                      	</div>
	                      <!-- tab-1 end -->
	                        </div>
	                        </div>
	                <!-- Basic Tables end -->
	                    </div>
	               </div>
                    </div>
                </div>
            </div>
	       			 <!-- 페이징 시작 -->
								<div class="d-flex justify-content-between mx-0 row" id="paging"
									style="padding-left: 550px;">
									<input type="hidden" value="1" id="pageDefault">
									<div class="col-sm-12 col-md-6">
										<div class="dataTables_paginate paging_simple_numbers"
											id="DataTables_Table_0_paginate">
											<ul class="pagination">
												<li
													class="paginate_button page-item previous <c:if test='${pagination.startPage <= 5}'>disabled</c:if>"
													id="DataTables_Table_0_previous"><a
													href="/dclz/bsrpList?currentPage=${pagination.startPage - 5}"
													aria-controls="DataTables_Table_0" data-dt-idx="0"
													tabindex="0" class="page-link">&nbsp;</a></li>
												<c:forEach var="page" begin="${pagination.startPage}"
													end="${pagination.endPage}">
													<li
														class="paginate_button page-item <c:if test='${param.currentPage eq page}'>active</c:if>">
														<a href="/dclz/bsrpList?currentPage=${page}"
														aria-controls="DataTables_Table_0" data-dt-idx="4"
														tabindex="0" class="page-link">${page}</a>
													</li>
												</c:forEach>
												<li
													class="paginate_button page-item next <c:if test='${pagination.endPage >= pagination.totalPages}'>disabled</c:if>">
													<a
													href="/dclz/bsrpList?currentPage=${pagination.startPage + 5}"
													aria-controls="DataTables_Table_0" data-dt-idx="8"
													tabindex="0" class="page-link">&nbsp;</a>
												</li>
											</ul>
										</div>
									</div>
								</div>
								<!-- 페이징 끝 -->
	        
	        </div>
	        </div>
	        
	        <!-- 모달 -->
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
 
 	<div class="modal fade text-left modal-primary emptySearch" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-centered" role="document">
				        <div class="modal-content">
				            <div class="modal-header" style="justify-content: center;">
				                <h5 class="modal-title" id="myModalLabel140" style="text-align: center; center;font-size: 13px;">안내사항</h5>
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                    <span aria-hidden="true">&times;</span>
				                </button>
				            </div>
				            <div class="modal-body" style="text-align: center;font-size: 15px;">
				                검색어를 입력해 주세요.
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
        });
        
        /** 목록 전체 클릭*/
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
 		
        /** 목록 일괄 삭제 */
 		function deleteValue() {
			var url = "bsrpDelete";
			var valueArr = new Array();
			var list = $("input[name='RowCheck']");
			for(var i=0; i< list.length; i++){
				if(list[i].checked){
					valueArr.push(list[i].value);
				}
			}
			if (valueArr.length == 0){
				$(".delselect").modal();
			}
			else{
				$(".final").modal();
				var btn = document.querySelector("#deleteBtn");
				const confirm = document.querySelector('#deleteConfirm')
				const deleteCancel = document.querySelector('#deleteCancel')
				
				confirm.addEventListener('click', function() {
					$.ajax({
						url : url,
						type : "POST",
						traditional : true,
						data : {
							valueArr : valueArr
						},
						success: function(data) {
								if(data>0){
								$(".delconfirm").modal();	
								location.replace("bsrpList")
								}
						}
					});
				})
			}
		}

        
   		function search(page){
   			var data = {
   					filter : $("#searchFilter").val(),
        			keyword : $("#keyword").val(),
   					page : page
   			}
   			
   			$.ajax({
   				type:'POST',
   				url:"searchBsrpPages",
   				contentType : "application/json; charset=utf-8",
   				data:JSON.stringify(data),
   				success:function(result){
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
   					var thead = "";
   					var tbody = "";
   					var pageStr = '<ul class="pagination">';
   					$(".nav-tabs").html("");
					pageStr += '<li class="page-item prev '
					if(result.startPage<=5){pageStr += 'disabled'}
					pageStr += '">';
					pageStr += '<a href="javascript:search('+(result.startPage-5)+')" class="page-link">&nbsp;</a></li>';
					for(var s=result.startPage; s <= result.endPage; s++){
						pageStr += '<li class="page-item '
						if(result.currentPage==s){pageStr += 'active'}
						pageStr += '">';
						pageStr += '<a href="javascript:search('+s+')" class="page-link">'+s+'</a></li>'
					}
					pageStr += '<li class="page-item next ';
					if(result.endPage >= result.totalPages){pageStr += 'disabled'} 
					pageStr += '">';
					pageStr += '<a href="javascript:search('+result.startPage+5+')" class="page-link">&nbsp;</a></li>'
					pageStr += '</ul></div>'
   					
   					if(result.content.length){
   						thead += "<tr>";
   						thead += "<th style='width:1%;'><div class='custom-control custom-checkbox'><input id='allCheck' class='custom-control-input' type='checkbox' name='allCheck'/><label class='custom-control-label' for='allCheck'></label></div></th>";
   						thead += "<th style='text-align:center; width:7%;'>순번</th>";
   						thead += "<th style='text-align:center;'>제목</th>";
   						thead += "<th style='text-align:center;'>일정</th>";
   						thead += "<th style='text-align:center;'>장소</th>";
   						thead += "<th style='text-align:center;'>신청일자</th>";
   						thead += "<th style='text-align:center;'>신청상태</th>";
   						thead += "</tr>";
   						
   						$.each(result.content, function(i,v){
   							tbody += "<tr class='rowContent' style = 'cursor:pointer;'>"
   							tbody += "<td><div class='custom-control custom-checkbox'><input name='RowCheck' class='custom-control-input' id='" + v.BSRP_SN + "-RowCheck' type='checkbox' value="+v.BSRP_SN+"><label class='custom-control-label' for='" + v.BSRP_SN + "-RowCheck'></label></div></td>"
   							tbody += "<td style='text-align:center;width:98.83px;' onclick =location.href='bsrpDetail?bsrpSn=" + v.BSRP_SN +"'>" + v.RNUM + "</td>"
   							tbody += "<td style='text-align:center;width:311.84px;' onclick =location.href='bsrpDetail?bsrpSn=" + v.BSRP_SN +"'>" + v.REQSTDOC_SJ + "</td>"
   							tbody += "<td style='text-align:center;width:344.27px;' onclick =location.href='bsrpDetail?bsrpSn=" + v.BSRP_SN +"'>" + v.BGN_DE+" ~ "+ v.END_DE + "</td>" 
   							tbody += "<td style='text-align:center;width:161.83px;' onclick =location.href='bsrpDetail?bsrpSn=" + v.BSRP_SN +"'>" + v.BSRP_PLACE + "</td>"
   							tbody += "<td style='text-align:center;width:263.34px;' onclick =location.href='bsrpDetail?bsrpSn=" + v.BSRP_SN +"'>" + v.REQST_DE + "</td>"
   							tbody += "<td style='text-align:center;width:161.89px;' onclick =location.href='bsrpDetail?bsrpSn=" + v.BSRP_SN +"'>" + v.sanctnStat + "</td>"
   							tbody += "</tr>"
   							
   						});
   					}else if(result.content.length == 0){
   						thead += "<tr >";
   						thead += "<th style='width:1%;'><div class='custom-control custom-checkbox'><input id='allCheck' class='custom-control-input' type='checkbox' name='allCheck'/><label class='custom-control-label' for='allCheck'></label></div></th>";
   						thead += "<th style='text-align:center; width:7%;'>순번</th>";
   						thead += "<th style='text-align:center;'>제목</th>";
   						thead += "<th style='text-align:center;'>일정</th>";
   						thead += "<th style='text-align:center;'>장소</th>";
   						thead += "<th style='text-align:center;'>신청일자</th>";
   						thead += "<th style='text-align:center;'>신청상태</th>";
   						thead += "</tr>";
   						tbody += "<tr><td colspan='7' style='text-align:center;'>검색결과가 없습니다.</td></tr>";
   					}
   					
   					$(".paging_simple_numbers").html(pageStr);
   					$("thead").html(thead);
   					$("tbody").html(tbody);
   				},
   				error : function(xhr, status) {
   				      	
   				}
   			});
   		}
    
   	 $("#searchBtn").on("click",function(){
   		var emptyKeyword = $("#keyword").val();
   		 if (emptyKeyword == null || emptyKeyword == "" || emptyKeyword == 'undefined') {
   			$(".emptySearch").modal();
		} else {
	     	search($("#pageDefault").val());
		}
     });	
 		
 		
        
    </script>
 
</body>
<!-- END: Body-->


