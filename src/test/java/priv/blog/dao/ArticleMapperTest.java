package priv.blog.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.BeforeClass;
import org.junit.Test;
import priv.blog.pojo.Article;

import java.util.List;

/**
 * @author setusb
 * @version 1.0
 * @date 2021/4/20 22:58
 */
public class ArticleMapperTest {

    private static ArticleMapper mapper;

    @BeforeClass
    public static void setUpMybatisDatabase() {
        SqlSessionFactory builder = new SqlSessionFactoryBuilder().build(ArticleMapperTest.class.getClassLoader().getResourceAsStream("mybatisTestConfiguration/ArticleMapperTestConfiguration.xml"));
        //you can use builder.openSession(false) to not commit to database
        mapper = builder.getConfiguration().getMapper(ArticleMapper.class, builder.openSession(true));
    }

    @Test
    public void testInsert() {

        int uuid = 1;
        Article article = new Article();
        article.setUuid(uuid);
        article.setArticleTitle("123");
        article.setArticleTarget("123");
        article.setArticleContent("123");
        article.setArticleBan(0);
        article.setArticleTop(0);
        article.setArticlePoints(0);
        mapper.insert(article);
    }

    @Test
    public void testListByAll() {
        List<Article> list = mapper.listByAll();
        for (Article article : list) {
            System.out.println(article.getArticleTitle());
        }
    }

    @Test
    public void testUpdateByPrimaryKeySelective() {

        Article article = new Article();
        article.setArticleUuid(1);
        article.setArticleTitle("123");
        article.setArticleTarget("123");
        article.setArticleContent("123");
        System.out.println(mapper.updateByPrimaryKeySelective(article));
    }
}
