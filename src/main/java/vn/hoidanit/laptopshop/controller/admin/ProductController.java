package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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

    @GetMapping("/admin/product/{id}")
    public String getDetailProductPage(Model model, @PathVariable long id) {
        Product productDetail = this.productService.fetchProductsById(id).get();
        model.addAttribute("productDetail", productDetail);
        return "admin/product/detail_product";
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

    // Update - PUT/PATCH
    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable long id) {
        Optional<Product> productUpdate = this.productService.fetchProductsById(id);
        model.addAttribute("productUpdate", productUpdate.get());
        return "admin/product/update_product";
    }

    @PostMapping("/admin/product/update")
    public String handleUpdateProduct(@ModelAttribute("productUpdate") @Valid Product product,
            BindingResult updateProductBindingResult,
            @RequestParam("imgFile") MultipartFile file) {

        if (updateProductBindingResult.hasErrors()) {
            return "admin/product/update_product";
        }
        Product productUpdate = this.productService.fetchProductsById(product.getId()).get();
        if (productUpdate != null) {
            productUpdate.setName(product.getName());
            productUpdate.setPrice(product.getPrice());
            productUpdate.setShortDesc(product.getShortDesc());
            productUpdate.setDetailDesc(product.getDetailDesc());
            productUpdate.setQuantity(product.getQuantity());
            productUpdate.setFactory(product.getFactory());
            productUpdate.setTarget(product.getTarget());

            if (file != null && !file.isEmpty()) {
                String imgFile = this.upLoadFileService.handleUpLoadFile(file, "product");
                productUpdate.setImage(imgFile);
            }
            this.productService.createProduct(productUpdate);
        }
        return "redirect:/admin/product";
    }

    // Delete
    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("productDelete", new Product());
        return "admin/product/delete_product";
    }

    @PostMapping("/admin/product/delete")
    public String handleDeleteProduct(@ModelAttribute("productDelete") Product productDelete) {
        this.productService.deleteProduct(productDelete.getId());
        return "redirect:/admin/product";
    }

}
