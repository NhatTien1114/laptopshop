package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.hoidanit.laptopshop.domain.Order;
import vn.hoidanit.laptopshop.domain.OrderDetail;
import vn.hoidanit.laptopshop.repository.OrderRepository;
import vn.hoidanit.laptopshop.service.OrderDetailService;
import vn.hoidanit.laptopshop.service.OrderService;

@Controller
public class OrderController {
    private final OrderRepository orderRepository;
    private final OrderService orderService;
    private final OrderDetailService orderDetailService;

    public OrderController(OrderService orderService, OrderDetailService orderDetailService,
            OrderRepository orderRepository) {
        this.orderService = orderService;
        this.orderDetailService = orderDetailService;
        this.orderRepository = orderRepository;
    }

    // Read
    @GetMapping("/admin/order")
    public String getOrderPage(Model model, @RequestParam("page") Optional<String> pageParam) {
        int page = 1;
        try {
            page = Integer.parseInt(pageParam.get());
        } catch (Exception e) {
        }
        Pageable pageable = PageRequest.of(page - 1, 1);
        Page<Order> orderPage = this.orderService.fetchAllOrders(pageable);
        List<Order> orders = orderPage.getContent();
        model.addAttribute("orders", orders);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", orderPage.getTotalPages());
        return "admin/order/show_order";
    }

    @GetMapping("/admin/order/{id}")
    public String getOrderDetailPage(Model model) {
        List<OrderDetail> orderDetails = this.orderDetailService.fetchAllOrders();
        model.addAttribute("orderDetails", orderDetails);
        return "admin/order/detail_order";
    }

    // Update
    @GetMapping("/admin/order/update/{id}")
    public String getUpdateOrderPage(Model model, @PathVariable long id) {
        Optional<Order> orderUpdate = this.orderService.fetchOrderById(id);
        model.addAttribute("orderUpdate", orderUpdate.get());
        return "admin/order/update_order";
    }

    @PostMapping("/admin/order/update/{id}")
    public String updateOrder(@ModelAttribute("orderUpdate") Order orderUpdate) {
        this.orderService.updateOrder(orderUpdate);
        return "redirect:/admin/order";
    }

    // Delete
    @GetMapping("/admin/order/delete/{id}")
    public String getDeleteOrderPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newOrder", new Order());
        return "admin/order/delete_order";
    }

    @PostMapping("/admin/order/delete")
    public String deleteOrder(@ModelAttribute("orderDelete") Order orderDelete) {
        this.orderService.deleteOrder(orderDelete.getId());
        return "redirect:/admin/order";
    }
}
