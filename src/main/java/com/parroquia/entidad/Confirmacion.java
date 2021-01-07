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
@Table(name = "confirmacion")
public class Confirmacion {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idconfirmacion;
	
	private String numlibro;
	private String numfolio;
	private String numpartida;
	private String apellidos;
	private String nombres;
	private String madre;
	private String padre;
	private String lugarconfirmacion;
	private String edadconfirmacion;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fechaconfirmacion;
	
	private String ministrosacramento;
	
	private String madrina;
	private String padrino;
	
	private String nomparroquia;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fechabautismo;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fechaactual;
	
	
	
	
}
