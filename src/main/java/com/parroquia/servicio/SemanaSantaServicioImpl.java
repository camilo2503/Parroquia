package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parroquia.entidad.SemanaSanta;
import com.parroquia.repositorio.SemanaSantaRepositorio;

@Service
public class SemanaSantaServicioImpl implements SemanaSantaService {

	@Autowired
	SemanaSantaRepositorio repositorio;
	
	
	@Override
	public SemanaSanta insertaActualizaSemanaSanta(SemanaSanta obj) {
		// TODO Auto-generated method stub
		return repositorio.save(obj);
	}

	@Override
	public void eliminaActivos(int id) {
		// TODO Auto-generated method stub
		repositorio.deleteById(id);
		
	}

	@Override
	public List<SemanaSanta> listarTodos() {
		// TODO Auto-generated method stub
		return repositorio.findAll();
	}

	@Override
	public List<SemanaSanta> listarPorNombres(String filtro) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Optional<SemanaSanta> buscarPorId(int id) {
		// TODO Auto-generated method stub
		return repositorio.findById(id);
	}

}
