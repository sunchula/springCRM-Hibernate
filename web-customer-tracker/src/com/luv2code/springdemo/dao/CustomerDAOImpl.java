package com.luv2code.springdemo.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luv2code.springdemo.entity.Customer;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

	//need to inject the session factory
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Customer> getCustomers() {

		//get the current Hibernate Session
		Session currentSession = sessionFactory.getCurrentSession();

		//create the query .... sort by last name
		Query<Customer> theQuery = currentSession.createQuery("from Customer order by lastName", Customer.class);
		
		//exceute the query
		List<Customer> customers = theQuery.getResultList();
		
		//return the results
		return customers;
	}

	@Override
	public void saveCustomer(Customer theCustomer) {

		//get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		//save/update the customer .... finally LOL
		currentSession.saveOrUpdate(theCustomer);
	}

	@Override
	public Customer getCustomer(int theId) {

		//get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		//now retrieve/read from databasse using Primary key
		Customer theCustomer = currentSession.get(Customer.class, theId);		
		
		return theCustomer;
	}

	@Override
	public void deleteCustomer(int theId) {

		//get current Hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		//delete object with primary key
		Query theQuery = currentSession.createQuery("delete from Customer where id=:theCustomerId");
		theQuery.setParameter("theCustomerId", theId);
		
		theQuery.executeUpdate();
	}
}










