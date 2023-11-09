<?php
    include 'database.php';
    session_start();

    $cust_id = $_SESSION['customer_id'];
    $transaksi_id = $_GET['transaksi_id'];
    $reset = false;

    /** PROSES */
    if(isset($_GET['transaksi_id']) && isset($_GET['status_pesanan'])) {
        // UPDATE `transaksi` SET `no_resi` = '12' WHERE `transaksi`.`id` = 1; 
        $status_pesanan = $_GET['status_pesanan'];
        mysqli_query($conn, "UPDATE `transaksi` SET `status_pesanan` = '$status_pesanan' WHERE `transaksi`.`id` = $transaksi_id; ");
        $reset = true;
    }

    if(isset($_GET['transaksi_id']) && isset($_GET['no_resi'])) {
        // UPDATE `transaksi` SET `no_resi` = '12' WHERE `transaksi`.`id` = 1; 
        $no_resi = $_GET['no_resi'];
        mysqli_query($conn, "UPDATE `transaksi` SET `no_resi` = '$no_resi' WHERE `transaksi`.`id` = $transaksi_id; ");
        $reset = true;
    }

    if($reset) {
        header("Location: proses_pengiriman.php?transaksi_id=$transaksi_id");
    }

    $transaksi_query = mysqli_query($conn, "SELECT *, (select sum(c.product_price * b.jumlah) from transaksi_barang b left join tb_product c on c.product_id = b.product_id where b.transaksi_id = transaksi.id) as total from transaksi where id = $transaksi_id");
    $transaksi = mysqli_fetch_assoc($transaksi_query);

    $progress_bar = 0;

    if($transaksi['status_pesanan'] == 'Pesanan Masuk') {
        $progress_bar = 25;
    } else if($transaksi['status_pesanan'] == 'Pengemasan') {
        $progress_bar = 50;
    } else if($transaksi['status_pesanan'] == 'Pengiriman') {
        $progress_bar = 75;
    } else if($transaksi['status_pesanan'] == 'Penerimaan') {
        $progress_bar = 100;
    }

    
?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Proses Pengiriman | beautyskin</title>
    <link rel="stylesheet" href="style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300&display=swap" rel="stylesheet">
</head>

<body>
    <header>
        <div class="container">
            <h1><a href="index.php">beautyskin</a></h1>
            <ul>
                <li><a href="beranda_admin.php">Beranda</a></li>
                <li><a href="profil.php">Profil</a></li>
                <li><a href="data_kategori.php">Kategori</a></li>
                <li><a href="data_produk.php">Produk</a></li>
                <li><a href="proses_pengiriman.php">Pesanan</a></li>
                <li><a href="logout.php">Logout</a></li>
            </ul>
        </div>
    </header>
    <div class="section">
        <div class="container">
            <h3>Proses Pengiriman</h3>
        </div>
    </div>

    <div class="container1">
        <div class="step-container">
            <div class="step active">
                <span class="step-number">1</span>
                <span class="step-text">Pesanan Masuk</span>
            </div>
            <div class="step">
                <span class="step-number">2</span>
                <span class="step-text">Pengemasan</span>
            </div>
            <div class="step">
                <span class="step-number">3</span>
                <span class="step-text">Pengiriman</span>
            </div>
            <div class="step">
                <span class="step-number">4</span>
                <span class="step-text">Penerimaan</span>
            </div>
        </div>

        <div class="progress-bar">
            <div class="progress" style="width: <?= $progress_bar; ?>%"></div>
        </div>

        <div class="content">
            <form action="proses_pengiriman.php" method="get">
                <input hidden type="text" name="transaksi_id" value="<?= $_GET['transaksi_id'] ?>">

                <?php if($transaksi['status_pesanan'] == 'Pesanan Masuk') { ?>
                    <h2>Pesanan Masuk</h2>
                    <p>Silakan tekan tombol di bawah ini untuk melanjutkan ke langkah Pengemasan:</p>
                    <input hidden type="text" name="status_pesanan" value="Pengemasan">
                    <button class="next-button" type="submit">Lanjutkan ke Pengemasan</button>
                <?php } else if($transaksi['status_pesanan'] == 'Pengemasan') { ?>
                    <h2>Pengemasan</h2>
                    <p>Proses pengemasan barang sedang berlangsung. Barang sedang dikemas dengan baik dan aman untuk pengiriman.
                    </p>
                    <input hidden type="text" name="status_pesanan" value="Pengiriman">
                    <input type="text" id="resi-input" name="no_resi" placeholder="Masukkan nomor resi" required>
                    <button class="next-button" type="submit">Lanjutkan ke Pengiriman</button>
                <?php } else if($transaksi['status_pesanan'] == 'Pengiriman') { ?>
                    <h2>Pengiriman</h2>
                    <p>Proses pengiriman barang sedang berlangsung.
                    Barang akan dikirimkan ke alamat yang di berikan dalam waktu yang diestimasikan.
                    </p>
                    <p>Nomor resi: <?= $transaksi['no_resi'] ?></p>
                    <input hidden type="text" name="status_pesanan" value="Penerimaan">
                    <button class="next-button" type="submit">Lanjutkan ke Penerimaan</button>
                <?php } else if($transaksi['status_pesanan'] == 'Penerimaan') { ?>
                    <h2>Penerimaan</h2>
                    <p>Barang Anda telah berhasil dikirimkan.
                    Harap tunggu hingga barang diterima oleh Anda atau pihak yang dituju.
                    </p>
                <?php } ?>
            </form>
        </div>
    </div>

</body>

</html>
