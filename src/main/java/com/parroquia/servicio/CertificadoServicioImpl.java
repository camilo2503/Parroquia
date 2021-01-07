package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parroquia.entidad.Certificados;
import com.parroquia.repositorio.CertificadoRepositorio;
@Service
public class CertificadoServicioImpl implements CertificadoServicio {
	@Autowired
	private CertificadoRepositorio repositorio;
	
	
	@Override
	public Certificados insertaActualizaCertificado(Certificados obj) {
		
		return repositorio.save(obj);
	}

	@Override
	public void eliminaCertificado(int id) {
		repositorio.deleteById(id);
		
	}

	@Override
	public List<Certificados> listarTodos() {
		
		return repositorio.findAll();
	}

	@Override
	public List<Certificados> listarPorNombres(String filtro) {
		
		return null;
	}

	@Override
	public Optional<Certificados> buscarPorId(int id) {
		// TODO Auto-generated method stub
		return repositorio.findById(id);
	}

}
