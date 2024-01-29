<?php
include"connect.php";
session_start();
if(!isset($_SESSION['ebcuser']))
{
    header("location:login.php");
}

$cname=$_SESSION['ebcuser'];
$pid=$_GET['pid'];
$dt=date('Y-m-d');
$os='AddedInCart';

$x=mysqli_query($con,"insert into temp_cart values('$cname',$pid,'$os','$dt')");
if($x>0)
{
    ?>
    <script>
    if(confirm("Item Added in cart"))
        location="custdashboard.php";
    else
        location="custdashboard.php"
</script>	
<?php
}
else
{
?>
    
    <script>
    if(confirm("Item not Added in cart"))
        location="custdashboard.php";
    else
        location="custdashboard.php"
</script>	
<?php
}



?>