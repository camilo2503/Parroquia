package com.parroquia.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.parroquia.entidad.AyudaSocial;
import com.parroquia.servicio.AyudaSocialService;

@Controller
public class AyudaSocialController {
	
	@Autowired
	private AyudaSocialService service;
	
	
	@RequestMapping("/ayudasocial")
	public String verCrud(HttpSession session) {
		
		List<AyudaSocial> lista = service.listarTodos();
		session.setAttribute("ayuda", lista);
		return "ayudaSocial";
	}
	
	@RequestMapping("/consultaCrudAyudaSocial")
	public String consulta(String filtro, HttpSession session) {
		
			List<AyudaSocial> lista = service.listarPorNombres(filtro+"%");
			session.setAttribute("ayuda", lista);

		return "ayudaSocial";
		
	}
	
	@RequestMapping("/salidaAyudaSocial")
	public String salida(HttpSession session) {
		List<AyudaSocial> lista = service.listarTodos();
		session.setAttribute("ayuda", lista);
		return "redirect:ayudasocial";
	}
	
	@RequestMapping("/registraActualizaAyudaSocial")
	public String insertaActualiza(AyudaSocial social, HttpSession session) {
		
		try {
			AyudaSocial obj = service.insertaActualizaAyudaSocial(social);
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
		
		return "redirect:salidaAyudaSocial";
	}
	

}
