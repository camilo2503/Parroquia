package com.parroquia.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.parroquia.entidad.Bautiso;
import com.parroquia.servicio.BautisoServicio;

@Controller
public class BautisoController {
	@Autowired
	private BautisoServicio service;
	
	@RequestMapping("/verBautiso")
	public String verCrud() {
		return "crudBautiso";
	}

	
	@RequestMapping("/consultaCrudBautiso")
	public String consulta(String filtro, HttpSession session) {
		
			List<Bautiso> lista = service.listarPorNombres(filtro+"%");
			session.setAttribute("bautisos", lista);

		return "crudBautiso";
	}
	
	@RequestMapping("/salidaBautiso")
	public String salida(HttpSession session) {
		List<Bautiso> lista = service.listarTodos();
		session.setAttribute("bautisos", lista);
		return "crudBautiso";
	}
	
	@RequestMapping("/registraActualizaCrudBautiso")
	public String insertaActualiza(Bautiso bautiso, HttpSession session) {
		
		try {
			Bautiso obj = service.insertaActualizaABautiso(bautiso);
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
		
		return "redirect:salidaBautiso";
	}
	

}
