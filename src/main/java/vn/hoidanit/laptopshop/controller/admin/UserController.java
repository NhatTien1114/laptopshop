package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.UpLoadFileService;
import vn.hoidanit.laptopshop.service.UserService;


@Controller
public class UserController {

    // DI = Dependency injection
    private final UserService userService;
    private final UpLoadFileService upLoadFileService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UpLoadFileService upLoadFileService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.upLoadFileService = upLoadFileService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/")
    public String getUserPage(Model model) {
        model.addAttribute("binbin", "test");
        model.addAttribute("nhattien", "Tôi là Tiến");
        return "helloJSP";
    }

    @GetMapping("/admin/user")
    public String getTableUserPage(Model model) {
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin/user/show";
    }

    @RequestMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        User userDetail = this.userService.getUserById(id);
        model.addAttribute("userDetail", userDetail);
        return "admin/user/detail";
    }

    @RequestMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        User userUpdate = this.userService.getUserById(id);
        model.addAttribute("userUpdate", userUpdate);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String updateUser(@ModelAttribute("userUpdate") User user) {
        User userUpdate = this.userService.getUserById(user.getId());
        if (userUpdate != null) {
            userUpdate.setAddress(user.getAddress());
            userUpdate.setFullName(user.getFullName());
            userUpdate.setPhoneNumber(user.getPhoneNumber());
            this.userService.handleSaveUser(userUpdate); // vì user đã tồn tại nên sẽ update, nếu không có thì sẽ tạo mới
        }
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/create") // không có method => mặc định GET
    public String getInputUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create") 
    public String createInputUserPage(Model model, 
        @ModelAttribute("newUser") User user,
        @RequestParam("avatarFile") MultipartFile file
    ) {
        String avatar = this.upLoadFileService.handleUpLoadFile(file, "avatar");
        user.setAvatar(avatar);
        user.setPassword(this.passwordEncoder.encode(user.getPassword()));
        user.setRole(this.userService.getRoleByName(user.getRole().getName()));
        this.userService.handleSaveUser(user);
        return "redirect:/admin/user"; // sau khi tạo xong thì quay về trang table user
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("userDelete", new User());
        return "admin/user/delete";
    }
    
    @PostMapping("/admin/user/delete")
    public String deleteUser(Model model, @ModelAttribute("userDelete") User user) {
        this.userService.handleDeleteUser(user.getId());
        return "redirect:/admin/user";
    }
}
