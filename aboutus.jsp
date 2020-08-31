<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Bid Time - About Us</title>
  <link rel="icon" href="normalimg/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="normalvendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="normalvendors/fontawesome/css/all.min.css">
  <link rel="stylesheet" href="normalvendors/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="normalvendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="normalvendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="normalvendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="normalcss/style.css">
</head>
<body>
  <!--================ Start Header Menu Area =================-->
	<header class="header_area">
    <div class="main_menu">
       <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
          <a class="navbar-brand logo_h" href="index.jsp"><img src="normalimg/logo.png" alt=""></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
               <ul class="nav navbar-nav menu_nav ml-auto mr-auto">
              <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="sell.jsp">Sell</a></li>	
        	  <li class="nav-item active"><a class="nav-link" href="aboutus.jsp">About Us</a></li>
      		  <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
              <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
               </ul>
              <ul class="nav-shop"><li class="nav-item"><a class="button button-header" href="logout.jsp">
                <%= session.getAttribute("user")==null?"Welcome":"Logout" %></a></li></ul>
          </div>
        </div>
      </nav>
    </div>
  </header>
<!--================ End Header Menu Area =================-->

  <!--================Blog Categorie Area =================-->
  <section class="blog_categorie_area" style="padding-top:30px;padding-bottom:0px">
    <div class="container">
      <div class="row">
        <div class="col-sm-6 col-lg-4 mb-4 mb-lg-0">
            <div class="categories_post">
                <img class="card-img rounded-0" src="normalimg/blog/cat-post/cat-post3.jpg" alt="post">
                <div class="categories_details">
                    <div class="categories_text">
                        <a href="#">
                            <h5>Buy</h5>
                        </a>
                        <div class="border_line"></div>
                        <p>Buy our Product</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-lg-4 mb-4 mb-lg-0">
          <div class="categories_post">
            <img class="card-img rounded-0" src="normalimg/blog/cat-post/cat-post2.jpg" alt="post">
            <div class="categories_details">
              <div class="categories_text">
                <a href="#">
                    <h5>Bid</h5>
                </a>
                <div class="border_line"></div>
                <p>Bid for our Product</p>
              </div>
            </div>
          </div>
        </div>
        <div class="col-sm-6 col-lg-4 mb-4 mb-lg-0">
            <div class="categories_post">
                <img class="card-img rounded-0" src="normalimg/blog/cat-post/cat-post1.jpg" alt="post">
                <div class="categories_details">
                    <div class="categories_text">
                        <a href="#">
                            <h5>Sell</h5>
                        </a>
                        <div class="border_line"></div>
                        <p>Sell your Product</p>
                    </div>
                </div>
            </div>
        </div>
      </div>
    </div>
  </section>
  <!--================Blog Categorie Area =================-->
<!--=================How It Works =========================-->
<section class="blog_area single-post-area py-80px section-margin--small" style="margin-bottom: 0px;">
<div class="row">
    <div class="col-lg-1"></div>
    <div class="col-lg-9">
        <div class="quotes">
            <h2>How Auction Works</h2>
            <ol type="I" style="font-size:20px;margin-top: 40px;">
                <li style="margin-top: 20px;">Auction starts with Rs.0/- , Each new bid raises the item price by some smaller amount.</li>
                <li style="margin-top: 20px;">The auction clock restarts from 10 or 15 seconds every time someone bids.</li>
                <li style="margin-top: 20px;">If no new bids are placed before the clock runs out, the last bidder wins.</li>
                <li style="margin-top: 20px;">Before you can take part in an auction you need to be a registered user.</li>
                <li style="margin-top: 20px;">The Winner of the product in an Auction will be displayed in the website on the next day.</li>
            </ol>
        </div>
    </div>
