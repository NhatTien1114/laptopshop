package vn.hoidanit.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.CartDetail;
import vn.hoidanit.laptopshop.domain.Order;
import vn.hoidanit.laptopshop.domain.OrderDetail;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.CartDetailRepository;
import vn.hoidanit.laptopshop.repository.CartRepository;
import vn.hoidanit.laptopshop.repository.OrderDetailRepository;
import vn.hoidanit.laptopshop.repository.OrderRepository;
import vn.hoidanit.laptopshop.repository.ProductRepository;
import vn.hoidanit.laptopshop.repository.UserRepository;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserRepository userRepository;
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public ProductService(ProductRepository productRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, UserRepository userRepository,
            OrderRepository orderRepository, OrderDetailRepository orderDetailRepository) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userRepository = userRepository;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public Page<Product> fetchProducts(Pageable pageable) {
        return productRepository.findAll(pageable);
    }

    public Optional<Product> fetchProductsById(long id) {
        return this.productRepository.findById(id);
    }

    public void createProduct(Product product) {
        this.productRepository.save(product);
    }

    public void deleteProduct(long id) {
        this.productRepository.deleteById(id);
    }

    public void handleAddProductToCart(String email, long productId, HttpSession session, long quantity) {
        User user = this.userRepository.findByEmail(email);
        if (user != null) {
            Cart cart = this.cartRepository.findByUser(user);

            if (cart == null) {
                Cart otherCart = new Cart();
                otherCart.setUser(user);
                otherCart.setSum(1);

                cart = this.cartRepository.save(otherCart);
            }

            Optional<Product> productOptional = this.productRepository.findById(productId);
            if (productOptional.isPresent()) {
                Product product = productOptional.get();

                CartDetail oldCart = this.cartDetailRepository.findByCartAndProduct(cart, product);
                if (oldCart == null) {
                    CartDetail cartDetail = new CartDetail();
                    cartDetail.setCart(cart);
                    cartDetail.setProduct(product);
                    cartDetail.setPrice(product.getPrice());
                    cartDetail.setQuantity(quantity);
                    this.cartDetailRepository.save(cartDetail);

                    // Update sum in cart
                    int sum = cart.getSum() + 1;
                    cart.setSum(sum);
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", sum);

                } else {
                    oldCart.setQuantity(oldCart.getQuantity() + quantity);
                    this.cartDetailRepository.save(oldCart);
                }

            }

        }
    }

    public Cart fetchByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public void removeProductFromCart(long cartDetailId, HttpSession session) {
        Optional<CartDetail> currentDetail = this.cartDetailRepository.findById(cartDetailId);
        if (currentDetail.isPresent()) {
            CartDetail cartDetail = currentDetail.get();
            cartDetailRepository.delete(cartDetail);
            Cart cart = cartDetail.getCart();

            if (cart.getSum() > 1) {
                cart.setSum(cart.getSum() - 1);
                this.cartRepository.save(cart);
                session.setAttribute("sum", cart.getSum());
            } else {
                this.cartRepository.delete(cart);
                session.setAttribute("sum", 0);
            }

        }
    }

    public void handleUpdateCartBeforeCheckou(List<CartDetail> cartDetails) {
        for (CartDetail cartDetail : cartDetails) {
            Optional<CartDetail> currentCartDetail = this.cartDetailRepository.findById(cartDetail.getId());
            if (currentCartDetail.isPresent()) {
                CartDetail existingCartDetail = currentCartDetail.get();
                existingCartDetail.setQuantity(cartDetail.getQuantity());
                this.cartDetailRepository.save(existingCartDetail);
            }
        }
    }

    public void handleOrder(User user, HttpSession session, String receiverName, String receiverPhone,
            String receiverAddress) {
        Cart cart = this.cartRepository.findByUser(user);

        if (cart != null) {
            // create order
            Order order = new Order();
            order.setUser(user);
            order.setReceiverName(receiverName);
            order.setReceiverPhone(receiverPhone);
            order.setReceiverAddress(receiverAddress);
            order.setStatus("PENDING");
            List<CartDetail> cartDetails = cart.getCartDetails();
            long totalPrice = 0;
            for (CartDetail cartDetail : cartDetails) {
                totalPrice += cartDetail.getPrice() * cartDetail.getQuantity();
            }
            order.setTotalPrice(totalPrice);
            order = this.orderRepository.save(order);

            if (cartDetails != null) {
                for (CartDetail cartDetail : cartDetails) {
                    // create order detail
                    OrderDetail orderDetail = new vn.hoidanit.laptopshop.domain.OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(cartDetail.getProduct());
                    orderDetail.setPrice(cartDetail.getPrice());
                    orderDetail.setQuantity(cartDetail.getQuantity());
                    this.orderDetailRepository.save(orderDetail);
                }

                for (CartDetail cartDetail : cartDetails) {
                    // delete cart detail
                    this.cartDetailRepository.deleteById(cartDetail.getId());
                }

                // delete cart
                this.cartRepository.deleteById(cart.getId());
                session.setAttribute("sum", 0);
            }
        }

    }

}
