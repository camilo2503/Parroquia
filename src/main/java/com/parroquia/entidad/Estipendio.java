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
@Table(name = "estipendio")
public class Estipendio {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idestipendio;

	private String nombre;
	private String apellidos;
	private String monto;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fechamisa;
	

	
	private String observaciones;
	
	

	

}
