/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myproject.medical.factory;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author gugul
 */
public class Connector {
    public static Connection getCon(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject", "root", "");
            return con;
        }
        catch(Exception e){
            System.out.println(e);
            return null;
        }
    }
}
