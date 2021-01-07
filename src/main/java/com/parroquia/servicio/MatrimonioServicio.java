package com.parroquia.servicio;

import java.io.ByteArrayInputStream;
import java.util.List;
import java.util.Optional;

import com.parroquia.entidad.Matrimonio;

public interface MatrimonioServicio {
	
	public abstract Matrimonio insertaActualizaMatrimonio(Matrimonio obj);
	public abstract void eliminaMatrimonio(int id);
	public abstract List<Matrimonio> listarTodos();
	public abstract List<Matrimonio> listarPorNombres(String filtro);
	public abstract Optional<Matrimonio> buscarPorId(int id);
	
	//************************************
	public ByteArrayInputStream exportAllDataMatrimonio() throws Exception;

}
