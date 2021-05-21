package priv.blog.controller;

import com.alibaba.fastjson.JSON;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import priv.blog.pojo.Article;
import priv.blog.service.ArticleService;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

/**
 * @author setusb
 * @version 1.0
 * @date 2021/4/20 22:21
 */
@Controller
public class ArticleController {
    final
    ArticleService articleService;

    public ArticleController(@Qualifier("articleServiceImpl") ArticleService articleService) {
        this.articleService = articleService;
    }

    /**
     * 文章上传
     */
    @RequestMapping(path = "/articlePost", method = RequestMethod.POST)
    @ResponseBody
    public String articlePost(HttpSession session, @Param("articleTitle") String articleTitle, @Param("articleTarget") String articleTarget, @Param("content") String content) {
        HashMap<String, Object> hashMap = new HashMap<>();

        int uuid = (int) session.getAttribute("loginSuccessful");

        Article article = new Article();
        article.setUuid(uuid);
        article.setArticleTitle(articleTitle);
        article.setArticleTarget(articleTarget);
        article.setArticleContent(content);
        article.setArticleBan(0);
        article.setArticleTop(0);
        article.setArticlePoints(0);

        int s = articleService.insertContent(article);
        if (s == 1) {
            hashMap.put("flag", true);
        } else {
            hashMap.put("flag", false);
        }

        return JSON.toJSONString(hashMap);
    }

    /**
     * 用于跳转主页
     */
    @RequestMapping(path = "/index")
    public String index(Model model) {
        model.addAttribute("article", articleService.listByAll());
        return "index";
    }

    /**
     * 退出登录
     */
    @RequestMapping(path = "/signOut")
    public String signOut(HttpSession session, Model model) {
        model.addAttribute("article", articleService.listByAll());
        session.removeAttribute("loginSuccessful");
        return "index";
    }


    /**
     * 默认主页
     */
    @RequestMapping(path = "")
    public String returnIndex(Model model) {
        model.addAttribute("article", articleService.listByAll());
        return "index";
    }

    /**
     * 通过文章id索引文章
     */
    @RequestMapping(path = "/article/{id}")
    public String articleIndex(@PathVariable int id, Model model) {
        model.addAttribute("article", articleService.selectByPrimaryKey(id));
        return "default/articleinfo";
    }

    /**
     * 用于跳转用户信息修改
     */
    @RequestMapping(path = "/default/userinfo")
    public String userInfo(HttpSession session, Model model) {
        int uuid = (int) session.getAttribute("loginSuccessful");

        model.addAttribute("article", articleService.selectAllByUuid(uuid));

        return "default/userinfo";
    }

    @RequestMapping(path = "/default/articleDelete", method = RequestMethod.POST)
    @ResponseBody
    public String articleDelete(@Param("uuid") int uuid) {
        HashMap<String, Object> hashMap = new HashMap<>();

        int s = articleService.deleteByPrimaryKey(uuid);

        if (s == 1) {
            hashMap.put("flag", true);
        } else {
            hashMap.put("flag", false);
        }

        return JSON.toJSONString(hashMap);
    }

    /**
     * 编辑发帖资源
     */
    @RequestMapping(path = "/default/updateArticle/{id}")
    public String articleUpdate(@PathVariable int id, Model model) {
        articleService.selectByPrimaryKey(id);
        model.addAttribute("article", articleService.selectByPrimaryKey(id));
        return "default/articleupdate";
    }

    /**
     * 更新发帖资源
     */
    @RequestMapping(path = "/default/updateArticles/{id}", method = RequestMethod.POST)
    @ResponseBody
    public String articleUpdate(@PathVariable int id, @Param("articleTitle") String articleTitle, @Param("articleTarget") String articleTarget, @Param("content") String content) {
        HashMap<String, Object> hashMap = new HashMap<>();

        Article article = new Article();

        /*System.out.println("文章id: "+id+"\n文章标题: "+articleTitle+"\n文章简介: "+articleTarget+"\n文章内容: "+content);*/

        article.setArticleUuid(id);
        article.setArticleTitle(articleTitle);
        article.setArticleTarget(articleTarget);
        article.setArticleContent(content);

        if (articleService.updateByPrimaryKeySelective(article) == 1) {
            hashMap.put("flag", true);
        } else {
            hashMap.put("flag", false);
        }

        return JSON.toJSONString(hashMap);
    }

    /**
     * 搜索文章
     */
    @RequestMapping(path = "/search/{title}")
    public String search(@PathVariable String title, Model model) {

        List<Article> list = articleService.articleSelectAllByArticleTitle(title);

        if (list.isEmpty()) {
            model.addAttribute("flag", "1");
            return "default/search";
        }

        model.addAttribute("article", list);

        return "default/search";
    }

    /**
    * 文章点赞
    */
    @RequestMapping(path = "/likePlusOne", method = RequestMethod.POST)
    @ResponseBody
    public String likePlusOne(@Param("uuid") int uuid) {
        HashMap<String, Object> hashMap = new HashMap<>();

        Article article = articleService.selectByPrimaryKey(uuid);
        Article ae = new Article();

        ae.setArticleUuid(uuid);
        ae.setArticlePoints(article.getArticlePoints() + 1);

        hashMap.put("flag", article.getArticlePoints() + 1);

        articleService.updateByPrimaryKeySelective(ae);

        return JSON.toJSONString(hashMap);
    }
}
