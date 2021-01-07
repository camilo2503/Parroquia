package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parroquia.entidad.IngresoDinero;
import com.parroquia.repositorio.IngresosRepositorio;
@Service
public class IngresoServicioImpl implements IngresoService{
	
	@Autowired
	private IngresosRepositorio repositorio;
	
	
	@Override
	public IngresoDinero insertaActualizaIngresos(IngresoDinero obj) {
		
		return repositorio.save(obj);
	}

	@Override
	public void eliminaIngresos(int id) {
		repositorio.deleteById(id);
		
	}

	@Override
	public List<IngresoDinero> listarTodos() {
		
		return repositorio.findAll();
	}

	@Override
	public List<IngresoDinero> listarPorNombres(String filtro) {
	
		return null;
	}

	@Override
	public Optional<IngresoDinero> buscarPorId(int id) {
		
		return repositorio.findById(id);
	}

}
