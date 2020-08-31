<%@page import = "com.onlineauction.ConnectionCreate"%>
<%@ page import="com.onlineauction.EmailSendingServlet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>  
<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.math.BigInteger"%>

<html lang="en">
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Bid Time - Login</title>
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
        function incorrect() 
        {
            swal('Invalid','Username or Password','error');
        }
        function invalidunm() 
        {
            swal('Invalid','Not a Registered User','error');
        }
        function alreadylogin(){
            swal({
                title:"Logged In",
                text: "You must Log out first.Are You Sure?",
                icon: "warning",
                buttons: {
                       cancel: true,
                       confirm: "Yes"
                         }
            }).then(val => {
                if(val){
                    window.location = "logout.jsp";
                }else{
                    window.location = "index.jsp";
                }
            });
        }
    </script>
    </head>
<body>
<%
    if(session.getAttribute("user") != null)
    {
%>
        <script>alreadylogin();</script>
<%  }
    if(request.getParameter("btnlogin") != null)
    {
        String emailid = request.getParameter("txtemailid");    
        String pwd = request.getParameter("txtpwd");

        Connection con = ConnectionCreate.initDatabase();
        Statement st = con.createStatement();

        ResultSet rs;
        try
        {
            if((!emailid.equals("")) && (!pwd.equals("")))
            {
                rs = st.executeQuery("select * from register where email_id='" + emailid + "' and pwd='" + pwd + "'");
                if (rs.next()) 
                {
                    out.println(rs.getString(3) + " " + rs.getString(4));
                    if(!rs.getString(3).equals("24x7bitime@gmail.com") && !rs.getString(4).equals("admin"))
                    {
                        session.setAttribute("mailid",rs.getString(3));
                        session.setAttribute("user",rs.getString(2));
                        response.sendRedirect("index.jsp");
                        
                    }
                    else
                    {
                        session.setAttribute("mailid",rs.getString(3));
                        session.setAttribute("user","Admin");
                        response.sendRedirect("adminhome.jsp");
                    }
                }
                else 
                { 
%>
                    <script>incorrect();</script>
<% }   
                st.close();
            }
        }
        catch(Exception e){} finally { con.close(); }
    } 
%>

<%
    if(request.getParameter("btnforgot") != null)
    {
        String emailid = request.getParameter("txtemailid");
        if(!emailid.equals(""))
        {
            Connection con = ConnectionCreate.initDatabase();
            Statement st = con.createStatement();
            ResultSet rs;
            try
            {
                rs = st.executeQuery("Select * from register where email_id = '" + emailid + "'");
                if(rs.next())
                {
                    session.setAttribute("mailid",rs.getString(3));
                    session.setAttribute("pwd",rs.getString(4));
                    RequestDispatcher rd = request.getRequestDispatcher("/EmailSendingServlet");
                    rd.forward(request, response);
                }
                else
                {
%>
                    <script>invalidunm();</script>
<%                    
                }
            }
            catch(Exception e) { } finally { con.close(); }
        }  
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
              <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="sell.jsp">Sell</a></li>	
        	  <li class="nav-item"><a class="nav-link" href="aboutus.jsp">About Us</a></li>
      		  <li class="nav-item active"><a class="nav-link" href="login.jsp">Login</a></li>
              <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
               </ul>
              <ul class="nav-shop"><li class="nav-item"><a class="button button-header" href="logout.jsp">
                <%= session.getAttribute("user")==null?"Welcome":"Logout" %></a></li></ul>
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
							<h4>New to our website?</h4>
							<p></p>
							<a class="button button-account" href="register.jsp">Create an Account</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner">
						<h3>Log in to enter</h3>
						<form class="row login_form" action="#" id="contactForm" method="post">
							<div class="col-md-12 form-group">
								<input type="email" class="form-control" id="txtemailid" name="txtemailid" placeholder="Email Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email Address'" required>
                                                                <div id="confirm" style="margin-left:5px;position:absolute;top:50px;left:10px;color:#FF0000;display:none;">Please Enter Valid Email Address</div>
							</div>
							<div class="col-md-12 form-group" style="margin-top: 20px;">
                                                            <input type="password" class="form-control" name="txtpwd" id="txtpwd" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'" required>
							</div>
							<div class="col-md-12 form-group">
								<button type="submit" value="Login" name="btnlogin" class="button button-login w-100">Log In</button>
                                                                <button type="submit" id="btnforgot" value="Forgot" name="btnforgot" class="button button-login w-100" style="background-color: white;color:#777;border-color: white;font-weight: normal;font-size:14px;margin-top: 20px;">Forgot Password</button>
<script type="text/javaScript">  
(function() {
    document.getElementById('btnforgot').onclick = function() 
    {
        var mail = document.getElementById('txtemailid').value;
        if(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail)) 
        { 
            document.getElementById('txtpwd').required = false;
            document.getElementById('confirm').style.display = 'none';
            return true;
        }
        else
        {
            document.getElementById('confirm').style.display = 'block';
            document.getElementById('txtemailid').focus();
            return false;
        }
    };
})();
</script>
                                                        </div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Login Box Area =================-->
        
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