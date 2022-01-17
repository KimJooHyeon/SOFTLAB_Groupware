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
    <title>Input - Vuexy - Bootstrap HTML admin template</title>
    <link rel="apple-touch-icon" href="/resources/images/ico/apple-icon-120.png">
    
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,400;1,500;1,600" rel="stylesheet">

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/vendors/css/vendors.min.css">
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
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/assets/css/style.css">
    <!-- END: Custom CSS-->

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu-modern  navbar-floating footer-static   menu-collapsed" data-open="click" data-menu="vertical-menu-modern" data-col="">

    <!-- BEGIN: Header-->
    <ul class="main-search-list-defaultlist-other-list d-none">
        <li class="auto-suggestion justify-content-between"><a class="d-flex align-items-center justify-content-between w-100 py-50">
                <div class="d-flex justify-content-start"><span class="mr-75" data-feather="alert-circle"></span><span>No results found.</span></div>
            </a></li>
    </ul>
    <!-- END: Header-->


    <!-- BEGIN: Main Menu-->
    <!-- END: Main Menu-->

    <!-- BEGIN: Content-->
    <div class="app-content content ">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper container-xxl p-0">
            <div class="content-header row">
                <div class="content-header-left col-md-9 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="col-12">
                            <h2 class="content-header-title float-left mb-0">Input</h2>
                            <div class="breadcrumb-wrapper">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Home</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="#">Form Elements</a>
                                    </li>
                                    <li class="breadcrumb-item active">Input
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content-header-right text-md-right col-md-3 col-12 d-md-block d-none">
                    <div class="form-group breadcrumb-right">
                        <div class="dropdown">
                            <button class="btn-icon btn btn-primary btn-round btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i data-feather="grid"></i></button>
                            <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item" href="app-todo.html"><i class="mr-1" data-feather="check-square"></i><span class="align-middle">Todo</span></a><a class="dropdown-item" href="app-chat.html"><i class="mr-1" data-feather="message-square"></i><span class="align-middle">Chat</span></a><a class="dropdown-item" href="app-email.html"><i class="mr-1" data-feather="mail"></i><span class="align-middle">Email</span></a><a class="dropdown-item" href="app-calendar.html"><i class="mr-1" data-feather="calendar"></i><span class="align-middle">Calendar</span></a></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content-body">
                <!-- Basic Inputs start -->
                <section id="basic-input">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Basic Inputs</h4>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-xl-4 col-md-6 col-12 mb-1">
                                            <div class="form-group">
                                                <label for="basicInput">Basic Input</label>
                                                <input type="text" class="form-control" id="basicInput" placeholder="Enter email" />
                                            </div>
                                        </div>
                                        <div class="col-xl-4 col-md-6 col-12 mb-1">
                                            <div class="form-group">
                                                <label for="helpInputTop">Input text with help</label>
                                                <small class="text-muted">eg.<i>someone@example.com</i></small>
                                                <input type="text" class="form-control" id="helpInputTop" />
                                            </div>
                                        </div>
                                        <div class="col-xl-4 col-md-6 col-12 mb-1">
                                            <div class="form-group">
                                                <label for="disabledInput">Disabled Input</label>
                                                <input type="text" class="form-control" id="disabledInput" disabled />
                                            </div>
                                        </div>
                                        <div class="col-xl-4 col-md-6 col-12">
                                            <div class="form-group">
                                                <label for="helperText">With Helper Text</label>
                                                <input type="text" id="helperText" class="form-control" placeholder="Name" />
                                                <p><small class="text-muted">Find helper text here for given textbox.</small></p>
                                            </div>
                                        </div>
                                        <div class="col-xl-4 col-md-6 col-12">
                                            <div class="form-group">
                                                <label for="disabledInput">Readonly Input</label>
                                                <input type="text" class="form-control" id="readonlyInput" readonly="readonly" value="You can't update me :P" />
                                            </div>
                                        </div>
                                        <div class="col-xl-4 col-md-6 col-12">
                                            <div class="form-group">
                                                <label for="disabledInput">Readonly Static Text</label>
                                                <p class="form-control-static" id="staticInput">email@pixinvent.com</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Basic Inputs end -->

                <!-- Input Sizing start -->
                <section id="input-sizing">
                    <div class="row match-height">
                        <div class="col-md-6 col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Sizing Options</h4>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-12">
                                            <p class="card-text">
                                                For different sizes of Input, Use classes like <code>.form-control-lg</code> &amp;
                                                <code>.form-control-sm</code> for Large, Small input box.
                                            </p>
                                            <div class="form-group">
                                                <label for="largeInput">Large</label>
                                                <input id="largeInput" class="form-control form-control-lg" type="text" placeholder="Large Input" />
                                            </div>
                                            <div class="form-group">
                                                <label for="defaultInput">Default</label>
                                                <input id="defaultInput" class="form-control" type="text" placeholder="Normal Input" />
                                            </div>
                                            <div class="form-group">
                                                <label for="smallInput">Small</label>
                                                <input id="smallInput" class="form-control form-control-sm" type="text" placeholder="Small Input" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Horizontal form label sizing</h4>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-12">
                                            <p class="card-text mb-2">
                                                Be sure to use <code>.col-form-label-sm</code> or <code>.col-form-label-lg</code> to your
                                                <code>&lt;label&gt;</code>s or <code>&lt;legend&gt;</code>s to correctly follow the size of
                                                <code>.form-control-lg</code> and <code>.form-control-sm</code>.
                                            </p>
                                            <div class="form-group row">
                                                <label for="colFormLabelLg" class="col-sm-3 col-form-label col-form-label-lg">Large</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control form-control-lg" id="colFormLabelLg" placeholder="Large Input" />
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="colFormLabel" class="col-sm-3 col-form-label">Default</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="colFormLabel" placeholder="Normal Input" />
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm">Small</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control form-control-sm" id="colFormLabelSm" placeholder="Small Input" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Input Sizing end -->

                <!-- Floating Label Inputs start -->
                <section id="floating-label-input">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Floating Label Inputs</h4>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-12 mb-1">
                                            <p>
                                                For Floating Label Inputs, need to use <code>.form-label-group</code> class & add attribute
                                                <code>disabled</code> for disabled Floating Label Input.
                                            </p>
                                        </div>
                                        <div class="col-sm-6 col-12">
                                            <div class="form-label-group">
                                                <input type="text" class="form-control" id="floating-label1" placeholder="Label-placeholder" />
                                                <label for="floating-label1">Label-placeholder</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-12">
                                            <div class="form-label-group">
                                                <input type="text" class="form-control" id="floating-label-disable" placeholder="Label-placeholder" disabled />
                                                <label for="floating-label-disable">Disabled-placeholder</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Floating Label Inputs end -->

                <!-- Basic File Browser start -->
                <section id="input-file-browser">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">File input</h4>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-12">
                                            <div class="form-group">
                                                <label for="basicInputFile">Simple File Input</label>
                                                <input type="file" class="form-control-file" id="basicInputFile" />
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-12">
                                            <div class="form-group">
                                                <label for="customFile">With Browse button</label>
                                                <div class="custom-file">
                                                    <input type="file" class="custom-file-input" id="customFile" />
                                                    <label class="custom-file-label" for="customFile">Choose file</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Basic File Browser end -->

                <!-- validations start -->
                <section class="validations" id="validation">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Input Validation States</h4>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-12">
                                            <p>
                                                You can indicate invalid and valid form fields with <code>.is-invalid</code> and <code>.is-valid</code>.
                                                Note that <code>.invalid-feedback</code> is also supported with these classes.
                                            </p>
                                        </div>
                                        <div class="col-sm-6 col-12">
                                            <label for="valid-state">Valid State</label>
                                            <input type="text" class="form-control is-valid" id="valid-state" placeholder="Valid" value="Valid" required />
                                            <div class="valid-feedback">This is valid state.</div>
                                        </div>
                                        <div class="col-sm-6 col-12">
                                            <label for="invalid-state">Invalid State</label>
                                            <input type="text" class="form-control is-invalid" id="invalid-state" placeholder="Invalid" value="Invalid" required />
                                            <div class="invalid-feedback">This is invalid state.</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- validations end -->

                <!-- Tooltip validations start -->
                <section class="tooltip-validations" id="tooltip-validation">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Input Validation States with Tootltips</h4>
                                </div>
                                <div class="card-body">
                                    <p>
                                        <code>.{valid/invalid}-feedback</code> classes for <code>.{valid/invalid}-tooltip</code> classes to display
                                        validation feedback in a styled tooltip.
                                    </p>
                                    <form class="needs-validation" novalidate>
                                        <div class="form-row">
                                            <div class="col-md-4 col-12 mb-3">
                                                <label for="validationTooltip01">First name</label>
                                                <input type="text" class="form-control" id="validationTooltip01" placeholder="First name" value="Mark" required />
                                                <div class="valid-tooltip">Looks good!</div>
                                            </div>
                                            <div class="col-md-4 col-12 mb-3">
                                                <label for="validationTooltip02">Last name</label>
                                                <input type="text" class="form-control" id="validationTooltip02" placeholder="Last name" value="Otto" required />
                                                <div class="valid-tooltip">Looks good!</div>
                                            </div>
                                            <div class="col-md-4 col-12 mb-3">
                                                <label for="validationTooltip03">City</label>
                                                <input type="text" class="form-control" id="validationTooltip03" placeholder="City" required />
                                                <div class="invalid-tooltip">Please provide a valid city.</div>
                                            </div>
                                        </div>
                                        <button class="btn btn-primary" type="submit">Submit</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Tooltip validations end -->

            </div>
        </div>
    </div>
    <!-- END: Content-->

    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

    <!-- BEGIN: Footer-->
    <footer class="footer footer-static footer-light">
        <p class="clearfix mb-0"><span class="float-md-left d-block d-md-inline-block mt-25">COPYRIGHT &copy; 2021<a class="ml-25" href="https://1.envato.market/pixinvent_portfolio" target="_blank">Pixinvent</a><span class="d-none d-sm-inline-block">, All rights Reserved</span></span><span class="float-md-right d-none d-md-block">Hand-crafted & Made with<i data-feather="heart"></i></span></p>
    </footer>
    <button class="btn btn-primary btn-icon scroll-top" type="button"><i data-feather="arrow-up"></i></button>
    <!-- END: Footer-->


    <!-- BEGIN: Vendor JS-->
    <script src="/resources/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="/resources/js/core/app-menu.js"></script>
    <script src="/resources/js/core/app.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <script src="/resources/js/scripts/forms/form-tooltip-valid.js"></script>
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