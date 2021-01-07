package com.parroquia.servicio;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parroquia.entidad.Opcion;
import com.parroquia.entidad.Rol;
import com.parroquia.entidad.Usuario;
import com.parroquia.repositorio.UsuarioRepositorio;

@Service
public class UsuarioServicioImpl implements UsuarioServicio{

	@Autowired
	private UsuarioRepositorio repositorio;
	
	@Override
	public Usuario login(Usuario bean) {
		return repositorio.login(bean);
	}

	@Override
	public List<Opcion> traerEnlacesDeUsuario(int idUsuario) {
		return repositorio.traerEnlacesDeUsuario(idUsuario);
	}

	@Override
	public List<Rol> traerRolesDeUsuario(int idUsuario) {
		return repositorio.traerRolesDeUsuario(idUsuario);
	}

	@Override
	public List<Usuario> listarUsuario() {
		return repositorio.findAll();
	}

	@Override
	public Usuario insertaActualizaUsuario(Usuario usuario) {
		usuario.setFechaRegistro(new Date());
		return repositorio.save(usuario);
	}

	@Override
	public void EliminarUsuario(int id) {
		repositorio.deleteById(id);
		
	}

	@Override
	public Optional<Usuario> ObtenerUsuario(int id) {
		return repositorio.findById(id);
	}

	@Override
	public List<Usuario> listarPorFiltro(String filtro) {
		// TODO Auto-generated method stub
		return repositorio.listaPorNombre(filtro);
	}

}
