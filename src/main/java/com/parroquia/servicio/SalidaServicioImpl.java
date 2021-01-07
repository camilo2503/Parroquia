package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parroquia.entidad.SalidaDinero;
import com.parroquia.repositorio.SalidasRepositorio;
@Service
public class SalidaServicioImpl implements SalidaService {
	@Autowired
	SalidasRepositorio repositorio;
	
	
	
	@Override
	public SalidaDinero insertaActualizaSalidas(SalidaDinero obj) {
		
		return repositorio.save(obj);
	}

	@Override
	public void eliminaSalidas(int id) {
	 repositorio.deleteById(id);
		
	}

	@Override
	public List<SalidaDinero> listarTodos() {
	
		return repositorio.findAll();
	}

	@Override
	public List<SalidaDinero> listarPorNombres(String filtro) {
	
		return null;
	}

	@Override
	public Optional<SalidaDinero> buscarPorId(int id) {
		
		return repositorio.findById(id);
	}

}
