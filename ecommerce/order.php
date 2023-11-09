<?php
    session_start();
    include'database.php';
    if($_SESSION['login_status'] != true){
        echo '<script>window.location="login.php"</script>';
    } 
    $query = mysqli_query($conn, "SELECT * FROM tb_admin WHERE admin_id = '".$_SESSION['id']."' ");
    $d = mysqli_fetch_object($query);
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset = "utf-8">
        <meta name = "viewport" content = "width=device-width, initial-scale=1">
        <title>Profil Admin | sourchic</title>
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
        <!---data admin---> 
        <div class="section">
            <div class="container">
                <h3>Form Order</h3>
                <div class="box">
                    <form action="" method="POST">
                        <input type="text" name="nama" placeholder="Nama Lengkap" class="input" required>
                        <input type="text" name="telp" placeholder="No. Telepon" class="input" required>
                        <input type="text" name="alamat" placeholder="Alamat" class="input" required>
                        <input type="text" name="pembayaran" placeholder="Pembayaran" class="input" value="BCA a.n sourchic" required>
                        <input type="text" name="pengiriman" placeholder="Pengiriman" class="input" required>
                        <input type="submit" name="submit" value="Order" class="button">
                    </form>
                </div>
            </div>
        </div>
</body>
</html>