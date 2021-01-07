package com.parroquia.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import com.parroquia.entidad.Banco;

public interface BancoRepositorio extends JpaRepository<Banco, Integer> {

}
