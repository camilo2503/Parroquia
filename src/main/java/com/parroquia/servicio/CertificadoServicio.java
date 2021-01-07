package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import com.parroquia.entidad.Certificados;

public interface CertificadoServicio {
	
	public abstract Certificados insertaActualizaCertificado(Certificados obj);
	public abstract void eliminaCertificado(int id);
	public abstract List<Certificados> listarTodos();
	public abstract List<Certificados> listarPorNombres(String filtro);
	public abstract Optional<Certificados> buscarPorId(int id);

}
