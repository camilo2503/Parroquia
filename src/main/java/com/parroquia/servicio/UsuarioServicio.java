package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import com.parroquia.entidad.Opcion;
import com.parroquia.entidad.Rol;
import com.parroquia.entidad.Usuario;

public interface UsuarioServicio {

	public abstract Usuario login(Usuario bean);

	public abstract List<Opcion> traerEnlacesDeUsuario(int idUsuario);

	public abstract List<Rol> traerRolesDeUsuario(int idUsuario);
	
	public abstract List<Usuario> listarUsuario();
	
	public abstract Usuario insertaActualizaUsuario(Usuario usuario);
	
	public abstract void EliminarUsuario(int id);
	
	public Optional<Usuario> ObtenerUsuario(int id);

	public abstract List<Usuario> listarPorFiltro(String filtro);
	
}
