<?php
    include 'database.php';

    $id_pelanggan = $_POST['id_pelanggan'];
    $total = $_POST['total'];
    $catatan = $_POST['catatan'];

    $insert_invoice = "INSERT INTO invoice (id_pelanggan, total, catatan) values ('$id_pelanggan','$total','$catatan')";
    $insert = mysqli_query($conn, $insert_invoice);

    $select_invoice = "SELECT * FROM invoice order by id desc";
    $query_invoice = mysqli_query($conn, $select_invoice);
    $invoice = mysqli_fetch_object($query_invoice);
    
    $cart = "SELECT * FROM tb_cart where customer_id = '$id_pelanggan'";
    $cart_q = mysqli_query($conn, $cart);

    while ($row = mysqli_fetch_array($cart_q)) {
        $sql_cart = "INSERT INTO invoice_item (id_invoice, id_product, jumlah) values ('{$invoice->id}','{$row['product_id']}','{$row['jumlah']}')";
        mysqli_query($conn, $sql_cart);
    }

    header("Location: invoice.php?id=$invoice->id");

?>