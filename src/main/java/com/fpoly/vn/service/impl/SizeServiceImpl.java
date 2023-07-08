package com.fpoly.vn.service.impl;

import com.fpoly.vn.entities.Size;

import java.util.List;
import java.util.UUID;

public interface SizeServiceImpl {
    List<Size> getALL();

    @Deprecated
    Size getByID(UUID id);
}
