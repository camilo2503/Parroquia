package com.parroquia.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.parroquia.entidad.Mantenimiento;

public interface MantenimientoRepositorio extends JpaRepository<Mantenimiento, Integer> {
	
	@Query("select m from Mantenimiento m where tipo = 1")
	public List<Mantenimiento> listaEdificios();
	
	@Query("select m from Mantenimiento m where tipo = 2")
	public List<Mantenimiento> listaEquipos();
	
	@Query("select m from Mantenimiento m where m.descripcion like :var_parm and tipo = 1")
	public abstract List<Mantenimiento> listaPorNombreEdificios(@Param("var_parm") String nombre);

	@Query("select m from Mantenimiento m where m.descripcion like :var_parm and  tipo = 2")
	public abstract List<Mantenimiento> listaPorNombreEquipos(@Param("var_parm") String nombre);


}
