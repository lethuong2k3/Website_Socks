package com.fpoly.vn.service;

import com.fpoly.vn.entities.Product;
import com.fpoly.vn.model.GioHangDomainModel;
import com.fpoly.vn.model.GioHangModel;
import com.fpoly.vn.model.GioHangViewModel;
import com.fpoly.vn.repository.GioHangRepository;
import com.fpoly.vn.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class GioHangService {
    @Autowired
    private GioHangRepository gioHangRepository;

    @Autowired
    private ProductRepository productRepository;

    public void themSanPhamVaoGio(UUID id, Integer soLuong) {
        if (gioHangRepository.sanPhamDaCoTrongGio(id)) {
            Integer soLuongHienCo = gioHangRepository.laySoLuongSanPhamTrongGio(id);
            Integer soLuongCongDon = soLuongHienCo + soLuong;
            gioHangRepository.suaSoLuongSanPhamTrongGio(id, soLuongCongDon);
        } else {
            gioHangRepository.themSanPhamVaoGio(id, soLuong);

        }
    }

    public void suaSoLuongSanPhamTrongGio(UUID id, Integer soLuongCapNhat) {
        gioHangRepository.suaSoLuongSanPhamTrongGio(id, soLuongCapNhat);
    }

    public void xoaSanPhamTrognGio(UUID id) {
        gioHangRepository.xoaSanPhamTrongGio(id);
    }

    public GioHangViewModel xemGioHang() {
        GioHangDomainModel gioHangDomainModel = gioHangRepository.layGioHang();
        Map<UUID, Integer> danhSachSanPham = gioHangDomainModel.getDanhSachSanPham();
        GioHangViewModel viewModel = new GioHangViewModel();
        List<GioHangModel> sanPhamTrongGio = new ArrayList<>();
        BigDecimal tongTien = BigDecimal.ZERO;
        for(Map.Entry<UUID, Integer> sp : danhSachSanPham.entrySet()) {
            UUID id = sp.getKey();
            Integer soLuong = sp.getValue();
            Product product = productRepository.findById(id).get();
            GioHangModel sanPham = new GioHangModel();
            sanPham.setId(id);
            sanPham.setSoLuong(soLuong);
            sanPham.setDonGia(product.getDonGia());
            sanPham.setTenSanPham(product.getTenSanPham());
            sanPham.setHinhAnh(product.getHinhAnh());
            sanPhamTrongGio.add(sanPham);

            BigDecimal thanhTien = product.getDonGia().multiply(BigDecimal.valueOf(soLuong));
            tongTien = tongTien.add(thanhTien);
        }
        viewModel.setSanPhamTrongGio(sanPhamTrongGio);
        viewModel.setTongTien(tongTien);
        return viewModel;
    }
}
