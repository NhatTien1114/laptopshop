package vn.hoidanit.laptopshop.controller;

import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {

    // DI = Dependency injection
    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getUserPage(Model model) {
        String test = this.userService.handleUser();
        model.addAttribute("binbin", test);
        model.addAttribute("nhattien", "Tôi là Tiến");
        return "helloJSP";
    }

    @RequestMapping("/admin/user")
    public String getInputUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user/create1", method = RequestMethod.POST)
    public String createInputUserPage(Model model, @ModelAttribute("newUser") User user) {
        System.out.println("run here" + user);
        return "helloJSP";
    }

}
