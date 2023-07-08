package com.fpoly.vn.repository;

import com.fpoly.vn.entities.Order;
import com.fpoly.vn.model.OrderModel;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.UUID;

public interface OrderRepository extends JpaRepository<Order, UUID> {
    @Query("SELECT NEW com.fpoly.vn.model.OrderModel(o.id, o.account.hoVaTen, o.account.sdt, o.ngayTao) FROM Order o")
    Page<OrderModel> getOrdersWithDetails(Pageable pageable);
}
