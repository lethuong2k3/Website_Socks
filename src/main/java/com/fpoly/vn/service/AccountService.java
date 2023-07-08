package com.fpoly.vn.service;

import com.fpoly.vn.entities.Account;
import com.fpoly.vn.repository.AccountRepository;
import com.fpoly.vn.service.impl.AccountServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class AccountService implements AccountServiceImpl {
    @Autowired
    private AccountRepository repository;

    @Override
    public Account update(UUID id, Account entity) {
        if (entity != null) {
            Account account = repository.getById(entity.getId());
            if (account != null) {
                return repository.save(entity);
            }
        }
        return null;
    }
}
