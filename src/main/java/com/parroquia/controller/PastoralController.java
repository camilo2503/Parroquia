package com.parroquia.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.parroquia.entidad.Pastoral;
import com.parroquia.servicio.PastoralService;

@Controller
public class PastoralController {
	
	@Autowired
	private PastoralService service;
	
	
	@RequestMapping("/ingresopastoral")
	public String verCrud(HttpSession session) {
		
		List<Pastoral> lista = service.listarTodos();
		session.setAttribute("pastoral", lista);
		return "pastoral";
	}
	
	@RequestMapping("/consultaCrudPastoral")
	public String consulta(String filtro, HttpSession session) {
		
			List<Pastoral> lista = service.listarPorNombres(filtro+"%");
			session.setAttribute("pastoral", lista);

		return "pastoral";
		
	}
	
	@RequestMapping("/salidaPastoral")
	public String salida(HttpSession session) {
		List<Pastoral> lista = service.listarTodos();
		session.setAttribute("pastoral", lista);
		return "redirect:ingresopastoral";
	}
	
	@RequestMapping("/registraActualizaPastoral")
	public String insertaActualiza(Pastoral pastoral, HttpSession session) {
		
		try {
			Pastoral obj = service.insertaActualizaPastoral(pastoral);
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
		
		return "redirect:salidaPastoral";
	}
	

}
