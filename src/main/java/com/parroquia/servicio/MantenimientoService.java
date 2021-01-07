package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import com.parroquia.entidad.Mantenimiento;

public interface MantenimientoService {
	
	public abstract Mantenimiento insertaActualizaMantenimiento(Mantenimiento obj);
	public abstract void eliminaMantenimiento(int id);
	public abstract List<Mantenimiento> listarMantenimientoEdificios();
	public abstract List<Mantenimiento> listarMantenimientoEquipos();
	public abstract List<Mantenimiento> listarPorNombresEdificios(String filtro);
	public abstract List<Mantenimiento> listarPorNombresEquipos(String filtro);
	public abstract Optional<Mantenimiento> buscarPorId(int id);

}
