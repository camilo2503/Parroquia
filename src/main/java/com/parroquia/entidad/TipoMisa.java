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
@Table(name = "tipomisa")

public class TipoMisa {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idtipomisa;
	
	private String descripcion;

}
