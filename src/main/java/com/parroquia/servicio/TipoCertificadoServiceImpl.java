package com.parroquia.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parroquia.entidad.TipoCertificado;
import com.parroquia.repositorio.TipoCertificadoRepositorio;


@Service
public class TipoCertificadoServiceImpl implements TipoCertificadoService{

	@Autowired
	private TipoCertificadoRepositorio tipoCertificadoRepository;

	@Override
	public List<TipoCertificado> listaTipoCertificado() {
		return tipoCertificadoRepository.findAll();
	}

	

}
