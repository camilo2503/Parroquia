package com.parroquia.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.parroquia.entidad.Trabajador;
import com.parroquia.servicio.TrabajadorServicio;

@Controller
public class TrabajadorController {
	@Autowired
	private TrabajadorServicio service;
	
	@RequestMapping("/crudTrabajador")
	public String verCrud(HttpSession session) {
		List<Trabajador> lista = service.listarTodos();
		session.setAttribute("trabajador", lista);
		return "crudTrabajador";
	}

	
	@RequestMapping("/consultaCrudTrabajador")
	public String consulta(String filtro, HttpSession session) {
		
			List<Trabajador> lista = service.listarPorNombres(filtro+"%");
			session.setAttribute("trabajador", lista);

		return "crudTrabajador";
	}
	
	@RequestMapping("/salidaTrabajador")
	public String salida(HttpSession session) {
		List<Trabajador> lista = service.listarTodos();
		session.setAttribute("trabajador", lista);
		return "crudTrabajador";
	}
	
	@RequestMapping("/registraActualizacrudTrabajador")
	public String insertaActualiza(Trabajador trabajador, HttpSession session) {
		
		try {
			Trabajador obj = service.insertaActualizaTrabajador(trabajador);
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
		
		return "redirect:salidaTrabajador";
	}
	

}
