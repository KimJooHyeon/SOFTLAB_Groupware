<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=0,minimal-ui">
    <meta name="description" content="Vuexy admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
    <meta name="keywords" content="admin template, Vuexy admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="PIXINVENT">
    <title>Tree - Vuexy - Bootstrap HTML admin template</title>
    <link rel="apple-touch-icon" href="/resources/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="/resources/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,400;1,500;1,600" rel="stylesheet">

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/vendors/css/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/fonts/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendors/css/extensions/jstree.min.css">
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
    <link rel="stylesheet" type="text/css" href="/resources/css/plugins/extensions/ext-component-tree.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/tab.css">
    <script src="/resources/js/jquery-3.6.0.js"></script>
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/css/style.css">
    <!-- END: Custom CSS-->
	
	 <script type="text/javascript">
		
        $(document).ready(function(){
              $("#tab-2").hide();
             $('ul.tabs li').click(function(){
                var tab_id = $(this).attr('data-tab');
                 $('ul.tabs li').removeClass('current');
                $('.tab-content').removeClass('current');
   
                $(this).addClass('current');
                $("#"+tab_id).addClass('current');
                if(tab_id=='tab-2'){
                   $("#tab-2").show();
                }
             });
          });
        
        $(function() {
    		$("#insertBtn").on("click", function() {
	    			var v_infos=$(".jstree-anchor.jstree-clicked")[0].children;
	    			console.log($(".jstree-anchor.jstree-clicked")[0].children);
	    			var empNo = v_infos[1].value;
	    			var clsfCode = v_infos[2].value;
	    			var empNm = v_infos[3].value;
	    			var deptNm = v_infos[4].value;
	    			$("#appLineTable").append(
	    					"<tr class='apptr'><td>"+deptNm+"</td><td>"+clsfCode+"</td><td id='emp' data-empNo="+empNo+">"+empNm+"</td></tr>"	
	    			);
                
    		});	
    		
    		
    		$('#searchBtn').on('click', function() {
    			event.preventDefault();      // built-in event막기
    			//event.stopPropergation(); // 이벤트 전파 막기
    			 var form = $("#sanctionSearch").serialize();
				$.ajax({
					type : 'get',
					url : "/hr/searchEmpAjax",
					data : form,
					dataType : 'json',
					success : function(empData) {
						var v_tblStr="<ul>";
						for(var i=0; i<empData.length; i++){
							v_tblStr +="<a><li class='searchResult'>[" + empData[i].deptNm + "&nbsp;&nbsp; /";
							v_tblStr +="&nbsp;&nbsp;" + empData[i].clsfCode + "]";
							v_tblStr +="&nbsp;&nbsp;" + empData[i].empNm + "</li></a>";
						}						
						v_tblStr +="</ul>";
						$("#searchResultMenu").html(v_tblStr);
					}
				});
			});
        	
    		//행삭제
    		 $('#deleteBtn').on('click', function() {
    		 //행삭제할 테이블 가져오기
    		 var table = document.getElementById('alt');
    		 var count = 1;	
    		 
    		 //tr삭제하기
    		    table.deleteRow(table.rows.length - 1);
    		 //삭제할때마다 행개수 -1
    		 count--;
    		  });

    	});
     </script>
     <style type="text/css">
		@import
			url('https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap')
			;
		
		.mb-50 {
			margin-top: 0.5rem;
		}
		
		.time {
			color: #7367F0;
		}
		
		#deptLi:hover {
			opacity: .7;
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
                        <div class="col-md-3">
                            <h2 class="content-header-title float-left mb-0">전자결재</h2>
                            <div class="breadcrumb-wrapper">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">조직도</a>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                 <div class="content-body">
                 <div class="container">
                   <!-- Basic Tables start -->
                   <div class="row" id="basic-table">
                       <div class="col-12" style="margin-top: 10px;">
                          <ul class="tabs">
                             <li class="tab-link current" data-tab="tab-1">조직도</li>
                             <li class="tab-link" data-tab="tab-2">검색</li>
                          </ul>
                <!-- Tree section -->
                <section class="basic-custom-icons-tree">
                    <div class="row">
                        <!-- Basic Tree -->
                        <div class="col-md-3">
                        <!-- tab-1 start -->
                            <div id="tab-1" class="tab-content current">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">SOFTLAB</h4>
                                </div>
                                <div class="card-body" style="height: 500px; overflow: scroll;">
                                    <div id="jstree-basic">
                                        <ul>
                                            <c:forEach items="${deptList}" var="deptList">
                                                <c:if test="${deptList.lvl<2}">

                                                    <li data-jstree='{"icon" : "far fa-folder"}'>
                                                        <span>${deptList.deptNm}</span>
                                                </c:if>
                                               
                                                    <c:if test="${deptList.lvl>1}">
                                                        <ul data-jstree='{"icon" : "far fa-folder"}'>
                                                            <li data-jstree='{"icon" : "fab fa-css3-alt"}'><span>${deptList.deptNm}</span>
                                                            </c:if> 
                                                                <ul id="deptLi">
                                                                    <c:forEach items="${deptEmpList}" var="deptEmpList"> 
                                                                        <c:if test="${deptList.deptCode eq deptEmpList.deptCode}">
                                                                            <li data-jstree='{"icon" : "far fa-file-image"}'>[${deptList.deptNm}&nbsp;&nbsp; /
                                                                                &nbsp;&nbsp;${deptEmpList.clsfCode}]
                                                                                &nbsp;&nbsp;${deptEmpList.empNm}
                                                                                <input type="hidden" class="empNo" value="${deptEmpList.empNo}">
																				<input type="hidden" class="clsfCode" value="${deptEmpList.clsfCode}">
																				<input type="hidden" class="empNm" value="${deptEmpList.empNm}">
																				<input type="hidden" class="deptNm" value="${deptEmpList.deptNm}">
																			</li>
                                                                        </c:if> 
                                                                    </c:forEach>
                                                                    <c:if test="${deptList.lvl>1}">
                                                                </ul>            
                                                                    </c:if>
                                                        </ul>
                                                    </c:forEach>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div> 
                                </div>
                            </div>
                        </div>
                 	<!-- tab-2 start -->
                 	<div id="tab-2" class="tab-content current">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">SOFTLAB</h4>
                                </div>
                                <div class="card-body" style="height: 500px; overflow: scroll;">
                                    <form id="sanctionSearch">
										<span>
											<input type="text" id="keyword" name="keyword" class="form-control" style="width: 150px; display: inline;" value="${keyword}">
						                    <input type="submit" id="searchBtn" name="searchBtn" class="btn btn-primary mr-1 waves-effect waves-float waves-light" value="검색">
						                    <br><br>
					                    </span>
					                    <div id="searchResultMenu">
					                    	<c:if test="${keyword != null}">
					                    		 <div id="jstree-basic">
                                       				 <ul>
                                           				 <c:forEach items="${deptList}" var="deptList">
                                                			<c:if test="${deptList.lvl<2}">

                                                  			  <li data-jstree='{"icon" : "far fa-folder"}'>
                                                       			 <span>${deptList.deptNm}</span>
                                                </c:if>
                                               
                                                    <c:if test="${deptList.lvl>1}">
                                                        <ul data-jstree='{"icon" : "far fa-folder"}'>
                                                            <li data-jstree='{"icon" : "fab fa-css3-alt"}'><span>${deptList.deptNm}</span>
                                                            </c:if> 
                                                                <ul>
                                                                    <c:forEach items="${deptEmpList}" var="deptEmpList"> 
                                                                        <c:if test="${deptList.deptCode eq deptEmpList.deptCode}">
                                                                            <li data-jstree='{"icon" : "far fa-file-image"}'>[${deptList.deptNm}&nbsp;&nbsp; /
                                                                                &nbsp;&nbsp;${deptEmpList.clsfCode}]
                                                                                &nbsp;&nbsp;${deptEmpList.empNm}
                                                                                <input type="hidden" class="empNo" value="${deptEmpList.empNo}">
																				<input type="hidden" class="clsfCode" value="${deptEmpList.clsfCode}">
																				<input type="hidden" class="empNm" value="${deptEmpList.empNm}">
																				<input type="hidden" class="deptNm" value="${deptEmpList.deptNm}">
																		</li>
                                                                             </li> 
                                                                        </c:if> 
                                                                    </c:forEach>
                                                                    <c:if test="${deptList.lvl>1}">
                                                                </ul>            
                                                                    </c:if>
                                                        </ul>
                                                    </c:forEach>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div> 
					                    	</c:if>
					                    </div>
				                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div style="margin-left: 50px; margin-right: 50px;">
                        <br><br><br><br><br><br><br><br>
                        <input type="button" value="추가" id="insertBtn" style="height: 30px;">
                        <br><br><br>
                        <input type="button" value="삭제" id="deleteBtn" style="height: 30px;">
                        </div>
                        <div id="rightMenu" class="col-sm-4 col-md-3" style="height: 500px;">
                            <div class="card" style="width: 700px; height: 500px; overflow: scroll;">
                                <div class="card-header">
                                    <h4 class="card-title">결재선</h4>
                                </div>
                                <div class="card-body">
                                <table class="table" id="alt">
                                    <thead>

                                    <tr style="text-align: center;">
                                        <th>부서</th>
                                        <th>직급</th>
                                        <th>이름</th>
                                      <!--   <th>비고</th> -->
                                    </tr>
                                    </thead>
                                    <tbody id="appLineTable" style="text-align: center;">

                                    </tbody>
                                </table>
                                </div>
                            </div>
                            <div style="margin: auto; width: 700px;">
                                <button class="btn btn-info btn-sm" style="text-align: center;
                                margin: auto; float: right; padding: 13px;" id="appListConfirm">확인</button>
                            </div>
                            <br style="clear: both;">
                        </div>
                        </div>
                    </section>
                </div>
            </div>
            </div>               
            </div>
        </div>
    </div>
    
       </div>
                </div>
            </section>
            <!--/ Tree section -->
    <!-- END: Content-->

    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

    


    <!-- BEGIN: Vendor JS-->
    <script src="/resources/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="/resources/vendors/js/extensions/jstree.min.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="/resources/js/core/app-menu.js"></script>
    <script src="/resources/js/core/app.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <script src="/resources/js/scripts/extensions/ext-component-tree.js"></script>
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
    </script>
</body>
<!-- END: Body-->

</html>