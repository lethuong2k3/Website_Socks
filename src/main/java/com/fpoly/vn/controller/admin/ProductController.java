package com.fpoly.vn.controller.admin;

import com.fpoly.vn.entities.Category;
import com.fpoly.vn.entities.Product;
import com.fpoly.vn.entities.Product_Size;
import com.fpoly.vn.entities.Size;
import com.fpoly.vn.repository.ProductSizeRepository;
import com.fpoly.vn.service.CategoryService;
import com.fpoly.vn.service.ProductService;
import com.fpoly.vn.service.ProductSizeService;
import com.fpoly.vn.service.SizeService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.*;

@Controller
@RequestMapping("admin/products")
public class ProductController {
    @Autowired
    private CategoryService categoryService;

    @Autowired
    private SizeService sizeService;

    @Autowired
    private ProductService productService;

    @Autowired
    private ProductSizeService productSizeService;

    @Autowired
    private ProductSizeRepository productSizeRepository;

    @GetMapping
    public String index(Model model,
                        @RequestParam(defaultValue = "1") int page,
                        @RequestParam(required = false) String tenSanPham,
                        @ModelAttribute("product") Product product) {
        Page<Product> pageProduct;
        if (page < 1) page = 1;
        Pageable pageable = PageRequest.of(page - 1, 5);
        if (tenSanPham == null || tenSanPham.isBlank()) {
            pageProduct = productService.findAll(pageable);
        } else {
            pageProduct = productService.findByTenSanPhamContains(tenSanPham, pageable);
        }
        List<Category> listCate = categoryService.getALL();
        List<Size> listSize = sizeService.getALL();
        model.addAttribute("listCate", listCate);
        model.addAttribute("listSize", listSize);
        model.addAttribute("page", pageProduct);
        return "/products/product";
    }

    @PostMapping("/add")
    private String addProduct(@ModelAttribute("product") Product product, Model model,
                              @RequestParam("attach")MultipartFile attach,
                              @RequestParam("productSize") String[] selectedSizes) {
        Path path = Paths.get("");
        path = path.resolve("src").resolve("main").resolve("resources").resolve("static").resolve("images");
        if (attach.isEmpty()) {
            product.setHinhAnh(null);
        }
        try {
            InputStream inputStream = attach.getInputStream();
            Files.copy(inputStream, path.resolve(attach.getOriginalFilename()), StandardCopyOption.REPLACE_EXISTING);
            product.setHinhAnh(attach.getOriginalFilename().toLowerCase());
        } catch (Exception e){
            System.out.println("Chưa thêm hình ảnh");
        }
        productService.save(product);
        if (selectedSizes != null) {
            for (String sizeId: selectedSizes) {
                Size size = sizeService.getByID(UUID.fromString(sizeId));
                if (size != null) {
                    Product_Size productSize = new Product_Size();
                    productSize.setProduct(product);
                    productSize.setSize(size);
                    productSizeService.save(productSize);
                }
            }
        }
        model.addAttribute("successMessage", "Thêm sản phẩm thành công");
        return "redirect:/admin/products";
    }


    @RequestMapping("/delete/{id}")
    private String deleteProduct(@PathVariable(name = "id") UUID id){
        productSizeRepository.deleteByProduct_Id(id);
        productService.deleteById(id);
        return "redirect:/admin/products";
    }

    @RequestMapping("/load/{id}")
    private String loadDataForm(@PathVariable(name = "id") UUID id, Model model,
                                @RequestParam(defaultValue = "1") int page,
                                @RequestParam(required = false) String tenSanPham) {
        Product product = productService.getByID(id);
        List<UUID> listProductSize = productSizeRepository.findSizeIdByProductId(id);
        model.addAttribute("product", product);
        Page<Product> pageProduct;
        if (page < 1) page = 1;
        Pageable pageable = PageRequest.of(page - 1, 5);
        if (tenSanPham == null || tenSanPham.isBlank()) {
            pageProduct = productService.findAll(pageable);
        } else {
            pageProduct = productService.findByTenSanPhamContains(tenSanPham, pageable);
        }
        List<Category> listCate = categoryService.getALL();
        List<Size> listSize = sizeService.getALL();
        model.addAttribute("listCate", listCate);
        model.addAttribute("listSize", listSize);
        model.addAttribute("listProductSize", listProductSize);
        model.addAttribute("page", pageProduct);
        model.addAttribute("showModal", true);
        return "/products/product";
    }

    @RequestMapping("/update/{id}")
    private String updateProduct(@PathVariable(name = "id") UUID id, @ModelAttribute("product") Product product,
                                 @RequestParam("attach") MultipartFile attach) {
        Path path = Paths.get("");
        path = path.resolve("src").resolve("main").resolve("resources").resolve("static").resolve("images");
        if (attach.isEmpty()) {
            product.setHinhAnh(product.getHinhAnh());
        }
        try {
            InputStream inputStream = attach.getInputStream();
            Files.copy(inputStream, path.resolve(attach.getOriginalFilename()), StandardCopyOption.REPLACE_EXISTING);
            product.setHinhAnh(attach.getOriginalFilename().toLowerCase());
        } catch (Exception e){
            System.out.println("Chưa thêm hình ảnh");
        }
        productService.update(id, product);
        return "redirect:/admin/products";
    }

}
