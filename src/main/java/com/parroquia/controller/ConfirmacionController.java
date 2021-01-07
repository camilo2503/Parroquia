package com.parroquia.controller;

import java.io.ByteArrayInputStream;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.parroquia.entidad.Confirmacion;
import com.parroquia.servicio.ConfirmacionServicio;

@Controller
public class ConfirmacionController {
	
	@Autowired
	private ConfirmacionServicio service;
	
	@RequestMapping("/crudConfirmacion")
	public String verCrud(HttpSession session) {
		
		List<Confirmacion> lista = service.listarTodos();
		session.setAttribute("confirmacion", lista);
		return "crudConfirmacion";
	}

	//LISTA DENTRO DEL CRUD (MANTENIMIENTO)
	@RequestMapping("/consultaCrudConfirmacion")
	public String consulta(String filtro, HttpSession session) {
		
			List<Confirmacion> lista = service.listarPorNombres(filtro+"%");
			session.setAttribute("confirmacion", lista);

		return "crudConfirmacion";
	}
	
	//LISTA DENTRO DE CONSULTAS
	@RequestMapping("/consultaConfirmacion")
	public String consultaConfirmacion(String filtro, HttpSession session) {
		
		List<Confirmacion> lista = service.listarTodos();
			session.setAttribute("confirmacion", lista);

		return "intranetConsultaConfirmacion";
	}
	
	@RequestMapping("/salidaConfirmacion")
	public String salida(HttpSession session) {
		List<Confirmacion> lista = service.listarTodos();
		session.setAttribute("confirmacion", lista);
		return "crudConfirmacion";
	}
	
	@RequestMapping("/registraActualizaConfirmacion")
	public String insertaActualiza(Confirmacion confirmacion, HttpSession session) {
		
		try {
			Confirmacion obj = service.insertaActualizaConfirmacion(confirmacion);
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
		
		return "redirect:salidaConfirmacion";
	}
	
	//******************************EXCEL******************************************************************
		@GetMapping("/exportconfirmacion/all")
		public ResponseEntity<InputStreamResource> exportAllData() throws Exception{
			ByteArrayInputStream stream= service.exportAllDataConfirmacion();
			
			HttpHeaders headers= new HttpHeaders();
			headers.add("Content-Disposition","attachment; filename=confirmaciones.xls");
			
			return ResponseEntity.ok().headers(headers).body(new InputStreamResource(stream));
			
		}
	

}
