package com.parroquia.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import com.parroquia.entidad.Pastoral;

public interface PastoralRepositorio extends JpaRepository<Pastoral, Integer> {

}
