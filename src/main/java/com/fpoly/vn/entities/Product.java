package com.fpoly.vn.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.Set;
import java.util.UUID;

@Entity
@Table(name = "product")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Product {
    @Id
    @GeneratedValue(generator = "uuid2")
    @Column(name = "id", nullable = false, columnDefinition = "uniqueidentifier")
    private UUID id;

    @Column(name = "tensanpham", length = 500, nullable = false)
    private String tenSanPham;

    @Column(name = "soluong", nullable = false)
    private int soLuong;

    @Column(name = "dongia", nullable = false)
    private BigDecimal donGia;

    @Column(name = "hoatiet", length = 200, nullable = false)
    private String hoaTiet;

    @Column(name = "mausac", length = 200, nullable = false)
    private String mauSac;

    @Column(name = "noibat", columnDefinition = "bit default 0", nullable = false)
    private boolean noiBat;

    @Column(name = "hinhanh", length = 200)
    private String hinhAnh;

    @Column(name = "mota", length = 1000, nullable = true)
    private String moTa;

    @Column(name = "trangthai", columnDefinition = "bit default 1", nullable = false)
    private boolean trangThai;

    @ManyToOne(optional = false)
    @JoinColumn(name = "category_id", nullable = false)
    private Category category;

    @OneToMany(mappedBy = "product")
    private Set<Product_Size> productSize;

    @OneToMany(mappedBy = "product")
    private Set<OrderDetail> orderDetail;

    @OneToMany(mappedBy = "product")
    private Set<SaleOff> saleOff;


}
