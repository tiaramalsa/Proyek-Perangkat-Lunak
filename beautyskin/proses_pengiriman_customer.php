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
                <li><a href="index.php">Home</a></li>
                <li><a href="produk.php">Produk</a></li>
                <li><a href="order.php">Keranjang</a></li>
                <li><a href="proses_pengiriman_customer.php">Pesanan</a></li>
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
                <span class="step-text">Pengemasan</span>
            </div>
            <div class="step">
                <span class="step-number">2</span>
                <span class="step-text">Pengiriman</span>
            </div>
            <div class="step">
                <span class="step-number">3</span>
                <span class="step-text">Penerimaan</span>
            </div>
        </div>

        <div class="progress-bar">
            <div class="progress"></div>
        </div>

        <div class="content">
            <h2>Pengemasan</h2>
            <p>Proses pengemasan barang sedang berlangsung.</p>
            <p>Barang Anda akan dikemas dengan baik dan aman untuk pengiriman.</p>
            <p>Setelah pengemasan selesai, barang akan segera dikirim ke alamat yang Anda berikan.</p>
            
        </div>
    </div>

    <script>
        // Simulasi proses pengemasan (contoh)
        setTimeout(function() {
            // Pindah ke langkah Pengiriman
            document.getElementsByClassName('step')[0].classList.remove('active');
            document.getElementsByClassName('step')[1].classList.add('active');
            document.getElementsByClassName('progress')[0].style.width = '66.66%';

            // Tampilkan tampilan Pengiriman
            document.getElementsByClassName('content')[0].innerHTML = `
                <h2>Pengiriman</h2>
                <p>Proses pengiriman barang sedang dilakukan. 
                Barang Anda akan dikirimkan ke alamat yang Anda berikan dalam waktu yang diestimasikan.
                Setelah barang dikirim, Anda akan mendapatkan nomor resi untuk melacak pengiriman.
                </p>
            `;
            
            // Tampilkan tampilan Penerimaan
            document.getElementsByClassName('content')[0].innerHTML = `
                    <h2>Penerimaan</h2>

                    <p>Barang Anda telah berhasil dikirimkan.
                    Harap tunggu hingga barang diterima oleh Anda atau pihak yang dituju.
                    Jika ada masalah atau pertanyaan, jangan ragu untuk menghubungi kami.
                    </p>
                    <button class="next-button" onclick="proceedToFinish()">Selesai</button>

                `;
        }, 500); // Simulasi pengemasan selama 2 detik
        function proceedToFinish() {
            
           
            // Redirect ke halaman proses_pengiriman.php
            document.getElementsByClassName('step')[0].classList.remove('active');
            document.getElementsByClassName('step')[1].classList.add('active');
            document.getElementsByClassName('progress')[0].style.width = '100%';

             // Generate nomor resi
             var resiNumber = generateResiNumber();

             // Tampilkan tampilan Penerimaan
            document.getElementsByClassName('content')[0].innerHTML = `
            <h2>Penerimaan</h2>
            <p>Barang Anda telah berhasil dikirimkan.
            Harap tunggu hingga barang diterima oleh Anda atau pihak yang dituju.
            Jika ada masalah atau pertanyaan, jangan ragu untuk menghubungi kami.
            </p>
            <p>Nomor resi pengiriman Anda: ${resiNumber}</p>
            <button class="next-button" onclick="proceedToFinish()">Selesai</button>
        `;

             // Fungsi untuk menghasilkan nomor resi secara acak
                function generateResiNumber() {
                var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
                var resi = '';
                for (var i = 0; i < 10; i++) {
                    resi += characters.charAt(Math.floor(Math.random() * characters.length));
                }
                return resi;
            }
        }
    </script>
</body>

</html>
