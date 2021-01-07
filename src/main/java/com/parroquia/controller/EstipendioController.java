package com.parroquia.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.parroquia.entidad.Estipendio;
import com.parroquia.servicio.EstipendioServicio;

@Controller
public class EstipendioController {
	
	@Autowired
	private EstipendioServicio service;
	
	
	@RequestMapping("/ingresoestipendio")
	public String verCrud(HttpSession session) {
		
		List<Estipendio> lista = service.listarTodos();
		session.setAttribute("estipendio", lista);
		return "ingresaestipendio";
	}
	
	
	
	
	@RequestMapping("/consultaCrudEstipendio")
	public String consulta(String filtro, HttpSession session) {
		
			List<Estipendio> lista = service.listarPorNombres(filtro+"%");
			session.setAttribute("estipendio", lista);

		return "ingresaestipendio";
	}
	
	@RequestMapping("/salidaEstipendio")
	public String salida(HttpSession session) {
		List<Estipendio> lista = service.listarTodos();
		session.setAttribute("estipendio", lista);
		return "ingresaestipendio";
	}
	
	@RequestMapping("/registraActualizaEstipendio")
	public String insertaActualiza(Estipendio estipendio, HttpSession session) {
		
		try {
			Estipendio obj = service.insertaActualizaEstipendio(estipendio);
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
		
		return "redirect:salidaEstipendio";
	}
	

}
