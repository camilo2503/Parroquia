package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import com.parroquia.entidad.Proveedor;

public interface ProveedorServicio {
	
	public abstract Proveedor insertaActualizaProveedor(Proveedor obj);
	public abstract void eliminaProveedor(int id);
	public abstract List<Proveedor> listarTodos();
	public abstract List<Proveedor> listarPorNombres(String filtro);
	public abstract Optional<Proveedor> buscarPorId(int id);

}
