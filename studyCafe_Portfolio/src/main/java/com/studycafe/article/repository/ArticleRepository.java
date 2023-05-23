package com.studycafe.article.repository;

import java.util.List;


import org.springframework.dao.DataAccessException;

import com.studycafe.article.domain.Article;
import com.studycafe.article.domain.ArticleComment;
import com.studycafe.article.domain.ArticlePage;
import com.studycafe.article.domain.Page;
import com.studycafe.user.domain.User;

public interface ArticleRepository {

	public int getArticleListCount() throws DataAccessException;
	
	public List<Article> getArticleAllList(Page pageNo) throws DataAccessException;

	public Article getArticleDetail(int no) throws DataAccessException;

	public List<Article> getSearchTitle(String searchTitle) throws DataAccessException;

	public void addArticle(Article article) throws DataAccessException;

	public void modifyArticle(Article article) throws DataAccessException;

	public void deleteArticle(int a_no) throws DataAccessException;

	public List<ArticleComment> getCommentList(int no) throws DataAccessException;

	public void addComment(ArticleComment articleComment) throws DataAccessException;



	public ArticleComment getComment(int ac_no) throws DataAccessException;

	public void modiComment(ArticleComment articleComment) throws DataAccessException;

	public void deleteComment(int ac_no) throws DataAccessException;

	public int searchTitleCount(String searchTitle) throws DataAccessException;

	public List<Article> getSearchTitleList(Page pageNo) throws DataAccessException;

	public void addCnt(Article article) throws DataAccessException;

	public void subCnt(int a_no) throws DataAccessException;

}
