package com.fpoly.vn.controller.user;

import com.fpoly.vn.entities.Account;
import com.fpoly.vn.repository.AccountRepository;
import com.fpoly.vn.service.AccountService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    HttpSession session;

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private AccountService accountService;
    @GetMapping
    public String view(@ModelAttribute("acc") Account account) {
        return "/commons/update-account";
    }

    @RequestMapping("/update/{id}")
    public String updateAccount(@ModelAttribute("acc") Account account, Model model, @PathVariable(name = "id") UUID id) {
        Account acc = accountRepository.getById(id);
        account.setEmail(acc.getEmail());
        accountService.update(id, account);
        session.setAttribute("userLogin", acc);
        model.addAttribute("updateSuccess", true);
        return "/commons/update-account";
    }
}
