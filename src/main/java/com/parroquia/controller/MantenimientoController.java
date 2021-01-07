package com.parroquia.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.parroquia.entidad.Mantenimiento;
import com.parroquia.servicio.MantenimientoService;

@Controller
public class MantenimientoController {
	@Autowired
	private MantenimientoService service;
	
	@RequestMapping("/mantenimientoEdificio")
	public String verCrud(HttpSession session) {
		List<Mantenimiento> lista = service.listarMantenimientoEdificios();
		session.setAttribute("mantenimientoed", lista);
		return "mantenimientoEdificio";
	}

	
	@RequestMapping("/consultaCrudMantenimientoEdificios")
	public String consulta(String filtro, HttpSession session) {
		
			List<Mantenimiento> lista = service.listarPorNombresEdificios(filtro+"%");
			session.setAttribute("mantenimientoed", lista);

		return "mantenimientoEdificio";
	}
	
	@RequestMapping("/salidaMantenimientoEdificios")
	public String salida(HttpSession session) {
		List<Mantenimiento> lista = service.listarMantenimientoEdificios();
		session.setAttribute("mantenimientoed", lista);
		return "mantenimientoEdificio";
	}
	
	@RequestMapping("/registraActualizaCrudMantenimiento")
	public String insertaActualizaEdificios(Mantenimiento mantenimientoed, HttpSession session) {
		try {
			if(mantenimientoed.getTipo()==null) {
				mantenimientoed.setTipo("1");
			}
			Mantenimiento obj = service.insertaActualizaMantenimiento(mantenimientoed);
			if(obj == null) {
				session.setAttribute("MENSAJE", "Error al insertar o actualizar");
			}
			else {
				session.setAttribute("MENSAJE", "Insertado y actualizado correctamente");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("MENSAJE", "Error al intertar o actualizar");
		}
		
		return "redirect:salidaMantenimientoEdificios";
	}
	/***********************************MantenimientoEquipos*****************************************************************************/

	@RequestMapping("/mantenimientoEquipos")
	public String PrincipalEquipos(HttpSession session) {
		List<Mantenimiento> lista = service.listarMantenimientoEquipos();
		session.setAttribute("mantenimientoed", lista);
		return "mantenimientoEquipos";
	}

	@RequestMapping("/consultaCrudMantenimientoEquipos")
	public String consultaEquipos(String filtro, HttpSession session) {
		
			List<Mantenimiento> lista = service.listarPorNombresEquipos(filtro+"%");
			session.setAttribute("mantenimientoed", lista);

		return "mantenimientoEdificio";
	}
	
	@RequestMapping("/salidaMantenimientoEquipos")
	public String salidaEquipos(HttpSession session) {
		List<Mantenimiento> lista = service.listarMantenimientoEquipos();
		session.setAttribute("mantenimientoed", lista);
		return "mantenimientoEquipos";
	}
	
	@RequestMapping("/registraActualizaCrudMantenimientoEquipos")
	public String insertaActualizaEquipos(Mantenimiento mantenimientoed, HttpSession session) {
		
		try {
			if(mantenimientoed.getTipo()==null) {
				mantenimientoed.setTipo("2");
			}
			Mantenimiento obj = service.insertaActualizaMantenimiento(mantenimientoed);
			if(obj == null) {
				session.setAttribute("MENSAJE", "Error al insertar o actualizar");
			}
			else {
				session.setAttribute("MENSAJE", "Insertado y actualizado correctamente");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("MENSAJE", "Error al intertar o actualizar");
		}
		
		return "redirect:salidaMantenimientoEquipos";
	}
	
	
}
