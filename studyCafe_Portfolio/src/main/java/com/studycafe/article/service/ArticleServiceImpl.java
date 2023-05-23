package com.studycafe.article.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studycafe.article.domain.Article;
import com.studycafe.article.domain.ArticleComment;
import com.studycafe.article.domain.ArticlePage;
import com.studycafe.article.domain.Page;
import com.studycafe.article.repository.ArticleRepository;
import com.studycafe.user.domain.User;

@Service
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	ArticleRepository articleRepository;
	
	@Override
	public ArticlePage getArticlePage(Page pageNo) throws Exception {
		
		int total = articleRepository.getArticleListCount();
		List<Article> articleAllList = articleRepository.getArticleAllList(pageNo);
		return new ArticlePage(total,pageNo.getPageNo(),5, articleAllList);
	}

	@Override
	public Article getArticleDetail(int no) throws Exception {
		return articleRepository.getArticleDetail(no);
	}
	@Override
	public List<ArticleComment> getCommentList(int no) throws Exception {
		return articleRepository.getCommentList(no);
	}

	@Override
	public ArticlePage getSearchTitle(Page pageNo) throws Exception {
		int total = articleRepository.searchTitleCount(pageNo.getSearchTitle());
		System.out.println("total="+total);
		List<Article> SearchTitleList = articleRepository.getSearchTitleList(pageNo);
		return new ArticlePage(total,pageNo.getPageNo(),5, SearchTitleList);
	}

	@Override
	public void addArticle(Article article) throws Exception {
		articleRepository.addArticle(article);
	}

	@Override
	public void modifyArticle(Article article) throws Exception {
		articleRepository.modifyArticle(article);
	}

	@Override
	public void deleteArticle(int a_no) throws Exception {
		articleRepository.deleteArticle(a_no);
	}

	@Override
	public void addComment(ArticleComment articleComment) throws Exception {
		articleRepository.addComment(articleComment);
	}



	@Override
	public ArticleComment getComment(int ac_no) throws Exception {
		return articleRepository.getComment(ac_no);
	}

	@Override
	public void modiComment(ArticleComment articleComment) throws Exception {
		articleRepository.modiComment(articleComment);
	}

	@Override
	public void deleteComment(int ac_no) throws Exception {
		articleRepository.deleteComment(ac_no);
		
	}

	@Override
	public void addCnt(Article article) throws Exception{
		articleRepository.addCnt(article);
	}

	@Override
	public void subCnt(int a_no) throws Exception {
		articleRepository.subCnt(a_no);
	}




}
