<%@page import="com.onlineauction.ConnectionCreate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.Date,java.text.*" %>
<% Connection con=null; %>
<% int counter=0; %>
<% String t=null; %>
<%
    if(request.getParameter("btnbid") != null)
    {
        String id=request.getParameter("btnprdid");
        session.setAttribute("pid",id);
        response.sendRedirect("productdetails.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Bid Time - Home</title>
	<link rel="icon" href="normalimg/Fevicon.png" type="image/png">
        <link rel="stylesheet" href="normalvendors/bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="normalvendors/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="normalvendors/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="normalvendors/nice-select/nice-select.css">
        <link rel="stylesheet" href="normalvendors/owl-carousel/owl.theme.default.min.css">
        <link rel="stylesheet" href="normalvendors/owl-carousel/owl.carousel.min.css">
        <link rel="stylesheet" href="normalcss/style.css">
        <script>
                var now = [];
                var abc = [];
                var x = [];
                var distance = [];
                var days = [];
                var hours = [];
                var minutes = [];
                var seconds = [];
        </script>
    </head>
    <body>
    <header class="header_area">
    <div class="main_menu">
       <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
          <a class="navbar-brand logo_h" href="index.jsp"><img src="normalimg/logo.png" alt=""></a>
          <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
               <ul class="nav navbar-nav menu_nav ml-auto mr-auto">
              <li class="nav-item active"><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="sell.jsp">Sell</a></li>	
        	  <li class="nav-item"><a class="nav-link" href="aboutus.jsp">About Us</a></li>
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

  <main class="site-main">
<!-- ================ Upcoming items  carousel ================= --> 
    <section class="section-margin calc-60px">
      <div class="container">
        <div class="section-intro pb-60px">
          <h2><span class="section-intro__style">Ongoing</span>&nbsp;Auctions</h2>
        </div>
        <div class="row">
            <% 
                    try {
                        con = ConnectionCreate.initDatabase();
                        Statement st = con.createStatement();
                        ResultSet rs=null;
                        Date dt = new Date();
                        SimpleDateFormat timeFormat;
                        timeFormat = new SimpleDateFormat("kk:mm");
                        t = timeFormat.format(dt);
                        
                        if(session.getAttribute("user") == null)
                        {
                            rs = st.executeQuery("Select prd_id,prd_name,category_name,min_bid,prd_img,bid_amt,bid_date,bid_time from vw_product where (adminconfirm='Sold' or adminconfirm='Yes') and IF(bid_date=cast(now() as date),(TIMEDIFF(bid_time,'" + t + "')>0),bid_date>cast(now() as date)) order by bid_date limit 6");
                        }
                        else
                        {
                            rs = st.executeQuery("Select prd_id,prd_name,category_name,min_bid,prd_img,bid_amt,bid_date,bid_time from vw_product where seller_name NOT IN('" + session.getAttribute("user") + "') and (adminconfirm='Sold' or adminconfirm='Yes') and IF(bid_date=cast(now() as date),(TIMEDIFF(bid_time,'" + t + "')>0),bid_date>=cast(now() as date)) order by bid_date limit 6");
                        }
                        while(rs.next())
                        {
            %>
          <div class="col-md-6 col-lg-4 col-xl-4">
            <div class="card text-center card-product">
              <div class="card-product__img">
                  <img style="width:263px;height:280px" class="card-img" src="product_images/<%= rs.getString(5) %>" alt="">
              </div>
              <div class="card-body">
                <p><%= rs.getString(3) %></p>
                <h4 class="card-product__title"><a href="#"><%= rs.getString(2) %></a></h4>
                <p class="card-product__price">Actual Price : <%= rs.getInt(4) %></p>
                <p class="card-product__price">Current Price : <%= session.getAttribute("user")==null?"?????":rs.getString(6) %></p>
                <p class="card-product__price">Remaining Time : </p><h4 id="demo<%= counter %>" class="card-product__title"></h4>

<script>
// Set the date we're counting down to
abc[<%= counter %>] = new Date("<%= rs.getString(7) %> <%= rs.getString(8) %>").getTime();

// Update the count down every 1 second
x[<%= counter %>] = setInterval(function() {
    // Get today's date and time
    now[<%= counter %>] = new Date().getTime();

    // Find the distance between now and the count down date
    distance[<%= counter %>] = abc[<%= counter %>] - now[<%= counter %>];

    // Time calculations for days, hours, minutes and seconds
    days[<%= counter %>] = Math.floor(distance[<%= counter %>] / (1000 * 60 * 60 * 24));
    hours[<%= counter %>] = Math.floor((distance[<%= counter %>] % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    minutes[<%= counter %>] = Math.floor((distance[<%= counter %>] % (1000 * 60 * 60)) / (1000 * 60));
    seconds[<%= counter %>] = Math.floor((distance[<%= counter %>] % (1000 * 60)) / 1000);

    // Output the result in an element with id="demo"
    document.getElementById("demo<%= counter %>").innerHTML = days[<%= counter %>] + ":" + hours[<%= counter %>] + ":" 
    + minutes[<%= counter %>] + ":" + seconds[<%= counter %>];

    // If the count down is over, write some text 
    if (distance[<%= counter %>] < 0) {
        clearInterval(x[<%= counter %>]);
        document.getElementById("demo<%= counter %>").innerHTML = "EXPIRED";
        document.getElementById("btnbid").disabled=true;
    }
}, 1000);
</script>
<form action="#" method="post">
                <div class="row">
                    <div class="col-lg-3"><input type="hidden" value="<%= rs.getString(1) %>" name="btnprdid" class="button button-login w-100" /></div>
                    <div class="col-lg-6"><input type="submit" id="btnbid" value="Bid" name="btnbid" class="button button-login w-100" /></div>
                </div>
</form>
            </div>
            </div>
          </div>
          <%
              counter++;
            }
                    } catch(Exception e) {} finally { con.close(); }
          %>
        </div>
      </div>
    </section>
    <!-- ================ Upcoming items  carousel end ================= -->

    <!-- ================ Sold items  carousel ================= --> 
    <section class="section-margin calc-60px" style="margin-bottom:0px">
      <div class="container">
        <div class="section-intro pb-60px">
          <h2><span class="section-intro__style">Closed</span>&nbsp;Auctions</h2>
        </div>
        <div class="owl-carousel owl-theme" id="bestSellerCarousel">
            <%
                try{
                    con = ConnectionCreate.initDatabase();
                    Statement st1 = con.createStatement();
                    ResultSet rs1 = null;
                    rs1 = st1.executeQuery("Select prd_name,category_name,bid_amt,prd_img,buyer_name from vw_product where adminconfirm='Sold' and bid_date<cast(now() as date) order by bid_date DESC limit 6");
                    while(rs1.next()){
                    %>
                    <div class="card text-center card-product">
                        <div class="card-product__img">
                            <img class="img-fluid" style="width:254.72px;height: 271.17px;" src="product_images/<%= rs1.getString(4) %>" alt="">
                        </div>
                        <div class="card-body">
                            <p><%= rs1.getString(2) %></p>
                          <h4 class="card-product__title"><a href="#"><%= rs1.getString(1) %></a></h4>   
                          <p class="card-product__price">Winner : <%= rs1.getString(5) %></p>
                          <p class="card-product__price">Sold For : Rs.<%= rs1.getString(3) %></p>
                        </div>
                    </div>
                    <%
                    }
                }catch(Exception e){}finally{con.close();}
            %>
        </div>
      </div>
    </section>
    <!-- ================ Sold items  carousel end ================= --> 

	
	<!--================ Hero Carousel start =================-->
        <section class="section-margin mt-0">
      <div class="owl-carousel owl-theme hero-carousel">
        <div class="hero-carousel__slide">
          <img src="normalimg/home/hero-slide1.png" alt="" class="img-fluid">
          <a href="#" class="hero-carousel__slideOverlay">
            <h3>Mobiles</h3>
          </a>
        </div>
        <div class="hero-carousel__slide">
          <img src="normalimg/home/hero-slide2.png" alt="" class="img-fluid">
          <a href="#" class="hero-carousel__slideOverlay">
            <h3>PC, Laptops and Computers</h3>
          </a>
        </div>
        <div class="hero-carousel__slide">
          <img src="normalimg/home/hero-slide3.png" alt="" class="img-fluid">
          <a href="#" class="hero-carousel__slideOverlay">
            <h3>Antiques</h3>
          </a>
        </div>
      </div>
    </section>
	<section class="section-margin mt-0">
      <div class="owl-carousel owl-theme hero-carousel">
        <div class="hero-carousel__slide">
          <img src="normalimg/home/hero-slide4.png" alt="" class="img-fluid">
          <a href="#" class="hero-carousel__slideOverlay">
            <h3>Furnitures</h3>
          </a>
        </div>
        <div class="hero-carousel__slide">
          <img src="normalimg/home/hero-slide5.png" alt="" class="img-fluid">
          <a href="#" class="hero-carousel__slideOverlay">
            <h3>Bikes</h3>
          </a>
        </div>
        <div class="hero-carousel__slide">
          <img src="normalimg/home/hero-slide6.png" alt="" class="img-fluid">
          <a href="#" class="hero-carousel__slideOverlay">
            <h3>Cars</h3>
          </a>
        </div>
      </div>
    </section>
    <!--================ Hero Carousel end =================-->

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
  <script src="normalvendors/jquery.ajaxchimp.min.js"></script>
  <script src="normalvendors/mail-script.js"></script>
  <script src="normaljs/main.js"></script>
  </body>
</html>
