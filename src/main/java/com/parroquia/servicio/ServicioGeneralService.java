package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import com.parroquia.entidad.ServiciosGenerales;

public interface ServicioGeneralService {
	
	public abstract ServiciosGenerales insertaActualizaServiciosGenerales(ServiciosGenerales obj);
	public abstract void eliminaServicioGeneral (int id);
	public abstract List<ServiciosGenerales> listarTodos();
	public abstract List<ServiciosGenerales> listarPorNombres(String filtro);
	public abstract Optional<ServiciosGenerales> buscarPorId(int id);
	
	

}
