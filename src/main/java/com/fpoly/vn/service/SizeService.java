package com.fpoly.vn.service;

import com.fpoly.vn.entities.Size;
import com.fpoly.vn.repository.SizeRepository;
import com.fpoly.vn.service.impl.SizeServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class SizeService implements SizeServiceImpl {
    @Autowired
    private SizeRepository repository;

    @Override
    public List<Size> getALL() {
        return repository.findAll();
    }

    @Override
    @Deprecated
    public Size getByID(UUID id) {
        return repository.getById(id);
    }
}
