package com.parroquia.servicio;

import java.io.ByteArrayInputStream;
import java.util.List;
import java.util.Optional;

import com.parroquia.entidad.Misas;

public interface MisaServicio {
	
	public abstract Misas insertaActualizaMisas(Misas obj);
	public abstract void eliminaMisas(int id);
	public abstract List<Misas> listarTodos();
	public abstract List<Misas> listarPorNombres(String filtro);
	public abstract Optional<Misas> buscarPorId(int id);
	
	
	
	//**************************
	public ByteArrayInputStream exportAllData() throws Exception;

}
