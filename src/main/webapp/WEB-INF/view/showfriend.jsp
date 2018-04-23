<!DOCTYPE html>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<html lang="en">
<head>
  <title>Media Library</title>
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
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
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
					<li><a href="/create">Create Post</a></li>
				</ul>
				<div class="nav navbar-nav navbar-right">
            
            </div>
			</div>
   
  </div>
</nav>
<div class="container text-center" id="tasksDiv">
				<h3 style=" color:white;">FRIENDS </h3>
				<hr>
				<div class="table-responsive">
					<table class="table" id="user2" style=" color:white;">
						
						
							<c:forEach var="user12" items="${friends}" >
							<tr>	
									<td  style="background-color: black;">${user12}</td>
			     			</tr>
							</c:forEach>
						
					</table>
				</div>
			</div>
</body>
</html>