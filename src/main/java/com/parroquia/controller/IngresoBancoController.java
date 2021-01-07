package com.parroquia.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.parroquia.entidad.Banco;
import com.parroquia.entidad.IngresoDineroBanco;
import com.parroquia.servicio.BancoServicio;
import com.parroquia.servicio.IngresoBancoService;

@Controller
public class IngresoBancoController {
	@Autowired
	private IngresoBancoService service;
	
	@Autowired
	private BancoServicio bancoservicio;
	
	
	@RequestMapping("/ingresodinerobancario")
	public String verCrud(HttpSession session) {
		List<IngresoDineroBanco> lista = service.listarTodos();
		session.setAttribute("ingresobanco", lista);
		return "registroingresobanco";
	}
	
	@RequestMapping("/listaTipoBanco")
	@ResponseBody
	public List<Banco> listaTipoBanco(){
		return bancoservicio.listaTipoBanco();
	}

	


	
	@RequestMapping("/consultaCrudIngresoBancario")
	public String consulta(String filtro, HttpSession session) {
		
			List<IngresoDineroBanco> lista = service.listarPorNombres(filtro+"%");
			session.setAttribute("ingresobanco", lista);

		return "registroingresobanco";
	}
	
	@RequestMapping("/salidaIngresoBanco")
	public String salida(HttpSession session) {
		List<IngresoDineroBanco> lista = service.listarTodos();
		session.setAttribute("ingresobanco", lista);
		return "registroingresobanco";
	}
	
	@RequestMapping("/registraActualizaCrudIngresoBanco")
	public String insertaActualiza(IngresoDineroBanco inbanco, HttpSession session) {
		
		try {
			IngresoDineroBanco obj = service.insertaActualizaIngresosBanco(inbanco);
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
		
		return "redirect:salidaIngresoBanco";
	}
	

}
