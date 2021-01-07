package com.parroquia.servicio;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parroquia.entidad.Bautiso;
import com.parroquia.repositorio.BautisoRepositorio;
@Service
public class BautisoServicioImpl implements BautisoServicio {
	@Autowired
	private BautisoRepositorio repositorio;
	
	
	@Override
	public Bautiso insertaActualizaABautiso(Bautiso obj) {
		obj.setFechaactual(new Date());
		return repositorio.save(obj);
	}

	@Override
	public void eliminaBautiso(int id) {
		repositorio.deleteById(id);
		
	}

	@Override
	public List<Bautiso> listarTodos() {
		// TODO Auto-generated method stub
		return repositorio.findAll();
	}

	@Override
	public List<Bautiso> listarPorNombres(String filtro) {

		return null;
	}

	@Override
	public Optional<Bautiso> buscarPorId(int id) {
	
		return repositorio.findById(id);
	}

}
