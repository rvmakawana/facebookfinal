<!DOCTYPE html>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<html lang="en">
<head>
  <title>Media Library</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="navbar navbar-inverse">
			<a href="/logout" class="navbar-brand">Media Library</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="/create">Create Post</a></li>	 
				</ul>
				<div class="nav navbar-nav navbar-right">
              
            </div>
			</div>
		</div>
<div class="container text-center" id="tasksDiv">
				<h3>All Users</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered" id="user2">
						<thead>
							<tr>
								<th>Id</th>
								<th>UserName</th>
								<th>Friend</th>
							</tr>
						</thead>
						<tbody>
								<tr>
									<td>${user.id}</td>
									<td>${user.name}</td>
									<td>${user.friend}</td>
								</tr>
							
						</tbody>
					</table>
				</div>
			</div>

</body>
</html>
