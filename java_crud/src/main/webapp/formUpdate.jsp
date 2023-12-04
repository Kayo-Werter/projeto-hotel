<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CRUD Java - Atualizar Cliente</title>
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
                            <a class="fonte nav-link" aria-current="page" href="hospedes.html">Hóspedes</a>
                        </li>
                        <li class="nav-item">
                            <a class="fonte nav-link" href="#">Nossos ambientes</a>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>
    </header>
<br>
<div class="container">
	<div class="row">
		<div class="cold-md-7">
			<hr>
			<h3>Atualizar Cliente</h3>
			<hr>
			<form action="ClienteUpdate" method="POST">
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

                    // Exibir valores do cliente para atualização
                    if (rs.next()) {
                        out.println("<div class='form-floating mb-4'>");
                            out.println("<input name='id' type='number' class='form-control' placeholder=''>");
                        	out.println("<label>ID do Cliente</label>");
                        out.println("</div>");
        				out.println("<div class='form-floating mb-4'>");
        					out.println("<input name='nome' maxlength='40' type='text' class='form-control' id='floatingInput' placeholder=''>");
        					out.println("<label>Nome completo</label>");
        				out.println("</div>");
        				out.println("<div class='form-floating mb-4'>");
        					out.println("<input name='cpf' maxlength='11' type='text' class='form-control' placeholder=''>");
        					out.println("<label>CPF (apenas números)</label>");
        				out.println("</div>");
        				out.println("<div class='form-floating mb-4'>");
        				    out.println("<input name='entrada' type='date' class='form-control'>");
        					out.println("<label>Dia de entrada</label>");
        				out.println("</div>");
        				out.println("<select name='dias' type='number' class='form-select mb-4' aria-label='Default select example'>");
        					out.println("<option value='Inativo' selected>-- Selecione a quantidade de dias</option>");
        					out.println("<option value='1'>1</option>");
        					out.println("<option value='2'>2</option>");
        					out.println("<option value='3'>3</option>");
        					out.println("<option value='4'>4</option>");
        					out.println("<option value='5'>5</option>");
        				out.println("</select>");

        				out.println("<button class='btn btn-primary' type='submit'>Atualizar Dados</button>");
                    }
			    %>
			</form>
			<br>
			<h5><a class="btn btn-secondary" href="index.html">Voltar para o Cadastro de Clientes</a></h5>
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
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>