package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parroquia.entidad.CasaParroquial;
import com.parroquia.repositorio.CasaParroquialRepositorio;
@Service
public class CasaParroquialServicioImpl implements CasaParroquialService {
	@Autowired
	CasaParroquialRepositorio repositorio;
	
	
	
	@Override
	public CasaParroquial insertaActualizaCasaParroquial(CasaParroquial obj) {
		// TODO Auto-generated method stub
		return repositorio.save(obj);
	}

	@Override
	public void eliminaActivos(int id) {
		repositorio.deleteById(id);
		
	}

	@Override
	public List<CasaParroquial> listarTodos() {
		
		return repositorio.findAll();
	}

	@Override
	public List<CasaParroquial> listarPorNombres(String filtro) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Optional<CasaParroquial> buscarPorId(int id) {
		
		return repositorio.findById(id);
	}

}
