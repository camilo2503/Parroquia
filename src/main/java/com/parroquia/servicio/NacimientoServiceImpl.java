package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parroquia.entidad.Nacimiento;
import com.parroquia.repositorio.NacimientoRepositorio;

@Service
public class NacimientoServiceImpl implements NacimientoService {
	
	@Autowired
	NacimientoRepositorio repositorio;

	@Override
	public Nacimiento insertaActualizaNacimiento(Nacimiento obj) {
		// TODO Auto-generated method stub
		return repositorio.save(obj);
	}

	@Override
	public void eliminaActivos(int id) {
		repositorio.deleteById(id);
		
	}

	@Override
	public List<Nacimiento> listarTodos() {
		// TODO Auto-generated method stub
		return repositorio.findAll();
	}

	@Override
	public List<Nacimiento> listarPorNombres(String filtro) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Optional<Nacimiento> buscarPorId(int id) {
		// TODO Auto-generated method stub
		return repositorio.findById(id);
	}
	

}
