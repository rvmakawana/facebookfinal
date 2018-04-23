<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>create page</title>
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
</head>
<body>
 <div class="container">
<h4 style=" color:white;">Upload your image</h4>
<form action="/upload"  method="post" enctype="multipart/form-data">
     <div class="col-xs-8">
    <input type="file" name="file" style=" color:white;" required="required"/><br><br>
    </div>
      <div class="col-xs-8">
     <label for="des1" style=" color:white;">Enter short Description</label>
    <textarea class="form-control" id="des1" name="des1" rows="1"   required="required"></textarea>
    <br>
      <button type="submit" class="btn btn-primary">Submit</button> 
    </form>
   </div>
   
    
  </div>
</body>
</html>