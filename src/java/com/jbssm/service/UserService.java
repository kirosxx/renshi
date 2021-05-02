package com.jbssm.service;

import com.jbssm.domain.User;

import java.util.List;

public interface UserService {

    public User login(User user);

    public List<User> findAllUser();

    public void addUser(User user);

    public void register(User user);

    public void updateUser(User user);

    public User findByName(String username);

    public void deleteUser(int id);

}
