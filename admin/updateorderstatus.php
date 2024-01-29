<?php

echo "<link rel=stylesheet href=../css/bootstrap.min.css>";

include"../connect.php";

$bno=$_GET['bno'];
$rs=mysqli_query($con,"update bill set ostatus='In Transit' where bill_no=$bno");
$res=mysqli_query($con,"select pid from short_bill where bill_no=$bno");
while($row=mysqli_fetch_array($res))
{
    mysqli_query($con,"update product set pqty=pqty-1 where pid=$row[0]");
    
}

if($rs>0)
{
    
    ?>
         <script>
                if(confirm("Order Packed "))
                    location="admindashboard.php";
                else
                    location="admindashboard.php";  
            </script>      
  
    <?php
}
else
{
    
    ?>
         <script>
                if(confirm("Packing Error"))
                    location="admindashboard.php";
                else
                    location="admindashboard.php";  
            </script>      
  
    <?php
}

?>