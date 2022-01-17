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

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/vendors/css/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendors/css/forms/wizard/bs-stepper.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendors/css/forms/select/select2.min.css">
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

    <style type="text/css">
        .vertical-layout {
            min-width: 993px;
            overflow-x: hidden;
        }

        .btn-outline-primary {
            padding: 0.786rem;
            width: 66px;
            height: 45px;
        }

        .btn-group {
            width: 928px;
        }

        .form-label {
            width: 49px;
            height: 20px;
        }

        .card-body {
            padding-top: 7px;
        }

        .card-body .col-xl-4 {
            padding-left: 20px;
        }

        .mb-1 {
            padding-left: 10px;
        }

        .d-file {
            padding-top: 10px;
        }

        @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap');

        .mb-50 {
            margin-top: 0.5rem;
        }

        .time {
            color: #7367F0;
        }

        .form-control {
            /* 		display: inline; */
            /* 		width: 75%; */
            width: 227px;
        }

        .d-input {
            padding: 2px;
        }

        .toolTip {
            display: inline-block;
        }

        .toolTip-text {
            display: none;
            position: absolute;
            max-width: 200px;
            border: 1px solid;
            padding: 5px;
            font-size: 0.8em;
            color: black;
            background: transparent;
        }

        .toolTip:hover .toolTip-text {
            display: block;
        }
    </style>
    <script type="text/javascript">
        <% int empCount2 = 0; %>
        var empCount2 = <%= empCount2 %> ;
    </script>
</head>

