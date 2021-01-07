package com.parroquia.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import com.parroquia.entidad.IngresoDinero;

public interface IngresosRepositorio extends JpaRepository<IngresoDinero, Integer> {

}
