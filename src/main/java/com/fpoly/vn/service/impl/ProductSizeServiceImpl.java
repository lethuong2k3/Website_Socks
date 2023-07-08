package com.fpoly.vn.service.impl;

import com.fpoly.vn.entities.Product;
import com.fpoly.vn.entities.Product_Size;
import org.springframework.data.repository.query.Param;

import java.util.UUID;

public interface ProductSizeServiceImpl {
    @Deprecated
    Product_Size getByID(UUID id);

    Product_Size save(Product_Size entity);

    Product_Size update(UUID id, Product_Size entity);

}
