package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parroquia.entidad.AyudaSocial;
import com.parroquia.repositorio.AyudaSocialRepositorio;

@Service
public class AyudaSocialServiceImpl implements AyudaSocialService {
	
	@Autowired
	AyudaSocialRepositorio repositorio;

	@Override
	public AyudaSocial insertaActualizaAyudaSocial(AyudaSocial obj) {
		// TODO Auto-generated method stub
		return repositorio.save(obj);
	}

	@Override
	public void eliminaActivos(int id) {
		repositorio.deleteById(id);
		
	}

	@Override
	public List<AyudaSocial> listarTodos() {
		
		return repositorio.findAll();
	}

	@Override
	public List<AyudaSocial> listarPorNombres(String filtro) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Optional<AyudaSocial> buscarPorId(int id) {
		// TODO Auto-generated method stub
		return repositorio.findById(id);
	}

}
