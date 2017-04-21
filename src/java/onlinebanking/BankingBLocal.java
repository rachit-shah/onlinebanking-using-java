/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package onlinebanking;

import javax.ejb.Remote;
@Remote  
/**
 *
 * @author Abhi
 */

public interface BankingBLocal {

    

    public double GetBalance(String email);

    public boolean deposit(double amount, String emaill, boolean l);

    public double withdraw(double amount, String email, boolean l);
    
    public double transferTo(double amount,String email1,String email2);
    
}
