package com.fpoly.vn.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class GioHangViewModel {
    private List<GioHangModel> sanPhamTrongGio;
    private BigDecimal tongTien;

}
