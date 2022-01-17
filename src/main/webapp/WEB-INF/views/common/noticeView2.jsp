<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html class="loading" data-textdirection="ltr">
<!-- BEGIN: Head-->
<style type="text/css">
input::placeholder { text-align: center; }
</style>
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
    <link rel="stylesheet" type="text/css" href="/resources/vendors/css/forms/select/select2.min.css">
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
<!--     <link rel="stylesheet" type="text/css" href="/resources/css/core/menu/menu-types/vertical-menu.css"> -->
    <link rel="stylesheet" type="text/css" href="/resources/css/core/menu/menu-types/horizontal-menu.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/pages/page-blog.min.css">
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/assets/css/style.css">
    <!-- END: Custom CSS-->

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<!-- <body class="horizontal-layout horizontal-menu content-detached-right-sidebar navbar-floating footer-static  " data-open="hover" data-menu="horizontal-menu" data-col="content-detached-right-sidebar"> -->
<body class="horizontal-layout horizontal-menu content-detached-right-sidebar navbar-floating footer-static  " data-open="hover" data-menu="horizontal-menu" data-col="content-detached-right-sidebar">

    <!-- BEGIN: Header-->
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
                <h2 class="content-header-title float-left mb-0">Blog Detail</h2>
                <div class="breadcrumb-wrapper">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a>
                    </li>
                    <li class="breadcrumb-item"><a href="#">Pages</a>
                    </li>
                    <li class="breadcrumb-item"><a href="#">Blog</a>
                    </li>
                    <li class="breadcrumb-item active">Detail
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
        <div class="content-detached content-left">
          <div class="content-body"><!-- Blog Detail -->
