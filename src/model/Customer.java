package model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Customer {
	private String id;
	private String name;
	private String email;
	
	public Customer(String id, String name, String email) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
	}
}
