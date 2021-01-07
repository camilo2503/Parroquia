package com.parroquia.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.parroquia.entidad.SalidaDinero;
import com.parroquia.servicio.SalidaService;

@Controller
public class SalidaController {
	@Autowired
	private SalidaService service;
	
	@RequestMapping("/salidaDinero")
	public String verCrud(HttpSession session) {
		List<SalidaDinero> lista = service.listarTodos();
		session.setAttribute("salidas", lista);
		return "salidaDinero";
	}

	
	@RequestMapping("/consultaCrudsalidaDinero")
	public String consulta(String filtro, HttpSession session) {
		
			List<SalidaDinero> lista = service.listarPorNombres(filtro+"%");
			session.setAttribute("salidas", lista);

		return "salidaDinero";
	}
	
	@RequestMapping("/salidaSalidas")
	public String salida(HttpSession session) {
		List<SalidaDinero> lista = service.listarTodos();
		session.setAttribute("salidas", lista);
		return "salidaDinero";
	}
	
	@RequestMapping("/registraActualizasalidaDinero")
	public String insertaActualiza(SalidaDinero salida, HttpSession session) {
		
		try {
			SalidaDinero obj = service.insertaActualizaSalidas(salida);
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
		
		return "redirect:salidaSalidas";
	}
	

}
