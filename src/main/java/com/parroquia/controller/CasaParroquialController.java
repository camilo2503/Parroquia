package com.parroquia.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.parroquia.entidad.CasaParroquial;
import com.parroquia.servicio.CasaParroquialService;

@Controller
public class CasaParroquialController {
	
	@Autowired
	private CasaParroquialService service;
	
	
	@RequestMapping("/casaparroquial")
	public String verCrud(HttpSession session) {
		
		List<CasaParroquial> lista = service.listarTodos();
		session.setAttribute("parroquial", lista);
		return "casaparroquial";
	}
	
	@RequestMapping("/consultaCrudCasa")
	public String consulta(String filtro, HttpSession session) {
		
			List<CasaParroquial> lista = service.listarPorNombres(filtro+"%");
			session.setAttribute("parroquial", lista);

		return "casaparroquial";
		
	}
	
	@RequestMapping("/salidaParroquia")
	public String salida(HttpSession session) {
		List<CasaParroquial> lista = service.listarTodos();
		session.setAttribute("parroquial", lista);
		return "casaparroquial";
	}
	
	@RequestMapping("/registraActualizaCasaParroquial")
	public String insertaActualiza(CasaParroquial parroquia, HttpSession session) {
		
		try {
			CasaParroquial obj = service.insertaActualizaCasaParroquial(parroquia);
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
		
		return "redirect:salidaParroquia";
	}
	

}
