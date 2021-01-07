package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parroquia.entidad.Planilla;
import com.parroquia.repositorio.PlanillaRepositorio;

@Service
public class PlanillaServicioImpl implements PlanillaServicio {
	
	@Autowired
	private PlanillaRepositorio repositorio;

	@Override
	public List<Planilla> listarPlanillaTodos() {
		
	 return repositorio.findAll();
	}

	@Override
	public Planilla insertaActualizaPlanilla(Planilla planilla) {
		
		return repositorio.save(planilla);
	}

	@Override
	public void EliminarPlanilla(int id) {
		repositorio.deleteById(id);
		
	}

	@Override
	public Optional<Planilla> buscarPorId(int id) {
		
		return repositorio.findById(id);
	}

	@Override
	public List<Planilla> listarPorFiltro(String filtro) {
		
		return null;
	}

}
