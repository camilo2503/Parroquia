package com.parroquia.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import com.parroquia.entidad.Planilla;

public interface PlanillaRepositorio extends JpaRepository<Planilla, Integer> {

}
