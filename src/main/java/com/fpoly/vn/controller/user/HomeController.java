package com.fpoly.vn.controller.user;

import com.fpoly.vn.entities.Account;
import com.fpoly.vn.model.AccountModel;
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


import java.util.UUID;

@Controller
@RequestMapping("/")
public class HomeController {

    @Autowired
    HttpSession session;

    @Autowired
    private ProductService productService;

    @Autowired
    private AccountRepository repository;

    @Autowired
    private GioHangService gioHangService;

    @GetMapping
    private String view(Model model, @ModelAttribute("login") LoginModel login,
                        @ModelAttribute("account") AccountModel account) {
        model.addAttribute("productFeatured", productService.findByNoiBat(true));
        return "/commons/index";
    }

    @RequestMapping("/logout")
    public String logOut() {
        session.removeAttribute("userLogin");
        return "redirect:/";
    }

    @RequestMapping("/add/{id}")
    public String themSanPhamVaoGio(@PathVariable(name = "id") UUID id) {
        gioHangService.themSanPhamVaoGio(id, 1);
        return "redirect:/cart";
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
                return "redirect:/";
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
            acc.setSdt(accountModel.getSdt().trim());
            acc.setAdmin(0);
            repository.save(acc);
            model.addAttribute("registerSuccess", true);
            return "/commons/index";
        }
    }

    @RequestMapping("/products/{id}")
    private String productDetail(Model model, @PathVariable(name = "id") UUID id) {
        return "/commons/product-detail";
    }


}
