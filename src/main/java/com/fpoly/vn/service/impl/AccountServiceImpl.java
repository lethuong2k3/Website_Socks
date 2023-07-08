package com.fpoly.vn.service.impl;

import com.fpoly.vn.entities.Account;

import java.util.UUID;

public interface AccountServiceImpl {
    Account update(UUID id, Account entity);
}
