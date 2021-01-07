package com.parroquia.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.parroquia.entidad.Alquiler;
import com.parroquia.entidad.TipoAlquiler;
import com.parroquia.servicio.AlquilerServicio;
import com.parroquia.servicio.TipoAlquilerService;

@Controller
public class AlquilerController {
	
	@Autowired
	private AlquilerServicio service;
	
	@Autowired
	public TipoAlquilerService tiposervice;
	
	@RequestMapping("/")
	public String verCrud(HttpSession session) {
		
		List<Alquiler> lista = service.listarTodos();
		session.setAttribute("alquileres", lista);
		return "crudAlquileres";
	}
	
	
	@RequestMapping("/listaTipoAlquiler")
	@ResponseBody
	public List<TipoAlquiler> listaTipoAlquiler(){
		return tiposervice.listaTipoAlquiler();
	}

	
	@RequestMapping("/consultaCrudAlquileres")
	public String consulta(String filtro, HttpSession session) {
		
			List<Alquiler> lista = service.listarPorNombres(filtro+"%");
			session.setAttribute("alquileres", lista);

		return "crudAlquileres";
	}
	
	@RequestMapping("/salidaAlquileres")
	public String salida(HttpSession session) {
		List<Alquiler> lista = service.listarTodos();
		session.setAttribute("alquileres", lista);
		return "crudAlquileres";
	}
	
	@RequestMapping("/registraActualizaalquileres")
	public String insertaActualiza(Alquiler alquiler, HttpSession session) {
		
		try {
			Alquiler obj = service.insertaActualizaAlquiler(alquiler);
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
		
		return "redirect:salidaAlquileres";
	}
	

}
