package com.fpoly.vn.repository;

import com.fpoly.vn.entities.Order;
import com.fpoly.vn.entities.OrderDetail;
import com.fpoly.vn.entities.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface OrderDetaiRepository extends JpaRepository<OrderDetail, UUID> {
    List<OrderDetail> findByOrder_Id(UUID id);

    OrderDetail findByProductAndOrder(Product product, Order order);

    List<OrderDetail> findTop10ByOrderBySoLuongDesc();

}
