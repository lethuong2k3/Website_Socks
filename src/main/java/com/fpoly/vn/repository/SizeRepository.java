package com.fpoly.vn.repository;

import com.fpoly.vn.entities.Size;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface SizeRepository extends JpaRepository<Size, UUID> {

}
