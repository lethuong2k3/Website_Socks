package com.fpoly.vn.service.impl;

import com.fpoly.vn.entities.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface ProductServiceImpl {
    Page<Product> findByTenSanPhamContains(String name, Pageable pageable);

    List<Product> findByNoiBat(boolean status);

    Page<Product> findAll(Pageable pageable);

    @Deprecated
    Product getByID(UUID id);

    Product save(Product entity);

    Product update(UUID id, Product entity);

    void deleteById(UUID id);
}