<div class="blog-detail-wrapper">
  <div class="row">
    <!-- Blog -->
    <div class="col-12">
      <div class="card">
        <img
          src="/resources/images/banner/banner-12.jpg"
          class="img-fluid card-img-top"
          alt="Blog Detail Pic"
        />
        <div class="card-body">
          <h4 class="card-title">The Best Features Coming to iOS and Web design</h4>
          <div class="media">
            <div class="avatar mr-50">
              <img src="/resources/images/portrait/small/avatar-s-7.jpg" alt="Avatar" width="24" height="24" />
            </div>
            <div class="media-body">
              <small class="text-muted mr-25">by</small>
              <small><a href="javascript:void(0);" class="text-body">Ghani Pradita</a></small>
              <span class="text-muted ml-50 mr-25">|</span>
              <small class="text-muted">Jan 10, 2020</small>
            </div>
          </div>
          <div class="my-1 py-25">
            <a href="javascript:void(0);">
              <div class="badge badge-pill badge-light-danger mr-50">Gaming</div>
            </a>
            <a href="javascript:void(0);">
              <div class="badge badge-pill badge-light-warning">Video</div>
            </a>
          </div>
          <p class="card-text mb-2">
            Before you get into the nitty-gritty of coming up with a perfect title, start with a rough draft: your
            working title. What is that, exactly? A lot of people confuse working titles with topics. Let's clear that
            Topics are very general and could yield several different blog posts. Think "raising healthy kids," or
            "kitchen storage." A writer might look at either of those topics and choose to take them in very, very
            different directions.A working title, on the other hand, is very specific and guides the creation of a
            single blog post. For example, from the topic "raising healthy kids," you could derive the following working
            title See how different and specific each of those is? That's what makes them working titles, instead of
            overarching topics.
          </p>
          <h4 class="mb-75">Unprecedented Challenge</h4>
          <ul class="p-0 mb-2">
            <li class="d-block">
              <span class="mr-25">-</span>
              <span>Preliminary thinking systems</span>
            </li>
            <li class="d-block">
              <span class="mr-25">-</span>
              <span>Bandwidth efficient</span>
            </li>
            <li class="d-block">
              <span class="mr-25">-</span>
              <span>Green space</span>
            </li>
            <li class="d-block">
              <span class="mr-25">-</span>
              <span>Social impact</span>
            </li>
            <li class="d-block">
              <span class="mr-25">-</span>
              <span>Thought partnership</span>
            </li>
            <li class="d-block">
              <span class="mr-25">-</span>
              <span>Fully ethical life</span>
            </li>
          </ul>
          <div class="media">
            <div class="avatar mr-2">
              <img src="/resources/images/portrait/small/avatar-s-6.jpg" width="60" height="60" alt="Avatar" />
            </div>
            <div class="media-body">
              <h6 class="font-weight-bolder">Willie Clark</h6>
              <p class="card-text mb-0">
                Based in London, Uncode is a blog by Willie Clark. His posts explore modern design trends through photos
                and quotes by influential creatives and web designer around the world.
              </p>
            </div>
          </div>
          <hr class="my-2" />
          <div class="d-flex align-items-center justify-content-between">
            <div class="d-flex align-items-center">
              <div class="d-flex align-items-center mr-1">
                <a href="javascript:void(0);" class="mr-50">
                  <i data-feather="message-square" class="font-medium-5 text-body align-middle"></i>
                </a>
                <a href="javascript:void(0);">
                  <div class="text-body align-middle">19.1K</div>
                </a>
              </div>
              <div class="d-flex align-items-center">
                <a href="javascript:void(0);" class="mr-50">
                  <i data-feather="bookmark" class="font-medium-5 text-body align-middle"></i>
                </a>
                <a href="javascript:void(0);">
                  <div class="text-body align-middle">139</div>
                </a>
              </div>
            </div>
            <div class="dropdown blog-detail-share">
              <i
                data-feather="share-2"
                class="font-medium-5 text-body cursor-pointer"
                role="button"
                data-toggle="dropdown"
                aria-haspopup="true"
                aria-expanded="false"
              ></i>
              <div class="dropdown-menu dropdown-menu-right">
                <a href="javascript:void(0);" class="dropdown-item py-50 px-1">
                  <i data-feather="github" class="font-medium-3"></i>
                </a>
                <a href="javascript:void(0);" class="dropdown-item py-50 px-1">
                  <i data-feather="gitlab" class="font-medium-3"></i>
                </a>
                <a href="javascript:void(0);" class="dropdown-item py-50 px-1">
                  <i data-feather="facebook" class="font-medium-3"></i>
                </a>
                <a href="javascript:void(0);" class="dropdown-item py-50 px-1">
                  <i data-feather="twitter" class="font-medium-3"></i>
                </a>
                <a href="javascript:void(0);" class="dropdown-item py-50 px-1">
                  <i data-feather="linkedin" class="font-medium-3"></i>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--/ Blog -->

    <!-- Blog Comment -->
    <div class="col-12 mt-1" id="blogComment">
      <h6 class="section-label mt-25">Comment</h6>
      <div class="card">
        <div class="card-body">
          <div class="media">
            <div class="avatar mr-75">
              <img src="/resources/images/portrait/small/avatar-s-9.jpg" width="38" height="38" alt="Avatar" />
            </div>
            <div class="media-body">
              <h6 class="font-weight-bolder mb-25">Chad Alexander</h6>
              <p class="card-text">May 24, 2020</p>
              <p class="card-text">
                A variation on the question technique above, the multiple-choice question great way to engage your
                reader.
              </p>
              <a href="javascript:void(0);">
                <div class="d-inline-flex align-items-center">
                  <i data-feather="corner-up-left" class="font-medium-3 mr-50"></i>
                  <span>Reply</span>
                </div>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--/ Blog Comment -->

    <!-- Leave a Blog Comment -->
    <div class="col-12 mt-1">
      <h6 class="section-label mt-25">Leave a Comment</h6>
      <div class="card">
        <div class="card-body">
          <form action="javascript:void(0);" class="form">
            <div class="row">
              <div class="col-sm-6 col-12">
                <div class="form-group mb-2">
                  <input type="text" class="form-control" placeholder="Name" />
                </div>
              </div>
              <div class="col-sm-6 col-12">
                <div class="form-group mb-2">
                  <input type="email" class="form-control" placeholder="Email" />
                </div>
              </div>
              <div class="col-sm-6 col-12">
                <div class="form-group mb-2">
                  <input type="url" class="form-control" placeholder="Website" />
                </div>
              </div>
              <div class="col-12">
                <textarea class="form-control mb-2" rows="4" placeholder="Comment"></textarea>
              </div>
              <div class="col-12">
                <div class="custom-control custom-checkbox mb-2">
                  <input type="checkbox" class="custom-control-input" id="blogCheckbox" />
                  <label class="custom-control-label" for="blogCheckbox"
                    >Save my name, email, and website in this browser for the next time I comment.</label
                  >
                </div>
              </div>
              <div class="col-12">
                <button type="submit" class="btn btn-primary">Post Comment</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
    <!--/ Leave a Blog Comment -->
  </div>
