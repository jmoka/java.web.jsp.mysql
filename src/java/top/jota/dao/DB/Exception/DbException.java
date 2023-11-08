/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package top.jota.dao.DB.Exception;

/**
 *
 * @author jotac
 */
public class DbException  extends RuntimeException{
    
        private static final long serialVersionUID = 1L; 
        
        
    //contrutor passando para a super class que é a runtimeexception a mensagem que veio no parametro
    public DbException (String msg){
        
            super(msg);
    }
    
}
