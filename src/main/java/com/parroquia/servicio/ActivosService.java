package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import com.parroquia.entidad.Activos;

public interface ActivosService {
	
	public abstract Activos insertaActualizaActivos(Activos obj);
	public abstract void eliminaActivos(int id);
	public abstract List<Activos> listarTodos();
	public abstract List<Activos> listarPorNombres(String filtro);
	public abstract Optional<Activos> buscarPorId(int id);

}
