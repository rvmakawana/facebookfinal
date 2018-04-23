package com.example.demo;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

@Service
@Transactional
public class userservice {
	
	 public final Repo repo; 
	 public userservice(Repo repo)
	  {
		  this.repo=repo;
	  }
	 
	 public List<User> showAllUsers(){
			List<User> users = new ArrayList<User>();
			for(User user1 : repo.findAll()) {
				users.add(user1);
			}
			
			return users;
		}
	 
	 

}
