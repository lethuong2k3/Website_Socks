package com.fpoly.vn.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;
import java.util.Set;
import java.util.UUID;

@Entity
@Table(name = "orders")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Order {
    @Id
    @GeneratedValue(generator = "uuid2")
    @Column(name = "id", nullable = false, columnDefinition = "uniqueidentifier")
    private UUID id;

    @Column(name = "diachigiaohang", length = 200, nullable = false)
    private String diaChiGiaoHang;

    @Column(name = "ngaytao")
    private Date ngayTao;

    @Column(name = "trangthai", columnDefinition = "bit default 0", nullable = false)
    private boolean trangThai;

    @ManyToOne
    @JoinColumn(name = "account_id", nullable = false)
    private Account account;

    @OneToMany(mappedBy = "order")
    private Set<OrderDetail> orderDetail;
}
