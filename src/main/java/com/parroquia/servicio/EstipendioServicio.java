package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import com.parroquia.entidad.Estipendio;

public interface EstipendioServicio {
	
	public abstract Estipendio insertaActualizaEstipendio(Estipendio obj);
	public abstract void eliminaEstipendio(int id);
	public abstract List<Estipendio> listarTodos();
	public abstract List<Estipendio> listarPorNombres(String filtro);
	public abstract Optional<Estipendio> buscarPorId(int id);

}
