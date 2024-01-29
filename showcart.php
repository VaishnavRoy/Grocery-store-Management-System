<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel=stylesheet href=css/bootstrap.min.css>
<?php
include "includes/cust_header_dash.html";

include"connect.php";
session_start();
if(!isset($_SESSION['ebcuser']))
{
    header("location:login.php");
}

?>

<br><br><br>
<div class="container my-4"  > 
    <div class="row my-4">
       <div class=col-12>
           <?php
                $uname=$_SESSION['ebcuser'];
              $res=mysqli_query($con,"select temp_cart.pid,pname,pprice,pdesc,pimage from product,temp_cart where cuname='$uname' and temp_cart.pid=product.pid and ostatus='AddedInCart'");
                
                ?>
                <center><h2>Your Cart is Having Following Items </h2></center>
                <table class="table">
                    
                <thead class="thead-dark">
    <tr>
      <th scope="col">Product No</th>
      <th scope="col">Product Name</th>
      <th scope="col">Description</th>
      <th scope="col">Image</th>
      <th scope="col">Price (in Rs.)</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
  
  <?php
                    $total=0;
                    while($row=mysqli_fetch_Array($res))
                    {
                        $imgname=substr($row[4],3);
                        echo "<tr><th scope=row>$row[0]</th><td>$row[1]</td><td>$row[3]</td><td><img src=$imgname height=40px width=40px ></td><td>$row[2]</td><td>";
                        
                        ?>
                        <a href=deleteproduct.php?pid=<?php echo $row[0];?> class="btn btn-danger">Delete</a></td></tr>
                       <?php
                        $total=$total+$row[2];

                    }
                    echo "<tr><th colspan=3></th><th>Sub Total Rs.</th><td>$total</td></tr>";
                    $gst=$total*0.18;
                    echo "<tr><th colspan=3></th><th>GST Amount Rs.</th><td>$gst</td></tr>";
                    $gt=$total+$gst;
                    echo "<tr><th colspan=3></th><th>Grand Total Rs.</th><td>$gt</td></tr>";

                    echo "<tr><th colspan=3></th><th colspan=2>";
                    ?>
                    <a onclick="window.print()" href=checkout.php?st=<?php echo $total;?> class="btn btn-success btn-lg">Print & Checkout</a></th></tr>
                <?php    ?>

        </div> 
    </div>
</div>





<?php



?>