<body class="vertical-layout vertical-menu-modern  navbar-floating footer-static  " data-open="click"
    data-menu="vertical-menu-modern" data-col="">
    <input type="hidden" name="btnCode" id="btn-code" value="${btnCode}">
    <c:choose>
        <c:when test="${returnMap.SANCTN_STTUS_CODE ne null}">
            <input type="hidden" name="returnAt" id="returnAt" value="${returnMap.SANCTN_STTUS_CODE}">
        </c:when>
        <c:otherwise>
            <input type="hidden" name="returnAt" id="returnAt" value="N">
        </c:otherwise>
    </c:choose>
    <!-- BEGIN: Content-->
    <div class="content-overlay"></div>
    <div class="content-wrapper container-xxl p-0">
        <div class="content-header row">
            <div class="content-header-left col-md-9 col-12 mb-2">
                <div class="row breadcrumbs-top">
                    <div class="content-body">
                        <div class="container">
                            <!-- Basic Tables start -->
                            <div class="row" id="" style="background-color: white;">
                                <div class="col-12" style="margin-top: 10px;">
                                    <div class="col-lg-6 col-12" style="padding-bottom: 15px;">
                                        <div class="btn-group" role="group" aria-label="Basic example">
                                            <button type="button" class="btn btn-outline-primary waves-effect"
                                                id="printDoc">출력</button>
                                            <!--  <button type="button" class="btn btn-outline-primary waves-effect" id="setLine">결재 라인</button> -->
                                            <button type="button" class="btn btn-outline-primary waves-effect"
                                                id="setSanctnLine" data-toggle="modal"
                                                data-target="#addsanctionLine">결재라인</button>
                                            <button type="button" class="btn btn-outline-primary waves-effect"
                                                id="retrieveDoc">회수</button>
                                            <button type="button" class="btn btn-outline-primary waves-effect"
                                                id="setCc" data-toggle="modal" data-target="#addCcLine">참조</button>
                                            <button type="button" class="btn btn-outline-primary waves-effect"
                                                id="reUploadDoc">재기안</button>
                                            <button type="button" class="btn btn-outline-primary waves-effect"
                                                id="signDoc">승인</button>
                                            <button type="button" class="btn btn-outline-primary waves-effect"
                                                id="returnDoc" data-bs-toggle="modal"
                                                data-bs-target="#returnPrvonsh">반려</button>
                                            <button type="button" class="btn btn-outline-primary waves-effect"
                                                id="setDisplay">공람</button>
                                            <button type="button" class="btn btn-outline-primary waves-effect"
                                                id="uploadDoc">상신</button>
                                            <c:choose>
                                                <c:when test="${deleteBox ne null}">
                                                    <button type="button" class="btn btn-outline-primary waves-effect"
                                                        id="deleteDoc" onclick="deleteDoc()">삭제</button>
                                                </c:when>
                                                <c:otherwise>
                                                    <button type="button" class="btn btn-outline-primary waves-effect"
                                                        id="saveDoc">저장</button>
                                                </c:otherwise>
                                            </c:choose>
                                            <button type="button" class="btn btn-outline-primary waves-effect"
                                                id="exitDoc">닫기</button>
                                        </div>
                                    </div>
                                    <h1 class="font-large-2 fw-bolder mt-2 mb-0"
                                        style="text-align: center; padding-bottom: 25px; letter-spacing: 30px;"
                                        id="formNm">${formNm}</h1>

                                    <!-- 참조자 결재라인 시작 -->
                                    <div class="modal fade text-left" id="addCcLine" tabindex="-1" role="dialog"
                                        aria-labelledby="sanctionLineModal" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document"
                                            style="display: table; padding: 0px; margin: 0px;">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="sanctionLineModal">참조자 등록</h4>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>

                                                <div class="modal-body" style="width: 880px; height: 730px;">
                                                    <!-- BEGIN: Content-->
                                                    <div class="app-content content" style="padding: 0px; margin: 0px;">
                                                        <div class="container" style="padding: 0px; margin: 0px;">
                                                            <!-- Basic Tables start -->
                                                            <div class="row" id="">
                                                                <div class="col-12" style="margin-top: 10px;">
                                                                    <ul class="tabs2">
                                                                        <li class="tab-link2 current2"
                                                                            data-tab2="tab-3">조직도</li>
                                                                        <li class="tab-link2" data-tab2="tab-4">검색</li>
                                                                    </ul>
                                                                    <!-- Tree section -->
                                                                    <section class="basic-custom-icons-tree">
                                                                        <div class="row">
                                                                            <!-- Basic Tree -->
                                                                            <div class="col-md-4">
                                                                                <!-- tab-3 start -->
                                                                                <div id="tab-3"
                                                                                    class="tab-content2 current2">
                                                                                    <div class="card">
                                                                                        <div class="card-header">
                                                                                            <h4 class="card-title">
                                                                                                SOFTLAB</h4>
                                                                                        </div>
                                                                                        <div class="card-body"
                                                                                            style="height: 500px; overflow: scroll;">
                                                                                            <div id="jstree-basic">
                                                                                                <ul>
                                                                                                    <c:forEach
                                                                                                        items="${deptList}"
                                                                                                        var="deptList">
                                                                                                        <c:if
                                                                                                            test="${deptList.lvl<2}">

                                                                                                            <li
                                                                                                                data-jstree='{"icon" : "far fa-folder"}'>
                                                                                                                <span>${deptList.deptNm}</span>
                                                                                                        </c:if>

                                                                                                        <c:if
                                                                                                            test="${deptList.lvl>1}">
                                                                                                            <ul
                                                                                                                data-jstree='{"icon" : "far fa-folder"}'>
                                                                                                                <li
                                                                                                                    data-jstree='{"icon" : "fab fa-css3-alt"}'>
                                                                                                                    <span>${deptList.deptNm}</span>
                                                                                                        </c:if>
                                                                                                        <ul id="deptLi">
                                                                                                            <c:forEach
                                                                                                                items="${deptEmpList}"
                                                                                                                var="deptEmpList">
                                                                                                                <c:if
                                                                                                                    test="${deptList.deptCode eq deptEmpList.deptCode}">
                                                                                                                    <li data-jstree='{"icon" : "far fa-file-image"}'
                                                                                                                        onclick="addCcLine(this);">
                                                                                                                        [${deptList.deptNm}&nbsp;
                                                                                                                        /
                                                                                                                        &nbsp;${deptEmpList.clsfCode}]
                                                                                                                        &nbsp;${deptEmpList.empNm}
                                                                                                                        <input
                                                                                                                            type="hidden"
                                                                                                                            class="empNo"
                                                                                                                            value="${deptEmpList.empNo}">
                                                                                                                        <input
                                                                                                                            type="hidden"
                                                                                                                            class="clsfCode"
                                                                                                                            value="${deptEmpList.clsfCode}">
                                                                                                                        <input
                                                                                                                            type="hidden"
                                                                                                                            class="empNm"
                                                                                                                            value="${deptEmpList.empNm}">
                                                                                                                        <input
                                                                                                                            type="hidden"
                                                                                                                            class="deptNm"
                                                                                                                            value="${deptEmpList.deptNm}">
                                                                                                                    </li>
                                                                                                                </c:if>
                                                                                                            </c:forEach>
                                                                                                            <c:if
                                                                                                                test="${deptList.lvl>1}">
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
                                                                                <!-- tab-4 start -->
                                                                                <div id="tab-4"
                                                                                    class="tab-content2 current2">
                                                                                    <div class="card">
                                                                                        <div class="card-header">
                                                                                            <h4 class="card-title">
                                                                                                SOFTLAB</h4>
                                                                                        </div>
                                                                                        <div class="card-body"
                                                                                            style="height: 500px; overflow: scroll;">
                                                                                            <form id="sanctionSearch2">
                                                                                                <span> <input
                                                                                                        type="text"
                                                                                                        id="keyword"
                                                                                                        name="keyword"
                                                                                                        class="form-control"
                                                                                                        style="width: 150px; display: inline;"
                                                                                                        value="${keyword}">
                                                                                                    <input type="submit"
                                                                                                        id="searchBtn2"
                                                                                                        name="searchBtn"
                                                                                                        class="btn btn-primary mr-1 waves-effect waves-float waves-light"
                                                                                                        value="검색"> <br>
                                                                                                    <br>
                                                                                                </span>
                                                                                                <div
                                                                                                    id="searchResultMenu2">
                                                                                                </div>
                                                                                            </form>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div
                                                                                style="margin-left: 20px; margin-right: 20px;">
                                                                                <br> <br> <br> <br>
                                                                            </div>
                                                                            <div id="rightMenu"
                                                                                class="col-sm-4 col-md-3"
                                                                                style="height: 500px;">
                                                                                <div class="card"
                                                                                    style="width: 450px; height: 550px; overflow: scroll;">
                                                                                    <div class="card-header">
                                                                                        <h4 class="card-title">참조자</h4>
                                                                                    </div>
                                                                                    <div class="card-body">
                                                                                        <table class="table" id="alt2">
                                                                                            <thead>
                                                                                                <tr
                                                                                                    style="text-align: center;">
                                                                                                    <th>순번</th>
                                                                                                    <th>부서</th>
                                                                                                    <th>직급</th>
                                                                                                    <th>이름</th>
                                                                                                </tr>
                                                                                            </thead>
                                                                                            <tbody id="appLineTable2"
                                                                                                style="text-align: center;">
                                                                                            </tbody>
                                                                                        </table>
                                                                                    </div>
                                                                                </div>
                                                                                <div
                                                                                    style="margin: auto; width: 450px;">
                                                                                    <button type="button"
                                                                                        class="btn btn-primary waves-effect waves-float waves-light"
                                                                                        data-dismiss="modal"
                                                                                        style="text-align: center; margin: auto; float: right; padding: 13px;"
                                                                                        id="appCcListConfirm">등록</button>
                                                                                    <button
                                                                                        class="btn btn-outline-primary waves-effect"
                                                                                        type="button" id="deleteBtn2"
                                                                                        style="margin-right: 10px; float: right; padding: 13px; width: 56px; height: 42px;">삭제</button>
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
                                            <!--/ Tree section -->
                                            <!-- END: Content-->
                                        </div>
                                    </div>
                                    <!-- 참조자 결재라인 끝 -->

                                    <div class="card-body">
                                        <form id="uploadForm" action="/sanction/uploadFormAction" method="post">
                                            <input type="hidden" id="ccEmpInfoBySnNo1" name="cc1" />
                                            <input type="hidden" id="ccEmpInfoBySnNo2" name="cc2" />
                                            <input type="hidden" id="ccEmpInfoBySnNo3" name="cc3" />
                                            <input type="hidden" id="ccEmpInfoBySnNo4" name="cc4" />
                                            <input type="hidden" id="ccEmpInfoBySnNo5" name="cc5" />
                                            <div class="row"
                                                style="display: flex; flex-direction: row-reverse; padding-right: 15px; padding-bottom: 25px;">
                                                <table border="1"
                                                    style="padding-top: 10px; text-align: center; float: right;">
                                                    <tr>
                                                        <td rowspan="4" style="width: 30px;">결<br />재</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 70px;">담당</td>
                                                        <td style="width: 70px;" id="clsf1"><span
                                                                class="toolTip">${lineMap.nm1.CLSF_NM}<span
                                                                    class="toolTip-text">${lineMap.nm1.EMP_NM}</span></span>
                                                        </td>
                                                        <td style="width: 70px;" id="clsf2"><span
                                                                class="toolTip">${lineMap.nm2.CLSF_NM}<span
                                                                    class="toolTip-text">${lineMap.nm2.EMP_NM}</span></span>
                                                        </td>
                                                        <td style="width: 70px;" id="clsf3"><span
                                                                class="toolTip">${lineMap.nm3.CLSF_NM}<span
                                                                    class="toolTip-text">${lineMap.nm3.EMP_NM}</span></span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 50px;">${drftEmpMap.EMP_NM}</td>
                                                        <td id="next-nm-1"><input type="hidden" name="nm1" id="nm1"
                                                                style="border: 0 solid black; width: 70px; text-align: center; background: transparent;"
                                                                readonly value="${lineMap.nm1.EMP_NM}"></td>
                                                        <td id="next-nm-2"><input type="hidden" name="nm2" id="nm2"
                                                                style="border: 0 solid black; width: 70px; text-align: center; background: transparent;"
                                                                readonly value="${lineMap.nm2.EMP_NM}"></td>
                                                        <td id="next-nm-3"><input type="hidden" name="nm3" id="nm3"
                                                                style="border: 0 solid black; width: 70px; text-align: center; background: transparent;"
                                                                readonly value="${lineMap.nm3.EMP_NM}"></td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="row" style="padding-left: 14px;">
                                                <div class="d-input">
                                                    <label class="form-label" for="basicInput1">문서번호</label>
                                                    <input type="text" class="form-control" id="basicInput1"
                                                        name="elctrnSanctn" value="${vo.elctrnSanctnSn}" readonly>
                                                </div>
                                                <div class="d-input">
                                                    <label class="form-label" for="basicInput2">기안일자</label>
                                                    <input type="text" class="form-control" id="basicInput2"
                                                        value="${vo.drftDe}" readonly>
                                                </div>
                                                <div class="d-input">
                                                    <label class="form-label" for="basicInput3">기안자</label>
                                                    <input type="text" class="form-control" id="basicInput3"
                                                        name="empNm" value="${drftEmpMap.EMP_NM}" readonly>
                                                </div>
                                                <div class="d-input">
                                                    <label class="form-label" for="basicInput4">기안부서</label>
                                                    <input type="text" class="form-control" id="basicInput4"
                                                        name="deptNm" value="${drftEmpMap.DEPT_NM}" readonly>
                                                </div>
                                                <div style="padding-bottom: 10px;">
                                                    <label class="form-label" for="basicInput5"
                                                        style="width: 800px;">문서제목</label>
                                                    <input type="text" class="form-control" id="basicInput5"
                                                        name="docSj" value="${vo.docSj}" style="width: 922px;" readonly>
                                                </div>
                                            </div>
                                            <div>
                                                <div>
                                                    <label id="docContent" class="form-label" for="basicInput5"
                                                        style="width: 800px;">문서내용</label>
                                                    <div
                                                        style="border: 1px solid lightgrey; border-radius: 5px; background-color: #EFEFEF; min-height: 350px;">
                                                        ${vo.docCn}</div>
                                                </div>
                                            </div>

                                            <!-- 파일업로드 시작 -->
                                            <div class="mb-1 d-file" style="padding-left: 0px;"></div>
                                            <c:choose>
                                                <c:when test="${not empty fileList}">
                                                    <div class="card">
                                                        <div class="card-body d-list"
                                                            style="border: 1px solid lightgrey; border-radius: 5px; padding: 7px 21px;">
                                                            <p>
                                                                <i data-feather='paperclip'></i>&nbsp;업로드 파일 목록
                                                            </p>
                                                            <div id="preview"
                                                                style="height: 100px; overflow-y: scroll;">
                                                                <c:forEach var="fileList" items="${fileList}">
                                                                    <h5>
                                                                        <a
                                                                            href="/sanction/download?fileSn=${vo.fileSn}&fileName=${fileList.FILE_NM}">${fileList.REAL_FILE_NM}</a>
                                                                    </h5>
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                            <!-- 파일업로드 끝 -->
                                            <div style="text-align: center;">
                                                <h4>(주)소프트랩</h4>
                                            </div>
                                        </form>
                                        <form name="frmData" id="frmData" method="post" style="display: none;">
                                            <input type="hidden" name="docSj" value="${vo.docSj}" />
                                            <input type="hidden" name="docCn" value="${vo.docCn}" />
                                            <input type="hidden" name="drftFormSn" id="drftFormSn" value="1" />
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade text-left modal-primary impossibleModal" id="primary" tabindex="-1"
                            role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header" style="justify-content: center;">
                                        <h5 class="modal-title" id="myModalLabel140"
                                            style="text-align: center; center; font-size: 13px;">재기안</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body" style="text-align: center; font-size: 15px;">일반 기안서만 재기안 할 수
                                        있습니다.</div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade text-left modal-primary returnPrvonsh" id="returnPrvonsh" tabindex="-1"
                            role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header" style="justify-content: center;">
                                        <h5 class="modal-title" id="myModalLabel140"
                                            style="text-align: center; center; font-size: 13px;">반려</h5>
                                        <button type="button" id="returnCloseBtn" class="close" data-dismiss="modal"
                                            aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body" style="padding: 0rem 1.4rem 0.8rem 1.4rem;">
                                        <form class="auth-login-form mt-2"
                                            action="/sanction/returnAtModify?elctrnSanctnSn=${vo.elctrnSanctnSn}"
                                            method="POST" id="returnAtModifyForm">
                                            <div class="form-group">
                                                <div class="d-flex justify-content-between">
                                                    <label for="i-returnPrvonsh" id="returnReason">* 반려 사유를 입력해 주시기
                                                        바랍니다.</label>
                                                </div>
                                                <div class="input-group input-group-merge form-password-toggle">
                                                    <input class="form-control form-control-merge" id="i-returnPrvonsh"
                                                        type="text" name="returnPrvonsh"
                                                        aria-describedby="i-returnPrvonsh" tabindex="2"
                                                        aria-invalid="false" style="font-family: auto;">
                                                </div>
                                            </div>
                                            <div class="modal-footer"
                                                style="justify-content: center; padding: 0rem 1.4rem;">
                                                <button type="button" class="btn btn-primary" data-bs-dismiss="modal"
                                                    id="returnAtModifySubmit">확인</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade text-left modal-primary returnSuccess" id="primary" tabindex="-1"
                            role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header" style="justify-content: center;">
                                        <h5 class="modal-title" id="myModalLabel140"
                                            style="text-align: center; center; font-size: 13px;">반려</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body" style="text-align: center; font-size: 15px;">반려되었습니다.</div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade text-left modal-primary returnAlert" id="primary" tabindex="-1"
                            role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header" style="justify-content: center;">
                                        <h5 class="modal-title" id="myModalLabel140"
                                            style="text-align: center; center; font-size: 13px;">반려된 문서입니다.</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div id="docContent-returnProvonsh" class="modal-body"
                                        style="text-align: center; font-size: 15px;">
                                        ${returnMap.RETURN_PRVONSH}</div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade text-left modal-primary rtrvlModal" id="primary" tabindex="-1"
                            role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header" style="justify-content: center;">
                                        <h5 class="modal-title" id="myModalLabel140"
                                            style="text-align: center; center; font-size: 13px;">회수</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body" style="text-align: center; font-size: 15px;">회수하시겠습니까?</div>
                                    <div class="modal-footer" style="justify-content: center; padding: 0rem 1.4rem;">
                                        <button type="button" class="btn btn-primary" data-dismiss="modal"
                                            id="rtrvlConfirm">확인</button>
                                        <button type="button" class="btn btn-primary" data-dismiss="modal"
                                            id="rtrvlCancel">취소</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade text-left modal-primary rtrvlSuccess" id="primary" tabindex="-1"
                        role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header" style="justify-content: center;">
                                    <h5 class="modal-title" id="myModalLabel140"
                                        style="text-align: center; center; font-size: 13px;">회수</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body" style="text-align: center; font-size: 15px;">회수되었습니다.</div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade text-left modal-primary rtrvlFail" id="primary" tabindex="-1" role="dialog"
                        aria-labelledby="myModalLabel140" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header" style="justify-content: center;">
                                    <h5 class="modal-title" id="myModalLabel140"
                                        style="text-align: center; center; font-size: 13px;">회수</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body" style="text-align: center; font-size: 15px;">이미 결재된 문서로 회수할 수
                                    없습니다.</div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade text-left modal-primary reUploadModal" id="primary" tabindex="-1"
                        role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header" style="justify-content: center;">
                                    <h5 class="modal-title" id="myModalLabel140"
                                        style="text-align: center; center; font-size: 13px;">재기안
                                    </h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body" style="text-align: center; font-size: 15px;">재기안하시겠습니까?</div>
                                <div class="modal-footer" style="justify-content: center; padding: 0rem 1.4rem;">
                                    <button type="button" class="btn btn-primary" data-dismiss="modal"
                                        id="reUploadConfirm">확인</button>
                                    <button type="button" class="btn btn-primary" data-dismiss="modal"
                                        id="reUploadCancel">취소</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade text-left modal-primary displayModal" id="primary" tabindex="-1"
                        role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header" style="justify-content: center;">
                                    <h5 class="modal-title" id="myModalLabel140"
                                        style="text-align: center; center; font-size: 13px;">공람</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body" style="text-align: center; font-size: 15px;">공람하시겠습니까?</div>
                                <div class="modal-footer" style="justify-content: center; padding: 0rem 1.4rem;">
                                    <button type="button" class="btn btn-primary" data-dismiss="modal"
                                        id="displayConfirm">확인</button>
                                    <button type="button" class="btn btn-primary" data-dismiss="modal"
                                        id="displayCancel">취소</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade text-left modal-primary displaySuccess" id="primary" tabindex="-1"
                        role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header" style="justify-content: center;">
                                    <h5 class="modal-title" id="myModalLabel140"
                                        style="text-align: center; center; font-size: 13px;">공람</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body" style="text-align: center; font-size: 15px;">공람되었습니다.</div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade text-left modal-primary displayFail" id="primary" tabindex="-1" role="dialog"
                        aria-labelledby="myModalLabel140" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header" style="justify-content: center;">
                                    <h5 class="modal-title" id="myModalLabel140"
                                        style="text-align: center; center; font-size: 13px;">공람</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body" style="text-align: center; font-size: 15px;">이미 공람된 문서로 공람할 수
                                    없습니다.</div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade text-left modal-primary deleteModal" id="primary" tabindex="-1" role="dialog"
                        aria-labelledby="myModalLabel140" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header" style="justify-content: center;">
                                    <h5 class="modal-title" id="myModalLabel140"
                                        style="text-align: center; center; font-size: 13px;">삭제</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body" style="text-align: center; font-size: 15px;">삭제하시겠습니까?</div>
                                <div class="modal-footer" style="justify-content: center; padding: 0rem 1.4rem;">
                                    <button type="button" class="btn btn-primary" data-dismiss="modal"
                                        id="deleteConfirm">확인</button>
                                    <button type="button" class="btn btn-primary" data-dismiss="modal"
                                        id="deleteCancel">취소</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade text-left modal-primary maxCcLine" id="primary" tabindex="-1" role="dialog"
                        aria-labelledby="myModalLabel140" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header" style="justify-content: center;">
                                    <h5 class="modal-title" id="myModalLabel140"
                                        style="text-align: center; center; font-size: 13px;">참조</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body" style="text-align: center; font-size: 15px;">참조자는 최대 5명까지 지정할 수
                                    있습니다.</div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade text-left modal-primary alreadyExist" id="primary" tabindex="-1"
                        role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header" style="justify-content: center;">
                                    <h5 class="modal-title" id="myModalLabel140"
                                        style="text-align: center; center; font-size: 13px;">참조</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body" style="text-align: center; font-size: 15px;">이미 참조자로 지정된 직원입니다.
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade text-left modal-primary uploadModal" id="primary" tabindex="-1" role="dialog"
                        aria-labelledby="myModalLabel140" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header" style="justify-content: center;">
                                    <h5 class="modal-title" id="myModalLabel140"
                                        style="text-align: center; center; font-size: 13px;">참조</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body" style="text-align: center; font-size: 15px;">참조자를 지정하시겠습니까?
                                </div>
                                <div class="modal-footer" style="justify-content: center; padding: 0rem 1.4rem;">
                                    <button type="button" class="btn btn-primary" data-dismiss="modal"
                                        id="uploadConfirm">확인</button>
                                    <button type="button" class="btn btn-primary" data-dismiss="modal"
                                        id="uploadCancel">취소</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade text-left modal-primary ccSuccess" id="primary" tabindex="-1" role="dialog"
                        aria-labelledby="myModalLabel140" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header" style="justify-content: center;">
                                    <h5 class="modal-title" id="myModalLabel140"
                                        style="text-align: center; center; font-size: 13px;">참조</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body" style="text-align: center; font-size: 15px;">참조자 지정이 완료되었습니다.
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade text-left modal-primary closeModal" id="primary" tabindex="-1" role="dialog"
                        aria-labelledby="myModalLabel140" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header" style="justify-content: center;">
                                    <h5 class="modal-title" id="myModalLabel140"
                                        style="text-align: center; center; font-size: 13px;">닫기</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body" style="text-align: center; font-size: 15px;">창을 닫으시겠습니까?</div>
                                <div class="modal-footer" style="justify-content: center; padding: 0rem 1.4rem;">
                                    <button type="button" class="btn btn-primary" data-dismiss="modal"
                                        id="closeConfirm">닫기</button>
                                    <button type="button" class="btn btn-primary" data-dismiss="modal"
                                        id="closeCancel">취소</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade text-left modal-primary confirmDoc" id="primary" tabindex="-1" role="dialog"
                        aria-labelledby="myModalLabel140" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header" style="justify-content: center;">
                                    <h5 class="modal-title" id="myModalLabel140"
                                        style="text-align: center; center; font-size: 13px;">승인</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body" style="text-align: center; font-size: 15px;">승인하시겠습니까?</div>
                                <div class="modal-footer" style="justify-content: center; padding: 0rem 1.4rem;">
                                    <button type="button" class="btn btn-primary" data-dismiss="modal"
                                        id="confirmConfirm">확인</button>
                                    <button type="button" class="btn btn-primary" data-dismiss="modal"
                                        id="confirmCancel">취소</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade text-left modal-primary confirmSuccess" id="primary" tabindex="-1"
                        role="dialog" aria-labelledby="myModalLabel140" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header" style="justify-content: center;">
                                    <h5 class="modal-title" id="myModalLabel140"
                                        style="text-align: center; center; font-size: 13px;">승인</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body" style="text-align: center; font-size: 15px;">승인되었습니다.</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- BEGIN: Vendor JS-->
    <script src="/resources/vendors/js/vendors.min.js"></script>
    <!-- END Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="/resources/vendors/js/forms/wizard/bs-stepper.min.js"></script>
    <script src="/resources/vendors/js/forms/select/select2.full.min.js"></script>
    <script src="/resources/vendors/js/forms/cleave/cleave.min.js"></script>
    <script src="/resources/vendors/js/forms/cleave/addons/cleave-phone.us.js"></script>
    <script src="/resources/vendors/js/forms/validation/jquery.validate.min.js"></script>
    <script src="/resources/vendors/js/forms/cleave/addons/cleave-phone.us.js"></script>
    <script src="/resources/vendors/js/file-uploaders/dropzone.min.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="/resources/js/core/app-menu.js"></script>
    <script src="/resources/js/core/app.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <script src="/resources/js/scripts/pages/modal-add-new-address.js"></script>
    <script src="/resources/js/scripts/pages/page-blog-edit.js"></script>
    <script src="/resources/js/scripts/forms/form-file-uploader.min.js"></script>
    <!-- END: Page JS-->

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

    <script type="text/javascript">
        empCount2++;
        var empList2 = new Array();
        var appEmpList2 = new Array();

        const elctrnSanctnSn = document.querySelector('#basicInput1')

        // 참조 결재라인 지정
        $(document).ready(function () {
            $("#tab-4").hide();
            $('ul.tabs2 li').click(function () {
                var tab_id2 = $(this).attr('data-tab2');
                $('ul.tabs2 li').removeClass('current2');
                $('.tab-content2').removeClass('current2');

                $(this).addClass('current2');
                $("#" + tab_id2).addClass('current2');
                if (tab_id2 == 'tab-4') {
                    $("#tab-4").show();
                }
            });
        });

        $(function () {
            // 검색
            $('#searchBtn2').on('click', function () {
                event.preventDefault(); // built-in event막기
                //event.stopPropergation(); // 이벤트 전파 막기
                console.log("sanctionSearch2 : " + $("#sanctionSearch2")[0]);
                var formData = $("#sanctionSearch2").serialize();
                console.log("폼데이타" + formData);
                $.ajax({
                    type: 'get',
                    url: "/hr/searchEmpAjax",
                    data: formData,
                    dataType: 'json',
                    success: function (empData) {
                        console.log("성공", empData);
                        var keyword = $("#keyword").val();
                        console.log(keyword);

                        var v_tblStr = "<div id='jstree-basic'>";
                        v_tblStr += "<ul>";
                        for (var i = 0; i < empData.length; i++) {
                            v_tblStr +=
                                "<a><li class='searchResult' onclick='addCcLine(this);'>[" +
                                empData[i].deptNm + "&nbsp;&nbsp; /";
                            v_tblStr += "&nbsp;&nbsp;" + empData[i].clsfCode + "]";
                            v_tblStr += "&nbsp;&nbsp;" + empData[i].empNm;
                            v_tblStr += "<input type='hidden' class='empNo2' value=" +
                                empData[i].empNo + ">";
                            v_tblStr += "<input type='hidden' class='clsfCode2' value=" +
                                empData[i].clsfCode + ">";
                            v_tblStr += "<input type='hidden' class='empNm2' value=" +
                                empData[i].empNm + ">";
                            v_tblStr += "<input type='hidden' class='deptNm2' value=" +
                                empData[i].deptNm + "></li></a>";
                        }
                        v_tblStr += "</ul>";
                        v_tblStr += "</div>";
                        $("#searchResultMenu2").html(v_tblStr);
                    },
                    error: function (e) {
                        console.log("실패", e);
                    }
                });
            });

            //결재선 삭제
            $('#deleteBtn2').on('click', function () {
                //행삭제할 테이블 가져오기
                var table2 = document.getElementById('alt2');

                //tr삭제하기
                if (empCount2 > 1) {
                    table2.deleteRow(table2.rows.length - 1);
                    //삭제할때마다 행개수 -1
                    empCount2--;
                }
                console.log("empCount2 : " + empCount2);
            });
        });

        function addCcLine(geta) {
            console.log("geta : " + geta);
            console.log(geta.childNodes);

            var lastChildren2 = geta.lastChild; //i, a 중의 a가 잡힘
            var children2 = lastChildren2.childNodes; //a의 하위개체가 잡힘
            var outputString2 = "";
            console.log("children2.length : " + children2.length);
            console.log("empCount2 : " + empCount2);

            // 검색창에서 결재선으로 값 넘길 때의 조건 부여
            if (children2.length == 0) {
                console.log("test");
                var v_infos2 = geta.children;
                console.log(v_infos2);
                var empNo2 = v_infos2[0].value;
                var clsfCode2 = v_infos2[1].value;
                var empNm2 = v_infos2[2].value;
                var deptNm2 = v_infos2[3].value;
            }

            for (var i = 0; i < children2.length; i++) {
                outputString2 += "자식노드: " + children2[i].nodeName + "<br />";

                console.log(i + " : " + children2[i].value);

                if (i == 2) {
                    var empNo2 = children2[i].value;
                    console.log(i + " : " + empNo2);
                } else if (i == 5) {
                    var deptNm2 = children2[i].value;
                    console.log(i + " : " + deptNm2);
                } else if (i == 3) {
                    var clsfCode2 = children2[i].value;
                    console.log(i + " : " + clsfCode2);
                } else if (i == 4) {
                    var empNm2 = children2[i].value;
                    console.log(i + " : " + empNm2);
                }
            }

            //결재선에 추가
            if (empCount2 < 6) {
                var datas2 = $("td[data-empNo]");
                var flag2 = true; //입력 유효
                $.each(datas2, function (index, item) {
                    if (empNo2 == $(item).prop("id")) {
                        console.log(empNo2 + " : " + $(item).prop("id") + "=>존재함");
                        $('.alreadyExist').modal()
                        flag2 = false; //입력 무효
                    };
                });
                //입력이 유효할 때에만 추가
                if (flag2 == true) {
                    $("#appLineTable2").append(
                        "<tr class='apptr2'><td>" + empCount2 + "</td><td>" + deptNm2 +
                        "</td><td class='clsfNm2'>" + clsfCode2 + "</td><td id='" + empNo2 + "' data-empNo='" +
                        empNo2 + "' class='c-name2'>" + empNm2 + "</td></tr>"
                    );
                    empCount2++;
                }
            } else {
                $('.maxCcLine').modal()
            }
        }

        const setLine2 = document.querySelector('#appCcListConfirm')

        // 참조자 등록 창 하단의 등록버튼 클릭 시 실행
        setLine2.addEventListener('click', function () {
            $(".c-name2").each(function (index, item) {
                console.log("c-name2(" + index + ") : " + $(this).prop("id"));
                if (index == 0) {
                    $("#ccEmpInfoBySnNo1").val($(this).prop("id"));
                } else if (index == 1) {
                    $("#ccEmpInfoBySnNo2").val($(this).prop("id"));
                } else if (index == 2) {
                    $("#ccEmpInfoBySnNo3").val($(this).prop("id"));
                } else if (index == 3) {
                    $("#ccEmpInfoBySnNo4").val($(this).prop("id"));
                } else if (index == 4) {
                    $("#ccEmpInfoBySnNo5").val($(this).prop("id"));
                }
            })

            $('.uploadModal').modal()

            const ccEmpInfoBySnNo1 = document.querySelector('#ccEmpInfoBySnNo1')
            const ccEmpInfoBySnNo2 = document.querySelector('#ccEmpInfoBySnNo2')
            const ccEmpInfoBySnNo3 = document.querySelector('#ccEmpInfoBySnNo3')
            const ccEmpInfoBySnNo4 = document.querySelector('#ccEmpInfoBySnNo4')
            const ccEmpInfoBySnNo5 = document.querySelector('#ccEmpInfoBySnNo5')
            console.log(ccEmpInfoBySnNo1.value)
            console.log(ccEmpInfoBySnNo2.value)
            console.log(ccEmpInfoBySnNo3.value)
            console.log(ccEmpInfoBySnNo4.value)
            console.log(ccEmpInfoBySnNo5.value)

            document.querySelector('#uploadConfirm').addEventListener('click', function () {
                $.ajax({
                    url: '/sanction/addCc',
                    type: 'POST',
                    data: {
                        'cc1': ccEmpInfoBySnNo1.value,
                        'cc2': ccEmpInfoBySnNo2.value,
                        'cc3': ccEmpInfoBySnNo3.value,
                        'cc4': ccEmpInfoBySnNo4.value,
                        'cc5': ccEmpInfoBySnNo5.value,
                        'elctrnSanctnSn': elctrnSanctnSn.value
                    },
                    success: function (res) {
                        if (res) {
                            $('.ccSuccess').modal()
                        }
                    }
                })
            })
        })

        const printDoc = document.querySelector('#printDoc')
        const setSanctnLine = document.querySelector('#setSanctnLine')
        const setCc = document.querySelector('#setCc')
        const retrieveDoc = document.querySelector('#retrieveDoc')
        const reUploadDoc = document.querySelector('#reUploadDoc')
        const confirmDoc = document.querySelector('#confirmDoc')
        const returnDoc = document.querySelector('#returnDoc')
        const uploadFile = document.querySelector('#uploadFile')
        const setDisplay = document.querySelector('#setDisplay')
        const uploadDoc = document.querySelector('#uploadDoc')
        const saveDoc = document.querySelector('#saveDoc')
        const exitDoc = document.querySelector('#exitDoc')

        const tNm1 = document.querySelector('#next-nm-1')
        const tNm2 = document.querySelector('#next-nm-2')
        const tNm3 = document.querySelector('#next-nm-3')
        const iNm1 = document.querySelector('#nm1')
        const iNm2 = document.querySelector('#nm2')
        const iNm3 = document.querySelector('#nm3')

        const returnPrvonsh = document.querySelector('#i-returnPrvonsh')
        const rtrvlConfirm = document.querySelector('#rtrvlConfirm')
        const docContent = document.querySelector('#docContent')
        const docContentReturn = document.querySelector('#docContent-returnProvonsh').innerHTML

        // 반려문서 알림창
        if (document.querySelector('#returnAt').value == 'S3') {
            docContent.innerHTML = docContent.innerHTML + '<span style="font-weight: bold;">' + ' (반려사유 : ' +
                docContentReturn + ')</span'

            $('.returnAlert').modal()
            setCc.setAttribute('disabled', 'true')
            setCc.setAttribute('style', 'color: grey')
            setDisplay.setAttribute('disabled', 'true')
            setDisplay.setAttribute('style', 'color: grey')
        }

        // 출력
        printDoc.addEventListener('click', function () {
            window.print()
        })

        // 회수
        retrieveDoc.addEventListener('click', function () {
            $('.rtrvlModal').modal()

            const btnCode = document.querySelector('#btn-code')

            rtrvlConfirm.addEventListener('click', function () {
                $.ajax({
                    url: '/sanction/sanctionLineDelete',
                    type: 'POST',
                    data: {
                        'elctrnSanctnSn': elctrnSanctnSn.value
                    },
                    success: function (res) {
                        if (res) {
                            retrieveDoc.setAttribute('disabled', 'true')
                            retrieveDoc.setAttribute('style', 'color: grey')
                            reUploadDoc.removeAttribute('disabled')
                            reUploadDoc.removeAttribute('style')

                            $('.rtrvlSuccess').modal()
                            opener.parent.location.reload()
                        } else if (!res) {
                            $('.rtrvlFail').modal()
                        }
                    }
                })
            })
        })

        // 재기안
        reUploadDoc.addEventListener('click', function () {
            var formNm = document.querySelector('#formNm')

            if (formNm.innerText == '기안서') {
                $('.reUploadModal').modal()
                const reuploadConfirm = document.querySelector('#reUploadConfirm')
                reuploadConfirm.addEventListener('click', function () {

                    // 새 창 열기
                    var width = 992
                    var height = 910
                    var left = 10
                    var top = 10
                    var specs = 'width=' + width
                    specs += ',height=' + height
                    specs += ',left=' + left
                    specs += ',top=' + top

                    const drftFormSn = document.querySelector('#drftFormSn')

                    var pop_title = 'document'
                    window.open('', 'document', specs + ', scrollbars=no')
                    var frmData = document.frmData
                    frmData.target = pop_title
                    frmData.action = '/sanction/elctrnSanctnDrftFormDetailPost'
                    frmData.submit()

                    self.close()
                })
            } else {
                $('.impossibleModal').modal()
                return
            }
        })

        // 승인
        signDoc.addEventListener('click', function () {
            $('.confirmDoc').modal()

            const confirmBtn = document.querySelector('#confirmConfirm')
            confirmBtn.addEventListener('click', function () {
                $.ajax({
                    url: '/sanction/sanctionConfirm',
                    type: 'POST',
                    data: {
                        'elctrnSanctnSn': elctrnSanctnSn.value
                    },
                    success: function (res) {
                        if (res != '') {
                            // 결재자 서명이 추가되는 곳
                            console.log('step : ' + res)
                            if (res == 2) {
                                tNm1.innerHTML = iNm1.value
                            } else if (res == 3) {
                                tNm2.innerHTML = iNm2.value
                            } else if (res == 4) {
                                tNm3.innerHTML = iNm3.value
                            }

                            signDoc.setAttribute('disabled', 'true')
                            returnDoc.setAttribute('disabled', 'true')
                            setDisplay.setAttribute('disabled', 'true')
                            signDoc.setAttribute('style', 'color: grey')
                            returnDoc.setAttribute('style', 'color: grey')
                            setDisplay.setAttribute('style', 'color: grey')

                            $('.confirmSuccess').modal()
                            opener.parent.location.reload()
                        }
                    }
                })
            })
        })

        // 반려 
        returnDoc.addEventListener('click', function () {
            $('.returnPrvonsh').modal()

            const returnReason = document.querySelector('#returnReason')
            const closeReturnModal = document.querySelector('#returnPrvonsh')

            returnAtModifySubmit.addEventListener('click', function () {
                if (returnPrvonsh.value == '' || returnPrvonsh == null || !returnPrvonsh) {
                    returnReason.setAttribute('style', 'color: red;')
                    return
                } else {
                    closeReturnModal.classList.remove('show')
                    $.ajax({
                        url: '/sanction/returnAtModify',
                        type: 'post',
                        data: {
                            'elctrnSanctnSn': elctrnSanctnSn.value,
                            'returnPrvonsh': returnPrvonsh.value
                        },
                        success: function (res) {
                            const btn = document.querySelector('#returnCloseBtn')
                            btn.click()

                            if (res) {
                                signDoc.setAttribute('disabled', 'true')
                                returnDoc.setAttribute('disabled', 'true')
                                signDoc.setAttribute('style', 'color: grey')
                                returnDoc.setAttribute('style', 'color: grey')

                                $('.returnSuccess').modal()
                                opener.parent.location.reload()
                            }
                        }
                    })
                }
            })
        })

        // 공람
        setDisplay.addEventListener('click', function () {
            $('.displayModal').modal()
            document.querySelector('#displayConfirm').addEventListener('click', function () {
                $.ajax({
                    url: '/sanction/displayAtModify',
                    type: 'POST',
                    data: {
                        'elctrnSanctnSn': elctrnSanctnSn.value
                    },
                    success: function (res) {
                        if (res) {
                            $('.displaySuccess').modal()
                        } else if (!res) {
                            $('.displayFail').modal()
                        }
                    }
                })
            })
        })

        // 삭제
        const deleteDoc = () => {
            $('.deleteModal').modal()
            const confirm = document.querySelector('#deleteConfirm')
            const deleteCancel = document.querySelector('#deleteCancel')

            confirm.addEventListener('click', function () {
                if (document.querySelector('#returnAt').value == 'S3') {
                    // 반려 문서
                    $.ajax({
                        url: '/sanction/returnDelete?elctrnSanctnSn=' + elctrnSanctnSn.value,
                        type: 'POST',
                        data: {
                            'elctrnSanctnSn': elctrnSanctnSn.value
                        },
                        success: function (res) {
                            if (res) {
                                window.close()
                                opener.parent.location.reload()
                            }
                        }
                    })
                } else {
                    // 회수 문서
                    $.ajax({
                        url: '/sanction/rtrvlDelete?elctrnSanctnSn=' + elctrnSanctnSn.value,
                        type: 'POST',
                        data: {
                            'elctrnSanctnSn': elctrnSanctnSn.value
                        },
                        success: function (res) {
                            if (res) {
                                window.close()
                                opener.parent.location.reload()
                            }
                        }
                    })
                }
            })
        }

        // 닫기
        exitDoc.addEventListener('click', function () {
            $('.closeModal').modal()
            const confirm = document.querySelector('#closeConfirm')
            const closeCancel = document.querySelector('#closeCancel')
            const formName = document.querySelector('#formNm').innerHTML

            confirm.addEventListener('click', function () {
                window.close()

                if (formName != '기안서') {
                    opener.parent.location.reload()
                }
            })
        })

        // 결재라인 가져오기
        $.ajax({
            url: '/sanction/getSanctnLine',
            type: 'POST',
            data: {
                'elctrnSanctnSn': elctrnSanctnSn.value
            },
            success: function (res) {
                var vNm1 = "";
                var vNm2 = "";
                var vNm3 = "";

                $.each(res, function (i, v) {
                    if (i == 1) {
                        vNm1 = v.EMP_NM
                    }
                    if (i == 2) {
                        vNm2 = v.EMP_NM
                    }
                    if (i == 3) {
                        vNm3 = v.EMP_NM
                    }
                })

                tNm1.innerHTML = vNm1
                tNm2.innerHTML = vNm2
                tNm3.innerHTML = vNm3
            }
        })

        // 필요없는 버튼 비활성화
        const btnCode = document.querySelector('#btn-code').value

        if (btnCode == 'bc2') {
            // 결재라인, 참조, 승인, 반려, 공람, 상신, 저장 비활성화
            setSanctnLine.setAttribute('disabled', 'true')
            setCc.setAttribute('disabled', 'true')
            signDoc.setAttribute('disabled', 'true')
            returnDoc.setAttribute('disabled', 'true')
            setDisplay.setAttribute('disabled', 'true')
            uploadDoc.setAttribute('disabled', 'true')
            if (saveDoc != null) {
                saveDoc.setAttribute('disabled', 'true')
            }
            if (reUploadDoc != null) {
                reUploadDoc.setAttribute('disabled', 'true')
            }

            setSanctnLine.setAttribute('style', 'color: grey')
            setCc.setAttribute('style', 'color: grey')
            signDoc.setAttribute('style', 'color: grey')
            returnDoc.setAttribute('style', 'color: grey')
            setDisplay.setAttribute('style', 'color: grey')
            uploadDoc.setAttribute('style', 'color: grey')
            if (saveDoc != null) {
                saveDoc.setAttribute('style', 'color: grey')
            }
            if (reUploadDoc != null) {
                reUploadDoc.setAttribute('style', 'color: grey')
            }

        } else if (btnCode == 'bc3') {
            // 결재라인, 참조, 회수, 승인, 반려, 공람, 상신, 저장 비활성화
            setSanctnLine.setAttribute('disabled', 'true')
            setCc.setAttribute('disabled', 'true')
            retrieveDoc.setAttribute('disabled', 'true')
            signDoc.setAttribute('disabled', 'true')
            returnDoc.setAttribute('disabled', 'true')
            setDisplay.setAttribute('disabled', 'true')
            uploadDoc.setAttribute('disabled', 'true')
            if (saveDoc != null) {
                saveDoc.setAttribute('disabled', 'true')
            }

            setSanctnLine.setAttribute('style', 'color: grey')
            setCc.setAttribute('style', 'color: grey')
            retrieveDoc.setAttribute('style', 'color: grey')
            signDoc.setAttribute('style', 'color: grey')
            returnDoc.setAttribute('style', 'color: grey')
            setDisplay.setAttribute('style', 'color: grey')
            uploadDoc.setAttribute('style', 'color: grey')
            if (saveDoc != null) {
                saveDoc.setAttribute('style', 'color: grey')
            }

        } else if (btnCode == 'bc4') {
            // 결재라인, 참조, 회수, 공람, 상신, 저장 비활성화
            setSanctnLine.setAttribute('disabled', 'true')
            setCc.setAttribute('disabled', 'true')
            retrieveDoc.setAttribute('disabled', 'true')
            setDisplay.setAttribute('disabled', 'true')
            uploadDoc.setAttribute('disabled', 'true')
            if (saveDoc != null) {
                saveDoc.setAttribute('disabled', 'true')
            }
            if (reUploadDoc != null) {
                reUploadDoc.setAttribute('disabled', 'true')
            }

            setSanctnLine.setAttribute('style', 'color: grey')
            setCc.setAttribute('style', 'color: grey')
            retrieveDoc.setAttribute('style', 'color: grey')
            setDisplay.setAttribute('style', 'color: grey')
            uploadDoc.setAttribute('style', 'color: grey')
            if (saveDoc != null) {
                saveDoc.setAttribute('style', 'color: grey')
            }
            if (reUploadDoc != null) {
                reUploadDoc.setAttribute('style', 'color: grey')
            }

        } else if (btnCode == 'bc5') {
            // 결재라인, 참조, 회수, 승인, 반려, 공람, 상신, 저장 비활성화
            setSanctnLine.setAttribute('disabled', 'true')
            setCc.setAttribute('disabled', 'true')
            retrieveDoc.setAttribute('disabled', 'true')
            signDoc.setAttribute('disabled', 'true')
            returnDoc.setAttribute('disabled', 'true')
            setDisplay.setAttribute('disabled', 'true')
            uploadDoc.setAttribute('disabled', 'true')
            if (saveDoc != null) {
                saveDoc.setAttribute('disabled', 'true')
            }
            if (reUploadDoc != null) {
                reUploadDoc.setAttribute('disabled', 'true')
            }

            setSanctnLine.setAttribute('style', 'color: grey')
            setCc.setAttribute('style', 'color: grey')
            retrieveDoc.setAttribute('style', 'color: grey')
            signDoc.setAttribute('style', 'color: grey')
            returnDoc.setAttribute('style', 'color: grey')
            setDisplay.setAttribute('style', 'color: grey')
            uploadDoc.setAttribute('style', 'color: grey')
            if (saveDoc != null) {
                saveDoc.setAttribute('style', 'color: grey')
            }
            if (reUploadDoc != null) {
                reUploadDoc.setAttribute('style', 'color: grey')
            }

        } else if (btnCode == 'bc6') {
            // 결재라인, 참조, 회수, 승인, 반려, 상신, 저장 비활성화
            setSanctnLine.setAttribute('disabled', 'true')
            retrieveDoc.setAttribute('disabled', 'true')
            signDoc.setAttribute('disabled', 'true')
            returnDoc.setAttribute('disabled', 'true')
            uploadDoc.setAttribute('disabled', 'true')
            if (saveDoc != null) {
                saveDoc.setAttribute('disabled', 'true')
            }

            setSanctnLine.setAttribute('style', 'color: grey')
            retrieveDoc.setAttribute('style', 'color: grey')
            signDoc.setAttribute('style', 'color: grey')
            returnDoc.setAttribute('style', 'color: grey')
            uploadDoc.setAttribute('style', 'color: grey')
            if (saveDoc != null) {
                saveDoc.setAttribute('style', 'color: grey')
            }
        }
    </script>