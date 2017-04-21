/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package onlinebanking;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Stateful;

/**
 *
 * @author Abhi
 */
@Stateful(mappedName = "stateful123")
public class BankingB implements BankingBLocal {

    double balance;

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    @Override
    public double GetBalance(String email) {
        double b = 0;
        String Query = "select balance from registration where Email='" + email + "'";
        sqldb.connect();
        try {
            ResultSet rs = sqldb.fetchdata(Query);
            while (rs.next()) {
                b = rs.getDouble("balance");
            }
        } catch (SQLException ex) {
            Logger.getLogger(BankingB.class.getName()).log(Level.SEVERE, null, ex);
        }
        sqldb.connclose();
        return b;
    }

    @Override
    public boolean deposit(double amount, String email, boolean l) {
        balance = GetBalance(email);
        balance = balance + amount;
        sqldb.connect();
        String Query = "update registration set balance=" + balance + "where Email='" + email + "'";
        if (sqldb.iud_data(Query) == 1) {
            if (l != true) {
                String qry = "insert into history values('" + email + "','deposit'," + amount + "," + "''" + ",current_timestamp)";
                System.out.println(qry);
                if (sqldb.iud_data(qry) == 1) {
                    System.out.println("History updated");
                } else {
                    System.out.println("History error");
                }
            }
            sqldb.connclose();
            return true;
        } else {
            sqldb.connclose();
            return false;
        }

    }

    @Override
    public double withdraw(double amount, String email, boolean l) {
        balance = GetBalance(email);
        if (balance > amount) {
            balance = balance - amount;
        } else {
            System.out.println("Error");
            return -1;
        }
        sqldb.connect();
        String Query = "update registration set balance=" + balance + "where Email='" + email + "'";
        if (sqldb.iud_data(Query) == 1) {
            System.out.println("Successful");
            if (l != true) {
                String qry = "insert into history values('" + email + "','withdraw'," + amount + "," + "''" + ",current_timestamp)";
                System.out.println(qry);
                if (sqldb.iud_data(qry) == 1) {
                    System.out.println("History updated");
                } else {
                    System.out.println("History error");
                }
            }
        }
        sqldb.connclose();
        return balance;
    }

    public double transferTo(double x, String email1, String email2) {
        double bal = GetBalance(email1);
        if (x <= bal) {
            double p = withdraw(x, email1, true);
            if (p != -1) {
                deposit(x, email2, true);
            } else {
                return -1;
            }
            sqldb.connect();
            String qry = "insert into history values('" + email1 + "','transfer'," + x + ",'" + email2 + "',current_timestamp)";
            System.out.println(qry);
            if (sqldb.iud_data(qry) == 1) {
                System.out.println("History updated");
            } else {
                System.out.println("History error");
            }
            sqldb.connclose();
            System.out.println("\nTransfer succesful. Tansfered: $" + x);
            return x;
        } else { //does not need to be else if, because if not <=, it MUST be >.
            System.out.println("\nTransfer failed, not enough balance!");
            return -1;
        }

    }

}
