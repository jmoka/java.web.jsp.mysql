<%-- 
    Document   : index
    Created on : 7 de nov. de 2023, 14:51:36
    Author     : jotac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
    <!-- Adicione estilos personalizados aqui, se necessário -->
    <style>
        body {
            background-color: #f8f9fa;
        }

        .dashboard-container {
            margin: 20px;
        }

        .card {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<div class="container dashboard-container">
    <h1>Dashboard</h1>

    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Total de Usuários</h5>
                    <p class="card-text">100</p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Vendas do Mês</h5>
                    <p class="card-text">$10,000</p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Novos Pedidos</h5>
                    <p class="card-text">20</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Adicione mais cards ou elementos conforme necessário -->

</div>

</body>
</html>
