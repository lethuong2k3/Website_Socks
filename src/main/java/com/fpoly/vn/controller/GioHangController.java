package com.fpoly.vn.controller;

import com.fpoly.vn.entities.Account;
import com.fpoly.vn.model.AccountModel;
import com.fpoly.vn.model.GioHangViewModel;
import com.fpoly.vn.model.LoginModel;
import com.fpoly.vn.repository.AccountRepository;
import com.fpoly.vn.service.GioHangService;
import com.fpoly.vn.service.ProductService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/cart")
public class GioHangController {
    @Autowired
    HttpSession session;

    @Autowired
    private ProductService productService;

    @Autowired
    private AccountRepository repository;

    @Autowired
    private GioHangService gioHangService;
    @GetMapping
    public String xemGioHang(Model model, @ModelAttribute("login") LoginModel login,
                             @ModelAttribute("account") AccountModel account) {
        GioHangViewModel viewGioHang = gioHangService.xemGioHang();
        model.addAttribute("productCart", viewGioHang);
        return "/commons/cart";
    }

    @RequestMapping("/remove/{id}")
    public String xoaSanPhamTrongGio(@PathVariable(name = "id") UUID id) {
        gioHangService.xoaSanPhamTrognGio(id);
        return "redirect:/cart";
    }

    @RequestMapping("/update/{id}")
    public String updateSoLuongSanPhamTrongGio(@PathVariable(name = "id") UUID id, @RequestParam("quantity") String soLuong) {
        Integer quantity = Integer.parseInt(soLuong);
        gioHangService.suaSoLuongSanPhamTrongGio(id, quantity);
        return "redirect:/cart";
    }

    @RequestMapping("/logout")
    public String logOut() {
        session.removeAttribute("userLogin");
        return "redirect:/";
    }

    @PostMapping("/login")
    public String isLogin(@Validated @ModelAttribute("login") LoginModel login,
                          @Validated @ModelAttribute("account") AccountModel account, BindingResult result,
                          Model model){
        if (result.hasErrors()) {
            return "redirect:/";
        } else {
            Account userLogin = repository.findByEmailEquals(login.getEmail());
            if (userLogin != null && login.getMatKhau().equals(userLogin.getMatKhau())) {
                session.setAttribute("userLogin", userLogin);
                return "redirect:/";
            } else {
                return "/commons/index";
            }
        }
    }

    @PostMapping("/register")
    public String isRegister(@Validated @ModelAttribute("account") AccountModel accountModel,
                             @Validated @ModelAttribute("login") LoginModel login,
                             BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "redirect:/";
        } else {
            Account acc = new Account();
            acc.setHoVaTen(accountModel.getHoVaTen().trim());
            acc.setEmail(accountModel.getEmailRegis().trim());
            acc.setMatKhau(accountModel.getMatKhauRegis().trim());
            acc.setAdmin(0);
            repository.save(acc);
            model.addAttribute("registerSuccess", true);
            return "/commons/index";
        }
    }
}
