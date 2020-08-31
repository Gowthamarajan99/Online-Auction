<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.onlineauction.ConnectionCreate" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Bid Time - Contact</title>
	<link rel="icon" href="normalimg/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="normalvendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="normalvendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="normalvendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="normalvendors/linericon/style.css">
  <link rel="stylesheet" href="normalvendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="normalvendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="normalcss/style.css">
  <script src="js/sweetalert/sweetalert/sweetalert.min.js" type="text/javascript"></script>
    <script>
        function success() 
        {
            swal('Success','Your Query Has been Submitted Successfully','success');
        }
    </script>
</head>
<body>
    <%
    Connection con = null;
    try
    {
        con = ConnectionCreate.initDatabase();
        String name = request.getParameter("txtname");
        String email = request.getParameter("txtemail");
        String sub = request.getParameter("txtsub");
        String des = request.getParameter("txtdes");
        if((!name.equals("")) && (!email.equals("")) && (!sub.equals("")) && (!des.equals("")))
        {
            PreparedStatement st = con.prepareStatement("insert into contact(name,email_address,subject,description,ad_response) values('" + name + "','" + email + "','" + sub + "','" + des + "','No')");
            st.executeUpdate();
            name = email = sub = des = "";
            st.close(); %>
            <script>success();</script>
            <%
        }
    }catch(Exception e) { } finally { con.close(); }
%>
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
        	  <li class="nav-item"><a class="nav-link" href="aboutus.jsp">About Us</a></li>
      		  <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
              <li class="nav-item active"><a class="nav-link" href="contact.jsp">Contact</a></li>
            </ul>
              <ul class="nav-shop"><li class="nav-item"><a class="button button-header" href="logout.jsp">
                <%= session.getAttribute("user")==null?"Welcome":"Logout" %></a></li></ul>
          </div>
        </div>
      </nav>
    </div>
  </header>
	<!--================ End Header Menu Area =================-->

	<!-- ================ contact section start ================= -->
  <section class="section-margin--small" style="margin-top: 30px;">
    <div class="container">
      <div class="d-none d-sm-block mb-5 pb-4">
        <div>
            <iframe width=1110px height=450px src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3920.0773384512495!2d79.01622241431673!3d10.728518363010974!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3baabe2803211597%3A0x6371e96c202331c!2sSASTRA%20Deemed%20to%20be%20University!5e0!3m2!1sen!2sin!4v1585747113845!5m2!1sen!2sin"  frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
        </div>   
      </div>

      <div class="row">
        <div class="col-md-4 col-lg-3 mb-4 mb-md-0">
          <div class="media contact-info">
            <span class="contact-info__icon"><i class="ti-home"></i></span>
            <div class="media-body">
              <h3>BidTime Developers</h3>
              <p>SASTRA University</p>
            </div>
          </div>
          <div class="media contact-info">
            <span class="contact-info__icon"><i class="ti-headphone"></i></span>
            <div class="media-body">
              <h3><a href="#">+91 9773242644</a></h3>
              <p>All Days 24 x 7</p>
            </div>
          </div>
          <div class="media contact-info">
            <span class="contact-info__icon"><i class="ti-email"></i></span>
            <div class="media-body">
              <h3><a href="#">24x7bidtime@gmail.com</a></h3>
              <p>Send us your query anytime!</p>
            </div>
          </div>
        </div>
        <div class="col-md-8 col-lg-9">
          <form class="form-contact contact_form" action="#" method="post">
            <div class="row">
              <div class="col-lg-5">
                <div class="form-group">
                    <input class="form-control" name="txtname" type="text" placeholder="Enter your name" required>
                </div>
                <div class="form-group">
                  <input class="form-control" name="txtemail" type="email" placeholder="Enter email address" required>
                </div>
                <div class="form-group">
                  <input class="form-control" name="txtsub" type="text" placeholder="Enter Subject" required>
                </div>
              </div>
              <div class="col-lg-7">
                <div class="form-group">
                    <textarea class="form-control different-control w-100" name="txtdes" cols="30" rows="5" placeholder="Enter Message" required></textarea>
                </div>
              </div>
            </div>
            <div class="form-group text-center text-md-right mt-3">
              <input type="submit" class="button button--active button-contactForm" name="btnsend" value="Send Message" />
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>

  <!--================ Start footer Area  =================-->	
	<footer>
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
  <script src="normalvendors/jquery.form.js"></script>
  <script src="normalvendors/jquery.validate.min.js"></script>
  <script src="normalvendors/contact.js"></script>
  <script src="normalvendors/jquery.ajaxchimp.min.js"></script>
  <script src="normalvendors/mail-script.js"></script>
  <script src="normaljs/main.js"></script>
</body>
</html>