</div>
<!--/ Blog Detail -->

          </div>
        </div>
        <div class="sidebar-detached sidebar-right">
                <div class="sidebar">
                    <div class="blog-sidebar my-2 my-lg-0">
                        <!-- Search bar -->
                        <div class="blog-search">
                            <div class="input-group input-group-merge">
                                <input type="text" class="form-control" placeholder="Search here" />
                                <div class="input-group-append">
                                    <span class="input-group-text cursor-pointer">
                                        <i data-feather="search"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <!--/ Search bar -->

                        <!-- Recent Posts -->
                        <div class="blog-recent-posts mt-3">
                            <h6 class="section-label">Recent Posts</h6>
                            <div class="mt-75">
                                <div class="media mb-2">
                                    <a href="page-blog-detail.html" class="mr-2">
                                        <img class="rounded" src="../../../app-assets/images/banner/banner-22.jpg" width="100" height="70" alt="Recent Post Pic" />
                                    </a>
                                    <div class="media-body">
                                        <h6 class="blog-recent-post-title">
                                            <a href="page-blog-detail.html" class="text-body-heading">Why Should Forget Facebook?</a>
                                        </h6>
                                        <div class="text-muted mb-0">Jan 14 2020</div>
                                    </div>
                                </div>
                                <div class="media mb-2">
                                    <a href="page-blog-detail.html" class="mr-2">
                                        <img class="rounded" src="../../../app-assets/images/banner/banner-27.jpg" width="100" height="70" alt="Recent Post Pic" />
                                    </a>
                                    <div class="media-body">
                                        <h6 class="blog-recent-post-title">
                                            <a href="page-blog-detail.html" class="text-body-heading">Publish your passions, your way</a>
                                        </h6>
                                        <div class="text-muted mb-0">Mar 04 2020</div>
                                    </div>
                                </div>
                                <div class="media mb-2">
                                    <a href="page-blog-detail.html" class="mr-2">
                                        <img class="rounded" src="../../../app-assets/images/banner/banner-39.jpg" width="100" height="70" alt="Recent Post Pic" />
                                    </a>
                                    <div class="media-body">
                                        <h6 class="blog-recent-post-title">
                                            <a href="page-blog-detail.html" class="text-body-heading">The Best Ways to Retain More</a>
                                        </h6>
                                        <div class="text-muted mb-0">Feb 18 2020</div>
                                    </div>
                                </div>
                                <div class="media">
                                    <a href="page-blog-detail.html" class="mr-2">
                                        <img class="rounded" src="../../../app-assets/images/banner/banner-35.jpg" width="100" height="70" alt="Recent Post Pic" />
                                    </a>
                                    <div class="media-body">
                                        <h6 class="blog-recent-post-title">
                                            <a href="page-blog-detail.html" class="text-body-heading">Share a Shocking Fact or Statistic</a>
                                        </h6>
                                        <div class="text-muted mb-0">Oct 08 2020</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/ Recent Posts -->

                        <!-- Categories -->
                        <div class="blog-categories mt-3">
                            <h6 class="section-label">Categories</h6>
                            <div class="mt-1">
                                <div class="d-flex justify-content-start align-items-center mb-75">
                                    <a href="javascript:void(0);" class="mr-75">
                                        <div class="avatar bg-light-primary rounded">
                                            <div class="avatar-content">
                                                <i data-feather="watch" class="avatar-icon font-medium-1"></i>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="javascript:void(0);">
                                        <div class="blog-category-title text-body">Fashion</div>
                                    </a>
                                </div>
                                <div class="d-flex justify-content-start align-items-center mb-75">
                                    <a href="javascript:void(0);" class="mr-75">
                                        <div class="avatar bg-light-success rounded">
                                            <div class="avatar-content">
                                                <i data-feather="shopping-cart" class="avatar-icon font-medium-1"></i>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="javascript:void(0);">
                                        <div class="blog-category-title text-body">Food</div>
                                    </a>
                                </div>
                                <div class="d-flex justify-content-start align-items-center mb-75">
                                    <a href="javascript:void(0);" class="mr-75">
                                        <div class="avatar bg-light-danger rounded">
                                            <div class="avatar-content">
                                                <i data-feather="command" class="avatar-icon font-medium-1"></i>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="javascript:void(0);">
                                        <div class="blog-category-title text-body">Gaming</div>
                                    </a>
                                </div>
                                <div class="d-flex justify-content-start align-items-center mb-75">
                                    <a href="javascript:void(0);" class="mr-75">
                                        <div class="avatar bg-light-info rounded">
                                            <div class="avatar-content">
                                                <i data-feather="hash" class="avatar-icon font-medium-1"></i>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="javascript:void(0);">
                                        <div class="blog-category-title text-body">Quote</div>
                                    </a>
                                </div>
                                <div class="d-flex justify-content-start align-items-center">
                                    <a href="javascript:void(0);" class="mr-75">
                                        <div class="avatar bg-light-warning rounded">
                                            <div class="avatar-content">
                                                <i data-feather="video" class="avatar-icon font-medium-1"></i>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="javascript:void(0);">
                                        <div class="blog-category-title text-body">Video</div>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!--/ Categories -->
                    </div>

                </div>
            </div>
        </div>
      </div>
    <!-- END: Content-->
<!-- BEGIN: Customizer-->
    <!-- End: Customizer-->
    
    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

    <!-- BEGIN: Footer-->
    <footer class="footer footer-static footer-light">
    </footer>
    <button class="btn btn-primary btn-icon scroll-top" type="button"><i data-feather="arrow-up"></i></button>
    <!-- END: Footer-->

    <!-- BEGIN: Vendor JS-->
    <script src="/resources/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="/resources/vendors/js/ui/jquery.sticky.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="/resources/js/core/app-menu.js"></script>
    <script src="/resources/js/core/app.js"></script>
    <script src="/resources/js/scripts/customizer.min.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
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
</script>
</body>
<!-- END: Body-->

</html>