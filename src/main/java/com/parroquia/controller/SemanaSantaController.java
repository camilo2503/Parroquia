package com.parroquia.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.parroquia.entidad.SemanaSanta;
import com.parroquia.servicio.SemanaSantaService;

@Controller
public class SemanaSantaController {
	
	@Autowired
	private SemanaSantaService service;
	
	
	@RequestMapping("/semanasanta")
	public String verCrud(HttpSession session) {
		
		List<SemanaSanta> lista = service.listarTodos();
		session.setAttribute("semanasanta", lista);
		return "semanaSanta";
	}
	
	@RequestMapping("/consultaCrudSemanaSanta")
	public String consulta(String filtro, HttpSession session) {
		
			List<SemanaSanta> lista = service.listarPorNombres(filtro+"%");
			session.setAttribute("semanasanta", lista);

		return "semanaSanta";
		
	}
	
	@RequestMapping("/salidaSemana")
	public String salida(HttpSession session) {
		List<SemanaSanta> lista = service.listarTodos();
		session.setAttribute("semanasanta", lista);
		return "semanaSanta";
	}
	
	@RequestMapping("/registraActualizaSemanaSanta")
	public String insertaActualiza(SemanaSanta semana, HttpSession session) {
		
		try {
			SemanaSanta obj = service.insertaActualizaSemanaSanta(semana);
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
		
		return "redirect:salidaSemana";
	}
	

}
