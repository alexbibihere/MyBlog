<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
    String contextPath = request.getContextPath();
    request.setAttribute("contextPath",contextPath);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Single Post</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">

    <!-- Bootstrap styles -->
    <link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css">

    <!-- Font-Awesome -->
    <link rel="stylesheet" href="${contextPath}/css/font-awesome.min.css">

    <!-- Google Webfonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600|PT+Serif:400,400italic' rel='stylesheet' type='text/css'>

    <!-- Styles -->
   <link rel="stylesheet" href="${contextPath}/css/style1.css" id="theme-styles">

    <!--[if lt IE 9]>      
        <script src="${contextPath}/js/vendor/google/html5-3.6-respond-1.1.0.min.js"></script>
    <![endif]-->

    
</head>
<body>
    <header>
        <div class="widewrapper masthead">
            <div class="container">
                <a href="${contextPath}/index.html" id="logo">
                    <img src="${contextPath}/images/logo1.png" alt="clean Blog">
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
                    <a href="${contextPath}/#">Blog</a>
                    <span class="separator">&#x2F;</span>
                    <a href="${contextPath}/#">Bootstrap</a>
                    <span class="separator">&#x2F;</span>
                    <a href="${contextPath}/#">HTML Template</a>
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
                <div class="col-md-8 blog-main">
                    <article class="blog-post">
                        <header>
                           
                            <div class="lead-image">
                                <img src="${contextPath}/images/single-post.jpg" alt="" class="img-responsive">
                                
                            </div>
                        </header>
                        <div class="body">
                            <h1>Responsive HTML5 Template</h1>
                            <div class="meta">
                                <i class="fa fa-user"></i> John Doe <i class="fa fa-calendar"></i>23 Agustus 2015<i class="fa fa-comments"></i><span class="data"><a href="${contextPath}/#comments">3 Comments</a></span>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Autem quas voluptatem et minima quo amet ducimus. Voluptatum soluta tenetur ducimus fugiat, sint voluptate eveniet adipisci nulla asperiores distinctio laudantium eos. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident tenetur, consectetur dolores nostrum, numquam facere a dicta eum nam suscipit consequuntur dolorem aspernatur molestias vero quo id tempore vel possimus.</p>

                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Autem quas voluptatem et minima quo amet ducimus. Voluptatum soluta tenetur ducimus fugiat, sint voluptate eveniet adipisci nulla asperiores distinctio laudantium eos. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident tenetur, consectetur dolores nostrum, numquam facere a dicta eum nam suscipit consequuntur dolorem aspernatur molestias vero quo id tempore vel possimus.</p>


                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Autem quas voluptatem et minima quo amet ducimus. Voluptatum soluta tenetur ducimus fugiat, sint voluptate eveniet adipisci nulla asperiores distinctio laudantium eos. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident tenetur, consectetur dolores nostrum, numquam facere a dicta eum nam suscipit consequuntur dolorem aspernatur molestias vero quo id tempore vel possimus.</p>

                             <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Autem quas voluptatem et minima quo amet ducimus. Voluptatum soluta tenetur ducimus fugiat, sint voluptate eveniet adipisci nulla asperiores.</p>

                        </div>
                    </article>

                    <aside class="social-icons clearfix">
                        <h3>Share on </h3> 
                        <a href="${contextPath}/#"><i class="fa fa-facebook"></i></a> <a href="${contextPath}/#"><i class="fa fa-twitter"></i></a> <a href="${contextPath}/#"><i class="fa fa-google"></i></a>
                    </aside>

                    <aside class="comments" id="comments">
                        <hr>

                        <h2><i class="fa fa-comments"></i> 6 Comments</h2>

                        <article class="comment">
                            <header class="clearfix">
                                <img src="${contextPath}/images/avatar.png" alt="A Smart Guy" class="avatar">
                                <div class="meta">
                                    <h3><a href="${contextPath}/#">John Doe</a></h3>
                                    <span class="date">
                                        24 August 2015
                                    </span>
                                    <span class="separator">
                                        -
                                    </span>
                                    
                                    <a href="${contextPath}/#create-comment" class="reply-link">Reply</a>                
                                </div>
                            </header>
                             <div class="body">
                               Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facere sit perspiciatis debitis, vel ducimus praesentium expedita, assumenda ipsum cum corrupti dolorum modi. Rem ipsam similique sapiente obcaecati tenetur beatae voluptatibus.
                            </div>
                        </article>

                        <article class="comment reply">
                            <header class="clearfix">
                                <img src="${contextPath}/images/avatar.png" alt="A Smart Guy" class="avatar">
                                <div class="meta">
                                    <h3><a href="${contextPath}/#">John Doe</a></h3>
                                    <span class="date">
                                        24 August 2015
                                    </span>
                                    <span class="separator">
                                        -
                                    </span>
                                    
                                    <a href="${contextPath}/#create-comment" class="reply-link">Reply</a>                
                                </div>
                            </header>
                             <div class="body">
                               Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facere sit perspiciatis debitis, vel ducimus praesentium expedita, assumenda ipsum cum corrupti dolorum modi. Rem ipsam similique sapiente obcaecati tenetur beatae voluptatibus.
                            </div>
                        </article>

                        <article class="comment ">
                            <header class="clearfix">
                                <img src="${contextPath}/images/avatar.png" alt="A Smart Guy" class="avatar">
                                <div class="meta">
                                    <h3><a href="${contextPath}/#">John Doe</a></h3>
                                    <span class="date">
                                        24 August 2015
                                    </span>
                                    <span class="separator">
                                        -
                                    </span>
                                    
                                    <a href="${contextPath}/#create-comment" class="reply-link">Reply</a>                
                                </div>
                            </header>
                             <div class="body">
                               Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facere sit perspiciatis debitis, vel ducimus praesentium expedita, assumenda ipsum cum corrupti dolorum modi. Rem ipsam similique sapiente obcaecati tenetur beatae voluptatibus.
                            </div>
                        </article>

                        <article class="comment">
                            <header class="clearfix">
                                <img src="${contextPath}/images/avatar.png" alt="A Smart Guy" class="avatar">
                                <div class="meta">
                                    <h3><a href="${contextPath}/#">John Doe</a></h3>
                                    <span class="date">
                                        24 August 2015
                                    </span>
                                    <span class="separator">
                                        -
                                    </span>
                                    
                                    <a href="${contextPath}/#create-comment" class="reply-link">Reply</a>                
                                </div>
                            </header>
                             <div class="body">
                               Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facere sit perspiciatis debitis, vel ducimus praesentium expedita, assumenda ipsum cum corrupti dolorum modi. Rem ipsam similique sapiente obcaecati tenetur beatae voluptatibus.
                            </div>
                        </article>        
                    </aside>

                    <aside class="create-comment" id="create-comment">
                        <hr>    

                        <h2><i class="fa fa-pencil"></i> Add Comment</h2>

                        <form action="#" method="get" accept-charset="utf-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" name="name" id="comment-name" placeholder="Your Name" class="form-control input-lg">    
                                </div>
                                <div class="col-md-6">
                                    <input type="email" name="email" id="comment-email" placeholder="Email" class="form-control input-lg">    
                                </div>
                            </div>

                            <input type="url" name="name" id="comment-url" placeholder="Website" class="form-control input-lg">

                            <textarea rows="10" name="message" id="comment-body" placeholder="Your Message" class="form-control input-lg"></textarea>

                            <div class="buttons clearfix">
                                <button type="submit" class="btn btn-xlarge btn-clean-one">Submit</button>
                            </div>
                        </form>
                    </aside>
                </div>
                <aside class="col-md-4 blog-aside">
                    
                    <div class="aside-widget">
                        <header>
                            <h3>Featured Post</h3>
                        </header>
                        <div class="body">
                            <ul class="clean-list">
                                <li><a href="${contextPath}/">Clean - Responsive HTML5 Template</a></li>
                                <li><a href="${contextPath}/">Responsive Pricing Table</a></li>
                                <li><a href="${contextPath}/">Yellow HTML5 Template</a></li>
                                <li><a href="${contextPath}/">Blackor Responsive Theme</a></li>
                                <li><a href="${contextPath}/">Portfolio Bootstrap Template</a></li>
                                <li><a href="${contextPath}/">Clean Slider Template</a></li>
                            </ul>
                        </div>
                    </div>
                
                    <div class="aside-widget">
                        <header>
                            <h3>Related Post</h3>
                        </header>
                        <div class="body">
                            <ul class="clean-list">
                                <li><a href="${contextPath}/">Blackor Responsive Theme</a></li>
                                <li><a href="${contextPath}/">Portfolio Bootstrap Template</a></li>
                                <li><a href="${contextPath}/">Clean Slider Template</a></li>
                                <li><a href="${contextPath}/">Clean - Responsive HTML5 Template</a></li>
                                <li><a href="${contextPath}/">Responsive Pricing Table</a></li>
                                <li><a href="${contextPath}/">Yellow HTML5 Template</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="aside-widget">
                        <header>
                            <h3>Tags</h3>
                        </header>
                        <div class="body clearfix">
                            <ul class="tags">
                                <li><a href="${contextPath}/#">HTML5</a></li>
                                <li><a href="${contextPath}/#">CSS3</a></li>
                                <li><a href="${contextPath}/#">COMPONENTS</a></li>
                                <li><a href="${contextPath}/#">TEMPLATE</a></li>
                                <li><a href="${contextPath}/#">PLUGIN</a></li>
                                <li><a href="${contextPath}/#">BOOTSTRAP</a></li>
                                <li><a href="${contextPath}/#">TUTORIAL</a></li>
                                <li><a href="${contextPath}/#">UI/UX</a></li>                            
                            </ul>
                        </div>
                    </div>
                </aside>
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

    <script src="${contextPath}/http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="${contextPath}/js/bootstrap.min.js"></script>
    <script src="${contextPath}/js/modernizr.js"></script>

</body>
</html>