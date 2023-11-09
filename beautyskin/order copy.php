<?php 
     session_start();
     include 'database.php';
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset = "utf-8">
        <meta name = "viewport" content = "width=device-width, initial-scale=1">
        <title>Order | sourchic</title>
        <link rel="stylesheet" href="style.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300&display=swap" rel="stylesheet">
    </head>
    <body> 
        <!---header---> 
        <header>
            <div class="container">
                <h1><a href="index.php">beautyskin</a></h1>
                <ul>
                    <li><a href="index.php">Home</a></li>
                    <li><a href="about.php">About</a></li>
                    <li><a href="produk.php">Produk</a></li>
                    <li><a href="order.php">Order</a></li>
                </ul>
            </div>
        </header>
        

        <?php
            if (isset($_GET['product_image']) && isset($_GET['jumlah'])) {

                $product_image=$_GET['product_image'];
                $product_name=$_GET['product_name'];
                $product_price=$_GET['product_price'];
                $jumlah=$_GET['jumlah'];

                include 'database.php';

                $sql= "SELECT * FROM tb_product WHERE product_name='$product_name'";

                $query = mysqli_query($conn,$sql);
                $data = mysqli_fetch_array($query);
                $product_image=$data['product_image'];
                $product_name=$data['product_name'];
                $product_price=$data['product_price'];

            }else {
                $product_image="";
                $jumlah=0;
            }

            if (isset($_GET['aksi'])) {
                $aksi=$_GET['aksi'];
            }else {
                $aksi="";
            }


            switch($aksi){	
                case "tambah_produk":
                $itemArray = array($product_image=>array('product_image'=>$product_image,'product_name'=>$product_name,'jumlah'=>$jumlah,'product_price'=>$product_price));
                if(!empty($_SESSION["order"])) {
                    if(in_array($data['product_image'],array_keys($_SESSION["order"]))) {
                        foreach($_SESSION["order"] as $k => $v) {
                            if($data['product_image'] == $k) {
                                $_SESSION["order"] = array_merge($_SESSION["order"],$itemArray);
                            }
                        }
                    } else {
                        $_SESSION["order"] = array_merge($_SESSION["order"],$itemArray);
                    }
                } else {
                    $_SESSION["order"] = $itemArray;
                }
                break;
                case "hapus":

                    if(!empty($_SESSION["order"])) {
                        foreach($_SESSION["order"] as $k => $v) {
                                if($_GET["product_image"] == $k)
                                    unset($_SESSION["order"][$k]);
                                if(empty($_SESSION["order"]))
                                    unset($_SESSION["order"]);
                        }
                    }
                break;

                case "update":
                    $itemArray = array($product_image=>array('product_image'=>$product_image,'product_name'=>$product_name,'jumlah'=>$jumlah,'product_price'=>$product_price));
                    if(!empty($_SESSION["order"])) {
                        foreach($_SESSION["order"] as $k => $v) {
                            if($_GET["product_image"] == $k)
                            $_SESSION["order"] = array_merge($_SESSION["order"],$itemArray);
                        }
                    }
                break;
            }
            ?>

            <div class="row">
                <h3 style="margin-bottom:30px;">Keranjang Belanja</h3>
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>Foto Produk</th>
                        <th>Nama Produk</th>
                        <th>Harga</th>
                        <th>Jumlah Produk</th>
                        <th>Total</th>
                        <th>Aksi</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php
                        $no=0;
                        $sub_total=0;
                        $total=0;
                        $total_berat=0;
                        if(!empty($_SESSION["order"])):
                        foreach ($_SESSION["order"] as $item):
                            $no++;
                            $sub_total = $item["jumlah"]*$item['product_price'];
                            $total+=$sub_total;
                    ?>
                        <input type="hidden" name="product_image[]" class="product_image" value="<?php echo $item["product_image"]; ?>"/>
                        <tr>
                            <td style="text-align: center;"><?php echo $no; ?></td>
                            <td style="text-align: center;"><?php echo $item["product_image"]; ?></td>
                            <td><?php echo $item["product_name"]; ?></td>
                            <td>Rp. <?php echo number_format($item["product_price"],0,',','.');?> </td>
                            <td>
                            <input type="number" min="1" value="<?php echo $item["jumlah"]; ?>" class="form-control" id="jumlah<?php echo $no; ?>" name="jumlah[]" >
                            <script>
                                $("#jumlah<?php echo $no; ?>").bind('change', function () {
                                    var jumlah<?php echo $no; ?>=$("#jumlah<?php echo $no; ?>").val();
                                    $("#jumlaha<?php echo $no; ?>").val(jumlah<?php echo $no; ?>);
                                });
                                $("#jumlah<?php echo $no; ?>").keydown(function(event) { 
                                    return false;
                                });
                                
                            </script>

                            </td>
                            <td>Rp. <?php echo number_format($sub_total,0,',','.');?> </td>

                            <td>
                                <form method="get">
                                    <input type="hidden" name="product_image"  value="<?php echo $item['product_image']; ?>" class="form-control">
                                    <input type="hidden" name="aksi"  value="update" class="form-control">
                                    <input type="hidden" name="halaman"  value="keranjang-belanja" class="form-control">
                                    <input type="hidden" name="jumlah" value="<?php echo $item["jumlah"]; ?>" id="jumlaha<?php echo $no; ?>" value="" class="form-control">
                                    <input type="submit" class="btn btn-warning btn-xs" value="Update">
                                </form>
                                <a href="order.php?halaman=keranjang-belanja&product_image=<?php echo $item['product_image']; ?>&aksi=hapus" class="btn btn-danger btn-xs" role="button">Delete</a>
                            </td>
                        </tr>
                    <?php 
                        endforeach;
                        endif;
                    ?>
                    </tbody>
                </table><br>
                <h4>Total Pembayaran Rp. <?php echo number_format($total,0,',','.');?> </h4>
            </div>
        <!---footer--->
        <footer>
            <div class="footer_kecil">
                <small>Copyright &copy2023 beautyskin</small>
            </div>
        </footer>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
let harga;
let qty;
$('select[name="barang"]').on('change', function()  {
    // console.log();
    harga = $(this).find(':selected').attr('data-harga');
    calc_price();
});

$('input[name="jumlah"]').on('keyup', function()  {
    // console.log();
    qty = $(this).val();
    calc_price();
});

function calc_price() {
    console.log(harga);
    console.log(qty);

    if(harga && qty) {
        let total = parseInt(harga) * parseInt(qty);
        $('input[name="harga"]').val(total);
    }
}
</script>