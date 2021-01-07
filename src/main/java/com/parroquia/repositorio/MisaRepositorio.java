package com.parroquia.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import com.parroquia.entidad.Misas;

public interface MisaRepositorio extends JpaRepository<Misas, Integer> {

	

}
