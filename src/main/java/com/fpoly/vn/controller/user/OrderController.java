package com.fpoly.vn.controller.user;

import com.fpoly.vn.entities.Account;
import com.fpoly.vn.entities.Order;
import com.fpoly.vn.entities.OrderDetail;
import com.fpoly.vn.entities.Product;
import com.fpoly.vn.model.*;
import com.fpoly.vn.repository.AccountRepository;
import com.fpoly.vn.repository.OrderDetaiRepository;
import com.fpoly.vn.repository.OrderRepository;
import com.fpoly.vn.service.GioHangService;
import com.fpoly.vn.service.ProductService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/cart/buy")
public class OrderController {
    @Autowired
    HttpSession session;

    @Autowired
    private GioHangService gioHangService;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private AccountRepository repository;

    @Autowired
    private OrderDetaiRepository orderDetaiRepository;

    @Autowired
    private ProductService productService;

    @GetMapping
    public String buyProduct(@SessionAttribute(name = "userLogin", required = false) Account account, Model model, @ModelAttribute("login") LoginModel login,
                             @ModelAttribute("account") AccountModel acc, @ModelAttribute("payment") PaymentModel payment) {
        if (account == null) {
            model.addAttribute("notAccount", true);
            GioHangViewModel viewGioHang = gioHangService.xemGioHang();
            model.addAttribute("productCart", viewGioHang);
            return "commons/cart";
        }
        GioHangViewModel viewGioHang = gioHangService.xemGioHang();
        model.addAttribute("productCart", viewGioHang);
        return "commons/orderdetails";
    }

    @PostMapping("/pay")
    public String payProduct(Model model, @ModelAttribute("payment") PaymentModel payment, @SessionAttribute(name = "userLogin") Account account, @ModelAttribute("login") LoginModel login,
                             @ModelAttribute("account") AccountModel acc) {
        Order order = new Order();
        order.setDiaChiGiaoHang(payment.getShippingAddress());
        java.util.Date date=new java.util.Date();
        order.setNgayTao(date);
        order.setTrangThai(true);
        order.setAccount(account);
        orderRepository.save(order);
        GioHangViewModel viewGioHang = gioHangService.xemGioHang();
        for (GioHangModel gioHangModel : viewGioHang.getSanPhamTrongGio()) {
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setGia(gioHangModel.getDonGia());
            orderDetail.setSoLuong(gioHangModel.getSoLuong());
            orderDetail.setOrder(order);
            Product product = productService.getByID(gioHangModel.getId());
            product.setSoLuong(product.getSoLuong() - gioHangModel.getSoLuong());
            orderDetail.setProduct(product);
            orderDetail.setTrangThai("Đang giao");

            orderDetaiRepository.save(orderDetail);
        }
        model.addAttribute("paySuccess", true);
        return "commons/index";
    }

}
