package br.com.projetohotel.hotel;

import java.util.ArrayList;
import java.util.List;

public class Banco {
	private static List<Usuario> listaUsuarios = new ArrayList<>();
	
	static {
		Usuario usuario = new Usuario();
		usuario.setNome("kayo");
		
		Usuario usuario1 = new Usuario();
		usuario1.setNome("china");
		Usuario usuario2 = new Usuario();
		usuario2.setNome("samuel");
		
		listaUsuarios.add(usuario);
		listaUsuarios.add(usuario1);
		listaUsuarios.add(usuario2);

	}

	
	public void adiciona(Usuario usuario) {
		listaUsuarios.add(usuario);
		
	}
	
	public List<Usuario> getUsuarios(){
		return Banco.listaUsuarios;
	}
	
	
	
	
	
}