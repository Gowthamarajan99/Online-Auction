package com.onlineauction;

import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet(name = "ConnectionCreate", urlPatterns = {"/ConnectionCreate"})
public class ConnectionCreate extends HttpServlet 
{

    public static Connection initDatabase()
    {
        Connection con = null;
        String dbDriver = "com.mysql.jdbc.Driver";
        try
        {
            Class.forName(dbDriver);
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineauction","root","");
        } catch(Exception e) { }
        return con;
    }
}
