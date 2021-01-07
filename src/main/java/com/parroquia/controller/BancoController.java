package com.parroquia.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.parroquia.entidad.Banco;
import com.parroquia.servicio.BancoServicio;

@Controller
public class BancoController {
	@Autowired
	private BancoServicio service;
	
	
	@RequestMapping("/registrotarjeta")
	public String verCrud(HttpSession session) {
		List<Banco> lista = service.listarTodos();
		session.setAttribute("banco", lista);
		return "registrotarjeta";
	}
	


	
	@RequestMapping("/consultaCrudBanco")
	public String consulta(String filtro, HttpSession session) {
		
			List<Banco> lista = service.listarPorNombres(filtro+"%");
			session.setAttribute("banco", lista);

		return "registrotarjeta";
	}
	
	@RequestMapping("/salidaBanco")
	public String salida(HttpSession session) {
		List<Banco> lista = service.listarTodos();
		session.setAttribute("banco", lista);
		return "registrotarjeta";
	}
	
	@RequestMapping("/registraActualizaCrudBanco")
	public String insertaActualiza(Banco banco, HttpSession session) {
		
		try {
			Banco obj = service.insertaActualizaBanco(banco);
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
		
		return "redirect:salidaBanco";
	}
	

}
