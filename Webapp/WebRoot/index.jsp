<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page session="false"%>
<%@ page errorPage="ShowError.jsp" %>
<html>
  <head>
    <!-- Basic Page Needs
    ================================================== -->
  
    <!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home Security</title>
    <meta name="description" content="Spirit8 is a Digital agency one page template built based on bootstrap framework. This template is design by Robert Berki and coded by Jenn Pereira. It is simple, mobile responsive, perfect for portfolio and agency websites. Get this for free exclusively at ThemeForces.com">
    <meta name="keywords" content="bootstrap theme, portfolio template, digital agency, onepage, mobile responsive, spirit8, free website, free theme, themeforces themes, themeforces wordpress themes, themeforces bootstrap theme">
    <meta name="author" content="ThemeForces.com">
    
    <!-- Favicons
    ================================================== -->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="img/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">

    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css"  href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome/css/font-awesome.css">

    <!-- Slider
    ================================================== -->
    <link href="css/owl.carousel.css" rel="stylesheet" media="screen">
    <link href="css/owl.theme.css" rel="stylesheet" media="screen">

    <!-- Stylesheet
    ================================================== -->
    <link rel="stylesheet" type="text/css"  href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/responsive.css">

    <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,700,300,600,800,400' rel='stylesheet' type='text/css'>

    <script type="text/javascript" src="js/modernizr.custom.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="respond.min.js"></script>
    <![endif]-->
     <style>
     
  .affix {
      top: 0;
      width: 100%;
      -webkit-transition: all .5s ease-in-out;
      transition: all .5s ease-in-out;
      background-color: #000000;
   
       
      
    

  }
  
}
  .affix a {
      color: #C0C0C0!important;
      padding: 15px !important;
      -webkit-transition: all .5s ease-in-out;
      transition: all .5s ease-in-out;
  }
  .affix-top a {
      padding: 20px !important;
  }
  .affix + .container-fluid {
      padding-top: 95px;
  }
  </style>
  </head>
  <body>
    <!-- Navigation
    ==========================================-->
    <nav class="navbar navbar-default navbar-fixed-top" data-spy="affix" data-offset-top="657">
      <div class="container" id="navbg" >
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.html"><img alt="logo1" src="img/LOGO1.png" style="margin-left:-4px"> </a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">
           
            <li><a href="#tf-about" class="page-scroll">About</a></li>
            <li><a href="#tf-clients" class="page-scroll">Technologies</a></li>  
           
           <%HttpSession kk=request.getSession(false); %>
            <li><a href="#tf-works" class="page-scroll">Services</a></li>
            <li><a href="#tf-testimonials" class="page-scroll">Free Trial</a></li> 
 <li><a href="#tf-services" class="page-scroll">Download</a></li>           
 <li><a href="#tf-team" class="page-scroll">Team</a></li>
            <li><a href="#tf-contact" class="page-scroll">Contact</a></li>
  <li><a href="login.jsp?id=abc" class="page-scroll"><%
