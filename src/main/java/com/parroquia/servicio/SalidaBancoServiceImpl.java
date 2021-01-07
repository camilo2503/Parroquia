package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parroquia.entidad.SalidaDineroBanco;
import com.parroquia.repositorio.SalidaDineroBancoRepositorio;
@Service
public class SalidaBancoServiceImpl implements SalidaBancoService {
	
	@Autowired
	SalidaDineroBancoRepositorio repositorio;

	@Override
	public SalidaDineroBanco insertaActualizaSalidaDinero(SalidaDineroBanco obj) {
		
		return repositorio.save(obj);
	}

	@Override
	public void eliminaSalidaBanco(int id) {
		repositorio.deleteById(id);
	}

	@Override
	public List<SalidaDineroBanco> listarTodos() {
		
		return repositorio.findAll();
	}

	@Override
	public List<SalidaDineroBanco> listarPorNombres(String filtro) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Optional<SalidaDineroBanco> buscarPorId(int id) {
	
		return repositorio.findById(id);
	}

	
	



}
