<?php 
    error_reporting(0);
    include 'database.php';
    $kontak = mysqli_query($conn, "SELECT admin_telp, admin_email, admin_address FROM tb_admin WHERE admin_id = 1");
    $a = mysqli_fetch_object($kontak);

    $produk = mysqli_query($conn, "SELECT * FROM tb_product WHERE product_id = '".$_GET['id']."' ");
    $p = mysqli_fetch_object($produk);
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset = "utf-8">
        <meta name = "viewport" content = "width=device-width, initial-scale=1">
        <title>Beranda | beautyskin</title>
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
                    <li><a href="produk.php">Produk</a></li>
                    <li><a href="order.php">Keranjang</a></li>
                    <li><a href="logout_cust.php">Logout</a></li>
                </ul>
            </div>
        </header>

        <!---search bar--->
        <div class="search">
            <div class="container">
                <form action="produk.php">
                    <input type="text" name="search" placeholder="Cari Produk" value="<?php echo $_GET['search']?>">
                    <input type="hidden" name="kat" value="<?php echo $_GET['kat']?>">
                    <input type="submit" name="cari" value="Cari">
                </form>
            </div>
        </div>

        <!---product detail--->
        <div class="section">
            <div class="container">
                <h3>Detail Produk</h3>
                <div class="box">
                    <div class="row">
                        <div class="col-3">
                            <img src="produk/<?php echo $p->product_image?>" width="100%">
                        </div>
                        <div class="col-3" style="width: 70%;">
                            <h3 style="color: white;"><?php echo $p->product_name?></h3>
                            <h4>Rp. <?php echo number_format($p->product_price)?></h4>
                            <p>Deskripsi : <br>
                            <?php echo $p->product_description?>
                            </p>
                            <p>Stok Tersedia : <?php echo $p->stock?></p>
                            <a href="order.php?product_id=<?= $p->product_id ?>&jumlah=1">
                            </a>
                            <a href="order.php?product_id=<?= $p->product_id ?>&jumlah=1" class="button-cart" role="button">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                                    <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                                    </svg>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!---footer--->
    <footer>
        <div class="footer_kecil">
            <small>Copyright &copy2023 beautyskin</small>
        </div>
    </footer>
    </body>
</html>
