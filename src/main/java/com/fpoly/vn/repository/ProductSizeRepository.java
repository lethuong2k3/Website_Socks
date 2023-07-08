package com.fpoly.vn.repository;

import com.fpoly.vn.entities.Product;
import com.fpoly.vn.entities.Product_Size;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.UUID;

public interface ProductSizeRepository extends JpaRepository<Product_Size, UUID> {
    @Transactional
    void deleteByProduct_Id(UUID id);

    @Query("SELECT o.size.id FROM Product_Size o WHERE o.product.id = :productID")
    List<UUID> findSizeIdByProductId(@Param("productID") UUID productID);


}
