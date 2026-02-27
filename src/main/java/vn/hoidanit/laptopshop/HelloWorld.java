package vn.hoidanit.laptopshop;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorld {
    @GetMapping("/")
    public String index() {
        return "Hello World From Nhat Tien with love hehe";
    }

    @GetMapping("/user")
    public String userPage() {
        return "User page hello guys";
    }

    @GetMapping("/admin")
    public String adminPage() {
        return "Admin page hello guys";
    }

}
