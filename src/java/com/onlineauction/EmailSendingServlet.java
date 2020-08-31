package com.onlineauction;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet(name = "EmailSendingServlet", urlPatterns = {"/EmailSendingServlet"})
public class EmailSendingServlet extends HttpServlet 
{
    private static final long serialVersionUID = 1L;
    private String host;
    private String port;
    private String user;
    private String pass;
 
    @Override
    public void init() 
    {
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }
 
    @Override
    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
    {        
        HttpSession session = request.getSession();
        String recipient = session.getAttribute("mailid").toString();
        
        String subject =  "BidTime Password";
        String content = "UserName : " + session.getAttribute("mailid").toString() + " Password : " + session.getAttribute("pwd").toString();
 
        String resultMessage = "";
 
        try {
            EmailUtility.sendEmail(host, port, user, pass, recipient, subject,
                    content);
            resultMessage = "The e-mail was sent successfully";
        } catch (Exception ex) {
            ex.printStackTrace();
            resultMessage = "There were an error: " + ex.getMessage();
        } finally 
        {
            request.setAttribute("Message", resultMessage);
            getServletContext().getRequestDispatcher("/Result.jsp").forward(request, response);
        }
    }
}
