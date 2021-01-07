package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parroquia.entidad.Alquiler;
import com.parroquia.repositorio.AlquilerRepositorio;

@Service
public class AlquilerServicioImpl implements AlquilerServicio {

	@Autowired
	private AlquilerRepositorio repositorio;
	
	@Override
	public Alquiler insertaActualizaAlquiler(Alquiler obj) {
		
		return repositorio.save(obj) ;
	}

	@Override
	public void eliminaAlquiler(int id) {
		repositorio.deleteById(id);
		
	}

	@Override
	public List<Alquiler> listarTodos() {
		// TODO Auto-generated method stub
		return repositorio.findAll();
	}

	@Override
	public List<Alquiler> listarPorNombres(String filtro) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Optional<Alquiler> buscarPorId(int id) {
		// TODO Auto-generated method stub
		return repositorio.findById(id);
	}

}
