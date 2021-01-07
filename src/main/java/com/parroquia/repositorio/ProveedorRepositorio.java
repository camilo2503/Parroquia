package com.parroquia.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import com.parroquia.entidad.Proveedor;

public interface ProveedorRepositorio extends JpaRepository<Proveedor, Integer> {

}
