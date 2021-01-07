package com.parroquia.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.parroquia.entidad.Planilla;
import com.parroquia.entidad.Trabajador;
import com.parroquia.servicio.PlanillaServicio;
import com.parroquia.servicio.TrabajadorServicio;

@Controller
public class PlanillaController {
	
	@Autowired
	private PlanillaServicio  planillaServicio;
	
	
	@Autowired
	private TrabajadorServicio trabajadorService;
	

	@RequestMapping("/crudPlanilla")
	public String crudUsuario(HttpSession session) { 
		List<Planilla> data = planillaServicio.listarPlanillaTodos();
		session.setAttribute("planilla", data);
		return "crudPlanilla"; }
	
	
	
	@RequestMapping("/listaTrabajador")
	@ResponseBody
	public List<Trabajador> listaTipoUsu(){
		return trabajadorService.listaTrabajador();
	}
	
	
	@RequestMapping("/consultaCrudPlanilla")
	public String consulta(String filtro, HttpSession session) {
		
		if(filtro != null) {
		List<Planilla> lista = planillaServicio.listarPorFiltro(filtro+"%");
		session.setAttribute("planilla", lista);
		}
		else 
		{
			List<Planilla> lista = planillaServicio.listarPlanillaTodos();
			session.setAttribute("planilla", lista);
		}
		return "crudPlanilla";
	}
	
	@RequestMapping("/registraActualizaCrudPlanilla")
	public String insertaUsuario(Planilla planilla,HttpSession session) 
	{
		try {


			Planilla obj = planillaServicio.insertaActualizaPlanilla(planilla);
		if(obj!=null)
			{
			session.setAttribute("MENSAJE", "Se registro correctamente");
			}
		else 
			{
			session.setAttribute("MENSAJE", "Error al registrar");
			}
		} catch (Exception e) {
			session.setAttribute("MENSAJE", "Error al registrar");
		}
		return "redirect:consultaCrudPlanilla";
	}
	

	
}
