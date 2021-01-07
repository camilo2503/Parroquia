package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parroquia.entidad.Pastoral;
import com.parroquia.repositorio.PastoralRepositorio;

@Service
public class PastoralServicioImpl implements PastoralService {
	
	@Autowired
	PastoralRepositorio repositorio;

	@Override
	public Pastoral insertaActualizaPastoral(Pastoral obj) {
		// TODO Auto-generated method stub
		return repositorio.save(obj);
	}

	@Override
	public void eliminaActivos(int id) {
		repositorio.deleteById(id);
		
	}

	@Override
	public List<Pastoral> listarTodos() {
		// TODO Auto-generated method stub
		return repositorio.findAll();
	}

	@Override
	public List<Pastoral> listarPorNombres(String filtro) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Optional<Pastoral> buscarPorId(int id) {
		// TODO Auto-generated method stub
		return repositorio.findById(id);
	}

}
