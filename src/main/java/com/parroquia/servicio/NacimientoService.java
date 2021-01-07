package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import com.parroquia.entidad.Nacimiento;

public interface NacimientoService {
	
	public abstract Nacimiento insertaActualizaNacimiento(Nacimiento obj);
	public abstract void eliminaActivos(int id);
	public abstract List<Nacimiento> listarTodos();
	public abstract List<Nacimiento> listarPorNombres(String filtro);
	public abstract Optional<Nacimiento> buscarPorId(int id);

}
