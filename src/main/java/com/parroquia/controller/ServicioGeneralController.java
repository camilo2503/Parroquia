package com.parroquia.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.parroquia.entidad.ServiciosGenerales;
import com.parroquia.servicio.ServicioGeneralService;

@Controller
public class ServicioGeneralController {
	@Autowired
	private ServicioGeneralService service;
	
	
	
	@RequestMapping("/serviciosGenerales")
	public String verCrud(HttpSession session) {
		List<ServiciosGenerales> lista = service.listarTodos();
		session.setAttribute("serviciosgenerales", lista);
		return "crudServiciosGenerales";
	}
	

	
	@RequestMapping("/consultaCrudServicios")
	public String consulta(String filtro, HttpSession session) {
		
			List<ServiciosGenerales> lista = service.listarPorNombres(filtro+"%");
			session.setAttribute("serviciosgenerales", lista);

		return "crudServiciosGenerales";
	}
	
	@RequestMapping("/salidaServicios")
	public String salida(HttpSession session) {
		List<ServiciosGenerales> lista = service.listarTodos();
		session.setAttribute("serviciosgenerales", lista);
		return "crudServiciosGenerales";
	}
	
	@RequestMapping("/registraActualizaCrudServiciosGenerales")
	public String insertaActualiza(ServiciosGenerales servicios, HttpSession session) {
		
		try {
			ServiciosGenerales obj = service.insertaActualizaServiciosGenerales(servicios);
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
		
		return "redirect:salidaServicios";
	}
	

}
