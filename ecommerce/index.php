<?php 
    include 'database.php';
    $kontak = mysqli_query($conn, "SELECT admin_telp, admin_email, admin_address FROM tb_admin WHERE admin_id = 1");
    $a = mysqli_fetch_object($kontak);
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset = "utf-8">
        <meta name = "viewport" content = "width=device-width, initial-scale=1">
        <title>sourchic</title>
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

        <!---search bar--->
        <div class="search">
            <div class="container">
                <form action="produk.php">
                    <input type="text" name="search" placeholder="Cari Produk">
                    <input type="submit" name="cari" value="Cari">
                </form>
            </div>
        </div>

        <!---category--->
        <div class="section">
            <div class="container">
                <h3>Kategori</h3>
                <div class="box">
                    <?php 
                        $kategori = mysqli_query($conn, "SELECT * FROM tb_category ORDER BY category_id DESC");
                        if(mysqli_num_rows($kategori) > 0){
                            while($k = mysqli_fetch_array($kategori)){
                    ?>
                        <a href="produk.php?kat=<?php echo $k['category_id']?>">
                            <div class="col-5">
                                <img src="http://localhost//UTS_PWL_4201_13352/kategori.png" width="50px" style="margin-bottom:5px;">
                                <p><?php echo $k['category_name']?></p>
                            </div>
                        </a>
                <?php }}else{ ?>
                    <p>Kategori tidak ada</p>
                <?php } ?>
                </div>
            </div>
        </div>

        <!---produk terbaru--->
        <div class="section">
            <div class="container">
                <h3>Produk Terbaru</h3>
                <div class="box">
                    <?php 
                        $produk = mysqli_query($conn, "SELECT * FROM tb_product WHERE product_status = 1 ORDER BY product_id DESC LIMIT 5");
                        if(mysqli_num_rows($produk) > 0){
                            while($p = mysqli_fetch_array($produk)){
                    ?>
                        <a href="detail_produk.php?id=<?php echo $p['product_id']?>">
                            <div class="col-2">
                                <img src ="produk/<?php echo $p['product_image']?>"> 
                                <p class="nama"><?php echo $p['product_name']?></p>
                                <p class="harga">Rp.<?php echo $p['product_price'] ?></p>
                            </div>
                        </a>
                    <?php }}else{ ?>
                        <p>Produk tidak ada</p>
                    <?php } ?>
                </div>
            </div>
        </div>

        <!---footer--->
        <div class="footer">
            <div class="container">
                <h4>Alamat</h4>
                <p>Jl. Soekarno Hatta No. 9, Semarang, Jawa Tengah</p>
                <!---<p><?php echo $a->admin_address ?></p>--->

                <h4>E-mail</h4>
                <p>sourchic@gmail.com</p>
                <!---<p><?php echo $a->admin_email ?></p>--->

                <h4>Telp</h4>
                <p>081256123765</p>
                <!---</p><p><?php echo $a->admin_telp ?></p>--->
                <small>Copyright &copy2022 sourchic</small>
            </div>
        </div>
    </body>
</html>