</div>
</section>
<!--=================End How It Works =========================-->

  <!--================Blog Area =================-->
  <section class="blog_area">
      <div class="container">
          <div class="row">
              <div class="col-lg-5">
                  <div class="blog_right_sidebar" style="margin-top:50px;margin-bottom:50px">
                      <aside class="single_sidebar_widget author_widget">
                          <img class="author_img rounded-circle" src="normalimg/blog/author.png" alt="">
                          <h4>Sagar Arundhadiyar</h4>
                          <p>BidTime Developer</p>
                          <div class="social_icon">
                              <a href="#">
                                  <i class="fab fa-facebook-f"></i>
                              </a>
                              <a href="#">
                                  <i class="fab fa-twitter"></i>
                              </a>
                              <a href="#">
                                  <i class="fab fa-github"></i>
                              </a>
                          </div>
                          <p>This website allows you to sell and buy products from anywhere in the world.
                              Hope you have no problems accessing our site.If you have any queries kindly
                              contact us through <a href="contact.jsp">24x7bidtime@gmail.com</a>
                          </p>
                          <div class="br"></div>
                      </aside>
                  </div>
              </div>
			  <div class="col-lg-2"></div>
			  <div class="col-lg-5">
                  <div class="blog_right_sidebar" style="margin-top:50px;margin-bottom:50px">
                      <aside class="single_sidebar_widget author_widget">
                          <img class="author_img rounded-circle" src="normalimg/blog/author1.png" alt="">
                          <h4>Gowthamarajan N</h4>
                          <p>BidTime Developer</p>
                          <div class="social_icon">
                              <a href="#">
                                  <i class="fab fa-facebook-f"></i>
                              </a>
                              <a href="#">
                                  <i class="fab fa-twitter"></i>
                              </a>
                              <a href="#">
                                  <i class="fab fa-github"></i>
                              </a>
                          </div>
                          <p>This is the wonderful website for find your needs. Give us your products we'll 
                              take care of the rest. We provide all features as what you want. If your 
                              good at bid then come and get.
                          </p>
                          <div class="br"></div>
                      </aside>
                  </div>
              </div>
          </div>
      </div>
  </section>
  <!--================Blog Area =================-->

  <!--================Instagram Area =================-->
  <section class="instagram_area">
    <div class="container box_1620">
      <div class="insta_btn">
        <a class="btn theme_btn" href="#">Our Categories</a>
      </div>
      <div class="instagram_image row m0">
        <a href="#"><img src="normalimg/instagram/ins-1.jpg" alt=""></a>
        <a href="#"><img src="normalimg/instagram/ins-2.jpg" alt=""></a>
        <a href="#"><img src="normalimg/instagram/ins-3.jpg" alt=""></a>
        <a href="#"><img src="normalimg/instagram/ins-4.jpg" alt=""></a>
        <a href="#"><img src="normalimg/instagram/ins-5.jpg" alt=""></a>
        <a href="#"><img src="normalimg/instagram/ins-6.jpg" alt=""></a>
      </div>
    </div>
  </section>
  <!--================End Instagram Area =================-->
  

  <!--================ Start footer Area  =================-->	
	<footer>
		<div class="footer-area footer-only">
			<div class="container">
				<div class="row section_gap">
				</div>
			</div>
		</div>

		<div class="footer-bottom">
			<div class="container">
				<div class="row d-flex">
					<p class="col-lg-12 footer-text text-center">
Copyright &copy; <a href="index.jsp">BidTime</a> &nbsp;<script>document.write(new Date().getFullYear());</script> All rights reserved | Made by &nbsp;<i class="fa fa-heart" aria-hidden="true"></i>&nbsp; Bidtime Developers</p>
				</div>
			</div>
		</div>
	</footer>
	<!--================ End footer Area  =================-->



  <script src="normalvendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="normalvendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="normalvendors/skrollr.min.js"></script>
  <script src="normalvendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="normalvendors/nice-select/jquery.nice-select.min.js"></script>
  <script src="normalvendors/jquery.ajaxchimp.min.js"></script>
  <script src="normalvendors/mail-script.js"></script>
  <script src="normaljs/main.js"></script>
</body>
</html>