package service;

import java.util.HashMap;
import java.util.Map;

import model.Customer;

public class CustomerService {
	private static final CustomerService instance = new CustomerService();
	private Map<String, Customer> customers;

	private CustomerService() {
		customers = new HashMap<>();
	}
	
	public static CustomerService getInstance(){
		return instance;
	}
	
	public boolean addCustomer(Customer customer){
		if(customers.containsKey(customer.getId())){
			return false;
		} else {
			customers.put(customer.getId(), customer);
			return true;
		}
	}
	
	public Customer findCustomer(String id){
		if(id != null){
			return customers.get(id.toLowerCase());
		} else {
			return null;
		}
	}
	
	public Customer login(String id, String password){
		Customer customerInfo = findCustomer(id);
		
		if(customerInfo != null 
				&& customerInfo.getPassword().equals(password)){
			return customerInfo;
		} else {
			return null;
		}
	}
}
