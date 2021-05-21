package priv.blog.service;

import org.apache.ibatis.annotations.Param;
import priv.blog.pojo.Article;

import java.util.List;

/**
 * @author setusb
 * @version 1.0
 * @date 2021/4/20 21:01
 */
public interface ArticleService {

    /**
     * 插入文章内容
     * @param record 文章实体
     * @return 是否插入成功
     * */
    int insertContent(Article record);

    /**
     * 返回所有文章信息
     * @return list数组
     * */
    List<Article> listByAll();

    /**
     * 通过主键查询文章内容
     * @param articleUuid 文章id
     * @return 文章实体
     * */
    Article selectByPrimaryKey(Integer articleUuid);

    /**
     * 通过匹配uuid来获取文章信息
     * @param uuid 唯一id
     * @return list数组
     * */
    List<Article> selectAllByUuid(Integer uuid);

    /**
     * 通过文章id删除
     * @param articleUuid 文章id
     * @return 返回是否删除成功
     * */
    int deleteByPrimaryKey(Integer articleUuid);

    /**
     * 通过主键选择性更新文章内容
     * @param record 文章实体
     * @return 是否更新成功
     * */
    int updateByPrimaryKeySelective(Article record);

    /**
     * 通过匹配文章标题获取文章信息
     * @param articleTitle 标题信息
     * @return list数组
     * */
    List<Article> articleSelectAllByArticleTitle(String articleTitle);
}
