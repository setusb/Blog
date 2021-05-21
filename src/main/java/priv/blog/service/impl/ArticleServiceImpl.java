package priv.blog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import priv.blog.dao.ArticleMapper;
import priv.blog.dao.UserMapper;
import priv.blog.pojo.Article;
import priv.blog.service.ArticleService;

import java.util.List;

/**
 * @author setusb
 * @version 1.0
 * @date 2021/4/20 21:01
 */
public class ArticleServiceImpl implements ArticleService {

    private UserMapper userMapper;

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    private ArticleMapper articleMapper;

    public void setArticleMapper(ArticleMapper articleMapper) {
        this.articleMapper = articleMapper;
    }

    @Override
    public int insertContent(Article record) {
        int s;
        userMapper.autoIncrement("article");
        try {
            s = articleMapper.insertSelective(record);
        } catch (Exception e) {
            return 0;
        }
        return s;
    }

    @Override
    public List<Article> listByAll() {
        return articleMapper.listByAll();
    }

    @Override
    public Article selectByPrimaryKey(Integer articleUuid) {
        return articleMapper.selectByPrimaryKey(articleUuid);
    }

    @Override
    public List<Article> selectAllByUuid(Integer uuid) {
        return articleMapper.selectAllByUuid(uuid);
    }

    @Override
    public int deleteByPrimaryKey(Integer articleUuid) {
        return articleMapper.deleteByPrimaryKey(articleUuid);
    }

    @Override
    public int updateByPrimaryKeySelective(Article record) {
        return articleMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public List<Article> articleSelectAllByArticleTitle(String articleTitle) {
        return articleMapper.selectAllByArticleTitle(articleTitle);
    }
}
