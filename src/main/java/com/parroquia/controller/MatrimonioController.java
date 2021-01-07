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

import com.parroquia.entidad.Matrimonio;
import com.parroquia.servicio.MatrimonioServicio;

@Controller
public class MatrimonioController {
	@Autowired
	private MatrimonioServicio service;
	
	@RequestMapping("/verMatrimonio")
	public String verCrud() {
		return "crudMatrimonio";
	}

	//CRUD MATRIMONIO 
	@RequestMapping("/consultaCrudMatrimonio")
	public String consulta(String filtro, HttpSession session) {
		
		List<Matrimonio> lista = service.listarTodos();
			session.setAttribute("matrimonio", lista);

		return "crudMatrimonio";
	}
	//*******************************PAGINA INTRANETCONSULTAMATRIMONIO
	@RequestMapping("/consultaMatrimonio")
	public String consultaMatrimonio(String filtro, HttpSession session) {
		
		List<Matrimonio> lista = service.listarTodos();
			session.setAttribute("matrimonio", lista);

		return "intranetConsultaMatrimonio";
	}
	
	@RequestMapping("/salidaMatrimonio")
	public String salida(HttpSession session) {
		List<Matrimonio> lista = service.listarTodos();
		session.setAttribute("matrimonio", lista);
		return "crudMatrimonio";
	}
	
	@RequestMapping("/registraActualizaCrudMatrimonio")
	public String insertaActualiza(Matrimonio matrimonio, HttpSession session) {
		
		try {
			Matrimonio obj = service.insertaActualizaMatrimonio(matrimonio);
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
		
		return "redirect:salidaMatrimonio";
	}
	
	//******************************EXCEL******************************************************************
		@GetMapping("/exportmatrimonio/all")
		public ResponseEntity<InputStreamResource> exportAllData() throws Exception{
			ByteArrayInputStream stream= service.exportAllDataMatrimonio();
			
			HttpHeaders headers= new HttpHeaders();
			headers.add("Content-Disposition","attachment; filename=matrimonios.xls");
			
			return ResponseEntity.ok().headers(headers).body(new InputStreamResource(stream));
			
		}
	

}
