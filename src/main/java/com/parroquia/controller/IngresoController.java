package com.parroquia.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.parroquia.entidad.IngresoDinero;
import com.parroquia.servicio.IngresoService;

@Controller
public class IngresoController {
	@Autowired
	private IngresoService service;
	
	@RequestMapping("/ingresoDinero")
	public String verCrud(HttpSession session) {
		List<IngresoDinero> lista = service.listarTodos();
		session.setAttribute("ingresos", lista);
		return "ingresoDinero";
	}

	
	@RequestMapping("/consultaCrudingresoDinero")
	public String consulta(String filtro, HttpSession session) {
		
			List<IngresoDinero> lista = service.listarPorNombres(filtro+"%");
			session.setAttribute("ingresos", lista);

		return "ingresoDinero";
	}
	
	@RequestMapping("/salidaIngresos")
	public String salida(HttpSession session) {
		List<IngresoDinero> lista = service.listarTodos();
		session.setAttribute("ingresos", lista);
		return "ingresoDinero";
	}
	
	@RequestMapping("/registraActualizaingresoDinero")
	public String insertaActualiza(IngresoDinero ingreso, HttpSession session) {
		
		try {
			IngresoDinero obj = service.insertaActualizaIngresos(ingreso);
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
		
		return "redirect:salidaIngresos";
	}
	

}
