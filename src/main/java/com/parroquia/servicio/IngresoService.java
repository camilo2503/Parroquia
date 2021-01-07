package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import com.parroquia.entidad.IngresoDinero;

public interface IngresoService {
	
	public abstract IngresoDinero insertaActualizaIngresos(IngresoDinero obj);
	public abstract void eliminaIngresos(int id);
	public abstract List<IngresoDinero> listarTodos();
	public abstract List<IngresoDinero> listarPorNombres(String filtro);
	public abstract Optional<IngresoDinero> buscarPorId(int id);

}