if(kk!=null){%><%= kk.getAttribute("user")%><%}else{ %>Login<%} %></a></li>
         
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>

    <!-- Home Page
    ==========================================-->
    <div id="tf-home" class="text-center">
        <div class="overlay">
            <div class="content">
                <h1>Welcome on <strong><span class="color">Home Security</span></strong></h1>
                <p class="lead">Where ever you are away from home we make sure you enjoy more <strong>Home Security</strong> let you care free about your home <br> Join us today itself and explore the posiblities
                <br><a href="#tf-about" class="fa fa-angle-down page-scroll"></a></p>
            </div>
        </div>
    </div>

    <!-- About Us Page
    ==========================================-->
    <div id="tf-about">
        <div class="container">
            <div class="row">
                <div class="col-md-6" style="left: 0px; top: 1px">
                    <img src="img/02.png" class="img-responsive">
                </div>
                <div class="col-md-6">
                    <div class="about-text">
                        <div class="section-title">
                            <h4>About us</h4>
                            <h2>Some words <strong>about us</strong></h2>
                            <hr>
                            <div class="clearfix"></div>
                        </div>
                        
                        
                        <img alt="about" src="img/about.png" >
                      <!----  <p class="intro">We love building and rebuilding brands through our  specific skills. Using colour, fonts, and illustration, we brand companies in a way they will never forget.</p>
                        <ul class="about-list">
                            <li>
                                <span class="fa fa-dot-circle-o"></span>
                                <strong>Mission</strong> - <em>We deliver uniqueness and quality</em>
                            </li>
                            <li>
                                <span class="fa fa-dot-circle-o"></span>
                                <strong>Skills</strong> - <em>Delivering fast and excellent results</em>
                            </li>
                            <li>
                                <span class="fa fa-dot-circle-o"></span>
                                <strong>Clients</strong> - <em>Satisfied clients thanks to our experience</em>
                            </li>
                        </ul>--->
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- Technology Section
    ==========================================-->
    <div id="tf-clients" class="text-center">
        <div class="overlay">
            <div class="container">

                <div class="section-title center">
                    <h2>Various used  <strong>Technologies</strong></h2>
                    <div class="line">
                        <hr>
                    </div>
                </div>
                <div id="clients" class="owl-carousel owl-theme">
                    <div class="item">
                        <img src="img/client/01.png" height="80px" width="200px">
                    </div>
                    <div class="item">
                        <img src="img/client/02.png" height="80px" >
                       <br> <br>OPEN CV
                         
                    </div>
                    <div class="item">
                        <img src="img/client/03.png"  height="80px">
                         <br> <br>Android

                    </div>
                    <div class="item">
                        <img src="img/client/04.png" height="100px">
                         <br> <br>
                    </div>
                   
                    <div class="item">
                        <img src="img/client/05.png" height="100px">
                         <br> <br>
                    </div>


                </div>

            </div>
        </div>
    </div>
   
  
    <!-- Service  Section
    ==========================================-->
    <div id="tf-works">
        <div class="container"> <!-- Container -->
            <div class="section-title text-center center">
                <h2>Take a look at <strong>our services</strong></h2>
                <div class="line">
                    <hr>
                </div>
                <div class="clearfix"></div>
                
            </div>
            <div class="space"></div>

           

            <div id="lightbox" class="row">

                <div class="col-sm-6 col-md-3 col-lg-3 branding">
                    <div class="portfolio-item">
                        <div class="hover-bg">
                            <a href="#mobility" data-toggle="modal">
                                <div class="hover-text">
                                    <h4>Mobility</h4>
                                    <small>web access</small>
                                    <div class="clearfix"></div>
                                    <i class="fa fa-plus"></i>
                                </div>
                                <img src="img/portfolio/01.png" class="img-responsive" alt="...">
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-3 col-lg-3 photography app">
                    <div class="portfolio-item">
                        <div class="hover-bg">
                            <a href="#cloud" data-toggle="modal">
                                <div class="hover-text">
                                    <h4>Cloud Operation</h4>
                                    <small>IBM Bluemix</small>
                                    <div class="clearfix"></div>
                                    <i class="fa fa-plus"></i>
                                </div>
                                <img src="img/portfolio/02.gif" class="img-responsive" alt="...">
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-3 col-lg-3 branding">
                    <div class="portfolio-item">
                        <div class="hover-bg">
                            <a href="#motiondetection" data-toggle="modal">
                                <div class="hover-text">
                                    <h4>Motion Detection</h4>
                                    <small>effective storage</small>
                                    <div class="clearfix"></div>
                                    <i class="fa fa-plus"></i>
                                </div>
                                <img src="img/portfolio/03.jpg" class="img-responsive" alt="...">
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-3 col-lg-3 branding">
                    <div class="portfolio-item">
                        <div class="hover-bg">
                            <a href="#alarmtriggering" data-toggle="modal">
                                <div class="hover-text">
                                    <h4>Alaram triggring</h4>
                                    <small>Automatic notification</small>
                                    <div class="clearfix"></div>
                                    <i class="fa fa-plus"></i>
                                </div>
                                <img src="img/portfolio/04.jpg" class="img-responsive" alt="...">
                            </a>
                        </div>
                    </div>
                </div>

                
                
                

            </div>
        </div>
    </div>

     <!-- purchase Section
    ==========================================-->
    <div id="tf-testimonials" class="text-center">
        <div class="overlay">
            <div class="container">
                <div class="section-title center">
                    <h2>Explore the new posiblities</h2>
                    <div class="line">
                        <hr>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <div id="testimonial" class="owl-carousel owl-theme">
                            <div class="item">
                                <h5></h5>
                                <p></p>
                                 <i class="fa  fa-unlock-alt fa-3x"></i>
                            </div>

                           
                        </div>
                        
                       <a href="purchase.jsp" type="button" class="btn btn-info">Sign up</a> for Free trial
 
                    </div>
                </div>
            </div>
        </div>
    </div>

     <!-- Download Section
    ==========================================-->
    <div id="tf-services" class="text-center">
        <div class="container">
            <div class="section-title center">
                <h2>Various Download available are</h2>
                <div class="line">
                    <hr>
                </div>
                <div class="clearfix"></div>
                <small><em>Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</em></small>
            </div>
            <div class="space"></div>
            <div class="row">
                <div class="col-md-3 col-sm-6 service">
                    <i class="fa fa-desktop"></i>
                    <h4><strong>Destop App development Vrsion1.O</strong></h4>
                    <p>It is an Beta version , use to configure the camera and customised</p>
                   <a href="login.jsp?id=download" class="btn btn-primary" role="button">Download</a>   </div>

                <div class="col-md-3 col-sm-6 service">
                    <i class="fa fa-mobile"></i>
                    <h4><strong>Android Mobile App Version 1.O </strong></h4>
                    <p>It is the mobile app to provide the mobility and the flexiblity to the user</p>
                     <a href="login.jsp?id=download" class="btn btn-primary" role="button">Download</a>
                </div>

                <div class="col-md-3 col-sm-6 service">
                    <i class="fa  fa-cloud-download"></i>
                    <h4><strong>Software Needed to be install</strong></h4>
                    <p>We have Some software need to be downloaded</p>
                    <a href="login.jsp?id=download" class="btn btn-primary" role="button">Download</a>

                </div>

                <div class="col-md-3 col-sm-6 service">
                    <i class="fa  fa-cogs"></i>
                    <h4><strong>Check Application Requirement</strong></h4>
                    <p>various system requirement and standards of the application</p>
                  <button type="button" class="btn btn-primary " data-toggle="modal" data-target="#myModal">View</button>

                </div>
            </div>
        </div>
    </div>
 
 <!-- Team Page
    ==========================================-->
    <div id="tf-team" class="text-center">
        <div class="overlay">
            <div class="container">
                <div class="section-title center">
                    <h2>Meet <strong>our team</strong></h2>
                    <div class="line">
                        <hr>
                    </div>
                </div>

                <div id="team" class="owl-carousel owl-theme row">
                    <div class="item">
                        <div class="thumbnail">
                            <img src="img/team/01.jpg" alt="..." class="img-circle team-img">
                            <div class="caption">
                                <h3>Ajay Kumar</h3>
                                <p><a href="https://www.ajayyadav.xyz">www.ajayyadav.xyz</a></p>
                                <p>UPTU ROLL NO. -1206810016</p>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="thumbnail">
                            <img src="img/team/02.jpg" alt="..." class="img-circle team-img">
                            <div class="caption">
                                <h3>Gaurav Samant</h3>
                                <p><a href="https://www.gauravsamant.com">www.gauravsamant.com</a></p>
                                <p>UPTU ROLL NO. -1206810087.</p>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="thumbnail">
                            <img src="img/team/03.jpg" alt="..." class="img-circle team-img">
                            <div class="caption">
                                <h3>Kaushal Kumar</h3>
                                <p><a href="https://www.kaushal94.com">www.kaushal94.com</a></p>
                                <p>UPTU ROLL NO. -1206810102</p>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="thumbnail">
                            <img src="img/team/04.jpg" alt="..." class="img-circle team-img">
                            <div class="caption">
                                <h3>Shashank Bhardwaj</h3>
                                <p><a href="https://www.shashankbhardwaj.xyz">www.shashankbhardwaj.xyz</a></p>
                                <p>UPTU ROLL NO. -1206810200</p>
                            </div>
                        </div>
                    </div>

                  
                </div>
                
            </div>
        </div>
    </div>

    <!-- Contact Section
    ==========================================-->
    <div id="tf-contact" class="text-center">
        <div class="container">

            <div class="row">
                <div class="col-md-8 col-md-offset-2">

                    <div class="section-title center">
                        <h2>Feel free to <strong>contact us</strong></h2>
                        <div class="line">
                            <hr>
                        </div>
                        <div class="clearfix"></div>
                        <small><em>We are here to help you . We will like to listern new and thing related to us . please write to us . Be patient the concern person will get back to you on the topic . We are still a venture requires your supports and wishes .</em></small>            
                    </div>

                    <form action="contact.jsp">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" name="email" placeholder="Enter email">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Subject</label>
                                    <input type="text" class="form-control" id="exampleInputPassword1" name="subject" placeholder="Topic">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Message</label>
                            <textarea class="form-control" rows="3" name="mess"></textarea>
                        </div>
                        
                        <button type="submit" class="btn tf-btn btn-primary">Submit</button>
                    </form>

                </div>
            </div>

        </div>
    </div>
    <!-- -----------models -->
    <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-body">
          <div class="clearfix"></div>
                <em>
         <pre>
         			<h2>Specification</h2>
         <h3>CAMERA</h3>
      Quality        :  5MP and more 
      Optional       :  night vision ,thermal capture  
      feature  
      	 <h3>CONNECTIVITY</h3>
      Bandwidth      :  256Kbps or more
         <h3>SYSTEM REQUIREMENT</h3>
      Ram            :  1 GB or more
      Pocessor       :  2 GHz or more 
      operating      :  windows 7 or higher
      system
         <h3>SOFTWARE REQUIREMENT</h3>
      Java           :  JDK 7 or above
      Open CV        :  Version 3.0.0 or above 
      feature 
         </pre>
          </em>
          To see the project abstract . Click <a href="abstarct.pdf" download> here</a>
           </div>
          
        </div>
        
      </div>
      
    </div>
  </div>
  
    
    
    
   <div class="modal fade" id="alarmtriggering" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        
        <div class="modal-body">
          <div class="clearfix"></div>
                <em>
           <h3> 
          automatic alaram triggring happens at the response site with the aunthecation of owner .
             an alert is send to owner and owner can trigger the physical alaam</p>
             </h3>
          </em>
           </div>
          
        </div>
        
         
       
      </div>
      
    </div>
  </div>
  
      
   <div class="modal fade" id="motiondetection" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
          <div class="clearfix"></div>
                <em>
         <h3>  Motion is been detected at the site my the camera by use of open cv . minmum percentag change of pixel is require
          as to coop up with the change of day in the camera enviroment . 
          </h3>
          </em>
           </div>
          
        </div>
        
      </div>
      
    </div>
  </div>
  
  
   <div class="modal fade" id="cloud" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
          <div class="clearfix"></div>
                <em>
           
        <h3>  We have utilises the cloud platform of IBM Bluemix . It provide the mobility and scalablity in the over all product working cycle
         it is utilise as a common platform for the combine working of our core and web app.</h3>
          </em>
           </div>
          
        </div>
        
      </div>
      
    </div>
  </div>
   
    
     <div class="modal fade" id="mobility" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
      <h3>  The control of the app is such that you can control it from any wher in the world with the access of internet.</h3>
      </div>
      
    </div>
  </div>
  
  
   
    
    
    <!-- -------/ models -->
    
    
    

    <nav id="footer">
        <div class="container">
            <div class="pull-left fnav">
                <p>ALL RIGHTS RESERVED. COPYRIGHT © 2015. Project undertaking FINAL YEAR BTECH MIET,MEERUT</p>
            </div>
            <div class="pull-right fnav">
                <ul class="footer-social">
                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                    
                </ul>
            </div>
        </div>
    </nav>


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.1.11.1.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/SmoothScroll.js"></script>
    <script type="text/javascript" src="js/jquery.isotope.js"></script>

    <script src="js/owl.carousel.js"></script>

    <!-- Javascripts
    ================================================== -->
    <script type="text/javascript" src="js/main.js"></script>

  </body>
</html>