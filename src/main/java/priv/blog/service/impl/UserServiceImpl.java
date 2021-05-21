package priv.blog.service.impl;

import org.springframework.stereotype.Service;
import priv.blog.dao.UserMapper;
import priv.blog.pojo.User;
import priv.blog.service.UserService;

import java.util.Collections;
import java.util.List;

/**
 * @author setusb
 * @version 1.0
 * @date 2021/4/17 16:40
 */
public class UserServiceImpl implements UserService {

    private UserMapper userMapper;

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public int insert(User record) {
        return userMapper.insert(record);
    }

    @Override
    public List<User> selectUser(String name) {
        return userMapper.selectByUsername(name);
    }

    @Override
    public List<User> selectIdUser(int uuid) {
        return userMapper.selectByPrimaryKey(uuid);
    }

    @Override
    public int insertUser(User record) {
        int s;
        try {
            userMapper.autoIncrement("user");
            s = userMapper.insert(record);
        } catch (Exception e) {
            return 0;
        }
        return s;
    }

    @Override
    public int updateByPrimaryKeySelective(User record) {
        int s;
        try {
            s = userMapper.updateByPrimaryKeySelective(record);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
        return s;
    }
}
