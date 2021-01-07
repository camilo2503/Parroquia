package com.parroquia.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.parroquia.entidad.Certificados;
import com.parroquia.entidad.TipoCertificado;
import com.parroquia.servicio.CertificadoServicio;
import com.parroquia.servicio.TipoCertificadoService;

@Controller
public class CertificadoController {
	@Autowired
	private CertificadoServicio service;
	
	@Autowired
	public TipoCertificadoService tiposervice;
	
	@RequestMapping("/crudCertificado")
	public String verCrud( HttpSession session) {
		List<Certificados> lista = service.listarTodos();
		session.setAttribute("certificado", lista);
		return "crudCertificado";	
	}
	
	
	@RequestMapping("/listaTipoCertificado")
	@ResponseBody
	public List<TipoCertificado> listaTipoCertificado(){
		return tiposervice.listaTipoCertificado();
	}

	
	@RequestMapping("/consultaCrudCertificado")
	public String consulta(String filtro, HttpSession session) {
		
			List<Certificados> lista = service.listarPorNombres(filtro+"%");
			session.setAttribute("certificado", lista);

		return "crudCertificado";
	}
	
	@RequestMapping("/salidaCertificado")
	public String salida(HttpSession session) {
		List<Certificados> lista = service.listarTodos();
		session.setAttribute("certificado", lista);
		return "crudCertificado";
	}
	
	@RequestMapping("/registraActualizaCrudCertificado")
	public String insertaActualiza(Certificados certificados, HttpSession session) {
		
		try {
			Certificados obj = service.insertaActualizaCertificado(certificados);
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
		
		return "redirect:salidaCertificado";
	}
	

}
