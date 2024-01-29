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
        <?php
            $res=mysqli_query($con,"select * from product");
            while($row=mysqli_fetch_Array($res))
            {
                ?>
                <div class="card col-3 offset-1 my-4" style="width: 18rem;">
  <img src="<?php echo substr($row[5],3);?>" class="card-img-top" alt="..." height=200px >
  <div class="card-body">
    <p class="card-text">
        <h5>Product Name :<?php echo $row[1];?></h5>
        <br>
        
        <h6>Description :<?php echo $row[3];?></h6>
        <h6>Price Rs.: <?php echo $row[2];?></h6>
        <br>
        <a href=addtocart.php?pid=<?php  echo $row[0];?> class="btn btn-success">Add to Cart</a>
    </p>
  </div>
</div>

<?php
            }
?>
            </div>
</div>




<?php



?>
