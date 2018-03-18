package com.ors.service;

import com.ors.model.User;
import com.ors.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRole("USER");
        userRepository.save(user);
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public User findByObjectId(Long objectId) { return userRepository.findByObjectId(objectId); }

    @Override
    public void updateEmail(String email, Long id){
        userRepository.updateEmail(email, id);
    }

    @Override
    public void updatePassword(String password, Long id){
        userRepository.updatePassword(password, id);
    }

    @Override
    public void updateNumber(String number, Long id){
        userRepository.updatePhone(number, id);
    }
}
