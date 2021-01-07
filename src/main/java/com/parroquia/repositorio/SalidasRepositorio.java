package com.parroquia.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import com.parroquia.entidad.SalidaDinero;

public interface SalidasRepositorio extends JpaRepository<SalidaDinero, Integer> {

}
