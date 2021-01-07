package com.parroquia.entidad;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "certificados")
public class Certificados {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idcertificados;
	
	
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idtipocertificado")
	private TipoCertificado tipoCertificado;
	
	private String precio;
	private String nombresolicitante;
	private String telefono;
	private String dni;
	private String paraquienes;

	
	

}
