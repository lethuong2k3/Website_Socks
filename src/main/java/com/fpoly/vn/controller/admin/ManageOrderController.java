package com.fpoly.vn.controller.admin;

import com.fpoly.vn.entities.Order;
import com.fpoly.vn.entities.OrderDetail;
import com.fpoly.vn.entities.Product;
import com.fpoly.vn.model.OrderModel;
import com.fpoly.vn.repository.OrderDetaiRepository;
import com.fpoly.vn.repository.OrderRepository;
import com.fpoly.vn.repository.ProductRepository;
import com.fpoly.vn.service.OrderDetailService;
import com.fpoly.vn.service.ProductService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("admin/orders")
public class ManageOrderController {
    @Autowired
    HttpSession session;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private OrderDetaiRepository orderDetaiRepository;

    @Autowired
    private OrderDetailService orderDetailService;

    @GetMapping
    public String index(Model model,
                        @RequestParam(defaultValue = "1") int page) {
        Page<OrderModel> pageOrder;
        if (page < 1) page = 1;
        Pageable pageable = PageRequest.of(page - 1, 5);
        pageOrder = orderRepository.getOrdersWithDetails(pageable);
        model.addAttribute("page", pageOrder);
        return "/orders/order";
    }

    @RequestMapping("/{id}")
    public String orderDetails(@PathVariable(name = "id") UUID id, Model model, @RequestParam(defaultValue = "1") int page) {
        session.setAttribute("order", orderRepository.getById(id));
        model.addAttribute("listProduct", productRepository.findAll());
        model.addAttribute("listOrderDetails", orderDetaiRepository.findByOrder_Id(id));
        Page<OrderModel> pageOrder;
        if (page < 1) page = 1;
        Pageable pageable = PageRequest.of(page - 1, 5);
        pageOrder = orderRepository.getOrdersWithDetails(pageable);
        model.addAttribute("page", pageOrder);
        return "/orders/manageOrderDetail";
    }

    @RequestMapping("/add/{id}")
    public String addOrderDetails(@PathVariable(name = "id") UUID id, @SessionAttribute("order") Order order,
                                  Model model,
                                  @RequestParam(defaultValue = "1") int page) {
        Product product = productRepository.getById(id);
        OrderDetail orderDetail = new OrderDetail();
        orderDetail.setGia(product.getDonGia());
        orderDetail.setOrder(order);
        orderDetail.setProduct(product);
        orderDetail.setSoLuong(2);
        orderDetailService.addOrUpdate(orderDetail);
        Page<OrderModel> pageOrder;
        if (page < 1) page = 1;
        Pageable pageable = PageRequest.of(page - 1, 5);
        pageOrder = orderRepository.getOrdersWithDetails(pageable);
        model.addAttribute("page", pageOrder);
        return "redirect:/admin/orders";
    }

    @RequestMapping("/delete/{id}")
    public String deleteOrderDetail(@PathVariable(name = "id") UUID id) {
        orderDetaiRepository.deleteById(id);
        return "redirect:/admin/orders";
    }

    @RequestMapping("/bill/{id}")
    public String viewBill(@PathVariable(name = "id") UUID id, Model model) {
        model.addAttribute("orderBill", orderRepository.findById(id).get());
        model.addAttribute("orderDetailBill", orderDetaiRepository.findByOrder_Id(id));
        return "orders/bill";
    }
}
