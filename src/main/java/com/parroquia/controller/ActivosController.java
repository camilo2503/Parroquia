package com.parroquia.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.parroquia.entidad.Activos;
import com.parroquia.servicio.ActivosService;

@Controller
public class ActivosController {
	
	@Autowired
	private ActivosService service;
	
	
	@RequestMapping("/adquisicionActivos")
	public String verCrud(HttpSession session) {
		
		List<Activos> lista = service.listarTodos();
		session.setAttribute("activos", lista);
		return "adquisicionActivos";
	}
	
	@RequestMapping("/consultaCrudActivos")
	public String consulta(String filtro, HttpSession session) {
		
			List<Activos> lista = service.listarPorNombres(filtro+"%");
			session.setAttribute("activos", lista);

		return "adquisicionActivos";
	}
	
	@RequestMapping("/salidaActivos")
	public String salida(HttpSession session) {
		List<Activos> lista = service.listarTodos();
		session.setAttribute("activos", lista);
		return "adquisicionActivos";
	}
	
	@RequestMapping("/registraActualizaActivos")
	public String insertaActualiza(Activos activos, HttpSession session) {
		
		try {
			Activos obj = service.insertaActualizaActivos(activos);
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
		
		return "redirect:salidaActivos";
	}
	

}
