<%@page import="com.onlineauction.ConnectionCreate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% Connection con=null; %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Bid Time - Product Details</title>
	<link rel="icon" href="normalimg/Fevicon.png" type="image/png">
        <link rel="stylesheet" href="normalvendors/bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="normalvendors/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="normalvendors/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="normalvendors/nice-select/nice-select.css">
        <link rel="stylesheet" href="normalvendors/owl-carousel/owl.theme.default.min.css">
        <link rel="stylesheet" href="normalvendors/owl-carousel/owl.carousel.min.css">
        <link rel="stylesheet" href="normalcss/style.css">
        <style>
            h5{
                font-size:18px;
            }
            .value-button {
                display: inline-block;
                border: 1px solid #384aeb;
                margin: 0px;
                width: 50px;
                height: 40px;
                text-align: center;
                vertical-align: middle;
                background: white;
                color:#384aeb;
                border-radius: 50%;
                font-size:22px;
                font-weight: bold;
                -webkit-touch-callout: none;
                -webkit-user-select: none;
                -khtml-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
            }

            .value-button:hover {
                cursor: pointer;
                background:#384aeb;
                color:white;    
            }

            input#bid {
                text-align: center;
                border: none;
                border-top: 1px solid #ddd;
                border-bottom: 1px solid #ddd;
                margin: 0px;
                width: 100px;
                height: 40px;
                font-weight: bold;
            }

            input[type=number]::-webkit-inner-spin-button,
            input[type=number]::-webkit-outer-spin-button {
                  -webkit-appearance: none;
                  margin: 0;
            }
        </style>
    <script src="js/sweetalert/sweetalert/sweetalert.min.js" type="text/javascript"></script>
    <script>
        function bidplaced() 
        {
            swal('Success','Your Bid Has been Placed Successfully','success');
        }
        function minbid() 
        {
            swal('Error','Bid Amount must be Greater than Current Price','error');
        }
    </script>
    </head>
    <body>
<%
    if(session.getAttribute("user") == null)
    {
        response.sendRedirect("login.jsp");
    }
%>
<%
    try
    {
        con = ConnectionCreate.initDatabase();
        int bid=Integer.parseInt(request.getParameter("bid"));
        String buyer=session.getAttribute("user").toString();
        String pid=session.getAttribute("pid").toString();
        if(bid!=0 && (!buyer.equals("")) && (!pid.equals("")))
        {
            PreparedStatement st = con.prepareStatement("update product set bid_amt='" + bid + "',buyer_name='" + buyer + "',adminconfirm='Sold' where prd_id='" + pid + "'");
            st.executeUpdate();
            buyer = pid = "";
            bid=0;
            st.close();
        %>
        <script>bidplaced();</script>
        <%
        }   
    }catch(Exception e){} finally{ con.close(); }
%>
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
	
  <!--================Single Product Area =================-->
	<div class="product_image_area" style="padding-bottom:50px;">
		<div class="container">
                    <form action="#" method="post">
                    <%
                        try
                        {
                            con = ConnectionCreate.initDatabase();
                            Statement st = con.createStatement();
                            ResultSet rs;
                            rs = st.executeQuery("Select * from vw_product where prd_id='" + session.getAttribute("pid").toString() + "'");
                            
                            while(rs.next())
                            {
                    %>
			<div class="row s_product_inner">
				<div class="col-lg-6">
					<div class="owl-carousel owl-theme s_Product_carousel">
						<div class="single-prd-item">
                                                    <img class="img-fluid" style="width:555px;height:600px;" src="product_images/<%= rs.getString(11) %>" alt="">
						</div>
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<div class="table-responsive">
                                                    <h2><%= rs.getString(2) %></h2>
                                                    <h3>Actual Price : Rs.<%= rs.getString(5) %></h3>
                                                    <h2>Current Price : Rs.<%= rs.getString(10) %></h2>
                                                    <table class="table">
							<tbody>
								<tr>
									<td>
										<h5>Category</h5>
									</td>
									<td>
										<h5><%= rs.getString(3) %></h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>Seller Name</h5>
									</td>
									<td>
										<h5><%= rs.getString(4) %></h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>Last Date</h5>
									</td>
									<td>
										<h5><%= rs.getString(6) %></h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>Description</h5>
									</td>
									<td>
										<h5><%= rs.getString(8) %></h5>
									</td>
								</tr>
                                                                <tr>
									<td>
										<h5>Highest Bidder</h5>
									</td>
									<td>
										<h5><%= rs.getString(9) %></h5>
									</td>
								</tr>
                                                                <tr>
									<td>
										<h5>Remaining Time</h5>
									</td>
									<td>
										<h5 id="rtime"></h5>
<script>
        var abc = new Date("<%= rs.getString(6) %> <%= rs.getString(7) %>").getTime();
        
        var x = setInterval(function() {

        var now = new Date().getTime();

        var distance = abc - now;

        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);

        document.getElementById("rtime").innerHTML = days + ":" + hours + ":"
        + minutes + ":" + seconds;

        if (distance < 0) {
          clearInterval(x);
          document.getElementById("rtime").innerHTML = "EXPIRED";
          document.getElementById("btnbid").disabled = true;
        }
        }, 1000);
</script>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
        <script>
            function increaseValue() {
                var value = parseInt(document.getElementById('bid').value, 10);
                value = isNaN(value) ? 0 : value;
                value++;
                document.getElementById('bid').value = value;
            }

            function decreaseValue() {
                var value = parseInt(document.getElementById('bid').value, 10);
                value = isNaN(value) ? 0 : value;
                value < 1 ? value = 1 : '';
                value--;
                document.getElementById('bid').value = value;
            }
            function checkBid(){
                var value = parseInt(document.getElementById('bid').value);
                var curbid=parseInt(<%= rs.getString(10) %>);
                if(value <= curbid){
                    document.getElementById('bid').value = 0;
                    swal('Error','Bid Amount must be Greater than Current Price','error');
                    return false;
                }
                return true;
            }
        </script>
        <div style="padding-bottom:20px">
            <div class="value-button" id="decrease" onclick="decreaseValue()" value="Decrease Value">-</div>
            <input type="number" id="bid" name="bid" value="0" />
            <div class="value-button" id="increase" onclick="increaseValue()" value="Increase Value">+</div>
            <div id="validbid" style="color:red;margin-top:0px;padding-top: 0px;display: none">Bid must be greater than Current Price</div>
        </div>
        <input type="submit" onclick="checkBid()" name="btnbid" class="button primary-btn" style="width:205px" value="Bid Now" />
						</div>
					</div>
				</div>
                        <% }
                        }    catch(Exception e) {} finally { con.close(); }
                        %>
                        </form>
			</div>
		</div>
	</div>
	<!--================End Single Product Area =================-->
        

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