package top.jota.dao.main;

import top.jota.dao.main.entidades.Usuario;
import top.jota.dao.main.entidades.services.UserServices;

public class Main {
    public static void main(String[] args) {
   
        Usuario joao = new Usuario(1, "joao", "123");
        System.err.println(joao.toString());
        
        
        UserServices userServices = new UserServices();  // inicializar UserService
        userServices.inserir();
        
       
       
    }
}
