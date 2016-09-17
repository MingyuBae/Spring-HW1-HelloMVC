package service;

import java.util.HashMap;
import java.util.Map;

import model.Customer;

public class CustomerService {
	private Map<String, Customer> customers;

	public CustomerService() {
		customers = new HashMap<>();
		
		addCustomer(new Customer("id001", "Alice", "alice@hansung.ac.kr"));
		addCustomer(new Customer("id002", "Bob", "bob@hansung.ac.kr"));
		addCustomer(new Customer("id003", "Charlie", "charlie@hansung.ac.kr"));
		addCustomer(new Customer("id004", "David", "david@hansung.ac.kr"));
		addCustomer(new Customer("id005", "Trudy", "trudy@hansung.ac.kr"));

	}
	
	public void addCustomer(Customer customer){
		customers.put(customer.getId(), customer);
	}
	
	public Customer findCustomer(String id){
		if(id != null){
			return customers.get(id.toLowerCase());
		} else {
			return null;
		}
	}
}
