package com.parroquia.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.parroquia.entidad.Banco;
import com.parroquia.entidad.SalidaDineroBanco;
import com.parroquia.servicio.BancoServicio;
import com.parroquia.servicio.SalidaBancoService;

@Controller
public class SalidaBancoController {
	@Autowired
	private SalidaBancoService service;
	
	@Autowired
	private BancoServicio bancoservicio;
	
	
	@RequestMapping("/salidaingresobancario")
	public String verCrud(HttpSession session) {
		List<SalidaDineroBanco> lista = service.listarTodos();
		session.setAttribute("salidabanco", lista);
		return "registrosalidabanco";
	}
	
	@RequestMapping("/listaTipoBancoSalida")
	@ResponseBody
	public List<Banco> listaTipoBancoSalida(){
		return bancoservicio.listaTipoBanco();
	}

	


	
	@RequestMapping("/consultaCrudSalidaBanco")
	public String consulta(String filtro, HttpSession session) {
		
			List<SalidaDineroBanco> lista = service.listarPorNombres(filtro+"%");
			session.setAttribute("salidabanco", lista);

		return "registrosalidabanco";
	}
	
	@RequestMapping("/salidaSobreBanco")
	public String salida(HttpSession session) {
		List<SalidaDineroBanco> lista = service.listarTodos();
		session.setAttribute("salidabanco", lista);
		return "registrosalidabanco";
	}
	
	@RequestMapping("/registraActualizaCrudSalidaBanco")
	public String insertaActualiza(SalidaDineroBanco salbanco, HttpSession session) {
		
		try {
			SalidaDineroBanco obj = service.insertaActualizaSalidaDinero(salbanco);
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
		
		return "redirect:salidaSobreBanco";
	}
	

}
