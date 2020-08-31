<%@page import="com.onlineauction.ConnectionCreate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import ="java.sql.*" %>
<%
	Connection con = null;
	try 
        {
            con = ConnectionCreate.initDatabase();
            String name = request.getParameter("txtname");
            String emailid = request.getParameter("txtemailid");
            String pwd = request.getParameter("txtpwd");
            if((!name.equals("")) && (!emailid.equals("")) && (!pwd.equals("")))
            {
                PreparedStatement st = con.prepareStatement("insert into register(name,email_id,pwd) values ('" + name + "','"+ emailid +"','" + pwd + "')");
                st.executeUpdate();
                name = emailid = pwd = "";
                st.close();
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {	} finally { con.close(); }
%>

<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Bid Time - Register</title>
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
</head>
<body>
    <script>
        function myFunction() {
           var pwd = document.getElementById('txtpwd').value;
           var cpwd = document.getElementById('txtcpwd').value;
           if(pwd !== cpwd) {
               document.getElementById('confirm').style.display = 'block';
               return false;
           }
           document.getElementById('confirm').style.display = 'none';
           return true;    
        }
    </script>
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
      		  <li class="nav-item active"><a class="nav-link" href="login.jsp">Login</a></li>
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
  
  <!--================Login Box Area =================-->
	<section class="login_box_area section-margin" style="margin-top: 30px;margin-bottom: 40px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img">
						<div class="hover">
							<h4>Already have an account?</h4>
							<a class="button button-account" href="login.jsp">Login Now</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner register_form_inner">
						<h3>Create an account</h3>
						<form class="row login_form" action="#" id="register_form"  onsubmit="return myFunction()">
							<div class="col-md-12 form-group">
                                                            <input type="email" class="form-control" name="txtemailid" placeholder="Email Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email Address'" required>
							  </div>
                                                    <div class="col-md-12 form-group">
                                                            <input type="text" class="form-control" name="txtname" placeholder="Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Name'" required>
							  </div>
							  <div class="col-md-12 form-group">
								<input type="password" class="form-control" id="txtpwd" name="txtpwd" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'" required>
							  </div>
							  <div class="col-md-12 form-group">
								<input type="password" class="form-control" id="txtcpwd" name="txtcpwd" placeholder="Confirm Password"  onfocus="this.placeholder = ''" onblur="this.placeholder = 'Confirm Password'">
                                                                <div id="confirm" style="margin-left:5px;position:absolute;top:50px;left:10px;color:#FF0000;display: none;">Password Do Not Match</div>
							</div>
                                                        
                                                    <div class="col-md-12 form-group" style="margin-top: 20px">
                                                            <button type="submit" value="submit" name="btnreg" class="button button-register w-100">Register</button>
							</div>
						</form>
					</div>
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