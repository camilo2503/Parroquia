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
import org.springframework.web.bind.annotation.ResponseBody;

import com.parroquia.entidad.Misas;
import com.parroquia.entidad.TipoMisa;
import com.parroquia.servicio.MisaServicio;
import com.parroquia.servicio.TipoMisaService;

@Controller
public class MisaController {
	@Autowired
	private MisaServicio service;
	
	@Autowired
	private TipoMisaService misaservice;
	
	@RequestMapping("/verMisas")
	public String verCrud(HttpSession session) {
		List<Misas> lista = service.listarTodos();
		session.setAttribute("misas", lista);
		return "crudMisas";
	}
	
	@RequestMapping("/listaTipoMisa")
	@ResponseBody
	public List<TipoMisa> listaTipoMisa(){
		return misaservice.listaTipoMisa();
	}

	//LISTA DENTRO DE CRUD MISAS
	@RequestMapping("/consultaCrudMisas")
	public String consulta(String filtro, HttpSession session) {
		
			List<Misas> lista = service.listarPorNombres(filtro+"%");
			session.setAttribute("misas", lista);

		return "crudMisas";
	}
	
	// LISTA DENTRO DE CONSULTAS
	@RequestMapping("/consultaMisas")
	public String consultaMisas(String filtro, HttpSession session) {
		
		List<Misas> lista = service.listarTodos();
			session.setAttribute("misas", lista);

		return "intranetConsultaMisas";
	}
	
	@RequestMapping("/salidaMisas")
	public String salida(HttpSession session) {
		List<Misas> lista = service.listarTodos();
		session.setAttribute("misas", lista);
		return "crudMisas";
	}
	
	@RequestMapping("/registraActualizaCrudMisas")
	public String insertaActualiza(Misas misas, HttpSession session) {
		
		try {
			Misas obj = service.insertaActualizaMisas(misas);
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
		
		return "redirect:salidaMisas";
	}
	//******************************EXCEL******************************************************************
	@GetMapping("/export/all")
	public ResponseEntity<InputStreamResource> exportAllData() throws Exception{
		ByteArrayInputStream stream= service.exportAllData();
		
		HttpHeaders headers= new HttpHeaders();
		headers.add("Content-Disposition","attachment; filename=misas.xls");
		
		return ResponseEntity.ok().headers(headers).body(new InputStreamResource(stream));
		
	}
	

}
