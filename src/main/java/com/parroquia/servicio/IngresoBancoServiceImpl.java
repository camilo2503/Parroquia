package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parroquia.entidad.IngresoDineroBanco;
import com.parroquia.repositorio.IngresoDineroBancoRepositorio;
@Service
public class IngresoBancoServiceImpl implements IngresoBancoService {
	
	@Autowired
	IngresoDineroBancoRepositorio repositorio;
	

	@Override
	public IngresoDineroBanco insertaActualizaIngresosBanco(IngresoDineroBanco obj) {
		
		return repositorio.save(obj);
	}

	@Override
	public void eliminaIngresosBanco(int id) {
		repositorio.deleteById(id);
		
	}

	@Override
	public List<IngresoDineroBanco> listarTodos() {
		
		return repositorio.findAll();
	}

	@Override
	public List<IngresoDineroBanco> listarPorNombres(String filtro) {
		
		return null;
	}

	@Override
	public Optional<IngresoDineroBanco> buscarPorId(int id) {
		
		return repositorio.findById(id);
	}

}
