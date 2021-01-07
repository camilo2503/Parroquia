package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import com.parroquia.entidad.Pastoral;

public interface PastoralService {
	
	public abstract Pastoral insertaActualizaPastoral(Pastoral obj);
	public abstract void eliminaActivos(int id);
	public abstract List<Pastoral> listarTodos();
	public abstract List<Pastoral> listarPorNombres(String filtro);
	public abstract Optional<Pastoral> buscarPorId(int id);

}
