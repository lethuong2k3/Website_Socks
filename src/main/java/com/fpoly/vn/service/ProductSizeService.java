package com.fpoly.vn.service;

import com.fpoly.vn.entities.Product;
import com.fpoly.vn.entities.Product_Size;
import com.fpoly.vn.repository.ProductSizeRepository;
import com.fpoly.vn.service.impl.ProductSizeServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class ProductSizeService implements ProductSizeServiceImpl {
    @Autowired
    private ProductSizeRepository repository;

    @Override
    @Deprecated
    public Product_Size getByID(UUID id) {
        return repository.getById(id);
    }

    @Override
    public Product_Size save(Product_Size entity) {
        return repository.save(entity);
    }

    @Override
    public Product_Size update(UUID id, Product_Size entity) {
        if (entity != null){
            Product_Size productSize = getByID(id);
            if (productSize != null) {
                return repository.save(entity);
            }
        }
        return null;
    }


}
