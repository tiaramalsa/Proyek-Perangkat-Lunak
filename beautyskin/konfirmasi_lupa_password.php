<?php
include 'database.php';
// konfirmasi_lupa_password.php

if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET["token"])) {
    $token = $_GET["token"];

    // Periksa apakah token valid
    if (validatePasswordResetToken($token)) {
        // Token valid, tampilkan halaman konfirmasi dengan form reset password
        echo '
        <!DOCTYPE html>
        <html>
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>Konfirmasi Lupa Password | beautyskin</title>
            <link rel="stylesheet" href="style.css">
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300&display=swap" rel="stylesheet">
        </head>
        <body id="bg-login">
            <div class="login-box">
                <br><br>
                <h2>Konfirmasi Lupa Password</h2>
                <br><br>
                <form action="reset_password.php" method="POST">
                    <input type="hidden" name="token" value="' . $token . '">
                    <input type="password" name="password" placeholder="Password Baru" class="input" required>
                    <br><br>
                    <input type="password" name="confirm_password" placeholder="Konfirmasi Password Baru" class="input" required>
                    <br><br>
                    <input type="submit" name="submit" value="Reset Password" class="button">
                </form>
            </div>
        </body>
        </html>
        ';
    } else {
        // Token tidak valid, tampilkan pesan kesalahan
        echo "Token tidak valid. Silakan kembali ke halaman lupa password dan coba lagi.";
    }
} else {
    // Redirect ke halaman lupa password jika tidak ada token yang diberikan
    header("Location: lupa_password.php");
    exit();
}

// Fungsi untuk memvalidasi token (sesuaikan dengan logika Anda)
function validatePasswordResetToken($token) {
    // Logika validasi token di sini
    include 'database.php';

    $profile_query = mysqli_query($conn, "SELECT * from tb_customer where token = '$token'");
    $profile = mysqli_fetch_assoc($profile_query);

    // Contoh sederhana: Token valid jika tidak kosong
    return isset($profile['id_pelanggan']);
}
?>
