<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=0,minimal-ui">
    <meta name="description"
        content="Vuexy admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
    <meta name="keywords"
        content="admin template, Vuexy admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="PIXINVENT">
    <title></title>
    <link rel="apple-touch-icon" href="/resources/images/ico/apple-icon-120.png">
    
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,400;1,500;1,600"
        rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/vendors/css/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendors/css/forms/wizard/bs-stepper.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendors/css/forms/select/select2.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendors/css/tables/datatable/buttons.bootstrap4.min.css">
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
    <link rel="stylesheet" type="text/css" href="/resources/css/plugins/forms/form-wizard.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/plugins/forms/form-validation.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/pages/modal-create-app.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/tab.css">
    <!-- END: Page CSS-->

    <style type="text/css">
        .mb-50 {
            padding-bottom: 10px;
        }

        #iHover:hover {
            color: #7367F0;
        }
    </style>

</head>

<body class="vertical-layout vertical-menu-modern  navbar-floating footer-static  " data-open="click"
    data-menu="vertical-menu-modern" data-col="">
    <input type="hidden" name="btnCode" id="btn-code" value="${btnCode}">
    <!-- BEGIN: Content-->
    <div class="app-content content ">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper container-xxl p-0">
            <div class="content-header row">
                <div class="content-header-left col-md-9 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="col-12" style="padding-bottom: 15px; padding-top: 20px;">
                            <h2 class="content-header-title float-left mb-0">전자결재</h2>
                            <div class="breadcrumb-wrapper">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#" style="cursor: default;">기안</a></li>
                                    <li class="breadcrumb-item active">${tabKo}</li>
                                </ol>
                            </div>
                        </div>
                        <div class="content-body">
                            <div class="container">
                                <!-- Basic Tables start -->
                                <div class="row">
                                    <div class="col-12" style="margin-top: 10px;">
                                        <!-- tab-1 start -->
                                        <div id="tab-1" class="tab-content current">
                                            <div class="card" style="height: 560px;">
                                                <div class="card-header">
                                                    <h2 class="card-title">${tabKo}</h2>
                                                    <form action="/sanction/elctrnSanctnSearch?tab=${tab}"
                                                        method="post">
                                                        <div style="display:flex;">
                                                            <input type="text" class="form-control" id="helpInputTop"
                                                                name="keyword" value="${keyword}"
                                                                placeholder="제목을 입력하세요."
                                                                style="display: inline; width: 300px;">
                                                            <button type="submit"
                                                                class="btn btn-icon btn-outline-primary waves-effect">
                                                                <i data-feather='search'></i>
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="table-responsive">
                                                    <form action="/sanction/deleteCheckBoxTmpr" method="post"
                                                        id="deleteCheckBoxForm">
                                                        <table class="table" style="text-align: center;">
                                                            <thead>
                                                                <tr>
                                                                    <c:if test="${deleteCheckBox eq 'yes'}">
                                                                        <th><a href="#" id="deleteCheckBox"
                                                                                onclick="deleteCheckBox()"
                                                                                style="text-decoration: none; color: #6E6B7B;">삭제</a>
                                                                        </th>
                                                                    </c:if>
                                                                    <th>NO</th>
                                                                    <th>문서번호</th>
                                                                    <th>제목</th>
                                                                    <th>기안자</th>
                                                                    <th>기안일자</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:choose>
                                                                    <c:when test="${not empty mapList.content}">
                                                                        <c:forEach var="row" items="${mapList.content}"
                                                                            varStatus="stat">
                                                                            <tr>
                                                                                <c:if test="${deleteCheckBox eq 'yes'}">
                                                                                	<td style="width: 120px; padding-left: 51px;">
                                                                                    	<div class="custom-control custom-checkbox">
																							<input type="checkbox" name="serialNumbers" id="${row.ELCTRN_SANCTN_SN}" class="custom-control-input" value="${row.ELCTRN_SANCTN_SN}" />
																							<label class="custom-control-label" for="${row.ELCTRN_SANCTN_SN}"></label>
																						</div>
                                                                                    </td>
                                                                                </c:if>
                                                                                <td>${row.RNUM}</td>
                                                                                <td>
                                                                                    <c:if test="${btnCode eq 'bc2'}">
                                                                                        <span class="brief"
                                                                                            data-value="${row.ELCTRN_SANCTN_SN}"
                                                                                            data-info="${row.DEPT_NM}-${row.ELCTRN_SANCTN_SN}"
                                                                                            data-toggle="modal"
                                                                                            data-target="#add-new-sidebar"
                                                                                            style="cursor: pointer;">📑</span>
                                                                                        &nbsp;</c:if>
                                                                                    <span
                                                                                        class="docInfo">${row.DEPT_NM}-${row.ELCTRN_SANCTN_SN}</span>
                                                                                </td>
                                                                                <td id="iHover" class="td_open"
                                                                                    data-value="${row.ELCTRN_SANCTN_SN}"
                                                                                    data-tab="${tab}"
                                                                                    data-btn="${btnCode}"
                                                                                    style="cursor: pointer; text-align: left;">
                                                                                    ${row.DOC_SJ}</td>
                                                                                <td>${row.EMP_NM}</td>
                                                                                <td>${row.DRFT_DE}</td>
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <tr>
                                                                            <td colspan="5" style="padding: 30px;">목록이
                                                                                없습니다.</td>
                                                                        </tr>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </tbody>
                                                        </table>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 문서 정보를 보여주는 모달 넣기 시작 -->
                                        <div class="modal modal-slide-in event-sidebar fade show" id="add-new-sidebar">
                                            <div class="modal-dialog sidebar-lg">
                                                <div class="modal-content p-0">
                                                    <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                        <i data-feather='x-square'></i>
                                                    </button>
                                                    <div class="modal-header mb-1" style="background-color: #F3F2F7;">
                                                        <h5 class="modal-title">문서 정보</h5>
                                                    </div>
                                                    <div class="modal-body flex-grow-1 pb-sm-0 pb-3">
                                                        <!-- 문서 정보 모달 시작 -->
                                                        <div id="docNum"></div>
                                                        <div class="card-body">
                                                            <ul class="timeline">

                                                                <li class="timeline-item">
                                                                    <span
                                                                        class="timeline-point timeline-point-success timeline-point-indicator"></span>
                                                                    <div class="timeline-event">
                                                                        <div
                                                                            class="d-flex justify-content-between flex-sm-row flex-column mb-sm-0 mb-1">
                                                                            <h6
                                                                                style="padding-bottom: 15px; margin: 0px;">
                                                                                결재현황</h6>
                                                                        </div>
                                                                        <div
                                                                            class="d-flex justify-content-between flex-wrap flex-sm-row flex-column">
                                                                            <div>
                                                                                <p class="text-muted mb-50">순번</p>
                                                                                <div id="iNum"></div>
                                                                            </div>
                                                                            <div>
                                                                                <p class="text-muted mb-50">이름</p>
                                                                                <div id="iName"></div>
                                                                            </div>
                                                                            <div class="mt-sm-0 mt-1">
                                                                                <p class="text-muted mb-50">부서 / 직급</p>
                                                                                <div id="iDept"></div>
                                                                            </div>
                                                                            <div class="mt-sm-0 mt-1">
                                                                                <p class="text-muted mb-50">상태</p>
                                                                                <div id="iSttus"></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="timeline-item">
                                                                    <span
                                                                        class="timeline-point timeline-point-warning timeline-point-indicator"></span>
                                                                    <div class="timeline-event">
                                                                        <div
                                                                            class="d-flex justify-content-between flex-sm-row flex-column mb-sm-0 mb-1">
                                                                            <h6 style="padding-bottom: 10px;">참조자</h6>
                                                                        </div>
                                                                        <div id="iCcInfo"></div>
                                                                    </div>
                                                                </li>
                                                                <li class="timeline-item">
                                                                    <span
                                                                        class="timeline-point timeline-point-danger timeline-point-indicator"></span>
                                                                    <div class="timeline-event">
                                                                        <div
                                                                            class="d-flex justify-content-between flex-sm-row flex-column mb-sm-0 mb-1">
                                                                            <h6 style="padding-bottom: 10px;">첨부파일</h6>
                                                                        </div>
                                                                        <div id="iFileName"></div>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <!-- 문서 정보 모달 끝 -->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 문서 정보를 보여주는 모달 넣기 끝 -->

                                        <div class="modal fade text-left modal-primary deleteModal" tabindex="-1"
                                            role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header" style="justify-content: center;">
                                                        <h5 class="modal-title" id="myModalLabel140"
                                                            style="text-align: center; center;font-size: 13px;">삭제</h5>
                                                        <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body" style="padding: 0rem 1.4rem 0.8rem 1.4rem;">
                                                        <div class="form-group">
                                                            <div class="d-flex justify-content-between">
                                                                <label for="login-password"
                                                                    style="text-align: center;">삭제하시겠습니까?</label>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer"
                                                            style="justify-content: center; padding: 0rem 1.4rem;">
                                                            <button type="button" class="btn btn-primary"
                                                                data-dismiss="modal" id="deleteConfirm">확인</button>
                                                            <button type="button" class="btn btn-primary"
                                                                data-dismiss="modal" id="deleteCancel">취소</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal fade text-left modal-primary deleteCheck" tabindex="-1"
                                            role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header" style="justify-content: center;">
                                                        <h5 class="modal-title" id="myModalLabel140"
                                                            style="text-align: center; center;font-size: 13px;">삭제</h5>
                                                        <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body" style="padding: 0rem 1.4rem 0.8rem 1.4rem;">
                                                        <div class="form-group">
                                                            <div class="d-flex justify-content-between">
                                                                <label for="login-password"
                                                                    style="text-align: center;">삭제할 문서를 선택하여 주시기
                                                                    바랍니다.</label>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer"
                                                            style="justify-content: center; padding: 0rem 1.4rem;">
                                                            <button type="button" class="btn btn-primary"
                                                                data-dismiss="modal" id="">확인</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- END: Content-->

                                        <!-- 페이징 시작 -->
                                        <div class="d-flex justify-content-between mx-0 row" style="padding-left: 550px;">
                                        	<input type="hidden" value="1" id="pageDefault">
                                            <div class="col-sm-12 col-md-6">
                                                <div class="dataTables_paginate paging_simple_numbers"
                                                    id="DataTables_Table_0_paginate">
                                                    <ul class="pagination">
                                                        <li class="paginate_button page-item previous <c:if test='${mapList.startPage <= 5}'>disabled</c:if>" id="DataTables_Table_0_previous">
                                                            <a href="/sanction/sanctnList?tab=${tab}&btnCode=${btnCode}?currentPage=${mapList.startPage - 5}" aria-controls="DataTables_Table_0" data-dt-idx="0" tabindex="0" class="page-link">&nbsp;</a>
                                                        </li>
                                                        <c:forEach var="page" begin="${mapList.startPage}" end="${mapList.endPage}">
	                                                        <li class="paginate_button page-item <c:if test='${param.currentPage eq page}'>active</c:if>">
	                                                        	<a href="/sanction/sanctnList?tab=${tab}&btnCode=${btnCode}&currentPage=${page}" aria-controls="DataTables_Table_0" data-dt-idx="4" tabindex="0" class="page-link">${page}</a>
	                                                        </li>
                                                        </c:forEach>
                                                        <li class="paginate_button page-item next <c:if test='${mapList.endPage >= mapList.totalPages}'>disabled</c:if>">
                                                        	<a href="/sanction/sanctnList?tab=${tab}&btnCode=${btnCode}&currentPage=${mapList.startPage + 5}" aria-controls="DataTables_Table_0" data-dt-idx="8" tabindex="0" class="page-link">&nbsp;</a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 페이징 끝 -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

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

