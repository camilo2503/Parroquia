package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parroquia.entidad.Mantenimiento;
import com.parroquia.repositorio.MantenimientoRepositorio;
@Service
public class MantenimientoServicioImpl implements MantenimientoService {
	@Autowired
	private MantenimientoRepositorio repositorio;
	
	
	@Override
	public Mantenimiento insertaActualizaMantenimiento(Mantenimiento obj) {
		
		return repositorio.save(obj);
	}

	@Override
	public void eliminaMantenimiento(int id) {
		repositorio.deleteById(id);
		
	}

	@Override
	public List<Mantenimiento> listarPorNombresEdificios(String filtro) {
		
		return repositorio.listaPorNombreEdificios(filtro);
	}
	@Override
	public List<Mantenimiento> listarPorNombresEquipos(String filtro) {
		
		return repositorio.listaPorNombreEquipos(filtro);
	}

	@Override
	public Optional<Mantenimiento> buscarPorId(int id) {
		
		return repositorio.findById(id);
	}
	

	@Override
	public List<Mantenimiento> listarMantenimientoEdificios() {
		// TODO Auto-generated method stub
		return repositorio.listaEdificios();
	}

	@Override
	public List<Mantenimiento> listarMantenimientoEquipos() {
		// TODO Auto-generated method stub
		return repositorio.listaEquipos();
	}

}
