package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import com.parroquia.entidad.Bautiso;

public interface BautisoServicio {
	
	public abstract Bautiso insertaActualizaABautiso(Bautiso obj);
	public abstract void eliminaBautiso(int id);
	public abstract List<Bautiso> listarTodos();
	public abstract List<Bautiso> listarPorNombres(String filtro);
	public abstract Optional<Bautiso> buscarPorId(int id);

}
