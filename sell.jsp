<%@page import="com.onlineauction.ConnectionCreate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*, java.sql.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>
<% Connection connection=null; %>
<% Connection con=null; %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Bid Time - Sell</title>
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
        function success() 
        {
            swal('Success','Product Posted Successfully to Admin','success');
        }
        function alertFunction() {
            swal ({
                title: "Not Authenticated!",
                text: "You must be an logged in!",
                icon: "warning"
            }).then(function() {
                window.location = "login.jsp";
            });
        }
    </script>
</head>
<body>
    <%
    String prdname = "";
    String category = "";
    String minbid = "";
    String biddate = "";
    String bidtime = "";
    String description = "";
    String fname = "";
    if(session.getAttribute("user") == null)
    {%>
        <script>
            alertFunction();
        </script>
    <% }
    else
    {
        try
        {
            File file ;
            int maxFileSize = 5000 * 1024;
            int maxMemSize = 5000 * 1024;
            ServletContext context = pageContext.getServletContext();
            String filePath = "F:/Online Auction/web/product_images/";

            String contentType = request.getContentType();

            if ((contentType.indexOf("multipart/form-data") >= 0)) 
            {
               DiskFileItemFactory factory = new DiskFileItemFactory();
               factory.setSizeThreshold(maxMemSize);

               factory.setRepository(new File("c:\\temp"));

               ServletFileUpload upload = new ServletFileUpload(factory);

               upload.setSizeMax( maxFileSize );

               try 
               { 
                  List fileItems = upload.parseRequest(request);

                  Iterator i = fileItems.iterator();

                  while ( i.hasNext () ) 
                  {
                     FileItem fi = (FileItem)i.next();
                     if ( !fi.isFormField () ) 
                     {
                        String fileName = fi.getName();
                        fname = fileName;
                        //boolean isInMemory = fi.isInMemory();
                        //long sizeInBytes = fi.getSize();

                        if( fileName.lastIndexOf("\\") >= 0 ) {
                           file = new File( filePath + 
                           fileName.substring( fileName.lastIndexOf("\\"))) ;
                        } else {
                           file = new File( filePath + fileName.substring(fileName.lastIndexOf("\\")+1)) ;
                        }
                        fi.write( file );
                    }
                    else if(fi.isFormField())
                    {
                        String name= fi.getFieldName();
                        if(name.equals("txtprdname"))
                        {
                            prdname=fi.getString();
                        }
                        if(name.equals("ddcategory"))
                        {
                            category=fi.getString();
                        }
                        if(name.equals("txtminbid"))
                        {
                            minbid=fi.getString();
                        }
                        if(name.equals("txtbiddate"))
                        {
                            biddate=fi.getString();
                        }
                        if(name.equals("txtbidtime"))
                        {
                            bidtime=fi.getString();
                        }
                        if(name.equals("txtdes"))
                        {
                            description=fi.getString();
                        }
                    }
                  }
                  try
                  { 
                    con = ConnectionCreate.initDatabase();
                    String sellername = (String) session.getAttribute("user");
                    PreparedStatement st = con.prepareStatement("insert into product(prd_name,cat_id,seller_name,min_bid,bid_date,bid_time,description,prd_img,bid_amt,adminconfirm) values('" + prdname + "','" + category + "','" + sellername + "','" + minbid + "','" + biddate + "','" + bidtime + "','" + description + "','" + fname + "','0','Pending')");
                    st.executeUpdate();
                    st.close();
                    con.close();
                    %> 
                    <script>success();</script>
                    <%
                  } catch(Exception e) { } finally { con.close(); }
               } catch(Exception e) { }
            }
        } catch(Exception e) { }
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
                    <h3 style="padding-top: 15px;padding-bottom: 15px;font-size: 22px;">Selling Details</h3>
                    <form class="row contact_form" action="#" method="post" enctype="multipart/form-data" >
                        <div class="col-md-12 form-group">
                            <input type="text" class="form-control" name="txtprdname" placeholder="Product Name" required>
                        </div>
                            
                        <div class="col-md-12 form-group">
                        <%
                            try{
                                connection = ConnectionCreate.initDatabase();
                                Statement statement = connection.createStatement() ;
                                ResultSet resultset = statement.executeQuery("select * from category") ;
                        %>
                            <select class="country_select" name="ddcategory">
                            <%  while(resultset.next()){ %>
                                <option value="<%= resultset.getString(1)%>"><%= resultset.getString(2)%></option>
                            <% } %>  
                            </select>
                        <% } catch(Exception e){} finally { connection.close(); } %>
                        </div>
                            
                        <div class="col-md-12 form-group">
                            <input type="number" class="form-control" name="txtminbid" placeholder="Minimum Bid" required>
                        </div>
                        
                        <div class="col-md-6 form-group">
                            <label style="font-size: 16px;margin-left: 10px;margin-top: 5px;">Enter Bid Date</label>
                        </div>
                        
                        <div class="col-md-6 form-group">
                            <input type="date" class="form-control" name="txtbiddate" required>
                        </div>
                        
                        <div class="col-md-6 form-group">
                            <label style="font-size: 16px;margin-left: 10px;margin-top: 5px;">Enter Bid Time</label>
                        </div>
                        
                        <div class="col-md-6 form-group">
                            <input type="time" class="form-control" name="txtbidtime" required>
                        </div>
                        
                        <div class="col-md-12 form-group">
                            <textarea class="form-control" name="txtdes" rows="1" placeholder="Product Description" required></textarea>
                        </div>
                        
                        <div class="col-md-6 form-group">
                            <label style="font-size: 16px;margin-left: 10px;margin-top: 5px;">Select Product Image : </label>
                        </div>
                        
                        <div class="col-md-6 form-group">
                            <input type="file" class="form-control" name="file" accept=".jpg,.png" size="50" required>
                        </div>
                        
                        <div class="col-md-6 form-group" style="margin-left: auto;margin-right: auto;margin-top: 30px;">
                            <button type="submit" value="submit" class="button button-login w-100">Post the Product</button>
			</div>
                        
                    </form>
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