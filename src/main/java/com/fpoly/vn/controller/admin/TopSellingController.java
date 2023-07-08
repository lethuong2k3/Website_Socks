package com.fpoly.vn.controller.admin;

import com.fpoly.vn.entities.OrderDetail;
import com.fpoly.vn.repository.OrderDetaiRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin/top-selling")
public class TopSellingController {

    @Autowired
    private OrderDetaiRepository repository;

    @GetMapping
    public String view(Model model) {
        List<OrderDetail> top10BestSellingProducts = repository.findTop10ByOrderBySoLuongDesc();
        model.addAttribute("top10BestSellingProducts", top10BestSellingProducts);

        return "statistical/thongke";
    }
}
