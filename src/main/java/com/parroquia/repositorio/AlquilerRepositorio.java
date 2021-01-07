package com.parroquia.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import com.parroquia.entidad.Alquiler;

public interface AlquilerRepositorio extends JpaRepository<Alquiler, Integer> {

}
