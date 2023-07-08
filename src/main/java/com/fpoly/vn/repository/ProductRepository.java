package com.fpoly.vn.repository;

import com.fpoly.vn.entities.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface ProductRepository extends JpaRepository<Product, UUID> {
    Page<Product> findByTenSanPhamContains(String name, Pageable pageable);

    List<Product> findByNoiBat(boolean status);

    List<Product> findTop10ByOrderBySoLuongDesc();

}
