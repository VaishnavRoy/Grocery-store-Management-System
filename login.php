<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel=stylesheet href=css/bootstrap.min.css>
<?php
include "includes/header.html";

include"connect.php";
session_start();
if(isset($_SESSION['ebcuser']))
{
    header("location:custdashboard.php");
}



if($_SERVER['REQUEST_METHOD']=="POST")
{

    $un=$_POST['txtUser'];
    $ps=$_POST['txtPass'];
    $ps=md5($ps);
    
 $res=mysqli_query($con,"select count(*) from customer where cuname='$un' and cpass='$ps'");

  $x=mysqli_fetch_array($res);
    

//  $res=pg_query($con,"select * from customer");
      
/*echo "<br><br><br><br>$res";
    while($row=pg_fetch_Array($res))
    {
        echo "<br>$row[0]";

    }*/

if($x[0]>0)
{
    
    $_SESSION['ebcuser']=$un;
    header("location:custdashboard.php");

}
else
{
    ?>
        <script>
            if(confirm("Username or password Invalid"))
                location="login.php";   
            else
                location="login.php";
        </script>

<?php

}


}
?>
<br><br><br>
<div class="container my-4"  > 
    <div class=row>
        <div class=col-4></div>
        <div class="col-4 shadow-lg p-3 mb-5 bg-white rounded" style="margin-top:200px; padding:60px;">
            <form action="login.php" method=post>
                  <div class="form-group">
                    <label for="exampleInputEmail1">Username</label>
                    <input type="text" class="form-control" id="txtUser" name="txtUser" aria-describedby="emailHelp">
                    <small id="emailHelp" class="form-text text-muted"></small>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <input type="password" class="form-control" id="txtPass" name=txtPass>
                  </div>
               
                  <input type="submit" class="btn btn-danger" style="width:350px;" value=Login>
        
                <div class="form-group" style="margin-top:20px;">
                    <a href=register.php class="btn btn-warning" colspan=2 style="width:350px;">New User ? Register<a> 
                    <!-- <a href=fp.php class="btn btn-warning">Recover Password<a>               -->
              </div>
  
            </form>            


        </div>
        <div class=col-4>
</div>
</div>
</div>




<?php
include"includes/footer.html";


?>
