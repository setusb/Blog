package priv.blog.service;

import priv.blog.pojo.User;

import java.util.List;

/**
 * @author setusb
 * @version 1.0
 * @date 2021/4/17 16:39
 */
public interface UserService {

    /**
     * 插入用户数据
     * @param record 用户实体
     * @return 是否插入成功
     * */
    int insert(User record);

    /**
     * 通过用户名查询用户数据
     * @param name 用户名
     * @return 用户实体
     */
    List<User> selectUser(String name);

    /**
     * 通过uuid查询用户数据
     * @param uuid 唯一id
     * @return 用户实体
     */
    List<User> selectIdUser(int uuid);

    /**
     * 插入用户数据
     * @param record 用户实体
     * @return 是否插入成功
     * */
    int insertUser(User record);

    /**
     * 通过uuid更新用户数据
     * @param record 用户实体
     * @return 是否更新成功
     * */
    int updateByPrimaryKeySelective(User record);
}
