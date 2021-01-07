package com.parroquia.servicio;

import java.util.List;
import java.util.Optional;

import com.parroquia.entidad.Planilla;

public interface PlanillaServicio {

	
	public abstract List<Planilla> listarPlanillaTodos();
	
	public abstract Planilla insertaActualizaPlanilla(Planilla planilla);
	
	public abstract void EliminarPlanilla(int id);
	
	public Optional<Planilla> buscarPorId(int id);

	public abstract List<Planilla> listarPorFiltro(String filtro);
	
}
