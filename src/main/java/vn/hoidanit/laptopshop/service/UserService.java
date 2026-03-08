package vn.hoidanit.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.UserRepository;

@Service
public class UserService {

    // DI: Dependency Injection
    private final UserRepository userRepository;
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public List<User> getUserByEmailAndAddress(String email, String address) {
        return this.userRepository.findUserByEmailAndAddress(email, address);
    }

    public User handleSaveUser(User user) {
        User bin = this.userRepository.save(user);
        return bin;
    }
}
