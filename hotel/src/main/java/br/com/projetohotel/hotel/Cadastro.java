package br.com.projetohotel.hotel;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Cadastro")
public class Cadastro extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nome = request.getParameter("nome");

		Usuario usuario = new Usuario();
		usuario.setNome(nome);
		
		Banco banco = new Banco();
		banco.adiciona(usuario);
				
		RequestDispatcher rd = request.getRequestDispatcher("novoUsuario.jsp");
		request.setAttribute("usuario", usuario.getNome());
		rd.forward(request, response);
	}

}