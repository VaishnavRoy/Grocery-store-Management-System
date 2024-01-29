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

$x=mysqli_query($con,"delete from temp_cart where cuname='$cname' and ostatus='$os' and pid=$pid");
if($x>0)
{
    ?>
    <script>
    if(confirm("Item Deleted from cart"))
        location="showcart.php";
    else
        location="showcart.php"
</script>	
<?php
}
else
{
?>
    
    <script>
    if(confirm("Item Deletion Error"))
        location="showcart.php";
    else
        location="showcart.php"
</script>	
<?php
}



?>