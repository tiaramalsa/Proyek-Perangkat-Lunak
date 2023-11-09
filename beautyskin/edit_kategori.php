<?php
    session_start();
    include'database.php';
    if($_SESSION['login_status'] != true){
        echo '<script>window.location="login.php"</script>';
    } 
    $kategori = mysqli_query($conn, "SELECT * FROM tb_category WHERE category_id = '".$_GET['id']."' ");
    if(mysqli_num_rows($kategori) == 0){
        echo '<script>window.location ="data_kategori.php"</script>';
    }
    $k = mysqli_fetch_object($kategori);
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset = "utf-8">
        <meta name = "viewport" content = "width=device-width, initial-scale=1">
        <title>Tambah Kategori | sourchic</title>
        <link rel="stylesheet" href="style.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300&display=swap" rel="stylesheet">
    </head>
    <body> 
        <!---header---> 
        <header>
            <div class="container">
                <h1><a href="beranda_admin.php">sourchic</a></h1>
                <ul>
                    <li><a href="beranda_admin.php">Beranda</a></li>
                    <li><a href="profil.php">Profil</a></li>
                    <li><a href="data_kategori.php">Kategori</a></li>
                    <li><a href="data_produk.php">Produk</a></li>
                    <li><a href="logout.php">Logout</a></li>
                </ul>
            </div>
        </header>
        <!---kategori---> 
        <div class="section">
            <div class="container">
                <h3>Edit Kategori</h3>
                <div class="box">
                    <form action="" method="POST">
                        <input type="text" name="nama" placeholder="Nama Kategori" class="input" value="<?php echo $k->category_name ?>" required>
                        <input type="submit" name="submit" value="Submit" class="button">
                    </form>
                    <?php 
                        if(isset($_POST['submit'])){
                            $nama = ucwords($_POST['nama']);

                            $update = mysqli_query($conn, "UPDATE tb_category SET
                                                category_name = '".$nama."' 
                                                WHERE category_id = '".$k->category_id."'");
                            if($update){
                                echo '<script>alert("Edit kategori berhasil")</script>';
                                echo '<script>window.location="data_kategori.php"</script>';
                            }else{
                                echo 'Gagal' .mysqli_error($conn);
                            }
                        }
                    ?>
                </div>             
            </div>
        </div>
        <!---footer--->
        <footer>
            <div class="container">
                <small>Copyright &copy2023 beautyskin</small>
            </div>
        </footer>
    </body>
</html>
