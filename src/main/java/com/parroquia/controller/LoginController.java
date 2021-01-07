package com.parroquia.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.parroquia.entidad.Bautiso;
import com.parroquia.entidad.Opcion;
import com.parroquia.entidad.Rol;
import com.parroquia.entidad.Usuario;
import com.parroquia.servicio.BautisoServicio;
import com.parroquia.servicio.UsuarioServicio;

@Controller
public class LoginController {

	@Autowired
	private UsuarioServicio servicio;
	
	@Autowired
	private BautisoServicio Bservicio;
	
	

	@RequestMapping("/verLogin")
	public String verLogin() { return "login"; }
	
	@RequestMapping("/verIntranetHome")
	public String verHome() { return "intranetHome"; }
	//-------------------------------REGISTROS ---------------------------------
	
	@RequestMapping("/registroBautiso")
	public String regCurso() { return "intranetregistroBautiso"; }

	@RequestMapping("/registroMisas")
	public String regAutor() { return "intranetregistroMisas"; }
	
	@RequestMapping("/registroAlquileres")
	public String regLibro() { return "intranetregistroAlquileres"; }
	
	@RequestMapping("/registraDisponibilidad")
	public String regDisponibilidad() { return "intranetRegistraDisponibilidad"; }
	
	
	@RequestMapping("/registraUsuario")
	public String regUsuario() { return "intranetRegistraUsuario"; }
	
	//-----------------CRUD (MANTENIMIENTO)
	@RequestMapping("/crudBautiso")
	public String crudAutor(HttpSession session) { 
		List<Bautiso> lista = Bservicio.listarTodos();
		session.setAttribute("bautisos", lista);
		return "crudBautiso"; }
	

	
	@RequestMapping("/crudMatrimonio")
	public String crudCurso() { 
		
		
		return "crudMatrimonio"; }
	
	@RequestMapping("/crudMisas")
	public String crudEditorial() { return "crudMisas"; }


	@RequestMapping("/crudAlquileres")
	public String crudAlquileres() { return "crudAlquileres"; }
	
	
	
	
	//---------------------------CONSULTA--------------------------- 
	@RequestMapping("/enlaceConsultaMatrimonio")
	public String enlaceConsultaCurso() { return "intranetConsultaMatrimonio"; }
	
	@RequestMapping("/enlaceConsultaMisas")
	public String enlaceConsultaAutor() { return "intranetConsultaMisas"; }

	
	@RequestMapping("/enlaceConsultaConfirmacion")
	public String enlaceConsultaLibro() { return "intranetConsultaConfirmacion"; }

	
	@RequestMapping("/enlaceConsultaDisponibilidad")
	public String enlaceConsultaDisponibilidad() { return "intranetConsultaDisponibilidad"; }

	
	//--------------------------------TRANSACCIONES--------------------------------
	
	@RequestMapping("/enlaceTransaccionDonaciones")
	public String enlaceTransaccionPrestamo() { return "intranetTransaccionDonaciones"; }

	@RequestMapping("/enlaceTransaccionCuotasMisas")
	public String enlaceTransaccionAutoresDeLibro() { return "intranetTransaccionCuotasMisas"; }

	@RequestMapping("/enlaceTransaccionRolesDeUsuario")
	public String enlaceTransaccionRolesDeUsuario() { return "intranetTransaccionRolesDeUsuario"; }

	@RequestMapping("/enlaceTransaccionOpcionesDeRol")
	public String enlaceTransaccionOpcionesDeRol() { return "intranetTransaccionOpcionesDeRol"; }

	@RequestMapping("/enlaceTransaccionAutoresDeInvestigacion")
	public String enlaceTransaccionAutoresDeInvestigacion() { return "intranetTransaccionAutoresDeInvestigacion"; }

	//-----------------------PROGRAMACION EN LOG---------------------------------- 
	
	@RequestMapping("/login")
	public String login(Usuario usu, HttpSession  session, HttpServletRequest request) {
		
		Usuario objUsu = servicio.login(usu);
		if(objUsu == null) {
			request.setAttribute("mensaje", "El usuario no existe");
			return "login";
		}else {
			List<Rol> roles = servicio.traerRolesDeUsuario(objUsu.getIdUsuario());
			List<Opcion> menus = servicio.traerEnlacesDeUsuario(objUsu.getIdUsuario());
			
			session.setAttribute("objUsuario", objUsu);
			session.setAttribute("objRoles", roles);
			session.setAttribute("objMenus", menus);
			return "redirect:home";
		}
	}
	
	@RequestMapping("/home")
	public String salida() {
		return "intranetHome";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		//Destruir todos los objetos de la sesion mediante programación
		session.invalidate();

		response.setHeader("Cache-control", "no-cache");
		response.setHeader("Expires", "0");
		response.setHeader("Pragma", "no-cache");

		request.setAttribute("mensaje", "El usuario salió de sesión");
		return "login";

	}

}
