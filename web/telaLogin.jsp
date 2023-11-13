<%-- 
    Document   : index
    Created on : 7 de nov. de 2023, 14:51:36
    Author     : jotac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="top.jota.dao.main.entidades.services.UserServices"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->
    <title>JSP Page</title>
</head>
<body>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
    <div class="container">
        <div class="card card-login mx-auto text-center bg-dark">
            <div class="card-header mx-auto bg-dark">
                <span> <img src="img/logo.jpg" class="w-75" alt="Logo"> </span><br/>
                <span class="logo_title mt-5"> Login</span>
            </div>
            <div class="card-body">
                <form action="telaLoginServlet" method="post">
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
                        <input type="password" name="senha" class="form-control" placeholder="Password">
                    </div>

                    <div class="form-group">                        
                        <input type="submit" name="btn" value="Login" class="btn btn-outline-danger float-right login_btn">
                    </div>
                                     
                </form>
               

               <p class="text-warning" align="left">
                  <%= request.getAttribute("msg") %>
               </p>
                
                
            </div>
                <div align="right" class = "mr-md-4"> <a href="cadastrarUsuarioSenha.jsp">Cadastrar</a></div>
        </div>
    </div>

    <link rel="stylesheet" type="text/css" href="css/styleTelaLoginCadastroSenha.css"/>
</body>
</html>
