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
@Table(name = "semanasanta")
public class SemanaSanta {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idsemanasanta;
	
	
	private String descripcion;
	private String monto;
	private String observaciones;
	
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fecharegistro;

}
