package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import com.parroquia.entidad.SemanaSanta;

public interface SemanaSantaService {
	
	public abstract SemanaSanta insertaActualizaSemanaSanta(SemanaSanta obj);
	public abstract void eliminaActivos(int id);
	public abstract List<SemanaSanta> listarTodos();
	public abstract List<SemanaSanta> listarPorNombres(String filtro);
	public abstract Optional<SemanaSanta> buscarPorId(int id);

}
