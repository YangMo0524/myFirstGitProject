package com.ssm.pet.service.serviceimpl;

import com.ssm.pet.dao.UserDAO;
import com.ssm.pet.pojo.UserTO;
import com.ssm.pet.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{
    @Autowired
    private UserDAO userDAO;

    @Override
    public void register(UserTO user) {
        userDAO.insertOneUser(user);
    }

    @Override
    public UserTO login(UserTO user) {
        return userDAO.selectUserByUserName(user);
    }

    @Override
    public UserTO getUserByName(UserTO user) {
        return userDAO.selectUserByUserName(user);
    }
}
