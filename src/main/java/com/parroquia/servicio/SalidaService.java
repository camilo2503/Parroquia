package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import com.parroquia.entidad.SalidaDinero;

public interface SalidaService {
	
	public abstract SalidaDinero insertaActualizaSalidas(SalidaDinero obj);
	public abstract void eliminaSalidas(int id);
	public abstract List<SalidaDinero> listarTodos();
	public abstract List<SalidaDinero> listarPorNombres(String filtro);
	public abstract Optional<SalidaDinero> buscarPorId(int id);

}
