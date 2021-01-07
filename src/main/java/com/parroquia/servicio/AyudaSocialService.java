package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import com.parroquia.entidad.AyudaSocial;

public interface AyudaSocialService {
	
	public abstract AyudaSocial insertaActualizaAyudaSocial(AyudaSocial obj);
	public abstract void eliminaActivos(int id);
	public abstract List<AyudaSocial> listarTodos();
	public abstract List<AyudaSocial> listarPorNombres(String filtro);
	public abstract Optional<AyudaSocial> buscarPorId(int id);

}
