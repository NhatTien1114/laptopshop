package vn.hoidanit.laptopshop.controller.client;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.Order;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.domain.dto.RegisterDTO;
import vn.hoidanit.laptopshop.service.OrderService;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UserService;

@Controller
public class HomePageController {

    private final OrderService orderService;
    private final ProductService productService;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;

    public HomePageController(ProductService productService,
            UserService userService,
            PasswordEncoder passwordEncoder, OrderService orderService) {
        this.productService = productService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.orderService = orderService;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        Pageable pageable = PageRequest.of(0, 60);
        Page<Product> productsPage = this.productService.fetchProducts(pageable);
        List<Product> products = productsPage.getContent();
        model.addAttribute("products", products);
        return "client/homepage/show";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerDTO", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String handleRegister(Model model, @ModelAttribute("registerDTO") @Valid RegisterDTO registerDTO,
            BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }

        User user = this.userService.registerDTOtoUser(registerDTO);
        String encodedPassword = passwordEncoder.encode(registerDTO.getPassword());
        user.setPassword(encodedPassword);
        user.setRole(this.userService.getRoleByName("USER"));
        this.userService.handleSaveUser(user);
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {
        return "client/auth/login";
    }

    @GetMapping("/deny")
    public String getDenyPage(Model model) {
        return "client/auth/deny";
    }

    @GetMapping("/order-history")
    public String getOrderHistoryPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        long id = (long) session.getAttribute("id");
        User user = new User();
        user.setId(id);

        List<Order> orders = this.orderService.fetchOrdersByUser(user);
        model.addAttribute("orders", orders);

        return "client/homepage/history";
    }

    @GetMapping("/products")
    public String getProductsPage(Model model,
            @RequestParam("page") Optional<String> pageParam,
            @RequestParam("name") Optional<String> nameParam,
            @RequestParam("min-price") Optional<String> minPriceParam,
            @RequestParam("max-price") Optional<String> maxPriceParam,
            @RequestParam("price") Optional<String> priceParam,
            @RequestParam("factory") Optional<String> factoryParam) {
        int page = 1;
        Double minPrice = null;
        Double maxPrice = null;
        try {
            page = Integer.parseInt(pageParam.get());
        } catch (Exception e) {
        }
        try {
            minPrice = Double.parseDouble(priceParam.get());
        } catch (Exception e) {
        }
        try {
            maxPrice = Double.parseDouble(maxPriceParam.get());
        } catch (Exception e) {
        }

        String name = nameParam.isPresent() ? nameParam.get() : "";
        String factory = factoryParam.isPresent() ? factoryParam.get() : "";
        Pageable pageable = PageRequest.of(page - 1, 6);
        List<String> factories = factory.isEmpty() ? List.of() : List.of(factory.split(","));
        String price = priceParam.isPresent() ? priceParam.get() : "";
        List<String> prices = price.isEmpty() ? List.of() : List.of(price.split(""));
        Page<Product> productsPage = this.productService.fetchProductsWithSpec(pageable, prices);
        List<Product> products = productsPage.getContent();
        model.addAttribute("products", products);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", productsPage.getTotalPages());
        return "client/homepage/products";
    }
}
