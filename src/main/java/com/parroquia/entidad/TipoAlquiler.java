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
@Table(name = "tiposalon")

public class TipoAlquiler {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idtiposalon;
	
	private String descripcion;

}
