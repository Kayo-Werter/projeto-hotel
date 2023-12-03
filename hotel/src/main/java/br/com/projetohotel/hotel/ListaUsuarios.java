package br.com.projetohotel.hotel;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/listaUsuarios")
public class ListaUsuarios extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		Banco banco = new Banco();
		List<Usuario> listaUsuarios = banco.getUsuarios();
		
		request.setAttribute("usuarios", listaUsuarios);
		
		RequestDispatcher rd = request.getRequestDispatcher("/listaUsuarios.jsp");
		rd.forward(request, response);
	}
}