package com.jbssm.service.impl;


import com.jbssm.dao.UserDao;
import com.jbssm.domain.User;
import com.jbssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    public User login(User user){
       return userDao.login(user);
    }

    @Override
    public List<User> findAllUser() {
        return userDao.findAllUser();
    }

    @Override
    public void addUser(User user) {
        userDao.addUser(user);
    }

    public void register(User user){
        userDao.register(user);
    }

    @Override
    public void updateUser(User user) {
        userDao.updateUser(user);
    }

    public User findByName(String username) {
        return userDao.findByName(username);
    }

    @Override
    public void deleteUser(int id) {
        userDao.deleteUser(id);
    }

}
