package com.studycafe.article.repository;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.studycafe.article.domain.Article;
import com.studycafe.article.domain.ArticleComment;
import com.studycafe.article.domain.Page;
import com.studycafe.user.domain.User;

@Repository
public class ArticleRepositoryImpl implements ArticleRepository {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getArticleListCount() throws DataAccessException {
		return sqlSession.selectOne("mapper.article.articleListCount");
	}
	
	
	@Override
	public List<Article> getArticleAllList(Page pageNo) throws DataAccessException {
		return sqlSession.selectList("mapper.article.articleAllList", pageNo);
	}

	@Override
	public int searchTitleCount(String searchTitle) throws DataAccessException {
		return sqlSession.selectOne("mapper.article.searchTitleCount",searchTitle);
	}
	
	
	@Override
	public List<Article> getSearchTitleList(Page pageNo) throws DataAccessException {
		return sqlSession.selectList("mapper.article.SearchTitleList", pageNo);
	}
	@Override
	public Article getArticleDetail(int no) throws DataAccessException {
		return sqlSession.selectOne("mapper.article.articleDetail",no);
	}

	@Override
	public List<ArticleComment> getCommentList(int no) throws DataAccessException {
		List<ArticleComment> articleComment = sqlSession.selectList("mapper.article.commentList",no);
		return articleComment;
	}
	
	@Override
	public List<Article> getSearchTitle(String searchTitle) throws DataAccessException {
		return sqlSession.selectList("mapper.article.searchTitle",searchTitle);
	}


	@Override
	public void addArticle(Article article) throws DataAccessException {
		sqlSession.insert("mapper.article.addArticle", article);		
	}


	@Override
	public void modifyArticle(Article article) throws DataAccessException {
		sqlSession.update("mapper.article.modifyArticle", article);
		
	}


	@Override
	public void deleteArticle(int a_no) throws DataAccessException {
		sqlSession.update("mapper.article.deleteArticle",a_no);
	}


	@Override
	public void addComment(ArticleComment articleComment) throws DataAccessException {
		sqlSession.insert("mapper.article.addComment",articleComment);		
		
	}





	@Override
	public ArticleComment getComment(int ac_no) throws DataAccessException {
		return sqlSession.selectOne("mapper.article.getComment",ac_no);
	}


	@Override
	public void modiComment(ArticleComment articleComment) throws DataAccessException {
		sqlSession.update("mapper.article.modiComment",articleComment);
	}


	@Override
	public void deleteComment(int ac_no) throws DataAccessException {
		sqlSession.update("mapper.article.deleteComment",ac_no);
		
	}


	@Override
	public void addCnt(Article article) throws DataAccessException {
		sqlSession.update("mapper.article.addCnt",article);		
	}


	@Override
	public void subCnt(int a_no) throws DataAccessException {
		sqlSession.update("mapper.article.subCnt",a_no);		
	}




	






}
