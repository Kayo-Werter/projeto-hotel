<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CRUD Java - Atualizar Cliente</title>
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
        				    out.println("<input name='nascimento' type='date' class='form-control'>");
        					out.println("<label>Nascimento</label>");
        				out.println("</div>");
        				out.println("<select name='situacao' class='form-select mb-4' aria-label='Default select example'>");
        					out.println("<option value='Inativo' selected>-- Selecione a situação:</option>");
        					out.println("<option value='Ativo'>Ativo</option>");
        					out.println("<option value='Inativo'>Inativo</option>");
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
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>