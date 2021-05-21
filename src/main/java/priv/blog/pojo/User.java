package priv.blog.pojo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author setusb
 * @version 1.0
 * @date 2021/4/17 16:30
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    /**
     * 唯一id
     */
    private Integer uuid;

    /**
     * 用户名
     */
    private String username;

    /**
     * 昵称
     */
    private String nickname;

    /**
     * 密码
     */
    private String password;

    /**
     * 注册日期
     */
    private Date date;

    /**
     * 性别
     */
    private String sex;

    /**
     * 用户信息
     */
    private String userinfo;

    /**
     * 权限
     */
    private Integer authority;

    /**
     * 验证
     */
    private Integer verification;
}