package com.parroquia.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import com.parroquia.entidad.Confirmacion;

public interface ConfirmacionRepositorio extends JpaRepository<Confirmacion, Integer> {

}
