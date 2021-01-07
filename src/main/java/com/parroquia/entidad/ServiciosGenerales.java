package com.parroquia.entidad;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "serviciosgenerales")
public class ServiciosGenerales {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idserviciosgenerales;

	private String descripcion;
	
	private String monto;
	
	private String observaciones;
	

	
	

	

}
