package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parroquia.entidad.Trabajador;
import com.parroquia.repositorio.TrabajadorRepositorio;

@Service
public class TrabajadorServicioImpl implements TrabajadorServicio {

	@Autowired
	private TrabajadorRepositorio repositorio;
	
	
	@Override
	public Trabajador insertaActualizaTrabajador(Trabajador obj) {
		
		return repositorio.save(obj);
	}

	@Override
	public void eliminaTrabajador(int id) {
		repositorio.deleteById(id);
		
	}

	@Override
	public List<Trabajador> listarTodos() {
		
		return repositorio.findAll();
	}

	@Override
	public List<Trabajador> listarPorNombres(String filtro) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Optional<Trabajador> buscarPorId(int id) {
		
		return repositorio.findById(id);
	}

	@Override
	public List<Trabajador> listaTrabajador() {
		
		return repositorio.findAll();
	}

}
