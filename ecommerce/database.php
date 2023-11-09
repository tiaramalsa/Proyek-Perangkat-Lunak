<!DOCTYPE html>
<html>
    <body>
    <?php
    $hostname = 'localhost';
    $username = 'root';
    $password = '';
    $dbname = 'db_ecommerce';

    $conn = mysqli_connect($hostname, $username, $password, $dbname) or die ('Gagal Terhubung');
?>
</body>
</html>