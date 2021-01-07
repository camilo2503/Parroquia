package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parroquia.entidad.Estipendio;
import com.parroquia.repositorio.EstipendioRepositorio;

@Service
public class EstipendioServicioImpl implements EstipendioServicio {
	
	@Autowired
	EstipendioRepositorio repositorio;

	@Override
	public Estipendio insertaActualizaEstipendio(Estipendio obj) {
		// TODO Auto-generated method stub
		return repositorio.save(obj);
	}

	@Override
	public void eliminaEstipendio(int id) {
		repositorio.deleteById(id);
		
	}

	@Override
	public List<Estipendio> listarTodos() {
		// TODO Auto-generated method stub
		return repositorio.findAll();
	}

	@Override
	public List<Estipendio> listarPorNombres(String filtro) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Optional<Estipendio> buscarPorId(int id) {
		// TODO Auto-generated method stub
		return repositorio.findById(id);
	}
	

}
