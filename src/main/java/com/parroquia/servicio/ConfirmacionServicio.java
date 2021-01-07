package com.parroquia.servicio;

import java.io.ByteArrayInputStream;
import java.util.List;
import java.util.Optional;

import com.parroquia.entidad.Confirmacion;

public interface ConfirmacionServicio {
	
	public abstract Confirmacion insertaActualizaConfirmacion(Confirmacion obj);
	public abstract void eliminaConfirmacion(int id);
	public abstract List<Confirmacion> listarTodos();
	public abstract List<Confirmacion> listarPorNombres(String filtro);
	public abstract Optional<Confirmacion> buscarPorId(int id);
	
	//***************************
	public ByteArrayInputStream exportAllDataConfirmacion() throws Exception;

}
