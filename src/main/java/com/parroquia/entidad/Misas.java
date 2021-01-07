package com.parroquia.entidad;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "misas")
public class Misas {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idmisas;

	private String precio;
	
	private String descripcion;
	
	private String paraquien;
	
	private String dequien;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fechamisa;
	
	
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	@ManyToOne(fetch = FetchType.LAZY)
	//@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name = "idtipomisa")
	private TipoMisa tipoMisa;
	//private List<TipoMisa> tipoMisa;
	
	
	/*public List<TipoMisa> getTiposMisas() {
        if (this.tipoMisa == null) {
            this.tipoMisa = new ArrayList<TipoMisa>();
        }
        return this.tipoMisa;
    }*/

}
