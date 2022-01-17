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
        #iHover:hover {
            color: #7367F0;
        }
    </style>

</head>

<body class="vertical-layout vertical-menu-modern  navbar-floating footer-static  " data-open="click"
    data-menu="vertical-menu-modern" data-col="">

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
                                    <li class="breadcrumb-item active">기안문작성</li>
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
                                            <div class="card" style="height: 560px;">
                                                <div class="card-header">
                                                    <h2 class="card-title">양식목록</h2>
                                                    <form action="/sanction/elctrnSanctnDrftFormSearch" method="post">
                                                        <div style="display:flex;">
                                                            <input type="text" class="form-control" id="helpInputTop"
                                                                name="keyword" value="${keyword}"
                                                                placeholder="양식명을 입력하세요."
                                                                style="display: inline; width: 300px;">
                                                            <button type="submit"
                                                                class="btn btn-icon btn-outline-primary waves-effect">
                                                                <i data-feather='search'></i>
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="table-responsive">
                                                    <table class="table" style="text-align: center;">
                                                        <thead>
                                                            <tr>
                                                                <th>NO</th>
                                                                <th>양식명</th>
                                                                <th>상위분류명</th>
                                                                <th>하위분류명</th>
                                                                <th>관리부서</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:choose>
                                                                <c:when test="${not empty mapList}">
                                                                    <c:forEach var="row" items="${mapList}">
                                                                        <tr>
                                                                            <td>${row.RNUM}</td>
                                                                            <td id="iHover" class="td_open"
                                                                                data-value="${row.DRFT_FORM_SN}"
                                                                                style="cursor: pointer;">${row.FORM_NM}
                                                                            </td>
                                                                            <td>${row.UPPER_DRFT_SE_CODE}</td>
                                                                            <td>${row.DRFT_SE_NM}</td>
                                                                            <td>${row.FORM_DEPT}</td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <tr>
                                                                        <td colspan="5" style="padding: 30px;">목록이 없습니다.
                                                                        </td>
                                                                    </tr>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- END: Content-->
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
    <!-- END Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="/resources/vendors/js/forms/wizard/bs-stepper.min.js"></script>
    <script src="/resources/vendors/js/forms/select/select2.full.min.js"></script>
    <script src="/resources/vendors/js/forms/cleave/cleave.min.js"></script>
    <script src="/resources/vendors/js/forms/cleave/addons/cleave-phone.us.js"></script>
    <script src="/resources/vendors/js/forms/validation/jquery.validate.min.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="/resources/js/core/app-menu.js"></script>
    <script src="/resources/js/core/app.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <script src="/resources/js/scripts/pages/modal-add-new-address.js"></script>
    <!-- END: Page JS-->

    <script type="text/javascript">
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

                var drftFormSn = e.target.getAttribute('data-value')

                if (drftFormSn == 1) {
                    window.open('/sanction/elctrnSanctnDrftFormDetail?drftFormSn=' + drftFormSn + '&snNumber=1', 'document',
                        specs + ', scrollbars=no')
                } else if (drftFormSn == 2) {
                    location.href = '/dclz/vcatnForm'
                } else if (drftFormSn == 3) {
                    location.href = '/dclz/bsrpForm'
                } else if (drftFormSn == 4) {
                    location.href = '/hr/crtfForm'
                } else if (drftFormSn == 5) {
                    location.href = ''
                } else if (drftFormSn == 6) {
                    location.href = ''
                }
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
