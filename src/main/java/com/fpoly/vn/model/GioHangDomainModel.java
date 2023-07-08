package com.fpoly.vn.model;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class GioHangDomainModel {
    private final Map<UUID, Integer> DANH_SACH_SAN_PHAM = new HashMap<>();
    public Map<UUID, Integer> getDanhSachSanPham() {
        return DANH_SACH_SAN_PHAM;
    }

}
