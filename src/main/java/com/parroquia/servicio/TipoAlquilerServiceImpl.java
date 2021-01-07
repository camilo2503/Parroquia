package com.parroquia.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parroquia.entidad.TipoAlquiler;
import com.parroquia.repositorio.TipoAlquilerRepositorio;


@Service
public class TipoAlquilerServiceImpl implements TipoAlquilerService{

	@Autowired
	private TipoAlquilerRepositorio tipoAlquilerRepository;

	@Override
	public List<TipoAlquiler> listaTipoAlquiler(){
		return tipoAlquilerRepository.findAll();
	}

	

}
