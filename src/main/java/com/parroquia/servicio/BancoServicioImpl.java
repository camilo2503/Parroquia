package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parroquia.entidad.Banco;
import com.parroquia.repositorio.BancoRepositorio;
@Service
public class BancoServicioImpl implements BancoServicio {
	
	
	@Autowired
	private BancoRepositorio repositorio;
	

	@Override
	public Banco insertaActualizaBanco(Banco obj) {
		
		return repositorio.save(obj);
	}

	@Override
	public void eliminaBanco(int id) {
		repositorio.deleteById(id);
		
	}

	@Override
	public List<Banco> listarTodos() {
		
		return repositorio.findAll();
	}

	@Override
	public List<Banco> listarPorNombres(String filtro) {
		
		return null;
	}

	@Override
	public Optional<Banco> buscarPorId(int id) {
		
		return repositorio.findById(id);
	}

	@Override
	public List<Banco> listaTipoBanco() {
		
		return repositorio.findAll();
	}

}
