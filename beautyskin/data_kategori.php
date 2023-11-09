<?php
    session_start();
    include 'database.php';
    if($_SESSION['login_status'] != true){
        echo '<script>window.location="login.php"</script>';
    }
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset = "utf-8">
        <meta name = "viewport" content = "width=device-width, initial-scale=1">
        <title>CRUD Kategori | beautyskin</title>
        <link rel="stylesheet" href="style.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300&display=swap" rel="stylesheet">
    </head>
    <body> 
        <!---header---> 
        <header>
            <div class="container">
                <h1><a href="beranda_admin.php">beautyskin</a></h1>
                <ul>
                    <li><a href="beranda_admin.php">Beranda</a></li>
                    <li><a href="profil.php">Profil</a></li>
                    <li><a href="data_kategori.php">Kategori</a></li>
                    <li><a href="data_produk.php">Produk</a></li>
                    <li><a href="logout.php">Logout</a></li>
                </ul>
            </div>
        </header>
        <!---content kategori---> 
        <div class="section">
            <div class="container">
                <h3>CRUD Kategori</h3>
                <div class="box">
                    <p color="#688333"><a href = "tambah_kategori.php">Tambah Kategori</a></p>
                   <table border="1" cellspacing="0" class="tabel">
                       <thead>
                           <tr>
                               <th>No</th>
                               <th>Kategori</th>
                               <th width="250px">Aksi</th>
                           </tr>
                       </thead>
                       <tbody>
                           <?php
                                $no = 1;
                                $kategori = mysqli_query($conn, "SELECT * FROM tb_category ORDER BY category_id DESC");
                                if(mysqli_num_rows($kategori) > 0){
                                while($row = mysqli_fetch_array($kategori)){
                           ?>
                           <tr>
                               <td><?php echo $no++ ?></td>
                               <td><?php echo $row['category_name']?></td>
                               <td>
                                   <a href="edit_kategori.php?id=<?php echo $row['category_id']?>">Edit</a> || <a href="hapus_kategori.php?idk=<?php echo $row['category_id'] ?>" onclick="return confirm('Yakin ingin menghapus kategori?')">Hapus</a>
                               </td>
                           </tr>
                           <?php }}else{ ?>
                            <tr>
                                <td colspan="3">Tidak ada data</td>
                            </tr>
                            <?php } ?>
                       </tbody>
                   </table> 
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
