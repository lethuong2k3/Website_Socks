package com.fpoly.vn.controller.admin;

import com.fpoly.vn.entities.Product;
import com.fpoly.vn.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin/top-stock")
public class TopStockController {
    @Autowired
    private ProductRepository productRepository;

    @GetMapping
    public String view(Model model) {
        List<Product> top10BestSellingProducts = productRepository.findTop10ByOrderBySoLuongDesc();
        model.addAttribute("top10BestSellingProducts", top10BestSellingProducts);
        return "statistical/thongkehangton";
    }
}
