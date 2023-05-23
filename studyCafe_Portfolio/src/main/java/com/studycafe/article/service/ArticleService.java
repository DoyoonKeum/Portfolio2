package com.studycafe.article.service;

import java.util.List;

import com.studycafe.article.domain.Article;
import com.studycafe.article.domain.ArticleComment;
import com.studycafe.article.domain.ArticlePage;
import com.studycafe.article.domain.Page;
import com.studycafe.user.domain.User;

public interface ArticleService {
	
	public ArticlePage getArticlePage(Page pageNo) throws Exception;

	public Article getArticleDetail(int no) throws Exception;

	public ArticlePage getSearchTitle(Page pageNo) throws Exception;

	public void addArticle(Article article) throws Exception;

	public void modifyArticle(Article article) throws Exception;

	public void deleteArticle(int a_no) throws Exception;

	public List<ArticleComment> getCommentList(int no) throws Exception;

	public void addComment(ArticleComment articleComment) throws Exception;
	


	public ArticleComment getComment(int ac_no) throws Exception;

	public void modiComment(ArticleComment articleComment) throws Exception;

	public void deleteComment(int ac_no) throws Exception;

	public void addCnt(Article article) throws Exception;

	public void subCnt(int a_no) throws Exception;


}
