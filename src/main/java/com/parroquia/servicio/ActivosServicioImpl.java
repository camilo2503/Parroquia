package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parroquia.entidad.Activos;
import com.parroquia.repositorio.ActivosRepositorio;
@Service
public class ActivosServicioImpl implements ActivosService {
	@Autowired
	private ActivosRepositorio repositorio;
	
	
	@Override
	public Activos insertaActualizaActivos(Activos obj) {
		
		return repositorio.save(obj);
	}

	@Override
	public void eliminaActivos(int id) {
		repositorio.deleteById(id);
		
	}
	@Override
	public List<Activos> listarTodos() {
		
		return repositorio.findAll();
	}

	@Override
	public List<Activos> listarPorNombres(String filtro) {
		
		return repositorio.listaPorNombre(filtro);
	}

	@Override
	public Optional<Activos> buscarPorId(int id) {
		
		return repositorio.findById(id);
	}
	
}
