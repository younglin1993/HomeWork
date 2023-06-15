package com.younglin.homework.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.younglin.homework.model.entity.Product;

public class ProductDao {
	
	private Session session;
	
	public ProductDao(Session session) {
		this.session = session;
	}

	public List<Product> findAll() {
		Query<Product> query = session.createQuery("FROM Product", Product.class);
		return query.list();
	}
	
	public List<Product> findByType(String type) {
		String hql = "FROM Product WHERE productType = :type";
		Query<Product> query = session.createQuery(hql, Product.class);
        query.setParameter("type", type);
        return query.getResultList();
	}
}
