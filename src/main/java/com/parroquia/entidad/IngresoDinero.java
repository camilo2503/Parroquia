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
@Table(name = "ingresodinero")
public class IngresoDinero {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idingresodinero;
	
	
	private String razonsocial;
	
	private String monto;
	
	
	

}
