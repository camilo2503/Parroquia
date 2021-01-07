package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parroquia.entidad.Proveedor;
import com.parroquia.repositorio.ProveedorRepositorio;
@Service
public class ProveedorServicioImpl implements ProveedorServicio {
	@Autowired
	ProveedorRepositorio repositorio;
	
	
	@Override
	public Proveedor insertaActualizaProveedor(Proveedor obj) {
		
		return repositorio.save(obj);
	}

	@Override
	public void eliminaProveedor(int id) {
		repositorio.deleteById(id);
		
	}

	@Override
	public List<Proveedor> listarTodos() {
		
		return repositorio.findAll();
	}

	@Override
	public List<Proveedor> listarPorNombres(String filtro) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Optional<Proveedor> buscarPorId(int id) {
	
		return repositorio.findById(id);
	}
	
	

}
