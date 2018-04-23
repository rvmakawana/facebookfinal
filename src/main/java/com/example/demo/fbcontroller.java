package com.example.demo;


import java.io.IOException;
import java.math.BigInteger;
import java.util.List;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

@SessionAttributes("user")
@Controller
public class fbcontroller {

	@Autowired 
	Repo repo;
	
	@Autowired
	private userservice userservice1;
	
	@Value("#{environment.accesskey}")
	String accesskey;
	@Value("#{environment.secretkey}")
	String secretkey;

	@ModelAttribute("user")
	public User setUpUserForm() {
	   return new User();
	}
	
	 @GetMapping("/")
	    public String log(HttpServletRequest req)
	    {
	    	return ("facebook1");
	    }
	 
	 @RequestMapping("/all")
	    public ModelAndView showall(@ModelAttribute User user)
	    {
	    	ModelAndView mv=new ModelAndView();
	    	String s1= user.getFriend();
	    	String[] s2=s1.split("[./]");
	    	StringBuffer s3= new StringBuffer();
	    	for(int i=1;i<s2.length;i+=2)
	    	{
	    		s3.append(s2[i]).append(".");
	    	}
	        String s4=s3.toString();
	        System.out.println("String is "+s4);
	        String[] s5=s4.split("[.]");
	        for(int i=0;i<s5.length;i++)
	    	{
	    		System.out.println(s5[i]);
	    	}
	    	mv.addObject("friends", s5);
	    	mv.setViewName("showfriend");
	    	return mv;
	    }
	    
	    @PostMapping(value="/facebookRedirect")
	    public ModelAndView handle(HttpServletRequest req,@RequestParam(name="myId") String myId,
	    		@RequestParam(name="myName") String myName,
	    		@RequestParam(name="myFriends") String myFriends,
	    		@RequestParam(name="myEmail") String myEmail,@ModelAttribute User user)
	    {
	    //	System.out.println(myId+myName+myEmail+myFriends);
	    	 ModelAndView indexPage= new ModelAndView();
	    	User u1=new User();
	    	u1.setId(Long.parseLong(myId));
	    	user.setId(Long.parseLong(myId));
	    	u1.setName(myName);
	    	user.setName(myName);
	    	u1.setFriend(myFriends);
	    	user.setFriend(myFriends);
	   // 	u1.setDescription("123");
	   
	    	if(repo.findById(Long.parseLong(myId))==null) 	
	    	{
	    		repo.save(u1);
	    	return new ModelAndView("hh");
	    	
	    	}
//	    	else 
//	    	{
//	    		repo.save(u1);
//	    		
//	    	}
	    	User u2=repo.findById(Long.parseLong(myId)); 
	    	user.setDescription(u2.getDescription());
	    	user.setProfilepic(u2.getProfilepic());
	    	System.out.print( myId+" "+myName + "   " + myFriends+"   Description   "+ user.getDescription()+" profilepic    "+user.getProfilepic());
	    	
	    	String[] splitted=myFriends.split("/");
	    	for(int i =0;i<splitted.length;i++)
	    	{
	    		System.out.println(i+":"+splitted[i]);
	    	}
	    	if(myId.equals("111641609688688"))
	    	{
	    		
	    		return new ModelAndView("admin");
	    	}
	    	else 
	    	{
	    		System.out.println("name"+user.getName());
	    		indexPage.addObject("n",user.getName());
	    		User u3=repo.findById(Long.parseLong(myId));
	    		System.out.println("name from user 3 " + u3.getName()+"descr"+ u3.getProfilepic());
	    		System.out.println("u3  name is "+u3.getName());
	    		
	    		 indexPage.addObject("imgSrc",user.getProfilepic());
	    		 System.out.println("link is "  + user.getProfilepic());
		         indexPage.addObject("des2",user.getDescription());
		         indexPage.setViewName("profile");
	    		return indexPage;
	    	}
	    	//return new ModelAndView("NewFile");
	    }
	    
	    @GetMapping("/show-users")
	    public String showAllUser(HttpServletRequest request) {
	    request.setAttribute("users",userservice1.showAllUsers());
	    
	    	return "alluser";
	    }
	    
	    @RequestMapping("/delete-user")
		public String deleteUser(@RequestParam long id, HttpServletRequest request) {
			repo.deleteById(id);
			request.setAttribute("users", userservice1.showAllUsers());	
			return "alluser";
		} 
	    
	    @GetMapping(value="/create")
	     public ModelAndView renderpage()
	     {
	        ModelAndView indexPage= new ModelAndView();
	        indexPage.setViewName("create");
	    	return  indexPage;
	     }
	
	    @PostMapping(value="/upload")
	    public ModelAndView uploads3(@RequestParam("file") MultipartFile image,@RequestParam(name="des1") String des1 ,@ModelAttribute User user)
	    {  
	    	  
	    	 
	        ModelAndView indexPage= new ModelAndView();
	       System.out.println(user.getName()+"description      " + des1);
	       
	        BasicAWSCredentials cred= new BasicAWSCredentials(accesskey,secretkey);
	       // AmazonS3Client client=AmazonS3ClientBuilder.standard().withCredentials(new AWSCredentialsProvider(cred)).with
	        AmazonS3 client=AmazonS3ClientBuilder.standard().withCredentials(new AWSStaticCredentialsProvider(cred)).withRegion(Regions.US_EAST_1).build();
	        try {
	 		PutObjectRequest put= new PutObjectRequest("firstravi",image.getOriginalFilename(),image.getInputStream(), new ObjectMetadata()).withCannedAcl(CannedAccessControlList.PublicRead);
	 		client.putObject(put);

	         String imgSrc = "http://"+"firstravi"+".s3.amazonaws.com/"+image.getOriginalFilename();
	         indexPage.addObject("n",user.getName());
	         indexPage.addObject("imgSrc",imgSrc);
	         indexPage.addObject("des2",des1);
	         repo.setUserInfoById(des1,imgSrc,user.getName());
	         indexPage.setViewName("profile");
	         return indexPage;
	        } catch (IOException e) {
	 		// TODO Auto-generated catch block
	 		e.printStackTrace();
	 	}
	        
	       indexPage.setViewName("error");
	       return indexPage;
	       
	      
	    }
	    
	}



