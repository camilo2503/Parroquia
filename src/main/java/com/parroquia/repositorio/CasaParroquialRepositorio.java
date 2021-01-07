package com.parroquia.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import com.parroquia.entidad.CasaParroquial;

public interface CasaParroquialRepositorio extends JpaRepository<CasaParroquial, Integer> {

}
