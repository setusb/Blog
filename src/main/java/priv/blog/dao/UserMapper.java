package priv.blog.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;

import priv.blog.pojo.User;

/**
 * @author setusb
 * @version 1.0
 * @date 2021/4/17 16:30
 */
public interface UserMapper {
    /**
     * 通过uuid删除用户数据
     *
     * @param uuid uuid
     * @return 是否删除成功
     */
    int deleteByPrimaryKey(Integer uuid);

    /**
     * 插入用户数据
     *
     * @param record 用户实体
     * @return 是否插入成功
     */
    int insert(User record);

    /**
     * 插入可选择的用户数据
     *
     * @param record 用户实体
     * @return 是否插入成功
     */
    int insertSelective(User record);

    /**
     * 按主键选择用户数据
     *
     * @param uuid uuid
     * @return 返回用户实体
     */
    List<User> selectByPrimaryKey(Integer uuid);

    /**
     * 通过uuid更新可选择用户数据
     *
     * @param record 用户实体
     * @return 是否更新成功
     */
    int updateByPrimaryKeySelective(User record);

    /**
     * 通过uuid更新用户数据
     *
     * @param record 用户实体
     * @return 是否更新成功
     */
    int updateByPrimaryKey(User record);

    /**
     * 通过用户名查询用户数据
     *
     * @param username 用户名
     * @return 用户实体
     */
    List<User> selectByUsername(@Param("username") String username);

    /**
     * 插入用户数据
     *
     * @param list 用户实体
     * @return 是否插入成功
     */
    int insertList(@Param("list") List<User> list);

    /**
     * 自增还原
     */
    void autoIncrement(@Param("tablesName") String tablesName);
}