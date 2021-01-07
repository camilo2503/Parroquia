package com.parroquia.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.parroquia.entidad.Nacimiento;
import com.parroquia.servicio.NacimientoService;

@Controller
public class NacimientoController {
	
	@Autowired
	private NacimientoService service;
	
	
	@RequestMapping("/ingresonacimiento")
	public String verCrud(HttpSession session) {
		
		List<Nacimiento> lista = service.listarTodos();
		session.setAttribute("nacimiento", lista);
		return "nacimientos";
	}
	
	@RequestMapping("/consultaCrudNacimientos")
	public String consulta(String filtro, HttpSession session) {
		
			List<Nacimiento> lista = service.listarPorNombres(filtro+"%");
			session.setAttribute("nacimiento", lista);

		return "nacimientos";
		
	}
	
	@RequestMapping("/salidaNacimiento")
	public String salida(HttpSession session) {
		List<Nacimiento> lista = service.listarTodos();
		session.setAttribute("nacimiento", lista);
		return "redirect:ingresonacimiento";
	}
	
	@RequestMapping("/registraActualizaNacimientos")
	public String insertaActualiza(Nacimiento nacimiento, HttpSession session) {
		
		try {
			Nacimiento obj = service.insertaActualizaNacimiento(nacimiento);
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
		
		return "redirect:salidaNacimiento";
	}
	

}
