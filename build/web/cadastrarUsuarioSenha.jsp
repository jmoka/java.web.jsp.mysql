<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="top.jota.dao.main.entidades.services.UserServices"%>
<%@page import="top.jota.dao.main.entidades.Usuario"%>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.regex.Matcher" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title>JSP Page</title>
</head>
<body>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
    <div class="container">
        <div class="card card-login mx-auto text-center bg-dark">
            <div class="card-header mx-auto bg-dark">
                <span> <img src="img/logo.jpg" class="w-75" alt="Logo"> </span><br/>
                <span class="logo_title mt-5">Cadastrar Usuário e Senha</span>
            </div>
            <div class="card-body">
                <form action="cadastrouser" method="post">
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <input type="text" name="nome" class="form-control" placeholder="Username">
                    </div>

                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                        </div>
                        <input type="password" name="senha" class="form-control" placeholder="Senha" id="senha">
                        
                    </div>
                    
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>    
                        </div>
                        <input type="password" name="senha2" class="form-control" placeholder="Confirm Senha" id="senha2">
                      
                    </div>
                    
                    
                   <div class="input-group-append d-flex justify-content-between align-items-center">
                       
                       <span class="text-primary mr-2 text-align-left"> 
                           <a href="telaLogin.jsp">Retornar ao Login </a>                           
                       </span>
                       
                       <span>
                        <span class="text-primary mr-1">   Mostrar Senhas   </span>
                        <input type="checkbox" onclick="mostrarSenha('senha', 'senha2')">
                        </span>
                    </div>

                    <div class="form-group mt-2">
                        <input type="submit" name="btn" value="Cadastrar" class="btn btn-outline-danger float-right login_btn">
                    </div>
                </form>

                <p class="text-warning" align="left">
                 <% 
                        String msg = (String)request.getAttribute("msg");
                        if(msg == null) {
                            out.print("Jota Sistemas");
                        } else {
                            out.print(msg);
                        }
                %>
                </p>
            </div>
        </div>
    </div>
    <link rel="stylesheet" type="text/css" href="css/styleTelaLoginCadastroSenha.css"/>
    <script>
        function mostrarSenha(idCampoSenha, idCampoSenha2) {
            var senhaInput = document.getElementById(idCampoSenha);
            var senhaInput2 = document.getElementById(idCampoSenha2);
            if (senhaInput.type === "password" && senhaInput2.type === "password") {
                senhaInput.type = "text";
                 senhaInput2.type = "text";
            } else {
                senhaInput.type = "password";
                senhaInput2.type = "password";
            }
        }
    </script>
</body>
</html>
