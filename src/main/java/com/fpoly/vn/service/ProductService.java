package com.fpoly.vn.service;

import com.fpoly.vn.entities.Product;
import com.fpoly.vn.repository.ProductRepository;
import com.fpoly.vn.service.impl.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class ProductService implements ProductServiceImpl {
    @Autowired
    private ProductRepository repository;
    @Override
    public Page<Product> findByTenSanPhamContains(String name, Pageable pageable) {
        return repository.findByTenSanPhamContains(name, pageable);
    }

    @Override
    public List<Product> findByNoiBat(boolean status) {
        return repository.findByNoiBat(status);
    }

    @Override
    public Page<Product> findAll(Pageable pageable) {
        return repository.findAll(pageable);
    }

    @Override
    @Deprecated
    public Product getByID(UUID id) {
        return repository.getById(id);
    }

    @Override
    public Product save(Product entity) {
        return repository.save(entity);
    }

    @Override
    public Product update(UUID id, Product entity) {
        if (entity != null){
            Product product = getByID(id);
            if (product != null) {
                return repository.save(entity);
            }
        }
        return null;
    }

    @Override
    public void deleteById(UUID id) {
        repository.deleteById(id);
    }
}
