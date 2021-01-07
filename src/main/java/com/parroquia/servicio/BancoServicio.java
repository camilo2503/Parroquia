package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import com.parroquia.entidad.Banco;

public interface BancoServicio {
	
	public abstract Banco insertaActualizaBanco(Banco obj);
	public abstract void eliminaBanco(int id);
	public abstract List<Banco> listarTodos();
	public abstract List<Banco> listarPorNombres(String filtro);
	public abstract Optional<Banco> buscarPorId(int id);
	
	
	public abstract List<Banco> listaTipoBanco();

}
