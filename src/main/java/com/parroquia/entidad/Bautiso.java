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
@Table(name = "bautiso")
public class Bautiso {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idbautiso;
	
	private String nombreparroquia;
	private String numLibro;
	private String numFolio;
	private String numPartida;
	private String apellidos;
	private String nombre;
	private String padre;
	private String madre;
	private String lugarnacimiento;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fechanacimiento;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fechabautismo;
	private String madrina;
	private String padrino;
	private String anotaciones;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fechaactual;

}
