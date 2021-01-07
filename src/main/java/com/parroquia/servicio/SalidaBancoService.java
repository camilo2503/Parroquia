package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import com.parroquia.entidad.SalidaDineroBanco;

public interface SalidaBancoService {
	
	public abstract SalidaDineroBanco insertaActualizaSalidaDinero(SalidaDineroBanco obj);
	public abstract void eliminaSalidaBanco (int id);
	public abstract List<SalidaDineroBanco> listarTodos();
	public abstract List<SalidaDineroBanco> listarPorNombres(String filtro);
	public abstract Optional<SalidaDineroBanco> buscarPorId(int id);
	
	

}
