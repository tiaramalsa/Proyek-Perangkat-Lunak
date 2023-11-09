<?php 
    error_reporting(0);
    include 'database.php';
    $kontak = mysqli_query($conn, "SELECT admin_telp, admin_email, admin_address FROM tb_admin WHERE admin_id = 1");
    $a = mysqli_fetch_object($kontak);
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset = "utf-8">
        <meta name = "viewport" content = "width=device-width, initial-scale=1">
        <title>Beranda | sourchic</title>
        <link rel="stylesheet" href="style.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300&display=swap" rel="stylesheet">
    </head>
    <body> 
        <!---header---> 
        <header>
            <div class="container">
                <h1><a href="index.php">sourchic</a></h1>
                <ul>
                    <li><a href="about.php">About</a></li>
                    <li><a href="produk.php">Produk</a></li>
                    <li><a href="order.php">Order</a></li>
                </ul>
            </div>
        </header>

        <!---product detail--->
        <div class= "section">
            <div class= "container">
            <h3>Detail Produk</h3>
                <div class= "box">
                    <div class="col-2">
                        tes
                    </div>
                </div>
            </div>
        </div>

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

        <!---footer--->
        <div class="footer">
            <div class="container">
                <h4>Alamat</h4>
                <p><?php echo $a->admin_address ?></p>

                <h4>Email</h4>
                <p><?php echo $a->admin_email ?></p>

                <h4>No Hp</h4>
                <p><?php echo $a->admin_telp ?></p>
                <small>Copyright &copy2022 sourchic</small>
            </div>
        </div>
    </body>
</html>
