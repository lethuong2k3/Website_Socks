package com.fpoly.vn.repository;

import com.fpoly.vn.entities.Account;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface AccountRepository extends JpaRepository<Account, UUID> {
    Account findByEmailEquals(String taiKhoan);


}
