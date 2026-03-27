package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UpLoadFileService;

@Controller
public class ProductController {

    private final ProductService productService;
    private final UpLoadFileService upLoadFileService;

    public ProductController(ProductService productService, UpLoadFileService upLoadFileService) {
        this.productService = productService;
        this.upLoadFileService = upLoadFileService;
    }

    // Read
    @GetMapping("/admin/product")
    public String getProductPage(Model model) {
        List<Product> products = this.productService.fetchProducts();
        model.addAttribute("products", products);
        return "admin/product/show_product";
    }

    // Create
    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create_product";
    }

    @PostMapping("/admin/product/create")
    public String handleCreateProduct(
            @ModelAttribute("newProduct") @Valid Product products,
            BindingResult newProductBindingResult,
            @RequestParam("imgFile") MultipartFile file) {
        if (newProductBindingResult.hasErrors()) {
            return "admin/product/create_product";
        }
        String imgFile = this.upLoadFileService.handleUpLoadFile(file, "product");
        products.setImage(imgFile);

        this.productService.createProduct(products);
        return "redirect:/admin/product";
    }

}
