package com.fpoly.vn.service;

import com.fpoly.vn.entities.OrderDetail;
import com.fpoly.vn.repository.OrderDetaiRepository;
import com.fpoly.vn.service.impl.OrderDetailServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderDetailService implements OrderDetailServiceImpl {
    @Autowired
    private OrderDetaiRepository orderDetaiRepository;


    @Override
    public void addOrUpdate(OrderDetail orderDetail) {
        OrderDetail existingOrderDetail = orderDetaiRepository.findByProductAndOrder(orderDetail.getProduct(), orderDetail.getOrder());
        if (existingOrderDetail != null) {
            existingOrderDetail.setSoLuong(existingOrderDetail.getSoLuong() + 1);
            orderDetaiRepository.save(orderDetail);
        } else {
            orderDetaiRepository.save(orderDetail);
        }
    }
}