<script type="text/javascript">
    const brief = document.querySelectorAll('.brief')
    const iNum = document.querySelector('#iNum')
    const iName = document.querySelector('#iName')
    const iDept = document.querySelector('#iDept')
    const iSttus = document.querySelector('#iSttus')
    const iCcInfo = document.querySelector('#iCcInfo')
    const iFileName = document.querySelector('#iFileName')

    const docInfo = document.querySelectorAll('.docInfo')
    const docNum = document.querySelector('#docNum')

    for (var i = 0; i < brief.length; i++) {
        brief[i].addEventListener('click', function (e) {
            var elctrnSanctnSn = e.target.getAttribute('data-value')
            var docInfo = e.target.getAttribute('data-info')
            docNum.innerHTML = '문서번호 | ' + docInfo

            // 결재 현황 가져오기
            $.ajax({
                url: '/sanction/briefLine',
                type: 'POST',
                data: {
                    'elctrnSanctnSn': elctrnSanctnSn
                },
                traditional: true,
                success: function (res) {
                    var num = "";
                    var name = "";
                    var dept = "";
                    var sttus = "";
                    $.each(res, function (i, v) {
                        num += "<p class='mb-0' style='padding-bottom: 25px;'>&nbsp;0" + v
                            .STEP + "</p>"
                        name += "<p class='mb-0' style='padding-bottom: 25px;'>" + v
                            .EMP_NM + "</p>"
                        dept += "<p class='mb-0' style='padding-bottom: 25px;'>" + v
                            .DEPT_NM + "&nbsp;" + v.CLSF_NM + "</p>"
                        sttus += "<p class='mb-0' style='padding-bottom: 25px;'>" + v
                            .SANCTN_STTUS_CODE + "</p>"
                    })
                    iNum.innerHTML = num
                    iName.innerHTML = name
                    iDept.innerHTML = dept
                    iSttus.innerHTML = sttus
                }
            })

            // 참조자 가져오기
            $.ajax({
                url: '/sanction/ccEmpInfoBySn',
                type: 'POST',
                data: {
                    'elctrnSanctnSn': elctrnSanctnSn
                },
                traditional: true,
                success: function (res) {
                    var ccInfo = "";
                    $.each(res, function (i, v) {
                        console.log('index : ' + i)
                        console.log('EMP_NM: ' + v.EMP_NM)
                        console.log('CLSF_CODE: ' + v.CLSF_CODE)
                        console.log('DEPT_NM: ' + v.DEPT_NM)

                        ccInfo +=
                            "<div class='d-flex flex-row align-items-center' style='padding-bottom: 15px;'>" +
                            "-&nbsp;" + v.EMP_NM + "&nbsp;(" + v.DEPT_NM + "&nbsp;" + v
                            .CLSF_CODE + ")</div>"
                    })
                    iCcInfo.innerHTML = ccInfo
                }
            })

            // 첨부파일 가져오기
            $.ajax({
                url: '/sanction/briefFile',
                type: 'POST',
                data: {
                    'elctrnSanctnSn': elctrnSanctnSn
                },
                traditional: true,
                success: function (res) {
                    var fileName = "";
                    $.each(res, function (i, v) {
                        console.log('index : ' + i)
                        console.log('REAL_FILE_NM: ' + v.REAL_FILE_NM)

                        fileName +=
                            "<div class='d-flex flex-row align-items-center' style='padding-bottom: 15px;'>"
                        fileName +=
                            '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"'
                        fileName +=
                            ' stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-paperclip">'
                        fileName +=
                            "<path d='M21.44 11.05l-9.19 9.19a6 6 0 0 1-8.49-8.49l9.19-9.19a4 4 0 0 1 5.66 5.66l-9.2 9.19a2 2 0 0 1-2.83-2.83l8.49-8.48'></path></svg>"
                        fileName += "&nbsp;<a href='/sanction/downloadNm?keyword=" + v
                            .FILE_NM + "'>" + v.REAL_FILE_NM + "</a></div>"
                    })
                    iFileName.innerHTML = fileName
                }
            })
        })
    }

    var codeBtn = document.querySelector('#btn-code')

    const deleteCheckBox = () => {
        var checkedArray = new Array()
        var list = document.getElementsByName('serialNumbers')
        for (var i = 0; i < list.length; i++) {
            if (list[i].checked) {
                checkedArray.push(list[i].value)
            }
        }

        if (checkedArray.length == 0) {
            $('.deleteCheck').modal()
        } else {
            $('.deleteModal').modal()
            const confirm = document.querySelector('#deleteConfirm')
            const deleteCancel = document.querySelector('#deleteCancel')

            confirm.addEventListener('click', function () {
                console.log('codeBtn :' + codeBtn.value)
                if (codeBtn.value == 'bc1') {
                    // 저장
                    $.ajax({
                        url: '/sanction/deleteCheckBoxTmpr',
                        type: 'POST',
                        traditional: true,
                        data: {
                            checkedArray: checkedArray
                        },
                        success: function (res) {
                            location.reload()
                        }
                    })
                } else if (codeBtn.value == 'bc3') {
                    // 회수
                    $.ajax({
                        url: '/sanction/deleteCheckBoxRtrvl',
                        type: 'POST',
                        traditional: true,
                        data: {
                            checkedArray: checkedArray
                        },
                        success: function (res) {
                            location.reload()
                        }
                    })
                }
            })
        }
    }

    const td_open = document.querySelectorAll('.td_open')

    // 새창으로 열기
    for (var i = 0; i < td_open.length; i++) {
        td_open[i].addEventListener('click', function (e) {
            var width = 992
            var height = 910
            //	 			var left = (screen.availWidth - width) / 2
            //	 			var top = (screen.availHeight - height) / 2
            var left = 10
            var top = 10
            var specs = 'width=' + width
            specs += ',height=' + height
            specs += ',left=' + left
            specs += ',top=' + top

            var elctrnSanctnSn = e.target.getAttribute('data-value')
            var tab = e.target.getAttribute('data-tab')
            var btnCode = e.target.getAttribute('data-btn')

            window.open('/sanction/sanctnDetail?elctrnSanctnSn=' + elctrnSanctnSn + '&tab=' + tab +
                '&btnCode=' + btnCode, ', document', specs + ', scrollbars=no')
        })
    }
</script>

<script>
    $(window).on('load', function () {
        if (feather) {
            feather.replace({
                width: 14,
                height: 14
            });
        }
    })
</script>
