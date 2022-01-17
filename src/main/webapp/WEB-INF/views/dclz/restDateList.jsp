<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">

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
    <link rel="stylesheet" type="text/css" href="/resources/custom/style.css">
    <!-- END: Custom CSS-->
    
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
 	
 	
	var valueArr = new Array();
 	
	function deleteValue() {
		var url = "dclzRestDelete";
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
								location.replace("restDateList?currentPage=1")
							}
					}
				});
			})
			}
		}
 	
 
 
 	</script>
</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu-modern  navbar-floating footer-static" data-open="click" data-menu="vertical-menu-modern" data-col="">

    
    <!-- BEGIN: Content-->
    <div class="app-content content ">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper container-xxl p-0">
            <div class="content-header row">
                <div class="content-header-left col-md-9 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="col-12" style="padding-left: 15px; padding-bottom: 15px;">
                            <h2 class="content-header-title float-left mb-0">관리자</h2>
                            <div class="breadcrumb-wrapper">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#" style="cursor: default;">근태관리</a>
                                    </li>
                                    <li class="breadcrumb-item active">휴일설정
                                    </li>
                                </ol>
                            </div>
                        </div>
            <div class="content-body">
           		<div class="container">
	                <!-- Basic Tables start -->
	                <div class="row" id="basic-table">
	                    <div class="col-12" style="margin-top: 10px;">
		           			
           		
	                      	
	                      	<div id="tab-1" class="tab-content current">
                       			<div class="card">
                         			<div class="card-body" style= "padding:15px;">
                         				<div class="cardHeader-button" >
			                        		<div class="searchEmp" style="display: flex;">
				                                <p style="font-size: 20px; margin-top:10px; margin-left: 15px;">휴일관리&nbsp;</p>
				                                <input type="hidden" id="searchYear" name="searchYear" value="${searchYear}">
				                                <a style="font-size: 20px; margin-top: 5px;" href="#" onclick="moveYear('l')"> &nbsp; < &nbsp; </a>
				                                <label style="font-size: 20px; margin-top: 5px;"  id="printYear" >${searchYear}년</label>
				                                <a style="font-size: 20px; margin-top: 5px;" href="#" onclick="moveYear('r')"> &nbsp; > </a>
				                                <div class="button" style="position:relative; left:935px;">
		                         				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#inlineForm" style="float:right; margin-top:5px; margin-inline:10px;">휴일 등록</button>
		                         				<button type="button"  class="btn btn-outline-primary waves-effect" style="float:right; margin-top:5px; " onclick="deleteValue();"> 선택 삭제 </button>
				                                </div>
		                      				</div>
		                      			</div>
		                            </div>
		                            
		                   
                                    <!-- Modal -->
                                    
                                    <div class="modal fade text-left" id="inlineForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="myModalLabel33">휴일 등록</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <form action="/dclz/dclzRestInsert" method="get" id="restDE">
                                                    <div class="modal-body">
                                                    	<label>일자 </label>
		                                                <section id="flatpickr">
	                                                        <div class="form-group">
	                                                            <input type="text" id="fp-default" name="restdeDe" class="form-control flatpickr-basic" placeholder="YYYY-MM-DD" />
	                                                        </div>
		                                                </section>

                                                        <label>휴일구분 </label>
                                                        <div class="form-group">
                                                            <select class="form-control" id="basicSelect" name="restdeSeCode">
					                                            <option value="R2">공휴일</option>
					                                            <option value="R3">임시 공휴일</option>
					                                            <option value="R4">기타</option>
					                                        </select>
                                                        </div>
                                                        
                                                        <label>내용 </label>
                                                        <div class="form-group">
                                                            <input type="text" name="restdeNm" placeholder="내용을 입력하세요" class="form-control" id="nm"/>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                    	<div id="content" style="width: 375px; height: 39px; text-align: center;"></div>
                                                        <button type="button" onclick="document.getElementById('restDE').submit();"  class="btn btn-primary" data-dismiss="modal">등록</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    
	                            
                            <div class="table-responsive" style="height: 523px;">
                                <table class="table">
                                    <thead>
                                        <tr>
                                        	<th style="width:1%;">
	                                        	<div class="custom-control custom-checkbox">	
	                                        		<input id="allCheck" type="checkbox" name="allCheck" class="custom-control-input" />
													<label class="custom-control-label" for="allCheck"></label>
												</div>
                                        	</th>
                                            <th style="width:7%; text-align: center;">순번</th>
                                            <th style="text-align: center;">일자</th>
                                            <th style="text-align: center;">내용</th>
                                            <th style="text-align: center;">요일</th>
                                            <th style="text-align: center;">휴일구분</th>
                                        </tr>
                                    </thead>
                                     
                                    <tbody>
                                    <c:forEach var="restDeList" items="${pagination.content}" varStatus="status">
                                        <tr style="height: 48px;">
                                        	<td style="text-align: center;">
                                        		<div class="custom-control custom-checkbox">
                                        			<input name="RowCheck" type="checkbox" value="${restDeList.RESTDE_SN}" class="custom-control-input" id="${status.count}-RowCheck" >
                                        			<label class="custom-control-label" for="${status.count}-RowCheck"></label>
                                        		</div>
                                        	</td>
                                            <td style="text-align: center;">${status.count}</td>
                                            <td style="text-align: center;">${restDeList.RESTDE_DE}</td>
                                            <td style="text-align: center;">${restDeList.RESTDE_NM}</td>
                                            <td style="text-align: center;">${restDeList.DFK_SE}요일</td>
                                            <td style="text-align: center;">${restDeList.CODE_NM}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                
                <!-- Basic Tables end -->
	                      
	                   
	                     	 
	                        </div>
	                        </div>
	               
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
													href="/dclz/restDateList?currentPage=${pagination.startPage - 5}"
													aria-controls="DataTables_Table_0" data-dt-idx="0"
													tabindex="0" class="page-link">&nbsp;</a></li>
												<c:forEach var="page" begin="${pagination.startPage}"
													end="${pagination.endPage}">
													<li
														class="paginate_button page-item <c:if test='${param.currentPage eq page}'>active</c:if>">
														<a href="/dclz/restDateList?currentPage=${page}"
														aria-controls="DataTables_Table_0" data-dt-idx="4"
														tabindex="0" class="page-link">${page}</a>
													</li>
												</c:forEach>
												<li
													class="paginate_button page-item next <c:if test='${pagination.endPage >= pagination.totalPages}'>disabled</c:if>">
													<a
													href="/dclz/restDateList?currentPage=${pagination.startPage + 5}"
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
				
					<div class="modal fade text-left modal-primary select" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-centered" role="document">
				        <div class="modal-content">
				            <div class="modal-header" style="justify-content: center;">
				                <h5 class="modal-title" id="myModalLabel140" style="text-align: center; center;font-size: 13px;">안내사항</h5>
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                    <span aria-hidden="true">&times;</span>
				                </button>
				            </div>
				            <div class="modal-body" style="text-align: center;font-size: 15px;">
				                현재일로부터 5년 전후만 선택이 가능합니다. 
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
        
        var date = new Date();
        var nowCal = date.getFullYear();
        var searchYear = document.getElementById("searchYear").value;
        var page = document.getElementById("pageDefault").value;
        	
        function moveYear(a){
        	if(a == "l" && (nowCal - 5) <= Number(searchYear)){
        		searchYear = Number(searchYear)-1;
        	}else if(a == "r" && (nowCal + 5) > Number(searchYear)){
        		searchYear = Number(searchYear)+1;
        	}else{
        		$(".select").modal();
        		return;
        	}
        	document.getElementById("printYear").innerHTML = searchYear + "년";
         
        	var data = {
    				searchYear : searchYear,
					page : page    				
    	  	}	
        	
        	$.ajax({
   				type:'POST',
   				url:"restDateListMonth",
   				contentType : "application/json; charset=utf-8",
   				data:JSON.stringify(data),
   				success:function(result){
   					console.log(result.content);
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
   						thead += "<th style='width:1%;'><input id='allCheck' type='checkbox' name='allCheck'/></th>";
   						thead += "<th style='text-align:center; width:7%;'>순번</th>";
   						thead += "<th style='text-align:center;'>일자</th>";
   						thead += "<th style='text-align:center;'>요일</th>";
   						thead += "<th style='text-align:center;'>휴일구분</th>";
   						thead += "<th style='text-align:center;'>내용</th>";
   						thead += "</tr>";
   						
   						$.each(result.content, function(i,v){
   							tbody += "<tr class='rowContent'>"
   							tbody += "<td><input name='RowCheck' type='checkbox' value="+v.RESTDE_SN+"></td>"
   							tbody += "<td style='text-align:center;width:98.83px;'>" + v.RNUM + "</td>"
   							tbody += "<td style='text-align:center;width:311.84px;'>" + v.RESTDE_DE + "</td>"
   							tbody += "<td style='text-align:center;width:344.27px;'>" + v.DFK_SE+ "요일</td>" 
   							tbody += "<td style='text-align:center;width:161.83px;'>" + v.CODE_NM + "</td>"
   							tbody += "<td style='text-align:center;width:263.34px;'>" + v.RESTDE_NM + "</td>"
   							tbody += "</tr>"
   							
   						});
   					}else if(result.content.length == 0){
   						thead += "<tr >";
   						thead += "<th style='width:1%;'><input id='allCheck' type='checkbox' name='allCheck'/></th>";
   						thead += "<th style='text-align:center; width:7%;'>순번</th>";
   						thead += "<th style='text-align:center;'>일자</th>";
   						thead += "<th style='text-align:center;'>요일</th>";
   						thead += "<th style='text-align:center;'>휴일구분</th>";
   						thead += "<th style='text-align:center;'>내용</th>";
   						thead += "</tr>";
   						tbody += "<tr><td colspan='7' style='text-align:center;'>등록된 휴일이 없습니다.</td></tr>";
   					}
   					
					
   					$(".paging_simple_numbers").html(pageStr);
   					$("thead").html(thead);
   					$("tbody").html(tbody);
   					console.log(result);
   				},
   				error : function(xhr, status) {
   				      	
   				}
   			});
        }
        
        
        $("#content").on("click",function(){
        	$("#fp-default").val("2022-02-22");
        	$("#basicSelect").val("R4");
        	$("#nm").val("창립기념일");
        	
        }) 
    </script>
 
</body>
<!-- END: Body-->



</html>