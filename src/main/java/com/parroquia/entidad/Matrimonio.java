package com.parroquia.entidad;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "matrimonio")
public class Matrimonio {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idmatrimonio;
	private String numlibro;
	private String numfolio;
	private String numpartida;
	private String nombreparroquia;
	private String nomEsposo;
	private String apeEsposo;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fechacimientoesposo;
	
	private String lugarnacimientoesposo;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fechabautismoesposo;
	
	private String parroquiabautismoesposo;
	
	//ESPOSA
	private String nomEsposa;
	private String apeEsposa;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fechacimientoesposa;
	
	private String lugarnacimientoesposa;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fechautismoesposa;
	
	
	private String parroquiabautismoesposa;
	
	
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fechamatrimonio;
	
	private String ministroasistente;
	private String padrino;
	private String madrina;
	private String testigos;
	private String anotacionesmarg;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fechactual;
	
	
	

}
