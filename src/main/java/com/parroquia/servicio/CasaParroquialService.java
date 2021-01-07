package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import com.parroquia.entidad.CasaParroquial;

public interface CasaParroquialService {
	
	public abstract CasaParroquial insertaActualizaCasaParroquial(CasaParroquial obj);
	public abstract void eliminaActivos(int id);
	public abstract List<CasaParroquial> listarTodos();
	public abstract List<CasaParroquial> listarPorNombres(String filtro);
	public abstract Optional<CasaParroquial> buscarPorId(int id);

}
