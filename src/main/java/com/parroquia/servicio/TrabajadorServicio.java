package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import com.parroquia.entidad.Trabajador;

public interface TrabajadorServicio {
	
	public abstract Trabajador insertaActualizaTrabajador(Trabajador obj);
	public abstract void eliminaTrabajador(int id);
	public abstract List<Trabajador> listarTodos();
	public abstract List<Trabajador> listarPorNombres(String filtro);
	public abstract Optional<Trabajador> buscarPorId(int id);
	
	
	
	public abstract List<Trabajador> listaTrabajador();

}
