package com.example.demo;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

public interface Repo extends CrudRepository<User,Long> {

	public User findById(long id);

	@Modifying
    @Transactional
	@Query("UPDATE User u set u.description= ?1,profilepic=?2 where u.name = ?3")
	 public void setUserInfoById(String re,String r1,String r2);	
//	
}
