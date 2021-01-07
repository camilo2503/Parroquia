package com.parroquia.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import com.parroquia.entidad.Certificados;

public interface CertificadoRepositorio extends JpaRepository<Certificados, Integer> {

}
