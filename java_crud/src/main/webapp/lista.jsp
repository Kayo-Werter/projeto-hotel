<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CRUD Java - Lista de Clientes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container-fluid">
    	<a class="navbar-brand" href="#">Navbar</a>
    	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      		<span class="navbar-toggler-icon"></span>
    	</button>
    	<div class="collapse navbar-collapse" id="navbarSupportedContent">
      		<ul class="navbar-nav me-auto mb-2 mb-lg-0">
        		<li class="nav-item">
          			<a class="nav-link active" aria-current="page" href="index.html">Home</a>
        		</li>
        		<li class="nav-item">
          			<a class="nav-link" href="CreateAndFind">Lista de Clientes</a>
        		</li>
      		</ul>
    	</div>
  	</div>
</nav>
<br>
<div class="container">
	<div class="row">
		<div class="cold-md-7">
			<hr>
			<h3>Clientes Cadastrados</h3>
			<hr>
			<table class="table">
				<thead>
					<tr>
						<th>ID</th>
						<th>Nome</th>
						<th>CPF</th>
						<th>Nascimento</th>
						<th>Situação</th>
					</tr>
				</thead>
				<tbody>
				    <%
                	    Connection connection = null;
                        Statement stmt = null;
                        ResultSet rs = null;
                        int idCliente = 0;

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
                            out.println("<td>" + rs.getString("nascimento") + "</td>");
                            out.println("<td>" + rs.getString("situacao") + "</td>");
                            out.println("<td>");
                            out.println("<a href=ClienteDestroy?clienteId=" + rs.getInt("id") + ">Deletar</a>");
                            out.println("</td>");
                            out.println("<td>");
                            out.println("</td>");

                            out.println("</tr>");
                        }
                        out.println("</table>");
                    %>
                    <a class="btn btn-primary" href=ClienteUpdate?clienteId=0>Atualizar Cliente</a>
				</tbody>
			</table>
			<br><br>
			<h5><a href="index.html">Voltar para o Cadastro de Clientes</a></h5>
		</div>
	</div>
</div>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>