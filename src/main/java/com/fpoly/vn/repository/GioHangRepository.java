package com.fpoly.vn.repository;

import com.fpoly.vn.model.GioHangDomainModel;
import org.springframework.stereotype.Repository;
import org.springframework.web.context.annotation.SessionScope;

import java.util.Map;
import java.util.UUID;

@Repository
@SessionScope
public class GioHangRepository {
    private GioHangDomainModel gioHang = new GioHangDomainModel();
    public void themSanPhamVaoGio(UUID id, Integer soLuong) {
        Map<UUID, Integer> sanPhamTrongGio = gioHang.getDanhSachSanPham();
        sanPhamTrongGio.put(id, soLuong);
    }

    public void xoaSanPhamTrongGio(UUID id) {
        Map<UUID, Integer> sanPhamTrongGio = gioHang.getDanhSachSanPham();
        sanPhamTrongGio.remove(id);
    }

    public void suaSoLuongSanPhamTrongGio(UUID id, Integer soLuongCapNhat) {
        Map<UUID, Integer> samPhamTrongGio = gioHang.getDanhSachSanPham();
        samPhamTrongGio.put(id, soLuongCapNhat);
    }

    public Integer laySoLuongSanPhamTrongGio(UUID id) {
        return gioHang.getDanhSachSanPham().get(id);
    }

    public boolean sanPhamDaCoTrongGio(UUID id) {
        return gioHang.getDanhSachSanPham().containsKey(id);
    }

    public GioHangDomainModel layGioHang() {
        return gioHang;
    }
}
