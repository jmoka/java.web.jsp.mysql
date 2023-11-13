/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package top.jota.servlets;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import static java.lang.System.out;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import top.jota.dao.main.entidades.services.UserServices;


@WebServlet(name = "cadastrouser", urlPatterns = {"/cadastrouser"})
public class cadastroUserServlet extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
                        String nome = request.getParameter("nome");
                        String senha = request.getParameter("senha");
                        String senha2 = request.getParameter("senha2");
                        String regex = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*()\\-_=+{};:,<.>]).{4,}$";

                        UserServices userServices = new UserServices();

                           if (senha != null && !senha.isEmpty() && senha.equals(senha2) && nome != null && !nome.isEmpty()) {
                            try {
                                Pattern pattern = Pattern.compile(regex);
                                Matcher matcher = pattern.matcher(senha);

                                if (matcher.matches()) {
                                    Integer cadastro = userServices.inserir(nome, senha);

                                    if (cadastro == 1) {
                                       request.setAttribute("msg", "Cadastro Efetuado com Sucesso!<br>" +
                                                                         "<a href=\"index.jsp\">Retornar ao Login</a>");

                                    } else {
                                       request.setAttribute("msg","Erro no Cadastro. Tente Novamente.");
                                    }
                                } else {
                                  request.setAttribute("msg", "Formato Senha Inválida!<br>" +
                                                                    "=> Mínimo 4 Caracteres<br>" +
                                                                    "=> Um número<br>" +
                                                                    "=> Um Símbolo<br>" +
                                                                    "=> Uma Letra Maiúscula");

                                }
                            } catch (Exception e) {
                                request.setAttribute("msg","Senha já Cadastrada");
                            }
                        } else if (nome == null && senha == null && senha2 == null) {
                            request.setAttribute("msg","");
                        } else if (nome == null || nome.isEmpty()) {
                            request.setAttribute("msg","Campo nome vazio");
                        } else if (senha == null || senha.isEmpty()) {
                            request.setAttribute("msg","Campo senha vazio");
                        } else if (senha2 == null || senha2.isEmpty()) {
                           request.setAttribute("msg","Campo Confirmar senha está vazio");
                        } else {
                           request.setAttribute("msg","Senha não Confere");
                        }
                      
                        RequestDispatcher dispatcher = request.getRequestDispatcher("cadastrarUsuarioSenha.jsp");
                        dispatcher.forward(request, response);
    }   

     

}
