package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import com.parroquia.entidad.Alquiler;

public interface AlquilerServicio {
	
	public abstract Alquiler insertaActualizaAlquiler(Alquiler obj);
	public abstract void eliminaAlquiler(int id);
	public abstract List<Alquiler> listarTodos();
	public abstract List<Alquiler> listarPorNombres(String filtro);
	public abstract Optional<Alquiler> buscarPorId(int id);

}
