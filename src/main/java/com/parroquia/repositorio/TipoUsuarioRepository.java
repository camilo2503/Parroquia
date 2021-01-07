package com.parroquia.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import com.parroquia.entidad.TipoUsuario;

public interface TipoUsuarioRepository extends JpaRepository<TipoUsuario, Integer> {

}
