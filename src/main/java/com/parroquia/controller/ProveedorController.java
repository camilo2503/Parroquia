package com.parroquia.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.parroquia.entidad.Proveedor;
import com.parroquia.servicio.ProveedorServicio;

@Controller
public class ProveedorController {
	@Autowired
	private ProveedorServicio service;
	
	@RequestMapping("/crudProveedor")
	public String verCrud(HttpSession session) {
		List<Proveedor> lista = service.listarTodos();
		session.setAttribute("proveedor", lista);
		return "crudProveedor";
	}

	
	@RequestMapping("/consultacrudProveedor")
	public String consulta(String filtro, HttpSession session) {
		
			List<Proveedor> lista = service.listarPorNombres(filtro+"%");
			session.setAttribute("proveedor", lista);

		return "crudProveedor";
	}
	
	@RequestMapping("/salidaProveedor")
	public String salida(HttpSession session) {
		List<Proveedor> lista = service.listarTodos();
		session.setAttribute("proveedor", lista);
		return "crudProveedor";
	}
	
	@RequestMapping("/registraActualizacrudProveedor")
	public String insertaActualiza(Proveedor proveedor, HttpSession session) {
		
		try {
			Proveedor obj = service.insertaActualizaProveedor(proveedor);
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
		
		return "redirect:salidaProveedor";
	}
	

}
