package com.parroquia.repositorio;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.parroquia.entidad.Activos;

public interface ActivosRepositorio extends JpaRepository<Activos, Integer> {
	
	@Query("select x from Activos x where x.descripcion like :var_parm")
	public abstract List<Activos> listaPorNombre(@Param("var_parm") String nombre);


}
