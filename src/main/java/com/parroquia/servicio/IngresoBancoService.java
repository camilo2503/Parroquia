package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import com.parroquia.entidad.IngresoDineroBanco;

public interface IngresoBancoService {
	
	public abstract IngresoDineroBanco insertaActualizaIngresosBanco(IngresoDineroBanco obj);
	public abstract void eliminaIngresosBanco (int id);
	public abstract List<IngresoDineroBanco> listarTodos();
	public abstract List<IngresoDineroBanco> listarPorNombres(String filtro);
	public abstract Optional<IngresoDineroBanco> buscarPorId(int id);
	
	

}
