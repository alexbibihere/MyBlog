<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
  String contextPath = request.getContextPath();
  request.setAttribute("contextPath",contextPath);
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Contact Me</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width">

  <!-- Bootstrap styles -->
  <link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css">


  <!-- Font-Awesome -->
  <link rel="stylesheet" href="${contextPath}/css/font-awesome/css/font-awesome.min.css">

  <!-- Google Webfonts -->
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600|PT+Serif:400,400italic' rel='stylesheet' type='text/css'>

  <!-- Styles -->
  <link rel="stylesheet" href="${contextPath}/css/style.css" id="theme-styles">

  <!--[if lt IE 9]>
  <script src="${contextPath}/${contextPath}/js/vendor/google/html5-3.6-respond-1.1.0.min.js"></script>
  <![endif]-->

</head>
<body>
<header>
  <div class="widewrapper masthead">
    <div class="container">
      <a href="${contextPath}/index.html" id="logo">
        <img src="${contextPath}/images/logo.png" alt="clean Blog">
      </a>

      <div id="mobile-nav-toggle" class="pull-right">
        <a href="${contextPath}/#" data-toggle="collapse" data-target=".clean-nav .navbar-collapse">
          <i class="fa fa-bars"></i>
        </a>
      </div>

      <nav class="pull-right clean-nav">
        <div class="collapse navbar-collapse">
          <ul class="nav nav-pills navbar-nav">

            <li>
              <a href="${contextPath}/index.html">Home</a>
            </li>
            <li>
              <a href="${contextPath}/about.html">About</a>
            </li>
            <li>
              <a href="${contextPath}/contact.html">Contact</a>
            </li>
          </ul>
        </div>
      </nav>

    </div>
  </div>

  <div class="widewrapper subheader">
    <div class="container">
      <div class="clean-breadcrumb">
        <a href="${contextPath}/#">Contact Me</a>
      </div>
      <div class="clean-searchbox">
        <form action="#" method="get" accept-charset="utf-8">

          <input class="searchfield" id="searchbox" type="text" placeholder="Search">
          <button class="searchbutton" type="submit">
            <i class="fa fa-search"></i>
          </button>
        </form>
      </div>
    </div>
  </div>
</header>

<div class="widewrapper main">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3 clean-superblock" id="contact">
        <h2>Contact</h2>

        <form action="#" method="get" accept-charset="utf-8" class="contact-form">
          <input type="text" name="name" id="contact-name" placeholder="Name" class="form-control input-lg">
          <input type="email" name="email" id="contact-email" placeholder="Email" class="form-control input-lg">
          <textarea rows="10" name="message" id="contact-body" placeholder="Your Message" class="form-control input-lg"></textarea>
          <div class="buttons clearfix">
            <button type="submit" class="btn btn-xlarge btn-clean-one">Submit</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<footer>
  <div class="widewrapper footer">
    <div class="container">
      <div class="row">
        <div class="col-md-4 footer-widget">
          <h3> <i class="fa fa-user"></i>About</h3>

          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi laboriosam nostrum consequatur fugiat at, labore praesentium modi, quasi dolorum debitis reiciendis facilis, dolor saepe sint nemo, earum molestias quas.</p>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorum, error aspernatur assumenda quae eveniet.</p>
        </div>

        <div class="col-md-4 footer-widget">
          <h3> <i class="fa fa-pencil"></i> Recent Post</h3>
          <ul class="clean-list">
            <li><a href="${contextPath}/">Clean - Responsive HTML5 Template</a></li>
            <li><a href="${contextPath}/">Responsive Pricing Table</a></li>
            <li><a href="${contextPath}/">Yellow HTML5 Template</a></li>
            <li><a href="${contextPath}/">Blackor Responsive Theme</a></li>
            <li><a href="${contextPath}/">Portfolio Bootstrap Template</a></li>
            <li><a href="${contextPath}/">Clean Slider Template</a></li>
          </ul>
        </div>

        <div class="col-md-4 footer-widget">
          <h3> <i class="fa fa-envelope"></i>Contact Me</h3>

          <p>Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet.</p>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil fugiat, cupiditate veritatis excepturi tempore explicabo.</p>
          <div class="footer-widget-icon">
            <i class="fa fa-facebook"></i><i class="fa fa-twitter"></i><i class="fa fa-google"></i>
          </div>
        </div>

      </div>
    </div>
  </div>
  <div class="widewrapper copyright">
    Copyright 2015
  </div>
</footer>

<script src="${contextPath}/js/jquery.min.js"></script>
<script src="${contextPath}/js/bootstrap.min.js"></script>
<script src="${contextPath}/js/modernizr.js"></script>

</body>
</html>