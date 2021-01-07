package com.parroquia.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parroquia.entidad.TipoUsuario;
import com.parroquia.repositorio.TipoUsuarioRepository;


@Service
public class TipoUsuarioServiceImpl implements TipoUsuarioService{

	@Autowired
	private TipoUsuarioRepository tipoUsuarioRepository;

	@Override
	public List<TipoUsuario> listaTipoUsuario() {
		return tipoUsuarioRepository.findAll();
	}

	

}
