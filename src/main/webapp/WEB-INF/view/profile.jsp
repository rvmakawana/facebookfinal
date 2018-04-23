<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    
<title>profile</title>
<style> 
.float-my-children > * {
    float:left;
    color:white;
    margin-right:5px;
}

/* this is called a clearfix. it makes sure that the container's children floats are cleared, without using extra markup */

.clearfix {
    *zoom:1 /* for IE */
}
.navbar-brand {
  padding: 0px;
}
.navbar-brand>img {
  height: 100%;
  padding: 15px;
  width: auto;
}
.clearfix:before,
.clearfix:after {
    content: " ";
    display: table;
}

.clearfix:after {
    clear: both;
}
.fonts
{
  color:white;
  font-weight: bold;
  font-family: garamond;
  font-size:150%;
}

body {
    background-image: url("http://www.efoza.com/postpic/2011/09/free-html-web-page-backgrounds_135630.jpg");
}
/* end clearfix*/

/* below is just to make things easier to see, not required */

</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <script>

</script>
</head>
<body>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#" alt="MEDIA LIBRARY">
          <span class="glyphicon glyphicon-bold"></span>
        </a>
      <a class="navbar-brand" href="#">MEDIA LIBRARY</a>
     
    </div>
    <div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
				
					
					<li><a href="/all">view friends</a></li>
					<li><a href="/create">Create Post</a></li>
				</ul>
				<div class="nav navbar-nav navbar-right">
            
            </div>
			</div>
   
  </div>
</nav>
 
 
 <div class=" clearfix float-my-children ">
   <a href = "${imgSrc}" download>
   <img src="${imgSrc}" width="200px" height="200px" >
   </a> 
   <div><span class="fonts"><h3>${n}</h3></span><br>${des2} </div>

</div>

</body>
</html>
