<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Result</title>
</head>
<body>
    <script src="js/sweetalert/sweetalert/sweetalert.min.js" type="text/javascript"></script>
    <script>
        function alertFunction() {
            swal ({
                title: "Success!",
                text: "Password Sent Successfully to your Mail!",
                icon: "success"
            }).then(function() {
                window.location = "login.jsp";
            });
        }
        window.onload = alertFunction;
    </script>
   </body>
</html>