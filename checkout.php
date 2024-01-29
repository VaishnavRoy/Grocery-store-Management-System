<?php


include"connect.php";
session_start();
if(!isset($_SESSION['ebcuser']))
{
    header("location:login.php");
}

$cname=$_SESSION['ebcuser'];
$dt=date('Y-m-d');
$subtotal=$_GET['st'];
$gst=$subtotal*0.18;
$ft=$subtotal+$gst;

$x=mysqli_query($con,"insert into bill(subtotal,gst,grandtotal,billdate,cuname,ostatus)values('$subtotal','$gst','$ft','$dt','$cname','Ordered')");
if($x>0)
{
    $y=mysqli_query($con,"select max(bill_no) from bill");
    $bn=mysqli_fetch_Array($y);
    $bno=$bn[0];
    $res=mysqli_query($con,"select pid from temp_cart where cuname='$cname' and ostatus='AddedInCart'");

    while($row=mysqli_fetch_Array($res))
    {
        mysqli_query($con,"insert into short_bill values($bno,$row[0])");

    }
    $res=mysqli_query($con,"delete from temp_cart where cuname='$cname' and ostatus='AddedInCart'");
    if($res>0)
    {?>
        <script>
            if(confirm("Your order has been confirmed"))
                location="custdashboard.php";
            else
                location="custdashboard.php";
                
        </script>
    <?php
    }
    else
    {
        ?>
        <script>
            if(confirm("Error in Order Confirmation"))
                location="showcart.php";
            else
                location="showcart.php";
                
        </script>
    <?php


    }   

}
else
{
    ?>
    <script>
        if(confirm("Error in Bill Generation"))
            location="showcart.php";
        else
            location="showcart.php";
            
    </script>
<?php
}

?>
