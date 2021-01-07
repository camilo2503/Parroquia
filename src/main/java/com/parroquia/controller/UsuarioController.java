package com.parroquia.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.parroquia.entidad.TipoUsuario;
import com.parroquia.entidad.Usuario;
import com.parroquia.servicio.TipoUsuarioService;
import com.parroquia.servicio.UsuarioServicio;

@Controller
public class UsuarioController {
	
	@Autowired
	private UsuarioServicio usuarioServicio;
	
	
	@Autowired
	private TipoUsuarioService tipoUsuarioService;
	

	@RequestMapping("/crudUsuario")
	public String crudUsuario(HttpSession session) { 
		List<Usuario> data = usuarioServicio.listarUsuario();
		session.setAttribute("USUARIOS", data);
		return "crudUsuario"; }
	
	@RequestMapping("/listaTipoUsuario")
	@ResponseBody
	public List<TipoUsuario> listaTipoUsu(){
		return tipoUsuarioService.listaTipoUsuario();
	}
	
	
	@RequestMapping("/consultaCrudUsuario")
	public String consulta(String filtro, HttpSession session) {
		
		if(filtro != null) {
		List<Usuario> lista = usuarioServicio.listarPorFiltro(filtro+"%");
		session.setAttribute("USUARIOS", lista);
		}
		else 
		{
			List<Usuario> lista = usuarioServicio.listarUsuario();
			session.setAttribute("USUARIOS", lista);
		}
		return "crudUsuario";
	}
	
	@RequestMapping("/registraActualizaCrudUsuario")
	public String insertaUsuario(Usuario usuario,HttpSession session) 
	{
		try {


			Usuario obj = usuarioServicio.insertaActualizaUsuario(usuario);
		if(obj!=null)
			{
			session.setAttribute("MENSAJE", "Se registro correctamente");
			}
		else 
			{
			session.setAttribute("MENSAJE", "Error al registrar");
			}
		} catch (Exception e) {
			session.setAttribute("MENSAJE", "Error al registrar");
		}
		return "redirect:consultaCrudUsuario";
	}
	
	@RequestMapping("/eliminaCrudUsuario")
	public String elimina(String id, HttpSession session) {
		
		try {
			Optional<Usuario> obj = usuarioServicio.ObtenerUsuario(Integer.parseInt(id));
			if(obj.isPresent()) {
				usuarioServicio.EliminarUsuario(Integer.parseInt(id));
				session.setAttribute("MENSAJE", "Se eliminó correctamente");
			}
			else {
				session.setAttribute("MENSAJE", "El ID enviado no existe");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("MENSAJE", "Error al eliminar");
		}
		
		return "redirect:consultaCrudUsuario";
	}
	
}
