package com.parroquia.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import com.parroquia.entidad.Nacimiento;

public interface NacimientoRepositorio extends JpaRepository<Nacimiento, Integer> {

}
