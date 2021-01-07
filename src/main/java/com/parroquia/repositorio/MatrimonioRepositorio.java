package com.parroquia.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import com.parroquia.entidad.Matrimonio;

public interface MatrimonioRepositorio extends JpaRepository<Matrimonio, Integer> {

}
