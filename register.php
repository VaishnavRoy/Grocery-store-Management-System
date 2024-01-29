<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel=stylesheet href=css/bootstrap.min.css>
<?php
include "includes/header.html";
include"connect.php";
if($_SERVER['REQUEST_METHOD']=="POST")
{
	$name=$_POST['txtName'];
	$mob=$_POST['txtMobile'];
	$email=$_POST['txtEmail'];
	$addr=$_POST['txtAddress'];
	$pin=$_POST['txtPin'];
	$un=$_POST['txtUser'];
	$ps=$_POST['txtPassword'];
	$ps=md5($ps);
	
	$x=mysqli_query($con,"insert into customer values('$un','$ps','$name','$mob','$addr','$pin','$email')");
	if($x>0)
	{
		
		?>
		<script>
			if(confirm("Registration Successful! You can login now"))
				location="login.php";
			else
				location="login.php"
		</script>	

	
	<?php
	}
	else
	{
		?>

		<script>
			if(confirm("Registration Error"))
				location="register.php";
			else
				location="register.php"
		</script>	

	<?php

	}
}
?>
<br><br><br>


<div class="container my-4">
	<div class=row>
		<div class=col-8 style="background-color:#edf1f5;border-radius:10px;padding:50px;">

		<form method=post action=register.php>
		  <div class="form-group">
    			<label for="exampleInputEmail1">Name</label>
    <input type="text" class="form-control" id="txtName" name=txtName>
    <small id="errName" class="form-text"></small>
  </div>
		  <div class="form-group">
    			<label for="exampleInputEmail1">Mobile</label>
    <input type="text" class="form-control" id="txtMobile" name=txtMobile>
    <small id="errMobile" class="form-text"></small>
  </div>
		  <div class="form-group">
    			<label for="exampleInputEmail1">Email</label>
    <input type="email" class="form-control" id="txtEmail" name=txtEmail>
    <small id="errEmail" class="form-text"></small>
  </div>
		  <div class="form-group">
    			<label for="exampleInputEmail1">Address</label>
    <textarea class="form-control" id="txtAddress" name=txtAddress cols=20 rows=3></textarea>
  </div>
		  <div class="form-group">
    			<label for="exampleInputEmail1">Pincode</label>
    <input type="text" class="form-control" id="txtPin" name=txtPin>
    <small id="errPin" class="form-text"></small>
  </div>
		  <div class="form-group">
    			<label for="exampleInputEmail1">Username</label>
    <input type="text" class="form-control" id="txtuser" name=txtUser>
    <small id="errName" class="form-text"></small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="txtPassword" name=txtPassword>
  </div>
  <input type="submit" class="btn btn-warning" value=Register>
</form>
			

		</div>
		<div class=col-4>
			<img src="images/register.png" >
		</div>
	</div>
</div>

<?php
include"includes/footer.html";
?>
