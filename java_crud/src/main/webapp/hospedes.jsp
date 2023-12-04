<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio</title>
    <link rel="stylesheet" href="templates/assets/css/styles.css">
    <link rel="stylesheet" href="templates/assets/css/reset.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
        integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>

<body>
    <header class="cabecalho">
        <h1 class="texto">HOTELWEB</h1>
        <nav class="navbar navbar-expand-lg ">
            <div class="container-fluid">
                <a class="fonte navbar-brand" href="templates/index.html">Inicio</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="fonte nav-link" aria-current="page" href="#">Hóspedes</a>
                        </li>
                        <li class="nav-item">
                            <a class="fonte nav-link" href="#">Nossos ambientes</a>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>
    </header>
    <body>
        <br>
        <div class="container">
            <div class="row">
                <div class="cold-md-7">
                    <hr>
                    <h3>Reservas Feitas</h3>
                    <hr>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nome</th>
                                <th>CPF</th>
                                <th>Data de Entrada</th>
                                <th>Quantidade de Dias</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            Connection connection = null;
                            Statement stmt = null;
                            ResultSet rs = null;

                            // Carregar o driver JDBC
                            Class.forName("com.mysql.cj.jdbc.Driver");

                            // Estabelecer a conexão com o banco de dados
                            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_crud", "root", "");

                            // Criar uma instrução SQL
                            stmt = connection.createStatement();
                            String sql = "SELECT * FROM java_crud.clientes";

                            // Executar a consulta
                            rs = stmt.executeQuery(sql);

                            // Exibir os resultados
                            while (rs.next()) {
                                out.println("<tr>");
                                    out.println("<td>" + rs.getInt("id") + "</td>");
                                    out.println("<td>" + rs.getString("nome") + "</td>");
                                    out.println("<td>" + rs.getString("cpf") + "</td>");
                                    out.println("<td>" + rs.getString("entrada") + "</td>");
                                    out.println("<td>" + rs.getString("dias") + "</td>");
                                    out.println("<td>");
                                    out.println("<a href=ClienteDestroy?clienteId=" + rs.getInt("id") + ">Deletar</a>");
                                    out.println("</td>");
                                out.println("</tr>");
                            }
                            out.println("</table>");
                        %>
                        <a class="btn btn-primary" href=ClienteUpdate?clienteId=0>Atualizar quarto</a>
                        <br>
                        </tbody>
                    </table>
                    <br>
                    <h5><a class="btn btn-secondary" href="templates/cadastro.html">Reservar outro quarto</a></h5>
                </div>
            </div>
        </div>
        <footer class="footer">
            <div class="footer-icons">
                <a href="https://www.instagram.com/jusesamoel/" target="_blank">
                    <i class="fa-brands fa-instagram fa-2x"></i>
                </a>
                <a href="#">
                    <i class="fa-brands fa-whatsapp fa-2x"></i>
                </a>
                <a href="#">
                    <i class="fa-brands fa-facebook fa-2x"></i>
                </a>
            </div>
            <p>Copyright 2023 | HotelWeb - Todos os Direitos Reservados</p>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    </body>
</html>