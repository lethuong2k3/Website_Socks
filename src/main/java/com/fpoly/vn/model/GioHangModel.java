package com.fpoly.vn.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.UUID;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class GioHangModel {
    private UUID id;
    private String hinhAnh;
    private String tenSanPham;
    private BigDecimal donGia;
    private Integer soLuong;
    private BigDecimal thanhTien;

    public BigDecimal getThanhTien() {
        return thanhTien = donGia.multiply(BigDecimal.valueOf(soLuong));
    }
}
