package com.younglin.homework.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import org.hibernate.Session;

import com.google.gson.Gson;
import com.younglin.homework.model.dao.ProductDao;
import com.younglin.homework.model.entity.Product;
import com.younglin.homework.util.HibernateUtil;

@WebServlet("/search")
public class SearchProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String searchText = request.getParameter("searchText");
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		try {
			session.beginTransaction();

			ProductDao productDao = new ProductDao(session);
			List<Product> searchResults = productDao.findByType(searchText);
			request.setAttribute("searchResults", searchResults);
			Gson gson = new Gson();
			String json = gson.toJson(searchResults);

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);

			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
