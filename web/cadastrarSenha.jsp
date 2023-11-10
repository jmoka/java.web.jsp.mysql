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
                <span class="logo_title mt-5"> Cadastrar Senha </span>
            </div>
            <div class="card-body">
                <form action="" method="post">
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
                        <input type="password" name="senha" class="form-control" placeholder="Senha">
                    </div>
                    
                     <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                        </div>
                        <input type="password" name="senha2" class="form-control" placeholder="Confirm Senha">
                    </div>

                    <div class="form-group">
                        <input type="submit" name="btn" value="Cadastrar" class="btn btn-outline-danger float-right login_btn">
                    </div>
                </form>

        <p class="text-danger" align="left">
          <%
    String nome = request.getParameter("nome");
    String senha = request.getParameter("senha");
    String senha2 = request.getParameter("senha2");
    String regex = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*()-_=+{};:,<.>]).{4,}$";

    UserServices userServices = new UserServices();
    
    if (senha != null && !senha.isEmpty() && senha.equals(senha2) && nome != null && !nome.isEmpty()) {
        try {
            Pattern pattern = Pattern.compile(regex);
            Matcher matcher = pattern.matcher(senha);

            if (matcher.matches()) {
                Integer cadastro = userServices.inserir(nome, senha);

                if (cadastro == 1) {
                    out.println("Cadastro Efetuado com Sucesso");
                    out.println("<br>");
                    out.println("<a href=\"index.jsp\">Retornar ao Login</a>");
                } else {
                    out.println("Erro no Cadastro. Tente Novamente.");
                }
            } else {
                out.println("Formato Senha Inválida!");
                  out.println("<br>");
                out.println("=> Mínimo 4 Caracteres");
                 out.println("<br>");
                out.println("=> Um número");
                 out.println("<br>");
                out.println("=> Um Simbolo");
                 out.println("<br>");
                out.println("=> Uma Letra Maiúscula");
               
            }
        } catch (Exception e) {
            out.println("Senha já Cadastrada");
        }
    } else if (nome == null && senha == null && senha2 == null) {
        out.println("");
    } else if (nome == null || nome.isEmpty()) {
        out.println("Campo nome vazio");
    } else if (senha == null || senha.isEmpty()) {
        out.println("Campo senha vazio");
    } else if (senha2 == null || senha2.isEmpty()) {
        out.println("Campo Confirmar senha está vazio");
    } else {
        out.println("Senha não Confere");
    }
%>


        </p>
            </div>
        </div>
    </div>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
</body>
</html>
