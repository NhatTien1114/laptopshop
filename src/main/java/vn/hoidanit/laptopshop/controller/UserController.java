package vn.hoidanit.laptopshop.controller;

import vn.hoidanit.laptopshop.service.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {

    // DI = Dependency injection
    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getUserPage() {
        String test = this.userService.handleUser();
        return "hello.html";
    }

}
