package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parroquia.entidad.ServiciosGenerales;
import com.parroquia.repositorio.ServiciosGeneralesRepositorio;
@Service
public class ServicioGeneralServiceImpl implements ServicioGeneralService {

	@Autowired
	ServiciosGeneralesRepositorio repositorio;
	
	
	@Override
	public ServiciosGenerales insertaActualizaServiciosGenerales(ServiciosGenerales obj) {
	
		return repositorio.save(obj);
	}

	@Override
	public void eliminaServicioGeneral(int id) {
		repositorio.deleteById(id);
		
	}

	@Override
	public List<ServiciosGenerales> listarTodos() {
		// TODO Auto-generated method stub
		return repositorio.findAll();
	}

	@Override
	public List<ServiciosGenerales> listarPorNombres(String filtro) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Optional<ServiciosGenerales> buscarPorId(int id) {
		// TODO Auto-generated method stub
		return repositorio.findById(id);
	}

}
