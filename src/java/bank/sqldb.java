package bank;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.sql.*;

/**
 *
 * @author c
 */
public class sqldb {
    public static Connection conn; //Connection Object
    public static Statement st; //Statement Object
    public static CallableStatement cs;
    
    // Connect method establish the connection to the database
    public static void connect()
    {       
        String url = "jdbc:mysql://localhost:3306/";
	String dbName = "banking";
	String driver = "com.mysql.jdbc.Driver";
	String userName = "root"; 
	String password = "";

        try {
            Class.forName(driver); //Register JDBC Driver
            //Class.forName(driver).newInstance(); //Register JDBC Driver
            conn = DriverManager.getConnection(url+dbName,userName,password); //create a connection object
            //conn.setAutoCommit(false);
            
            System.out.println("Connection Established");
            st = conn.createStatement();
        }
        catch (Exception e) {
		  e.printStackTrace();
		  }
    }
    // Used to close the connection with database
    public static void connclose()
    {
        try{
        conn.close();
        }
        catch(Exception e)
        {  e.printStackTrace();
        }
    }
    
    public static int iud_data(String str) // Used for insert, update, delete query
    {   int r=0;
        try {
        r=st.executeUpdate(str);
        /*
        String SQL = "{call getEmpName(?, ?)}";
        cs = conn.prepareCall(SQL);
        cs.setString("EMP_ID", "asd");
        cs.setString("EMP_Name", "asd");
        
        cs.registerOutParameter("empsal", Types.VARCHAR);
        cs.execute();
        String x=cs.getString("empsal");
        cs.close();
        */
        
        }
        catch(Exception e)
        {
        e.printStackTrace();
        }
        return r;
    }
    public static ResultSet fetchdata(String str) throws SQLException // Used for select query
    { 
        return st.executeQuery(str);
    }    
}
