package vn.hoidanit.laptopshop.service.specification;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.Product_;

public class ProductSpecs {
    public static Specification<Product> likeName(String name) {
        return (root, query, criteriaBuilder) -> {
            if (name != null && !name.isEmpty()) {
                return criteriaBuilder.like(root.get(Product_.NAME), "%" + name + "%");
            }
            return criteriaBuilder.conjunction();
        };
    }

    // ge = greater than or equal to, le = less than or equal to
    public static Specification<Product> minPrice(Double price) {
        return (root, query, criteriaBuilder) -> {
            if (price != null) {
                return criteriaBuilder.ge(root.get(Product_.PRICE), price);
            }
            return criteriaBuilder.conjunction();
        };
    }

    public static Specification<Product> maxPrice(Double price) {
        return (root, query, criteriaBuilder) -> {
            if (price != null) {
                return criteriaBuilder.le(root.get(Product_.PRICE), price);
            }
            return criteriaBuilder.conjunction();
        };
    }

    public static Specification<Product> categoryEquals(String factory) {
        return (root, query, criteriaBuilder) -> {
            if (factory != null && !factory.isEmpty()) {
                return criteriaBuilder.equal(root.get(Product_.FACTORY), factory);
            }
            return criteriaBuilder.conjunction();
        };
    }

    public static Specification<Product> categoryIn(List<String> factories) {
        return (root, query, criteriaBuilder) -> {
            if (factories != null && !factories.isEmpty()) {
                return criteriaBuilder.in(root.get(Product_.FACTORY)).value(factories);
            }
            return criteriaBuilder.conjunction();
        };
    }

    public static Specification<Product> targetIn(List<String> targets) {
        return (root, query, criteriaBuilder) -> {
            if (targets != null && !targets.isEmpty()) {
                return criteriaBuilder.in(root.get(Product_.TARGET)).value(targets);
            }
            return criteriaBuilder.conjunction();
        };
    }

    public static Specification<Product> priceBetween(double minPrice, double maxPrice) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.and(
                criteriaBuilder.ge(root.get(Product_.PRICE), minPrice),
                criteriaBuilder.le(root.get(Product_.PRICE), maxPrice));
    }

    public static Specification<Product> multiPrice(double minPrice, double maxPrice) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.between(root.get(Product_.PRICE), minPrice, maxPrice);
    }
}
