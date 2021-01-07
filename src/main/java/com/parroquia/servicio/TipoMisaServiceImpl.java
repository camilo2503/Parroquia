package com.parroquia.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parroquia.entidad.TipoMisa;
import com.parroquia.repositorio.TipoMisaRepository;


@Service
public class TipoMisaServiceImpl implements TipoMisaService{

	@Autowired
	private TipoMisaRepository tipoUsuarioRepository;

	@Override
	public List<TipoMisa> listaTipoMisa() {
		return tipoUsuarioRepository.findAll();
	}

	

}
