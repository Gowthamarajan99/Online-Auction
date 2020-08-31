<%@page import="com.onlineauction.ConnectionCreate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% Connection con=null; %>
<% int count=0; %>
<%
    if(session.getAttribute("user")==null){
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Bid Time - Approved Product</title>
  <link rel="icon" href="normalimg/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="normalvendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="normalvendors/fontawesome/css/all.min.css">
  <link rel="stylesheet" href="normalvendors/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="normalvendors/linericon/style.css">
  <link rel="stylesheet" href="normalvendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="normalvendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="normalvendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="normalvendors/nouislider/nouislider.min.css">
  <link rel="stylesheet" href="normalcss/style.css">
  <script src="js/sweetalert/sweetalert/sweetalert.min.js" type="text/javascript"></script>
  <script>
            function abc(){
                swal('Success','Product Deleted Successfully','success');
            }
        </script>
</head>
<body>
    <%
        if(request.getParameter("btnupdate")!=null){
            session.setAttribute("pid",request.getParameter("pid"));
            response.sendRedirect("updateproduct.jsp");
        }
        if(request.getParameter("btndelete")!=null)
        { 
            try
            {
                con = ConnectionCreate.initDatabase();
                String id = request.getParameter("pid").toString();
                PreparedStatement st1 = con.prepareStatement("Delete from product where prd_id='" + id + "'");
                st1.executeUpdate();
                st1.close();
            }catch(Exception e){} finally{con.close();}
     %>
        <script>abc();</script>
    <%
        }
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
              <li class="nav-item "><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item active"><a class="nav-link" href="sell.jsp">Sell</a></li>	
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
 
  <!--================Checkout Area =================-->
  <section class="checkout_area section-margin--small" style="margin-top: 30px;">
    <div class="container">
        <div class="billing_details">
            <div class="row">
                <div class="col-xl-3 col-lg-4 col-md-5">
                    <div class="sidebar-categories">
                      <div class="head">Quick Links</div>
                      <ul class="main-categories"  style="background-color: white">
                        <li class="common-filter">
                            <ul>
                                <a href="userpendingproduct.jsp" style="color:#777777;"><li class="filter-list"><label>Pending Approval</label></li></a>
                                <a href="userapprovedproduct.jsp" style="color:#777777;"><li class="filter-list"><label>Approved Products</label></li></a>
                                <a href="userrejectedproduct.jsp" style="color:#777777;"><li class="filter-list"><label>Rejected Products</label></li></a>
                                <a href="usersoldproduct.jsp" style="color:#777777;"><li class="filter-list"><label>Sold Products<span></span></label></li></a>
                            </ul>
                        </li>
                      </ul>
                    </div>
                </div>
                <div class="col-xl-9 col-lg-8 col-md-7">
                    <h3 style="padding-top: 15px;padding-bottom: 15px;font-size: 22px;">Approved Product Details</h3>
          <!-- Start Best Seller -->
          <section class="lattest-product-area pb-40 category-list">
            <div class="row">
                 <% 
                    try {
                        con = ConnectionCreate.initDatabase();
                        Statement st = con.createStatement();
                        ResultSet rs;
                        rs = st.executeQuery("Select prd_id,prd_name,category_name,min_bid,prd_img from vw_product where seller_name='" + session.getAttribute("user") + "' and adminconfirm='Yes' order by bid_date");
                        while(rs.next())
                        { %>
                        <div class="col-md-6 col-lg-4">
                            <div class="card text-center card-product">
                              <div class="card-product__img">
                                  <img class="card-img" style="width: 254.98px; height: 271.45px" src="product_images/<%= rs.getString(5) %>" alt="">
                                  <form action="#" method="post">
                                  <ul class="card-product__imgOverlay">
                                      <input type="hidden" name="pid" value="<%= rs.getString(1) %>"/>
                                      <li><button type="submit" value="" name="btnupdate" title="Update"><i class="ti-pencil-alt"></i></button></li>
                                      <li><button type="submit" value="" name="btndelete" title="Delete"><i class="ti-trash"></i></button></li>
                                  </ul>
                                  </form>
                              </div>
                              <div class="card-body">
                                <p><%= rs.getString(3) %></p>
                                <h4 class="card-product__title"><a href="#"><%= rs.getString(2) %></a></h4>
                                <p class="card-product__price">Rs.<%= rs.getString(4) %></p>
                              </div>
                            </div>
                        </div> 
                       <% }
                    } catch(Exception e) {} finally { con.close(); }
                %>
            </div>
          </section>
          <!-- End Best Seller -->
                </div>
            </div>
        </div>
    </div>
  </section>
  <!--================End Checkout Area =================-->

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