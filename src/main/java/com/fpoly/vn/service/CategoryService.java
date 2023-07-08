package com.fpoly.vn.service;

import com.fpoly.vn.entities.Category;
import com.fpoly.vn.repository.CategoryRepository;
import com.fpoly.vn.service.impl.CategoryServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService implements CategoryServiceImpl {
    @Autowired
    private CategoryRepository repository;

    @Override
    public List<Category> getALL() {
        return repository.findAll();
    }
}
